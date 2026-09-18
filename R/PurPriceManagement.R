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

    date_PurPriceManagement_Date = tsui::var_date('date_PurPriceManagement_Date')
    var_txt_PurPriceManagement_ItemNumber= tsui::var_text('txt_PurPriceManagement_ItemNumber')

    FDate=date_PurPriceManagement_Date()

    FItemNumber = var_txt_PurPriceManagement_ItemNumber()


    data = mdlVMPriceViewPkg::PurPriceManagement_select(erp_token = erp_token,FDate = FDate,FItemNumber = FItemNumber)

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
