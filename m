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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FEBC4361B
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 19:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0DED23A74
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 19:52:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgLQTvy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 14:51:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQTvx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 14:51:53 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615F2C061794;
        Thu, 17 Dec 2020 11:51:13 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so60661607lfc.11;
        Thu, 17 Dec 2020 11:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=peFOF8ndPv+QVCUnjm5e8UdB9wjjwk2hem22tcor5IU=;
        b=D2j7Mtjdwnh2n0c8ZldEpneOFgFr7nwNIbQ4o5W/0tqXRPrSkykYX4BE1YQy0GuuOT
         4K/krNBMQzkP44Jfqm/UGhLz+bK5jvV1v+liTIbPVfSzeN0zDIIX+yqLRX/TthTiJhok
         VgdaD5AJg0tEau/mbNoiKU/43c+XitBx9+j8unXljJQiqkHHk4rO7+gpBPUAwQwlw+be
         xi4SdE6Th+dYpTdkJtGJ8Ty1PFl0yEePk5mL4kl4ihq1uDsCT9HA+E9OPlAu/31FRTgN
         7/NILKBJ8syZNwXMMG9YSQJmylif2chW9o/hMhWJXacOGJBh7qAw8RQ/fpDxzRkula9U
         v7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=peFOF8ndPv+QVCUnjm5e8UdB9wjjwk2hem22tcor5IU=;
        b=SiagMX09ePupte2smgeizK2oIfnkozMyn2GO85GkQxtOq1X/S5uxWUlt3FEjOYVIlt
         EH03fG6D2hKUPDrbE7OnafupIuBJhOjRTodLZ2av58aN2/it7iPTXErlxgpuesOXMpfs
         jUHnGsLzg07y1QegSvSRUAgipx8emYORTa/nrQ5WRqNAZ/WF45mpuSMp7y/hS6Sgsf5v
         KfqGPI+xTgGbnYvlV8urkN0o4/SYF5ohi8hh3ZyY5rzJEznVnBiODTWQ9Oj914RJUKKd
         YjSarNAZnoXsfCpwYgzImkjjEMT43eWBsfou8+bOpZzJhouTGpjaFxpl1S1CwoqgXSFx
         PCtw==
X-Gm-Message-State: AOAM531PbfAzXmnNrUf5VPnZJ81tmHYtqAb8MlvybrDjufPOYdbYH3x0
        vCJnFk9Suf5aaO0pBVLzjcoJ6DI9DHA=
X-Google-Smtp-Source: ABdhPJyB6GNpYP9EvFELD2XvFcMJmHut99ZBV/0NpaJe7FmBBDX3XXq5Ud4wE39HhG+6eKTTRFl5FQ==
X-Received: by 2002:a19:8a46:: with SMTP id m67mr130126lfd.515.1608234671567;
        Thu, 17 Dec 2020 11:51:11 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id f15sm695124lfc.10.2020.12.17.11.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:51:10 -0800 (PST)
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
 <28468e30-a832-9774-bed3-ac986aef8831@gmail.com> <X9tzA4q8mv2j13yo@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <773e4951-eddd-c09b-9513-daf942b15dee@gmail.com>
Date:   Thu, 17 Dec 2020 22:51:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9tzA4q8mv2j13yo@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.12.2020 18:02, Thierry Reding пишет:
> On Thu, Dec 17, 2020 at 04:45:03PM +0300, Dmitry Osipenko wrote:
>> 17.12.2020 16:41, Thierry Reding пишет:
>>> On Thu, Dec 17, 2020 at 12:40:05PM +0300, Dmitry Osipenko wrote:
>>>> Tegra PHY driver now supports waking up controller from a low power mode.
>>>> Enable runtime PM in order to put controller into the LPM during idle.
>>>>
>>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>>>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>>>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>>>> Tested-by: Ion Agorria <ion@agorria.com>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
>>>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>> index 5fccdeeefc64..655671159511 100644
>>>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
>>>> @@ -38,21 +38,24 @@ struct tegra_usb_soc_info {
>>>>  
>>>>  static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
>>>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>>>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>>>  	.dr_mode = USB_DR_MODE_HOST,
>>>>  	.txfifothresh = 10,
>>>>  };
>>>>  
>>>>  static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
>>>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>>>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>>>  	.dr_mode = USB_DR_MODE_HOST,
>>>>  	.txfifothresh = 16,
>>>>  };
>>>>  
>>>>  static const struct tegra_usb_soc_info tegra_udc_soc_info = {
>>>>  	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
>>>> -		 CI_HDRC_OVERRIDE_PHY_CONTROL,
>>>> +		 CI_HDRC_OVERRIDE_PHY_CONTROL |
>>>> +		 CI_HDRC_SUPPORTS_RUNTIME_PM,
>>>>  	.dr_mode = USB_DR_MODE_UNKNOWN,
>>>>  };
>>>>  
>>>> @@ -323,6 +326,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
>>>>  	usb->data.hub_control = tegra_ehci_hub_control;
>>>>  	usb->data.notify_event = tegra_usb_notify_event;
>>>>  
>>>> +	/* Tegra PHY driver currently doesn't support LPM for ULPI */
>>>> +	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
>>>> +		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
>>>> +
>>>
>>> Does this prevent the wakeup_enabled from being set for ULPI PHYs?
>>
>> Yes
> 
> Okay, it should be fine then to keep that WARN_ONCE in that prior patch
> since we should really only get there if there's something seriously
> wrong.

Correct, that is the actual intention of the warning.

