import HomeIcon from "@mui/icons-material/Home";
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import BarChartIcon from "@mui/icons-material/BarChart";
import ExitToAppIcon from '@mui/icons-material/ExitToApp';
import ReceiptLongIcon from '@mui/icons-material/ReceiptLong';
export const navData = [
  {
    id: 0,
    icon: <HomeIcon />,
    text: "Home",
    link: "/"
  },
  {
    id: 1,
    icon: <CalendarMonthIcon />,
    text: "Planning",
    link: "planning"
  },
  {
    id: 2,
    icon: <BarChartIcon />,
    text: "Absences / Retards",
    link: "statistics"
  },
  {
    id: 3,
    icon: <ReceiptLongIcon />,
    text: "Justificatifs",
    link: "Justificatifs"
  },
  {
    id: 4,
    icon: <ExitToAppIcon />,
    text: "Deconnexion",
    link: "login"
  }
];
