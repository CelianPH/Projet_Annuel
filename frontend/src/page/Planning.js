import * as React from "react";
import Paper from "@mui/material/Paper";
import {
  Scheduler,
  WeekView,
  Appointments
} from "@devexpress/dx-react-scheduler-material-ui";
import { calendarData } from "../lib/calendar-data";

const Planning = () => (
  <Paper>
    <Scheduler data={calendarData} height={730}>
      <WeekView startDayHour={8} endDayHour={19} />
      <Appointments />
    </Scheduler>
  </Paper>
);

export default Planning;