import React from "react";
import { IV_ECEA } from "../../studentsList";
import MaterialTable from "material-table";
import PropTypes from "prop-types";
import SwipeableViews from "react-swipeable-views";
import { useTheme } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import Checkbox from "@material-ui/core/Checkbox";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles((theme) => ({
  table: {
    "& tbody>.MuiTableRow-root:hover": {
      background: "#e8e8e8"
    }
  }
}));

function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`full-width-tabpanel-${index}`}
      aria-labelledby={`full-width-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box p={3}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired
};

function Presentation(props) {
  const { handleispresentsecA } = props;
  const theme = useTheme();
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  const handleChangeIndex = (index) => {
    setValue(index);
  };

  return (
    <div className={classes.table}>
      <h1>Fiche d'appel</h1>
      <AppBar position="static" color="default"></AppBar>
      <SwipeableViews
        axis={theme.direction === "rtl" ? "x-reverse" : "x"}
        index={value}
        onChangeIndex={handleChangeIndex}
      >
        <TabPanel value={value} index={0} dir={theme.direction}>
          <MaterialTable
            columns={[
              { title: "Reg.Num", field: "regno" },
              { title: "Nom", field: "name" },
              {
                title: "Present",
                field: "isPresent",
                render: (rowData) => (
                  <>
                    <Checkbox
                      color="primary"
                      id={rowData.regno}
                      onChange={(e) => {
                        handleispresentsecA(rowData.regno, e.target.checked);
                      }}
                      checked={rowData.isPresent === "Yes"}
                    />
                    <label
                      htmlFor={rowData.regno}
                      style={{
                        color: rowData.isPresent === "Yes" ? "green" : "red"
                      }}
                    >
                      {rowData.isPresent}
                    </label>
                  </>
                )
              }
            ]}
            data={IV_ECEA.map((student) => {
              return {
                name: student.Name,
                regno: student.RegNo,
                isPresent: student.isPresent ? "Yes" : "No"
              };
            })}
            title="B1-ESGI"
            options={{
              exportButton: true,
              paginationType: "stepped",
              pageSize: 5,
              exportAllData: true
            }}
          />
        </TabPanel>
      </SwipeableViews>
      <div
        style={{
          fontSize: "14px",
          color: "blue",
          fontFamily: "cursive",
          textAlign: "center"
        }}
      ></div>
    </div>
  );
}

export default Presentation;
