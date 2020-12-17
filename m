Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6E6C4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD439238EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgLQNps (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgLQNpr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:45:47 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54D7C061794;
        Thu, 17 Dec 2020 05:45:06 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 23so57440761lfg.10;
        Thu, 17 Dec 2020 05:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7VpJRjPvmKOHT2sXQCSOmKbkChTk2wISduUVLRGTs2A=;
        b=HXh+cF47YtnSmgLnGISENV8vVOf/RFnnLSkuRJIMbhXq51Y7uFRi56sx6b3E2BiwAD
         2iiFQbeTGcPDah8zD9oBCZTZmA55i96xsVUpv7DGA8Zb7W07U42UpyryCp7eL7/8/ikY
         7OKf6zqDo1IETrq2mUznTmeI15+7XSOCfh5FqKnMmciW+hfv8q0HUPq5/86QifxdVbnQ
         wOjA7NGkvEtBmtUBVZ9uGHXUsgn/+29xkiFmWlDD4km8y4LDmG8mrS+2LWEDXT7IupaC
         u4cxhh66jbbKnFkefjRS+ydLXc8WQn+8YFanJ33LxVo22T5KwdztuHNWZKi7XH0YQx86
         JDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7VpJRjPvmKOHT2sXQCSOmKbkChTk2wISduUVLRGTs2A=;
        b=WOS23vR+Khx9sdLvZYPAQFsO/Bxeoh5GSWr8alS0L13rbB6s/iyRgITbWzB4zg9Oc8
         Gjj11m88NGZP4KQ6UWS9XUdkaVWWqMrxNBT02iJzy9RcH4wCn0Ju1cdESQg+d54Enrii
         dx7gj/kfVnDLOwk7gGQRXLmKDclW1wtwFLCIn7A59ybVuCwnxL45d+/QLaN7OUjI6fh6
         H4NfuRpr05QL1O1I8ix7SRf6cvvZK89xwp6w82Nz8NiGMADAy6dcf/7sFbQD+tSewIGS
         vin35JVF/G4qM5X2WH2N+7MNZRCp83xQdOX1LL8KmzrJFmWD0SgpGU80LG5Oop2AWKqH
         fc9Q==
X-Gm-Message-State: AOAM530gMzAMWcTCaioOuLVkymhhQXhAqnj5FJYnH0y/dXVoaNSsBiTP
        nlnqflTemh/keK/YM0FvCpCVxaBRQ0E=
X-Google-Smtp-Source: ABdhPJxHitJPMIjv/24Unx2UOck2ySiex3gUoI3P6WUA/z5AmgmC9xCHPkCC+nI6+I6/+FacwcTJWQ==
X-Received: by 2002:a19:28a:: with SMTP id 132mr15064503lfc.158.1608212705096;
        Thu, 17 Dec 2020 05:45:05 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id a123sm591654lfd.293.2020.12.17.05.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 05:45:04 -0800 (PST)
Subject: Re: [PATCH v2 6/8] usb: chipidea: tegra: Support runtime PM
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-7-digetx@gmail.com> <X9tgD+KSU1bIvht5@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28468e30-a832-9774-bed3-ac986aef8831@gmail.com>
Date:   Thu, 17 Dec 2020 16:45:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9tgD+KSU1bIvht5@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.12.2020 16:41, Thierry Reding пишет:
> On Thu, Dec 17, 2020 at 12:40:05PM +0300, Dmitry Osipenko wrote:
>> Tegra PHY driver now supports waking up controller from a low power mode.
>> Enable runtime PM in order to put controller into the LPM during idle.
>>
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Ion Agorria <ion@agorria.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> index 5fccdeeefc64..655671159511 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>> @@ -38,21 +38,24 @@ struct tegra_usb_soc_info {
>>  
>>  static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>  	.dr_mode = USB_DR_MODE_HOST,
>>  	.txfifothresh = 10,
>>  };
>>  
>>  static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>  	.dr_mode = USB_DR_MODE_HOST,
>>  	.txfifothresh = 16,
>>  };
>>  
>>  static const struct tegra_usb_soc_info tegra_udc_soc_info = {
>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>  	.dr_mode = USB_DR_MODE_UNKNOWN,
>>  };
>>  
>> @@ -323,6 +326,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
>>  	usb->data.hub_control = tegra_ehci_hub_control;
>>  	usb->data.notify_event = tegra_usb_notify_event;
>>  
>> +	/* Tegra PHY driver currently doesn't support LPM for ULPI */
>> +	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
>> +		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
>> +
> 
> Does this prevent the wakeup_enabled from being set for ULPI PHYs?

Yes

