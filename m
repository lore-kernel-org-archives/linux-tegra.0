Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5D4C55178
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 01:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C97992151B
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 01:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411601AbgJ0BNf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 21:13:35 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:26302 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410119AbgJ0BNf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 21:13:35 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15f97741f12b-eaab3; Tue, 27 Oct 2020 09:13:03 +0800 (CST)
X-RM-TRANSID: 2ee15f97741f12b-eaab3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.21.77] (unknown[10.42.68.12])
        by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55f97740b406-43814;
        Tue, 27 Oct 2020 09:13:02 +0800 (CST)
X-RM-TRANSID: 2ee55f97740b406-43814
Subject: Re: [PATCH] usb: host: ehci-tegra: Fix error handling
 integra_ehci_probe()
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201026090657.49988-1-tangbin@cmss.chinamobile.com>
 <20201026150538.GA1192191@rowland.harvard.edu>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <dc475369-2e24-549e-9c19-daf3a8ac80ac@cmss.chinamobile.com>
Date:   Tue, 27 Oct 2020 09:12:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201026150538.GA1192191@rowland.harvard.edu>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

ÔÚ 2020/10/26 23:05, Alan Stern Ð´µÀ:
> On Mon, Oct 26, 2020 at 05:06:57PM +0800, Tang Bin wrote:
>> If the function platform_get_irq() failed, the negative value
>> returned will not be detected here. So fix error handling in
>> tegra_ehci_probe().
>>
>> Fixes: 79ad3b5add4a ("usb: host: Add EHCI driver for NVIDIA Tegra SoCs")
>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>> ---
>>   drivers/usb/host/ehci-tegra.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
>> index 75a075daf..7b0efaf15 100644
>> --- a/drivers/usb/host/ehci-tegra.c
>> +++ b/drivers/usb/host/ehci-tegra.c
>> @@ -479,9 +479,9 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>>   	u_phy->otg->host = hcd_to_bus(hcd);
>>   
>>   	irq = platform_get_irq(pdev, 0);
>> -	if (!irq) {
>> -		err = -ENODEV;
>> -		goto cleanup_phy;
>> +	if (irq < 0) {
>> +		err = irq;
>> +		goto cleanup_phy;
>>   	}
>>   
>>   	otg_set_host(u_phy->otg, &hcd->self);
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> The "if (!irq)" statement occurs at least one other driver in this
> directory.  Would you like to submit a patch for ehci-xilinx-of.c as
> well?

OK, I will check this file out. Thanks!

Tang Bin



