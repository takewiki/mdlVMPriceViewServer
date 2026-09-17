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
#' OrderPriceViewServer()
OrderPriceViewServer <- function(input, output, session, dms_token, erp_token) {

  shiny::observeEvent(input$btn_OrderPrice_view, {

    date_OrderPrice_Date = tsui::var_dateRange('date_OrderPrice_Date')

    FStartDate=date_OrderPrice_Date()[1]
    FEndDate=date_OrderPrice_Date()[2]

    data = mdlVMPriceViewPkg::OrderPrice_select(erp_token = erp_token,FStartDate = FStartDate,FEndDate = FEndDate)

    tsui::run_dataTable2(id = 'OrderPrice_resultView',data = data)

    tsui::run_download_xlsx(id = 'dl_OrderPrice_view',data = data,filename='采购订单价.xlsx')



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
#' OrderPriceServer()
OrderPriceServer <- function(input, output, session, dms_token, erp_token) {


  OrderPriceViewServer(input = input, output = output, session = session, dms_token = dms_token, erp_token = erp_token)
}
