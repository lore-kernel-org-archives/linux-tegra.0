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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4049CC2BBCF
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:28:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3BD2233EB
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 17:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgLPR2s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 12:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbgLPR2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 12:28:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818A2C0617B0;
        Wed, 16 Dec 2020 09:28:07 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id s26so15673967lfc.8;
        Wed, 16 Dec 2020 09:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HEgHvQvC+fvQSQFOK0fx2c6TuA3OA18Kvj4t0km5zDk=;
        b=e0dLQ1JlIsy7KcUJConEdf/unbHgp7ofSi882pJVbBxpoNSw9iRklPXeJsFXHReW0m
         yXApqS1Jpc8YzN8yj1SgeVNvliz9S3ZDig/mFknljef5aqwInOPVCc5hNQJv7uvfbQxs
         iwlVY7fOMFllgQe+qbjLK5Khs97F741X3ePd2U2c6iL/iclxXyoqqZvYQ3ZWZ3SLzwdl
         RpMyThlSBel22HCeLZGqbSEXaR0r2Fr5aYHYGgNcf1iOIeuNr7UTlBShdKnZx60xrxiA
         wU4w2LablM/Kq7ktIUvG9QWhrMrussk5gEtkzzqSjF5CeNmpBJUSPgv6wFsz/OICKich
         lj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HEgHvQvC+fvQSQFOK0fx2c6TuA3OA18Kvj4t0km5zDk=;
        b=taaAvlv4zP9KepDV/p4ZurIOkmxOIfZov8kcVl8e1dD8jd1VYK4wmLSd7IKg/+AnIK
         RFWajUYLAKiUO3RwY+P8jmbc5Ae4OB0cWZ0/ALj6xJY8QbB5CL7LvPw1KdUmwVG1bTiz
         Ev1zcVUusJvq+KQ4v60AtIFAxXBYNYqVNy6yOaxMeVVcYsQ0fpo0r0qfy4W96nVmWgXj
         HfniKRaPUF7bReO4guRdl0cyw3PrPzTWKfqTafUoXHaGmCPvkPr4gBuma59tLEiru61Q
         IEODIiZ/jPp+Ivaqd3ljYUhkNtXdAlhXqgVogx8dIhkaYtKclOzBi8uG6ogj68qeRb2o
         /H/g==
X-Gm-Message-State: AOAM5320ND68e/WtAnOu3xAyY/HysDUvTMLl0Z8/a95wEa/aGA177iil
        skgVemnVz491m5VHNokyz6iKLMqxv4M=
X-Google-Smtp-Source: ABdhPJz2M9/7yQWq+L2724lT763ScpZBPLboMevj0BFGobg6XMqorsyiGnVL1LxpXtVOh8/kfH1xLA==
X-Received: by 2002:a2e:90d3:: with SMTP id o19mr15027475ljg.382.1608139684875;
        Wed, 16 Dec 2020 09:28:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id c10sm293393lfh.258.2020.12.16.09.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 09:28:04 -0800 (PST)
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
 <33d576a4-5ace-e1a1-d829-77266025aa9b@gmail.com>
 <20201216172253.GC238371@rowland.harvard.edu>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <76e776a1-104e-ea5b-46ad-496235c6c5fe@gmail.com>
Date:   Wed, 16 Dec 2020 20:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201216172253.GC238371@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 20:22, Alan Stern пишет:
> On Wed, Dec 16, 2020 at 08:09:51PM +0300, Dmitry Osipenko wrote:
>> 16.12.2020 19:45, Alan Stern пишет:
>>> On Tue, Dec 15, 2020 at 11:21:12PM +0300, Dmitry Osipenko wrote:
>>>> The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
>>>> SoCs. The ehci-tegra driver is obsolete now, remove it.
>>>>
>>>> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
>>>> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
>>>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/usb/host/Kconfig      |   9 -
>>>>  drivers/usb/host/Makefile     |   1 -
>>>>  drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
>>>>  3 files changed, 614 deletions(-)
>>>>  delete mode 100644 drivers/usb/host/ehci-tegra.c
>>>>
>>>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>>>> index 31e59309da1f..9c9e6ff9c43a 100644
>>>> --- a/drivers/usb/host/Kconfig
>>>> +++ b/drivers/usb/host/Kconfig
>>>> @@ -266,15 +266,6 @@ config USB_EHCI_HCD_AT91
>>>>  	  Enables support for the on-chip EHCI controller on
>>>>  	  Atmel chips.
>>>>  
>>>> -config USB_EHCI_TEGRA
>>>> -	tristate "NVIDIA Tegra HCD support"
>>>> -	depends on ARCH_TEGRA
>>>> -	select USB_EHCI_ROOT_HUB_TT
>>>> -	select USB_TEGRA_PHY
>>>> -	help
>>>> -	  This driver enables support for the internal USB Host Controllers
>>>> -	  found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
>>>
>>> For people upgrading from earlier kernel versions, do you think it
>>> would help to add a pointer here telling them which Kconfig option
>>> they need to enable now in order to get this functionality?
>>
>> Could you please clarify what do you mean by the "pointer"?
> 
> See the entries for USB_CNS3XXX_EHCI, USB_OCTEON_EHCI, 
> USB_OHCI_HCD_OMAP3, and USB_OHCI_SH in that Kconfig file for examples.

I'll point the deprecated USB_EHCI_TEGRA to the CI driver in a v2, thanks.
