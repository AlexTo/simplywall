/* eslint-disable max-len */
import React, {useEffect, useState} from 'react';
import clsx from 'clsx';
import PerfectScrollbar from 'react-perfect-scrollbar';
import PropTypes from 'prop-types';
import {
  Box,
  Button,
  Card,
  Checkbox,
  Grid,
  TableSortLabel,
  InputAdornment,
  IconButton,
  SvgIcon,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TablePagination,
  TableRow,
  TextField,
  Typography,
  Slider,
  Tooltip,
  makeStyles
} from '@material-ui/core';
import {
  BarChart2 as BarChart2Icon,
  Search as SearchIcon
} from 'react-feather';
import {useQuery} from "@apollo/react-hooks";
import {companyQueries} from "../../../graphql";
import NumberFormat from 'react-number-format';
import moment from "moment";
import {useDebounce} from "../../../hooks";
import {useDispatch} from "react-redux";
import {companyActions} from "../../../actions/companyActions";

const useStyles = makeStyles((theme) => ({
  root: {},
  bulkOperations: {
    position: 'relative'
  },
  bulkActions: {
    paddingLeft: 4,
    paddingRight: 4,
    marginTop: 6,
    position: 'absolute',
    width: '100%',
    zIndex: 2,
    backgroundColor: theme.palette.background.default
  },
  bulkAction: {
    marginLeft: theme.spacing(2)
  }
}));

function ValueLabelComponent(props) {
  const {children, open, value} = props;

  return (
    <Tooltip open={open} enterTouchDelay={0} placement="top" title={value}>
      {children}
    </Tooltip>
  );
}

function Results({className, ...rest}) {
  const classes = useStyles();
  const dispatch = useDispatch();
  const [selectedCompanies, setSelectedCompanies] = useState([]);
  const [page, setPage] = useState(0);
  const [companies, setCompanies] = useState([]);
  const [size, setSize] = useState(5);
  const [orderBy, setOrderBy] = useState('companyScore.total');
  const [order, setOrder] = useState('desc');
  const [totalElements, setTotalElements] = useState(0);
  const [scoreRange, setScoreRange] = React.useState([0, 20]);
  const debouncedScoreRange = useDebounce(scoreRange, 500);
  const [minScore, setMinScore] = useState(0);
  const [maxScore, setMaxScore] = useState(20);
  const [searchTerm, setSearchTerm] = useState('');
  const debouncedSearchTerm = useDebounce(searchTerm, 500);

  const {data} = useQuery(companyQueries.companies, {
    variables: {
      page, size, orderBy, order, searchTerm: debouncedSearchTerm, minScore, maxScore
    }
  });

  useEffect(() => {
    if (!data) {
      setCompanies([]);
      setTotalElements(0);
      return;
    }
    setCompanies(data.companies.companies);
    setTotalElements(data.companies.totalElements);
  }, [data])

  useEffect((() => {
    setMinScore(debouncedScoreRange[0]);
    setMaxScore(debouncedScoreRange[1]);
  }), [debouncedScoreRange])

  const enableBulkOperations = selectedCompanies.length > 0;
  const selectedSome = selectedCompanies.length > 0 && selectedCompanies.length < companies.length;
  const selectedAll = selectedCompanies.length === companies.length;

  const handlePageChange = (event, newPage) => {
    setPage(newPage);
  };

  const handleLimitChange = (event) => {
    setSize(event.target.value);
  };

  const handleSearchTermChange = (event) => {
    event.persist();
    setSearchTerm(event.target.value);
  };

  const handleSelectAll = (event) => {
    setSelectedCompanies(event.target.checked
      ? companies.map((g) => g.value)
      : []);
  };

  const handleSelectOne = (event, id) => {
    if (!selectedCompanies.includes(id)) {
      setSelectedCompanies((prevSelected) => [...prevSelected, id]);
    } else {
      setSelectedCompanies((prevSelected) => prevSelected.filter((i) => i !== id));
    }
  };

  const handleOrder = (col, default_value) => {
    if (orderBy === col) {
      setOrder(order === 'asc' ? 'desc' : 'asc');
    } else {
      setOrderBy(col);
      setOrder(default_value);
    }
  }

  return (
    <Card
      className={clsx(classes.root, className)}
      {...rest}>
      <Box p={2}>
        <Box
          display="flex"
          alignItems="center">
          <Grid container spacing={3}>
            <Grid item md={3}>
              <TextField
                InputProps={{
                  startAdornment: (
                    <InputAdornment position="start">
                      <SvgIcon
                        fontSize="small"
                        color="action">
                        <SearchIcon/>
                      </SvgIcon>
                    </InputAdornment>
                  )
                }}
                onChange={handleSearchTermChange}
                placeholder="Search name or exchange symbol"
                value={searchTerm}
                variant="outlined"
                fullWidth={true}
              />
            </Grid>
            <Grid item md={2}>
              <Typography id="range-slider" gutterBottom>
                Total Score
              </Typography>
              <Slider
                min={0}
                max={20}
                value={scoreRange}
                onChange={(event, value) => setScoreRange(value)}
                ValueLabelComponent={ValueLabelComponent}
                aria-labelledby="range-slider"
              />
            </Grid>
          </Grid>
        </Box>
      </Box>
      {enableBulkOperations && (
        <div className={classes.bulkOperations}>
          <div className={classes.bulkActions}>
            <Checkbox
              checked={selectedAll}
              indeterminate={selectedSome}
              onChange={handleSelectAll}
            />
            <Button
              variant="outlined"
              className={classes.bulkAction} onClick={() => {
            }}>
              Delete
            </Button>
          </div>
        </div>
      )}
      <PerfectScrollbar>
        <Box>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox">
                  <Checkbox
                    checked={selectedAll}
                    indeterminate={selectedSome}
                    onChange={handleSelectAll}
                  />
                </TableCell>
                <TableCell>
                  <TableSortLabel
                    active={orderBy === 'name'}
                    direction={orderBy === 'name' ? order : 'asc'}
                    onClick={() => handleOrder('name', 'asc')}>
                    Company Name
                  </TableSortLabel>
                </TableCell>
                <TableCell>
                  Unique Symbol
                </TableCell>
                <TableCell>
                  Exchange Symbol
                </TableCell>
                <TableCell>
                  Last Known Share Price
                </TableCell>
                <TableCell>
                  Share Price Updated
                </TableCell>
                <TableCell>
                  <TableSortLabel
                    active={orderBy === 'companyScore.total'}
                    direction={orderBy === 'companyScore.total' ? order : 'asc'}
                    onClick={() => handleOrder('companyScore.total', 'desc')}>
                    Total Score
                  </TableSortLabel>
                </TableCell>
                <TableCell align="right">
                </TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {companies.map((c) => {
                const isSelected = selectedCompanies.includes(c.id);
                return (
                  <TableRow
                    hover
                    key={c.id}
                    selected={isSelected}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={isSelected}
                        onChange={(event) => handleSelectOne(event, c.id)}
                        value={isSelected}
                      />
                    </TableCell>
                    <TableCell>
                      {c.name}
                    </TableCell>
                    <TableCell>
                      {c.uniqueSymbol}
                    </TableCell>
                    <TableCell>
                      {c.exchangeSymbol}
                    </TableCell>
                    <TableCell>
                      {c.lastKnownSharePrice && <NumberFormat value={c.lastKnownSharePrice.price}
                                                              displayType={'text'} thousandSeparator={true}
                                                              prefix={'$ '}
                                                              decimalScale={2}/>}

                    </TableCell>
                    <TableCell>
                      {c.lastKnownSharePrice && moment.unix(c.lastKnownSharePrice.dateCreated).fromNow()}
                    </TableCell>
                    <TableCell>
                      {c.companyScore && c.companyScore.total}
                    </TableCell>
                    <TableCell align="right">
                      <IconButton onClick={() => dispatch(companyActions.openCompanyDetailsDialog(c))}>
                        <SvgIcon fontSize="small">
                          <BarChart2Icon/>
                        </SvgIcon>
                      </IconButton>
                    </TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
          <TablePagination
            component="div"
            count={totalElements}
            onChangePage={handlePageChange}
            onChangeRowsPerPage={handleLimitChange}
            page={page}
            rowsPerPage={size}
            rowsPerPageOptions={[5, 10, 25]}
          />
        </Box>
      </PerfectScrollbar>
    </Card>
  );
}

Results.propTypes = {
  className: PropTypes.string,
};

Results.defaultProps = {
  products: []
};

export default Results;
