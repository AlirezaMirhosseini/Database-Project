import './App.css';
import Button from '@mui/material/Button';
import { Grid , Box , TextField } from '@mui/material';
import { styled } from '@mui/material/styles';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import { borderRadius, margin } from '@mui/system';
// import { color } from '@mui/system';

let DUMMY_TRANSACTIONS = [
  {
    VoucherID: '606',
    Date: '2018-01-28',
    Time: '09:19:00',
    Amount: 340000000,
    SourceDep: 502,
    DestinationDep: 508,
    BranchID: 202,
  },
  {
    VoucherID: '612',
    Date: '2020-01-28',
    Time: '18:01:00',
    Amount: 10000,
    SourceDep: 508,
    DestinationDep: 505,
    BranchID: 205,
  },
  {
    VoucherID: '627',
    Date: '2017-02-16',
    Time: '13:34:00',
    Amount: 12000000,
    SourceDep: 502,
    DestinationDep: 504,
    BranchID: 203,
  },
  {
    VoucherID: '637',
    Date: '2016-03-25',
    Time: '09:55:00',
    Amount: 90000,
    SourceDep: 500,
    DestinationDep: 514,
    BranchID: 206,
  },
];


const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: theme.palette.common.black,
    color: theme.palette.common.white,
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  },
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  '&:nth-of-type(odd)': {
    backgroundColor: theme.palette.action.hover,
  },
  // hide last border
  '&:last-child td, &:last-child th': {
    border: 0,
  },
}));

export default function App() {
  //DUMMY_TRANSACTIONS = DUMMY_TRANSACTIONS.map(d => ({...d, Description: `${d.Amount} toman transferred `}));

  return (
    <div>
      <Box sx={{ backgroundColor: '#e9c46a' }}>
        <Grid 
          container
          alignItems="center"
          justifyContent="center"
          style={{ minHeight: '10vh' , fontSize: '2.2rem' }}
        >
          <strong>Transaciton Tracker</strong>
        </Grid>
        <Box
          component="form"
          sx={{
            '& .MuiTextField-root': { m: 2,
              width: '25ch', top: 3 ,
              backgroundColor: '#f4a261',
              borderRadius: '5px'  },
          }}
          noValidate
          autoComplete="off"
        >
          <Grid 
            container
            alignItems="center"
            justifyContent="center"
            style={{ minHeight: '5vh' }}
          >
            <TextField
              required
              id="outlined-required"
              label="Source Deposit"
              type="number"
              helperText="499 < Input < 520"
            />
            <TextField
              required
              id="outlined-required"
              label="Destination Deposit"
              type="number"
              helperText="499 < Input < 520"
            />
            <TextField
              required
              id="outlined-required"
              label="Transfer Date"
              type="text"
              helperText="Format : yyyy-mm-dd"
            />
            <TextField
              required
              id="outlined-required"
              label="Transfer Time"
              type="text"
              helperText="Format : hh:mm:ss"
            />
          </Grid>
          <Grid 
            container
            alignItems="center"
            justifyContent="center"
            style={{ minHeight: '5vh' }}
          >
            <TextField
              required
              id="outlined-required"
              label="Amount"
              type="number"
            />
            <TextField
              required
              id="outlined-required"
              label="Limit of Output"
              type="number"
            />
            <TextField
              required
              id="outlined-required"
              label="Sum"
              type="number"
            />
          </Grid>
        </Box>

        <Grid 
          container
          alignItems="center"
          justifyContent="center"
          style={{ minHeight: '10vh' }}
        >
          <Button 
            variant='contained' 
            color="success"
            style={{ minHeight: '7vh', minWidth: '10vw' }}
          >
            Show Result
          </Button>
        </Grid>
        <Grid 
          container
          alignItems="center"
          justifyContent="center"
          style={{ minHeight: '10vh' }}
        >
          <Grid 
            container
            alignItems="center"
            justifyContent="center"
            style={{ minHeight: '10vh' , fontSize: '1.8rem' }}
          >
            <strong>Transaction History</strong>
          </Grid>
          <Grid 
            container
            alignItems="center"
            justifyContent="center"
            style={{ minHeight: '20vh' , margin: '5vh 5vw 5vh 5vw' }}
          >
            <TableContainer component={Paper}>
              <Table sx={{ minWidth: 700 }} aria-label="customized table">
                <TableHead>
                  <TableRow>
                    <StyledTableCell>Voucher ID</StyledTableCell>
                    <StyledTableCell align="center">Date</StyledTableCell>
                    <StyledTableCell align="center">Time</StyledTableCell>
                    <StyledTableCell align="center">Amount</StyledTableCell>
                    <StyledTableCell align="center">Source Deposit</StyledTableCell>
                    <StyledTableCell align="center">Destination Deposit</StyledTableCell>
                    <StyledTableCell align="center">Branch ID</StyledTableCell>
                    <StyledTableCell align="center">Transaction Description</StyledTableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {DUMMY_TRANSACTIONS.map((t) => (
                    <StyledTableRow key={t.VoucherID}>
                      <StyledTableCell component='th' scope='row'>{t.VoucherID}</StyledTableCell>
                      <StyledTableCell align='center'>{t.Date}</StyledTableCell>
                      <StyledTableCell align='center'>{t.Time}</StyledTableCell>
                      <StyledTableCell align='center'>{t.Amount}</StyledTableCell>
                      <StyledTableCell align='center'>{t.SourceDep}</StyledTableCell>
                      <StyledTableCell align='center'>{t.DestinationDep}</StyledTableCell>
                      <StyledTableCell align='center'>{t.BranchID}</StyledTableCell>
                      <StyledTableCell align='center'>{t.Amount} Transferred.</StyledTableCell>
                    </StyledTableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Grid>
        </Grid>
      </Box>
    </div>
  );
}
