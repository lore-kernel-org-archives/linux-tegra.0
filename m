Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27836C4742C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 13:49:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C383A2227F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 13:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBw2Rum5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgKPNso (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 08:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgKPNso (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 08:48:44 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED61C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 05:48:43 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id u19so18960388lfr.7
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Uc9RxlI1nt1Z8F2RKYdDm8AwCBgYrTJUUs/Xrfb+VSA=;
        b=FBw2Rum58fYBvtwrixZfJTY/x4A9m/j5eLKIRT9Dt80ildikgEJUnx0wpq5ZNS8KhV
         UrfD+CAhdP3g7sB+t00xA7GTUHt0/jTbJT34oaNfZg2WPuLHJ42kUpXbeq28xahVfFdj
         QDdiNUULGUEoO3ECBfebMnSG8l7kOm4hFdNOxvzrPcGuHnw32VhDTNBwzzxYnlOeiEGj
         dbMn91lO6iIYfT5YnZNXpBugkgHuRVGCOawU+0TS791Xhzu+dwC286ql31A1hJ50g/lJ
         tpW96zwUs1uSPG/mtyYzvIfZfUyeIZAADYPAgxvL01LJlBKylfpSHCLvMqosSWgiyNAL
         vXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Uc9RxlI1nt1Z8F2RKYdDm8AwCBgYrTJUUs/Xrfb+VSA=;
        b=sYUuBw+o/XfdWXNnkbGWSgF18bmSqiE6q9cPPkA9h+o/6atY0e1AI5LYrUaIBLdmdA
         VCMblfHcntRUo6OEo/LmfF6G9Tk7p0w/gn8+41R4/sTn39zsfwNiefTWuScprvRBsYUu
         HdFWCLhHbYO15eHiwxVwjhqGRJokpq8csQcYydQ6ph65RLYWmSFvIIQvvXsZSlhKPu+h
         5R0nM1wACltaBXWz043uEkphno5c0FnSMn4bGr2I6H+zaRwSnrEvOfUmQ8sc2Mh7AJ6m
         JkbD9oYfUM/UVKpUuLBHnBwuW9g7OfkWRrCrc3gzw1zrjswMIF4KlxB4+MM7znoQMtQX
         ed/w==
X-Gm-Message-State: AOAM531t2+zNiFEZpTHTEp7SyIqp45VglzeAWrLel6JFZcgoAHK8CHp+
        9U9kSQLWi41Kjvw70njOzm0s2l7izZ8=
X-Google-Smtp-Source: ABdhPJyES13BcONVXS4pXQeAMDyklObRNFLvo5rnC1w1B4unNCgRmaL8vWo9X6Ls/tUWaen2J1FxuQ==
X-Received: by 2002:a19:f510:: with SMTP id j16mr5216349lfb.389.1605534521081;
        Mon, 16 Nov 2020 05:48:41 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id f24sm2367179ljc.54.2020.11.16.05.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 05:48:40 -0800 (PST)
Subject: Re: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on
 TEGRA20_APB_DMA
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-tegra@vger.kernel.org
References: <20200923003421.4561-1-digetx@gmail.com>
 <20201116132005.GD2224373@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4699e7eb-ac82-4666-9bca-7692d5441b3f@gmail.com>
Date:   Mon, 16 Nov 2020 16:48:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201116132005.GD2224373@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.11.2020 16:20, Thierry Reding пишет:
> On Wed, Sep 23, 2020 at 03:34:21AM +0300, Dmitry Osipenko wrote:
>> The DMA subsystem could be entirely disabled in Kconfig and then the
>> TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
>> fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
>> dependency.
>>
>> The FUSE driver isn't a critical driver and currently it only provides
>> NVMEM interface to userspace which isn't known to be widely used, and
>> thus, it's fine if FUSE driver fails to load.
> 
> This isn't entirely accurate. The FUSE driver also provides SKU specific
> information via tegra_sku_info and exposes some of the FUSE registers to
> other drivers, such as the calibration data for XUSB.

The SKU data is read out only once during early boot and the DMA is not
used for this. The FUSE platform driver exists separately from the early
FUSE code.

> The APB DMA is really only needed to work around an issue on Tegra20, so
> perhaps this really is okay. On the other hand, could we not just change
> the dependency to something like
> 
> 	select DMADEVICES if ARCH_TEGRA_2x_SOC
> 	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
> 
> to fix the Kconfig issue but keep the explicit documentation of this
> dependency?

On Tegra20, the APB DMA is used only for by NVMEM which is exposed via
sysfs. If DMA is disabled, then NVMEM isn't registered because
tegra20_fuse_probe() returns -EPROBE_DEFER.

Hence there is no real need to enforce the extra dependencies. It's
always better to allow minimizing the build dependencies whenever
possible, IMO, and it's possible to do it in this case.
