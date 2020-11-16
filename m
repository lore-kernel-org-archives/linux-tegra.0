Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60292C2D0A3
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 19:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13C522225E
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 19:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j00ser3I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgKPTQh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 14:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgKPTQh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 14:16:37 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD868C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 11:16:35 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y16so21437302ljh.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 11:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kvaxviO7BiQzvISqbhoHjHqNzxDUY0/V0uMNpsyJv20=;
        b=j00ser3ImM8d0ZanCDxGUmu7L6Q61EdycCzhqxwQoO7vUMTBjOF8tBNwwekdZAiy3K
         LLMG3K3DVdy9DTn4dqcp0T20y5kwgXKCb1S+j1sEIiZxicAX4YP3vLxqnw4FFXtQTQhw
         dc+UAUcF44A/C2pmIC/uOmU8JifIKoWLxALjHBjhF9S/47NjNgbdVgNP6Q2EZmHSBG/7
         KokZznXjrnbkxq4M8P50lsoqgheI+Hy7Tzl68M/rq7d92nINJOEwQXRFuK3NsHqVABix
         3IShHXEbrZ/ZVo+wgEw+aLN5nts5L6pUONrRUgp5yZXE5pUjwvFlE0jWKowE8Eg/WJQN
         wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kvaxviO7BiQzvISqbhoHjHqNzxDUY0/V0uMNpsyJv20=;
        b=En7sttPwu97Zj8rHEWfCX28C3JaXRdZGRyehlgE61FKGziPy8rs9E18JAjj//vKjii
         v9hiv2Cov9VD/iqvqj8vJMj+xDTwT91dLRHlBPwRaR9WTYZJOWi9qa6IcLLU52+LzlW1
         7QCDfd2YfXjx+htnqToDRd+7PDjIhY9B1MNCQ/ZWJNFzmVcDQsEo9FtBnh0LjC88n3sU
         HTp3LHllH9xler5yy9GWG2NG87S4EDJBHu6w3+WuE1npo2232PuoAVJM1/XWNTFcfC+U
         3onIyAIMCugS6lD+Gpo/KtUe3eBqw4znGY7ndGb9iXNfcxKBLtjHN7au87RURFi/BtKa
         6DEA==
X-Gm-Message-State: AOAM533T/LxEfV8fGopRR3u/FncDYlInqsakSvYuuvpDUGkdca5NWuaR
        dfTxgNQsE0gMYumjKEcC78H5G73xxhE=
X-Google-Smtp-Source: ABdhPJzTpJBjm2JOYoOdCvkVPAA44FURpTStYMu481jUHdt3L/5HeRUKKJXU8qcAARMSo1aj7d+sgQ==
X-Received: by 2002:a2e:91d6:: with SMTP id u22mr325935ljg.206.1605554193917;
        Mon, 16 Nov 2020 11:16:33 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id l17sm2862053lfc.221.2020.11.16.11.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 11:16:33 -0800 (PST)
Subject: Re: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on
 TEGRA20_APB_DMA
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-tegra@vger.kernel.org
References: <20200923003421.4561-1-digetx@gmail.com>
 <20201116132005.GD2224373@ulmo>
 <4699e7eb-ac82-4666-9bca-7692d5441b3f@gmail.com>
 <20201116164947.GB2584498@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a3705d0-43ba-73b8-3195-176e7aa5c718@gmail.com>
Date:   Mon, 16 Nov 2020 22:16:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201116164947.GB2584498@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.11.2020 19:49, Thierry Reding пишет:
> On Mon, Nov 16, 2020 at 04:48:39PM +0300, Dmitry Osipenko wrote:
>> 16.11.2020 16:20, Thierry Reding пишет:
>>> On Wed, Sep 23, 2020 at 03:34:21AM +0300, Dmitry Osipenko wrote:
>>>> The DMA subsystem could be entirely disabled in Kconfig and then the
>>>> TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
>>>> fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
>>>> dependency.
>>>>
>>>> The FUSE driver isn't a critical driver and currently it only provides
>>>> NVMEM interface to userspace which isn't known to be widely used, and
>>>> thus, it's fine if FUSE driver fails to load.
>>>
>>> This isn't entirely accurate. The FUSE driver also provides SKU specific
>>> information via tegra_sku_info and exposes some of the FUSE registers to
>>> other drivers, such as the calibration data for XUSB.
>>
>> The SKU data is read out only once during early boot and the DMA is not
>> used for this. The FUSE platform driver exists separately from the early
>> FUSE code.
> 
> True, but the commit message isn't entirely accurate as-is, because on
> later Tegra SoCs the driver does a bit more than that. So if you don't
> mind I'll reword this to be a little more accurate if I end up deciding
> to apply it.

Please feel free to edit it as yo wish.

>>> The APB DMA is really only needed to work around an issue on Tegra20, so
>>> perhaps this really is okay. On the other hand, could we not just change
>>> the dependency to something like
>>>
>>> 	select DMADEVICES if ARCH_TEGRA_2x_SOC
>>> 	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
>>>
>>> to fix the Kconfig issue but keep the explicit documentation of this
>>> dependency?
>>
>> On Tegra20, the APB DMA is used only for by NVMEM which is exposed via
>> sysfs. If DMA is disabled, then NVMEM isn't registered because
>> tegra20_fuse_probe() returns -EPROBE_DEFER.
> 
> Again, true. But -EPROBE_DEFER is a silent error, so if somebody indeed
> has DMADEVICES disabled and TEGRA20_APB_DMA is not available, then they
> will not get FUSE support and they are going to struggle to find out why
> that's not working.
> 
>> Hence there is no real need to enforce the extra dependencies. It's
>> always better to allow minimizing the build dependencies whenever
>> possible, IMO, and it's possible to do it in this case.
> 
> I don't entirely agree with this. Dependencies (and especially selects)
> are used to pull in driver and/or features that are generally considered
> useful. In this particular case, TEGRA20_APB_DMA is needed for the FUSE
> driver to work correctly on Tegra20. Whether FUSE support on Tegra20 is
> useful or not isn't quite relevant at this point.
> 
> There's also a balance as to what makes sense and what doesn't. APB DMA
> is a useful feature in itself and disabling it is very much discouraged
> because there are plenty of other drivers that can make use of it. That
> is also the reason why we enable it in the default configuration. So I
> don't consider a select on a symbol that's enabled by default an extra
> dependency. Instead it's more of an explicit statement that you really
> do want this enabled if you want that driver to work.
> 
> And like I said, if we don't have this and the driver will fail to probe
> because of -EPROBE_DEFER, the user is going to have a very difficult
> time of finding out why exactly that's happening. We're not even
> emitting an error for this, so there's no way of knowing, even if they
> enable driver debugging, /why/ the FUSE driver isn't working.

Recent kernels have /sys/kernel/debug/devices_deferred.
