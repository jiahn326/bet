<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

	var L = {
			
			commonTextCoupon : '<spring:message code="common.text.coupon"/>',
			commonButtonSearch : '<spring:message code="common.button.search"/>',
			commonButtonSearch2 : '<spring:message code="common.button.search2"/>',
			commonButtonExcel : '<spring:message code="common.button.excel"/>',
			commonButtonReset : '<spring:message code="common.button.reset"/>',
			commonButtonConfirm : '<spring:message code="common.button.confirm"/>',
			commonButtonClose : '<spring:message code="common.button.close"/>',
			commonButtonList : '<spring:message code="common.button.list"/>',
			commonButtonDelete : '<spring:message code="common.button.delete"/>',
			commonButtonCancel : '<spring:message code="common.button.cancel"/>',
			commonButtonAdd : '<spring:message code="common.button.add"/>',
			commonButtonSave : '<spring:message code="common.button.save"/>',
			commonButtonNewRegistration : '<spring:message code="common.button.new.registration"/>',
			commonButtonModify : '<spring:message code="common.button.modify"/>',
			commonButtonApproved : '<spring:message code="common.button.approved"/>',
			commonButtonRejected : '<spring:message code="common.button.rejected"/>',
			commonButtonRegistration : '<spring:message code="common.button.registration"/>',
			commonButtonLogin : '<spring:message code="common.button.login"/>',
			commonButtonSingUp : '<spring:message code="common.button.sing.up"/>',
			commonTextCouponName : '<spring:message code="common.text.coupon.name"/>',
			commonTextCouponId : '<spring:message code="common.text.coupon.id"/>',
			commonTextCouponNumber : '<spring:message code="common.text.coupon.number"/>',
			commonTextCount1 : '<spring:message code="common.text.count1"/>',
			commonTextCount2 : '<spring:message code="common.text.count2"/>',
			commonTextCountItems : '<spring:message code="common.text.count.items"/>',
			commonTextCountPerPage : '<spring:message code="common.text.count.per.page"/>',
			commonTextPersonCount : '<spring:message code="common.text.person.count"/>',
			commonTextSearchInfo : '<spring:message code="common.text.search.info"/>',
			commonTextNo : '<spring:message code="common.text.no"/>',
			commonTextTotal : '<spring:message code="common.text.total"/>',
			commonTextChoice : '<spring:message code="common.text.choice"/>',
			commonTextStatus : '<spring:message code="common.text.status"/>',
			commonTextRegisterer : '<spring:message code="common.text.registerer"/>',
			commonTextRegDt : '<spring:message code="common.text.regDt"/>',
			commonTextApprover : '<spring:message code="common.text.approver"/>',
			commonTextApproveDate : '<spring:message code="common.text.approve.date"/>',
			commonTextApproverGroup : '<spring:message code="common.text.approver.group"/>',
			commonTextApproverTkcgr : '<spring:message code="common.text.approver.tkcgr"/>',
			commonTextApproverTkcgrGroup : '<spring:message code="common.text.approver.tkcgr.group"/>',
			commonTextBenefitType : '<spring:message code="common.text.benefit.type"/>',
			commonTextSubscriberId : '<spring:message code="common.text.subscriber.id"/>',
			commonTextSubscriberName : '<spring:message code="common.text.subscriber.name"/>',
			commonTextCpnCreate : '<spring:message code="common.text.cpn.create"/>',
			commonTextCpnModify : '<spring:message code="common.text.cpn.modify"/>',
			commonTextCpnDelete : '<spring:message code="common.text.cpn.delete"/>',
			commonTextCpnIssue : '<spring:message code="common.text.cpn.issue"/>',
			commonTextCpnCancel : '<spring:message code="common.text.cpn.cancel"/>',
			commonTextCpnDestroy : '<spring:message code="common.text.cpn.destroy"/>',
			commonTextCpnAccept : '<spring:message code="common.text.cpn.accept"/>',
			commonTextCpnDefer : '<spring:message code="common.text.cpn.defer"/>',
			commonTextCpnRequestAccept : '<spring:message code="common.text.cpn.request.accept"/>',
			commonTextCpnReRequestAccept : '<spring:message code="common.text.cpn.re.request.accept"/>',
			commonTextCpnCompleteModify : '<spring:message code="common.text.cpn.complete.modify"/>',
			commonTextImageUpload : '<spring:message code="common.text.image.upload"/>',
			commonTextNA : '<spring:message code="common.text.n.a"/>',
			commonTextNotSpef : '<spring:message code="common.text.not.spef"/>',
			commonTextImageChoice : '<spring:message code="common.text.image.choice"/>',
			commonTextPoint : '<spring:message code="common.text.point"/>',
			commonTextNoData : '<spring:message code="common.text.no.data"/>',
			commonTextLoading : '<spring:message code="common.text.loading"/>',
			commonTextLoadingError : '<spring:message code="common.text.loading.error"/>',
			commonTextStatusReprensentative : '<spring:message code="common.text.status.reprensentative"/>',
			commonTextExcelFormatDownload : '<spring:message code="common.text.excel.format.download"/>',
			commonTextExcelUpload : '<spring:message code="common.text.excel.upload"/>',
			commonTextSend : '<spring:message code="common.text.send"/>',
			commonTextDistribution : '<spring:message code="common.text.distribution"/>',
			commonTextVoucherDownload : '<spring:message code="common.text.voucher.download"/>',
			commonTextCouponStatus : '<spring:message code="common.text.coupon.status"/>',
			commonTextRegisterer2 : '<spring:message code="common.text.registerer2"/>',
			commonTextRegDt2 : '<spring:message code="common.text.regDt2"/>',
			commonTextUseDt : '<spring:message code="common.text.useDt"/>',
			commonTextUpdDt : '<spring:message code="common.text.updDt"/>',
			commonTextUpdateOprtr : '<spring:message code="common.text.update.oprtr"/>',
			commonTextCouponType : '<spring:message code="common.text.coupon.type"/>',
			commonTextCouponTypeId : '<spring:message code="common.text.coupon.type.id"/>',
			commonTextUseYN : '<spring:message code="common.text.use.y.n"/>',
			commonTextDate : '<spring:message code="common.text.date"/>',
			commonTextDate2 : '<spring:message code="common.text.date2"/>',
			commonTextSearchPeriod : '<spring:message code="common.text.search.period"/>',
			commonTextDetailInfo : '<spring:message code="common.text.detail.info"/>',
			commonTextDeleteRoleYn : '<spring:message code="common.text.delete.role.yn"/>',
			commonTextDescreption : '<spring:message code="common.text.descreption"/>',
			commonTextbnfitType : '<spring:message code="common.text.dc.type"/>',
			commonTextIssTms : '<spring:message code="common.text.iss.tms"/>',
			commonTextStat : '<spring:message code="common.text.stat"/>',
			commonTextEmpNo : '<spring:message code="common.text.emp.no"/>',
			commonTextName : '<spring:message code="common.text.name"/>',
			commonTextInfoModify : '<spring:message code="common.text.info.modify"/>',
			commonTextChkOver : '<spring:message code="common.text.chk.over"/>',
			commonTextChkEmpNo : '<spring:message code="common.text.chk.emp.no"/>',
			commonTextEmail : '<spring:message code="common.text.email"/>',
			commonTextApprovedStatus : '<spring:message code="common.text.approved.status"/>',
			commonTextMphonNo : '<spring:message code="common.text.mphon.no"/>',
			commonTextReplace : '<spring:message code="common.text.replace"/>',
			commonTextAuthGroup : '<spring:message code="common.text.auth.group"/>',
			commonTextApply : '<spring:message code="common.text.apply"/>',
			commonTextID1 : '<spring:message code="common.text.ID1"/>',
			commonTextID2 : '<spring:message code="common.text.ID2"/>',
			commonTextPwd : '<spring:message code="common.text.pwd"/>',
			commonTextPwd1 : '<spring:message code="common.text.pwd1"/>',
			commonTextPwd2 : '<spring:message code="common.text.pwd2"/>',
			commonTextBack : '<spring:message code="common.text.back"/>',
			commonTextReApprov : '<spring:message code="common.text.re.approv"/>',
			commonTextUsePeriod : '<spring:message code="common.text.use.period"/>',
			commonAlertMessageNotRegistExt : '<spring:message code="common.alert.message.not.regist.ext"/>',
			commonAlertMessageCreate : '<spring:message code="common.alert.message.create"/>',
			commonAlertMessageModify : '<spring:message code="common.alert.message.modify"/>',
			commonAlertMessageDeleted : '<spring:message code="common.alert.message.deleted"/>',
			commonAlertMessageAdded : '<spring:message code="common.alert.message.added"/>',
			commonAlertMessageSaved : '<spring:message code="common.alert.message.saved"/>',
			commonAlertMessageDestroy : '<spring:message code="common.alert.message.destroy"/>',
			commonAlertMessageApprove : '<spring:message code="common.alert.message.approve"/>',
			commonAlertMessageDefer : '<spring:message code="common.alert.message.defer"/>',
			commonAlertMessageReject : '<spring:message code="common.alert.message.reject"/>',
			commonAlertMessageReRequest : '<spring:message code="common.alert.message.re.request"/>',
			commonAlertMessageFillall : '<spring:message code="common.alert.message.fillall"/>',
			commonAlertMessageError : '<spring:message code="common.alert.message.error"/>',
			commonAlertNotValidAccNo : '<spring:message code="common.alert.not.valid.acc.no"/>',
			commonAlertNewRegisted : '<spring:message code="common.alert.new.registed"/>',
			commonAlertMessageQuestionCreate : '<spring:message code="common.alert.message.question.create"/>',
			commonAlertMessageQuestionCancel : '<spring:message code="common.alert.message.question.cancel"/>',
			commonAlertMessageQuestionDelete : '<spring:message code="common.alert.message.question.delete"/>',
			commonAlertMessageQuestionModify : '<spring:message code="common.alert.message.question.modify"/>',
			commonAlertMessageQuestionReject : '<spring:message code="common.alert.message.question.reject"/>',
			commonAlertMessageQuestionDefer : '<spring:message code="common.alert.message.question.defer"/>',
			commonAlertMessageQuestionDestroy : '<spring:message code="common.alert.message.question.destroy"/>',
			commonAlertMessageQuestionApprove : '<spring:message code="common.alert.message.question.approve"/>',
			commonAlertMessageQuestionReRequest : '<spring:message code="common.alert.message.question.re.request"/>',
			commonAlertMessageSmallInteger : '<spring:message code="common.alert.message.small.integer"/>',
			commonAlertMessageBigInteger : '<spring:message code="common.alert.message.big.integer"/>',
			commonAlertMessageNotMinus : '<spring:message code="common.alert.message.not.minus"/>',
			commonAlertPleaseSelectDeleted : '<spring:message code="common.alert.please.select.deleted"/>',
			commonAlertPleaseAllRequired : '<spring:message code="common.alert.please.all.required"/>',
			commonAlertPleaseChkOver : '<spring:message code="common.alert.please.chk.over"/>',
			commonAlertPleaseInputItem : '<spring:message code="common.alert.please.input.item"/>',
			commonAlertPleaseChoiceItem : '<spring:message code="common.alert.please.choice.item"/>',
			commonAlertPleaseChkDate : '<spring:message code="common.alert.please.chk.date"/>',
			commonAlertAbleUse : '<spring:message code="common.alert.able.use"/>',
			commonAlertAlreadyUse : '<spring:message code="common.alert.already.use"/>',
			commonAlertDateBeforeToday : '<spring:message code="common.alert.date.before.today"/>',
			commonAlertAbleInputByte : '<spring:message code="common.alert.able.input.byte"/>',
			commonAlertPleaseChoiceItem1 : '<spring:message code="common.alert.please.choice.item1"/>',
			commonTextCpnTypeMng : '<spring:message code="common.text.cpn.type.mng"/>',
			commonTextPleasePickApprover : '<spring:message code="common.text.please.pick.approver" text=""/>',
			commonAlertPleaseLogin : '<spring:message code="common.alert.please.login" text=""/>',
			commonMsgConfirmApprove : '<spring:message code="common.msg.confirm.approve"/>',
			commonMsgConfirmReject : '<spring:message code="common.msg.confirm.reject"/>',
			commonMsgConfirmModify : '<spring:message code="common.msg.confirm.modify"/>',
			commonTextUndetermined : '<spring:message code="common.text.undetermined"/>',
			commonTextSum : '<spring:message code="common.text.sum"/>'
			
			
			
			,promotionTextContentsPackage : "<spring:message code='promotion.text.contents.package'/>"
			,promotionTextContentsSeries : "<spring:message code='promotion.text.contents.series'/>"
			,promotionTextContentsChannel : "<spring:message code='promotion.text.contents.channel'/>"
			,promotionTextOfferSubscription : "<spring:message code='promotion.text.offer.subscription'/>"
			,promotionTextOfferRent : "<spring:message code='promotion.text.offer.rent'/>"
			,promotionTextOfferBuy : "<spring:message code='promotion.text.offer.buy'/>"
	}

</script>
