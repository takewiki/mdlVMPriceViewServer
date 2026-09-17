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
#' PurPriceManagementViewServer()
PurPriceManagementViewServer <- function(input, output, session, dms_token, erp_token) {

  shiny::observeEvent(input$btn_PurPriceManagement_view, {

    date_PurPriceManagement_Date = tsui::var_dateRange('date_PurPriceManagement_Date')

    FStartDate=date_PurPriceManagement_Date()[1]
    FEndDate=date_PurPriceManagement_Date()[2]

    data = mdlVMPriceViewPkg::PurPriceManagement_select(erp_token = erp_token,FStartDate = FStartDate,FEndDate = FEndDate)

    tsui::run_dataTable2(id = 'PurPriceManagement_resultView',data = data)

    tsui::run_download_xlsx(id = 'dl_PurPriceManagement_view',data = data,filename='采购价格管理.xlsx')



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
#' PurPriceManagementServer()
PurPriceManagementServer <- function(input, output, session, dms_token, erp_token) {


  PurPriceManagementViewServer(input = input, output = output, session = session, dms_token = dms_token, erp_token = erp_token)
}
