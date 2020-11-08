import React, {useEffect, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  Button,
  Box,
  DialogActions, Grid, Typography
} from "@material-ui/core";
import {companyActions} from "../../actions/companyActions";
import {useLazyQuery, useQuery} from "@apollo/react-hooks";
import {companyPriceCloseQueries} from "../../graphql";
import Chart from "react-apexcharts";
import {companyScoreQueries} from "../../graphql/companyScoreQueries";

const lineChartOptions = {
  chart: {
    type: 'area',
    stacked: false,
    height: 350,
    zoom: {
      type: 'x',
      enabled: true,
      autoScaleYaxis: true
    },
    toolbar: {
      autoSelected: 'zoom'
    }
  },
  dataLabels: {
    enabled: false
  },
  markers: {
    size: 0,
  },
  title: {
    text: 'Share Price Movement',
    align: 'left'
  },
  fill: {
    type: 'gradient',
    gradient: {
      shadeIntensity: 1,
      inverseColors: true,
      opacityFrom: 0.5,
      opacityTo: 0,
      stops: [0, 90, 100]
    },
  },
  yaxis: {
    labels: {
      formatter: function (val) {
        return val.toFixed(0);
      },
    },
    title: {
      text: 'Price'
    },
  },
  xaxis: {
    type: 'datetime',
  },
  tooltip: {
    shared: false,
    y: {
      formatter: function (val) {
        return val.toFixed(2)
      }
    }
  }
}

const snowFlakeOptions = {
  chart: {
    height: 350,
    type: 'radar',
  },
  title: {
    text: 'Snowflake Score'
  },
  xaxis: {
    categories: ['Dividend', 'Future', 'Health', 'Management', 'Past', 'Value', 'Misc']
  }
};

function CompanyDetailsDialog() {
  const dispatch = useDispatch();
  const {companyDetailsDialogOpen, company} = useSelector(state => state.companyReducer)

  const [sharePriceSeries, setSharePriceSeries] = useState([]);
  const [scoreSeries, setScoreSeries] = useState([0, 0, 0, 0, 0, 0, 0]);
  const [companyScore, setCompanyScore] = useState(null);

  const [loadCompanyPriceCloses] = useLazyQuery(companyPriceCloseQueries.companyPriceCloses, {
    onCompleted: data => {
      const companyPriceCloses = data.companyPriceCloses.companyPriceCloses;
      setSharePriceSeries([{
        name: "Share Price",
        data: companyPriceCloses.map(p => [p.dateCreated, p.price])
      }])
    }
  })

  const [loadCompanyScore] = useLazyQuery(companyScoreQueries.companyScore, {
    onCompleted: data => {
      const s = data.companyScore;
      setCompanyScore(s);
      setScoreSeries([{
        name: "Snowflake Score",
        data: [s.dividend, s.future, s.health, s.management, s.past, s.value, s.misc]
      }])
    }
  })

  useEffect(() => {
    if (!company)
      return;
    loadCompanyPriceCloses({
      variables: {
        page: 0, size: 50, companyId: company.id
      }
    })
    loadCompanyScore({
      variables: {
        companyId: company.id
      }
    })
  }, [company])

  const handleClose = () => {
    dispatch(companyActions.closeCompanyDetailsDialog());
  }


  if (!company || !companyScore || !sharePriceSeries) return <></>;

  return (
    <Dialog open={companyDetailsDialogOpen}
            onClose={handleClose}
            aria-labelledby="form-dialog-title"
            maxWidth="lg" fullWidth>
      <DialogTitle>
        <Typography>
          {company.name} ({company.uniqueSymbol})
        </Typography>
      </DialogTitle>
      <DialogContent>
        <Typography>
          {companyScore.sentence}
        </Typography>
        <Box p={2}>
          <Grid container spacing={3}>
            <Grid item md={6}>
              <Chart options={snowFlakeOptions} series={scoreSeries} type="radar" height={350}/>
            </Grid>
            <Grid item md={6}>
              <Chart options={lineChartOptions} series={sharePriceSeries} type="area" height={350}/>
            </Grid>
          </Grid>
        </Box>
      </DialogContent>
      <DialogActions>
        <Button color="secondary"
                size="small"
                onClick={handleClose}>
          Close
        </Button>
      </DialogActions>
    </Dialog>
  )
}

export default CompanyDetailsDialog;
