import "./App.css";
import { useEffect, useState } from "react";
import Button from "@mui/material/Button";
import { Grid, Box, TextField } from "@mui/material";
import { styled } from "@mui/material/styles";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell, { tableCellClasses } from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { toast } from "react-toastify";

const StyledTableCell = styled(TableCell)(({ theme }) => ({
   [`&.${tableCellClasses.head}`]: {
      backgroundColor: "#422711",
      color: theme.palette.common.white,
   },
   [`&.${tableCellClasses.body}`]: {
      fontSize: 14,
   },
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
   "&:nth-of-type(odd)": {
      backgroundColor: "#C1793A",
   },
   "&:nth-of-type(even)": {
      backgroundColor: "#CCA583",
   },
   // hide last border
   "&:last-child td, &:last-child th": {
      border: 0,
   },
}));

export default function App() {
   const [srcDep, setSrcDep] = useState(null);
   const [destDep, setDestDep] = useState(null);
   const [transferDate, setTransferDate] = useState(null);
   const [transferTime, setTransferTime] = useState(null);
   const [amount, setAmount] = useState(null);
   const [transactionResult, setTransactionResult] = useState([]);
   const [isLoading, setIsLoading] = useState(false);

   const showResultHandler = async () => {
      switch (null) {
         case srcDep:
            toast.error("حساب مبدا را پر کنید ... ");
            return;
         case destDep:
            toast.error("حساب مقصد را پر کنید ... ");
            return;
         case amount:
            toast.error("مقدار تراکنش را پر کنید ... ");
            return;
         case transferDate:
            toast.error("تاریخ انتقال را پر کنید ... ");
            return;
         case transferTime:
            toast.error("زمان انتقال را پر کنید ... ");
            return;
         default:
            break;
      }
      try {
         setIsLoading(true);
         const result = await fetch("http://localhost:8000/transactions", {
            method: "POST",
            headers: {
               Accept: "application/json, text/plain, */*",
               "Content-Type": "application/json",
            },
            body: JSON.stringify({
               srcDep: srcDep,
               destDep: destDep,
               transferDate: transferDate,
               transferTime: transferTime,
               amount: +amount,
            }),
         });
         const data = await result.json();
         console.log(data);
         console.log(result);
         setTransactionResult(data);
         // setIsLoading(false);
      } catch (error) {
         console.log("Error : ", error);
      }
   };

   useEffect(() => {
      console.log(94, transactionResult);
      setIsLoading(false);
   }, [transactionResult]);

   const srcDepChangeHandler = (event) => {
      setSrcDep(event.target.value);
   };
   const destDepChangeHandler = (event) => {
      setDestDep(event.target.value);
   };
   const transferDateChangeHandler = (event) => {
      setTransferDate(event.target.value);
   };
   const transferTimeChangeHandler = (event) => {
      setTransferTime(event.target.value);
   };
   const amountChangeHandler = (event) => {
      setAmount(event.target.value);
   };
   //DUMMY_TRANSACTIONS = DUMMY_TRANSACTIONS.map(d => ({...d, Description: `${d.Amount} toman transferred `}));

   return (
      <div>
         <Box sx={{ backgroundColor: "#ffd98b" }}>
            <Grid
               container
               alignItems="center"
               justifyContent="center"
               style={{ minHeight: "10vh", fontSize: "2.2rem" }}
            >
               <strong>Transaciton Tracker</strong>
            </Grid>
            <Box
               component="form"
               sx={{
                  "& .MuiTextField-root": {
                     m: 2,
                     width: "25ch",
                     top: 3,
                     backgroundColor: "#f6923d",
                     borderRadius: "5px",
                  },
               }}
               noValidate
               autoComplete="off"
            >
               <Grid
                  container
                  alignItems="center"
                  justifyContent="center"
                  style={{ minHeight: "5vh" }}
               >
                  <TextField
                     onChange={srcDepChangeHandler}
                     required
                     id="outlined-required"
                     label="Source Deposit"
                     type="number"
                     helperText="499 < Input < 520"
                  />
                  <TextField
                     onChange={destDepChangeHandler}
                     required
                     id="outlined-required"
                     label="Destination Deposit"
                     type="number"
                     helperText="499 < Input < 520"
                  />
                  <TextField
                     onChange={transferDateChangeHandler}
                     required
                     id="outlined-required"
                     label="Transfer Date"
                     type="text"
                     helperText="Format : yyyy-mm-dd"
                  />
                  <TextField
                     onChange={transferTimeChangeHandler}
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
                  style={{ minHeight: "5vh" }}
               >
                  <TextField
                     onChange={amountChangeHandler}
                     required
                     id="outlined-required"
                     label="Amount"
                     type="number"
                  />
               </Grid>
            </Box>

            <Grid
               container
               alignItems="center"
               justifyContent="center"
               style={{ minHeight: "10vh" }}
            >
               <Button
                  onClick={showResultHandler}
                  variant="contained"
                  color="success"
                  style={{
                     minHeight: "7vh",
                     minWidth: "10vw",
                     backgroundColor: "#ff6c00",
                  }}
               >
                  Show Result
               </Button>
            </Grid>
            <Grid
               container
               alignItems="center"
               justifyContent="center"
               style={{ minHeight: "10vh" }}
            >
               <Grid
                  container
                  alignItems="center"
                  justifyContent="center"
                  style={{ margin: "4vh 0 -2vh 0", fontSize: "1.8rem" }}
               >
                  <strong>Transaction History</strong>
               </Grid>
               <Grid
                  container
                  alignItems="center"
                  justifyContent="center"
                  style={{ minHeight: "20vh", margin: "5vh 5vw 5vh 5vw" }}
               >
                  <TableContainer component={Paper}>
                     <Table
                        sx={{ minWidth: 700 }}
                        aria-label="customized table"
                     >
                        <TableHead sx={{ backgroundColor: "#422711" }}>
                           <TableRow>
                              <StyledTableCell align="center">
                                 Voucher ID
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Date
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Time
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Amount
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Source Deposit
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Destination Deposit
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Branch ID
                              </StyledTableCell>
                              <StyledTableCell align="center">
                                 Transaction Description
                              </StyledTableCell>
                           </TableRow>
                        </TableHead>
                        <TableBody>
                           {!isLoading
                              ? transactionResult.map((t) => (
                                   <StyledTableRow key={t.voucherid}>
                                      <StyledTableCell
                                         align="center"
                                         component="th"
                                         scope="row"
                                      >
                                         {t.voucherid}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.trndate}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.trntime}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.amount}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.sourcedep}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.desdep}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.branch_id}
                                      </StyledTableCell>
                                      <StyledTableCell align="center">
                                         {t.trn_desc}
                                      </StyledTableCell>
                                   </StyledTableRow>
                                ))
                              : null}
                        </TableBody>
                     </Table>
                  </TableContainer>
               </Grid>
            </Grid>
         </Box>
      </div>
   );
}
