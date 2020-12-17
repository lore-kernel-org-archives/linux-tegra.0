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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8472CC2BB48
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 19:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E114239EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 19:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgLQToR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 14:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgLQToQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 14:44:16 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41568C0617A7;
        Thu, 17 Dec 2020 11:43:36 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y19so60548558lfa.13;
        Thu, 17 Dec 2020 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vBbSjsodA5VnvSxw1TcN/8LkcmQmCADHxuYEw3lfmLg=;
        b=MT4y8l3J9ocjk6Hc0STooTDAPzHBBzhr5mtr8lvMMQpSeneVErMF0X3WWNHntnBPgC
         tX8kloAcV9FY5s5UD2NLMnVFkblwLe5o+iasZnQS/5pLrieH8pAANDBCdgxF4LiWhQ7O
         JFbDFX7V189JKvOSNOUe/5ZCeVvTFXWFisxMOcnVjyC4nbyJlu1d0nM7TKzmPBFxxazq
         t3q4e9K1reapQrj8xPi/apdGRsRpiAOxtjqq+9zbiaYvWXJREYz9Otpf2O1nl9vd8DPm
         u7pllNNXj2gxSvtcaSsce+kdeeRUh+DVCeC6a0Tu2HyAmMcxxAcdW9Z/p1yumDu4edFc
         KlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vBbSjsodA5VnvSxw1TcN/8LkcmQmCADHxuYEw3lfmLg=;
        b=eQLRRwNLc07NECNOumJiwbw7Xa2h+Ekx9Pgf/HTCkqmq7Rqm9YkJ3q1t8PWc2qyW/U
         rk4ZQC9QFNrg5YzZQbYioSMI7ONORrsFraStMlQAuiq0H8a1e4/TVJwhWTTHK8CYU2kD
         qqdxcTGqOpLOQQMvLeW7gqYOx7PuXD7CmFYWJUuzD6/t81LR10ukRMa9ulkfDaBKUtZx
         RQEg4ByOyLA+jewLozGvtRalFujgFIpu4X/aPu9kJBAH6f4Oe4dg/R8a3LWpvlaU5eE7
         p6Ep3rglyP9Y6W6JEE8iEimOgPn4adwpucZ6hf1MfD1+7THJG/O8ncs0cEeXtVQ/3aHe
         yOmA==
X-Gm-Message-State: AOAM533dGNxFC18d6x+QXDj/gWGfYwy0OKROAEsV7VocC7nPI61Kf+OG
        VwT8cp/zQOurdkPXy7BzMNdjaZCX168=
X-Google-Smtp-Source: ABdhPJxnGQ1MMMAXLX6lUBIwTM9S5CIfD2NcABUoD+/8oUn1unMYw0duaT1V+CzLuLSE8cBN8bA2VQ==
X-Received: by 2002:a19:e8e:: with SMTP id 136mr133364lfo.272.1608234214562;
        Thu, 17 Dec 2020 11:43:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id u25sm579622lfm.111.2020.12.17.11.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:43:34 -0800 (PST)
Subject: Re: [PATCH v2 7/8] usb: host: ehci-tegra: Remove the driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-8-digetx@gmail.com>
 <20201217155003.GA280158@rowland.harvard.edu>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dae2cf1c-68ae-19e7-d5aa-74266aa5239f@gmail.com>
Date:   Thu, 17 Dec 2020 22:43:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201217155003.GA280158@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.12.2020 18:50, Alan Stern пишет:
> On Thu, Dec 17, 2020 at 12:40:06PM +0300, Dmitry Osipenko wrote:
>> The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
>> SoCs. The ehci-tegra driver is obsolete now, remove it and redirect the
>> older Kconfig entry to the CI driver.
>>
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Tested-by: Ion Agorria <ion@agorria.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/host/Kconfig      |   8 +-
>>  drivers/usb/host/Makefile     |   1 -
>>  drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
>>  3 files changed, 6 insertions(+), 607 deletions(-)
>>  delete mode 100644 drivers/usb/host/ehci-tegra.c
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 31e59309da1f..318315602337 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -269,9 +269,13 @@ config USB_EHCI_HCD_AT91
>>  config USB_EHCI_TEGRA
>>  	tristate "NVIDIA Tegra HCD support"
>>  	depends on ARCH_TEGRA
>> -	select USB_EHCI_ROOT_HUB_TT
>> -	select USB_TEGRA_PHY
>> +	select USB_CHIPIDEA
>> +	select USB_CHIPIDEA_HOST
>> +	select USB_CHIPIDEA_TEGRA
>>  	help
>> +	  This option is deprecated now and the driver was removed, use
>> +	  USB_CHIPIDEA_TEGRA instead.
>> +
>>  	  This driver enables support for the internal USB Host Controllers
>>  	  found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
> 
> It doesn't really make sense to say "... the driver was removed..."
> and then in the next paragraph say "This driver enables...".  You
> should change the second paragraph to begin: "Enable support for...".
> 
> That's a minor matter, though, and you can easily fix it in the next
> patch version.  Everything else is okay.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Okay, thanks.

