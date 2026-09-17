#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param erp_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' InvoicePriceViewServer()
InvoicePriceViewServer <- function(input, output, session, dms_token, erp_token) {

  shiny::observeEvent(input$btn_InvoicePrice_view, {

    date_InvoicePrice_Date = tsui::var_dateRange('date_InvoicePrice_Date')

    FStartDate=date_InvoicePrice_Date()[1]
    FEndDate=date_InvoicePrice_Date()[2]

    data = mdlVMPriceViewPkg::InvoicePrice_select(erp_token = erp_token,FStartDate = FStartDate,FEndDate = FEndDate)

    tsui::run_dataTable2(id = 'InvoicePrice_resultView',data = data)

    tsui::run_download_xlsx(id = 'dl_InvoicePrice_view',data = data,filename='采购发票价.xlsx')



  })



}



#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param erp_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' InvoicePriceServer()
InvoicePriceServer <- function(input, output, session, dms_token, erp_token) {


  InvoicePriceViewServer(input = input, output = output, session = session, dms_token = dms_token, erp_token = erp_token)
}
