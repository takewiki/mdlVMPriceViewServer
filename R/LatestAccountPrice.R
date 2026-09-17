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
#' LatestAccountPriceViewServer()
LatestAccountPriceViewServer <- function(input, output, session, dms_token, erp_token) {

  shiny::observeEvent(input$btn_LatestAccountPrice_view, {

    date_LatestAccountPrice_Date = tsui::var_dateRange('date_LatestAccountPrice_Date')

    FStartDate=date_LatestAccountPrice_Date()[1]
    FEndDate=date_LatestAccountPrice_Date()[2]

    data = mdlVMPriceViewPkg::LatestAccountPrice_select(erp_token = erp_token,FStartDate = FStartDate,FEndDate = FEndDate)

    tsui::run_dataTable2(id = 'LatestAccountPrice_resultView',data = data)

    tsui::run_download_xlsx(id = 'dl_LatestAccountPrice_view',data = data,filename='最新核算价格.xlsx')



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
#' LatestAccountPriceServer()
LatestAccountPriceServer <- function(input, output, session, dms_token, erp_token) {


  LatestAccountPriceViewServer(input = input, output = output, session = session, dms_token = dms_token, erp_token = erp_token)
}
