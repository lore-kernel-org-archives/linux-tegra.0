Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACE4C2BBCA
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B5EE233F7
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgLPRKh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgLPRKg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 12:10:36 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122C7C061794;
        Wed, 16 Dec 2020 09:09:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s26so15526567lfc.8;
        Wed, 16 Dec 2020 09:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OX+O9r/Bxythf+A2cZ1Ss4Q6ixNHsz0FLz+1QoE716M=;
        b=Yqmywf7CMdjhYyKHA49glyd9HzHFHG7CSRrkTKH4WLzroQSgXC2WKoz9vNpSwDumA4
         IKEDSzce0MqHsZgo2FTG9JI6hW46DwfKF9mC3DrDxQXEm9yH8BZEdLFdGmvOHPega2l+
         HC2IO9DCUckxPsLQuOV6ND4eQgJL4qR7rEbII4zTv3dyLcWH4rSjENXcL0qRsDNnuAiy
         VyEyW+WiaajOsGTV+SIm1fCNbSuWnBoWAfszW+tpzSTxayzSFOzGBSLtNNda93yHIALL
         q1vX3XM4a5PFRHIix6G+Ql8GNUDkrAMJaPsHVGtkudA3MrpVYANJmpTuj6dDZ29CTG2U
         /iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OX+O9r/Bxythf+A2cZ1Ss4Q6ixNHsz0FLz+1QoE716M=;
        b=ivmAxfso0vY/4D1fcKRsfyWY5H4JcGhIJecwzrWKT0Fbm4YyeXFGmeW3BlkvscmViz
         u2CzQdukxlMaOI6QCeRYXv5WrVDvKIg2jPJf5Sy/MFh62RVQoN/uvTd3M9VdtbW3eB23
         pcvBdG8uMeOdqayygaaZbRg1iZHM5ZUSxnE33oGKv7VvnS5gEaDHuULmySkcqwIuwS5M
         BHOxy4WAsI1zpoYwgp+DjwtdAHpBsg2taqtIyZHXCnP6vDmFkhumP3xB3a+i4Un9z4Pg
         H4W6+Zs/DZW7U/pKXp9XXL7Z20JuMOEW+KV/2tM1ECGzDiT1YGksJSUoWjHM4QbXSomg
         xODQ==
X-Gm-Message-State: AOAM530+grGKpbSVyqr3Ao5r0LwKXLeWD7bG4M+uRBMTs2YaSEPdXqdm
        LGyIfKx6SGTT6uhOMIYSVQnn95j3enc=
X-Google-Smtp-Source: ABdhPJzelYML5WFsrqEixCDjFDSNy/gZeyvn1d+5aBKu5AO12zKQ9KJn2JgqYQdsxJwqqomlDxafDg==
X-Received: by 2002:a05:6512:4cf:: with SMTP id w15mr13265723lfq.656.1608138593227;
        Wed, 16 Dec 2020 09:09:53 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z14sm349678ljc.41.2020.12.16.09.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 09:09:52 -0800 (PST)
Subject: Re: [PATCH v1 7/8] usb: host: ehci-tegra: Remove the driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-8-digetx@gmail.com>
 <20201216164511.GB238371@rowland.harvard.edu>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33d576a4-5ace-e1a1-d829-77266025aa9b@gmail.com>
Date:   Wed, 16 Dec 2020 20:09:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201216164511.GB238371@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 19:45, Alan Stern пишет:
> On Tue, Dec 15, 2020 at 11:21:12PM +0300, Dmitry Osipenko wrote:
>> The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
>> SoCs. The ehci-tegra driver is obsolete now, remove it.
>>
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/host/Kconfig      |   9 -
>>  drivers/usb/host/Makefile     |   1 -
>>  drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
>>  3 files changed, 614 deletions(-)
>>  delete mode 100644 drivers/usb/host/ehci-tegra.c
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 31e59309da1f..9c9e6ff9c43a 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -266,15 +266,6 @@ config USB_EHCI_HCD_AT91
>>  	  Enables support for the on-chip EHCI controller on
>>  	  Atmel chips.
>>  
>> -config USB_EHCI_TEGRA
>> -	tristate "NVIDIA Tegra HCD support"
>> -	depends on ARCH_TEGRA
>> -	select USB_EHCI_ROOT_HUB_TT
>> -	select USB_TEGRA_PHY
>> -	help
>> -	  This driver enables support for the internal USB Host Controllers
>> -	  found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
> 
> For people upgrading from earlier kernel versions, do you think it
> would help to add a pointer here telling them which Kconfig option
> they need to enable now in order to get this functionality?

Could you please clarify what do you mean by the "pointer"?
