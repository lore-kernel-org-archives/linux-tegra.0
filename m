Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE2AC5519F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 10:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1C812223C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 10:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uHzE8FQm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgKPKEe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 05:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgKPKEe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 05:04:34 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3886C0613CF
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 02:04:33 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id x9so19440613ljc.7
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZmjIGIJvWbNwTcs6wY2yBaK3bpVv+OHvz7tH87YwYZc=;
        b=uHzE8FQmyD1MvhqMopD3KicuEX7NxcYe8dEMPD/1rXqAKs4DANWOrWu4JpbcHVbvuE
         537ZyNer4tnhhyoR5oHzmcrWOsRY8ncJsUweqzCcWZrneRZz8XKh0OCGUIhFbuCM/d38
         Bb9ujsyBW8vVK0a5h8Cp8/AQ+at7cFA1KlDRTeoxMtvf2cj7aY8KuGvqTI+oCZsIwiRK
         /216JimzStgjngSyTeLl2lxI6FEj8KDmF07LVfNEdHy7SOT9XoFD8ATl89Wr3harXcFY
         H6R+Kgf/8GMVGk+DUSDVkG8VWJ2p1Q0g0inYV4I/rBQcw4I5W8u+t3HN0RVB1oSuHOBC
         wdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZmjIGIJvWbNwTcs6wY2yBaK3bpVv+OHvz7tH87YwYZc=;
        b=DdFnTmkZu+vJl6d9ujj+aFx3MXxuwKg+Oi1xhObg85L+BHVNnhsJ0H09CM06Icav9X
         Ce87bx/GYYI4S8obb6DNM50ZWwSuaQ2IRi0ERJH/00G47VhhYQzeTHAO8urJiUSlKEnR
         2G5XWTAIJdK+TUGap5MVje2+5MYBDIQWlUeDyYgg303MxD0f7nv0aLfiy7+dUQtG5wDV
         B+53pVHYgrdqoVUoeZCIp/DUY3xR48UwKXJEERRn4vNerbmnKNFMWg8bJC5w1KiLefrK
         OrHoB+g0oCXAdafCQ+aWU33h8LBpEdCP5x8QjOMGgx8BMdCnAKbuhKMRHwBuvbgHWgXy
         X2Dw==
X-Gm-Message-State: AOAM531928kPzzKJlfO4Eh0g7ZgSzoab6vu6HM1iu4Ho2NMij0GOPkHH
        +x2fXwk0LYOeYBNc5zfnT7nbXPNS8O8=
X-Google-Smtp-Source: ABdhPJyg1BMZz6Mc8XBdU0zWAHOXlE7aHbeutDuLv7uEX6cVzSZJhaRg/Kir+syodlX7d5JBE270Eg==
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr2295042ljk.441.1605521071856;
        Mon, 16 Nov 2020 02:04:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id 80sm2680260lfa.276.2020.11.16.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 02:04:31 -0800 (PST)
Subject: Re: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on
 TEGRA20_APB_DMA
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20200923003421.4561-1-digetx@gmail.com>
Message-ID: <9c7ddaf0-5c74-7450-958a-a34918d08146@gmail.com>
Date:   Mon, 16 Nov 2020 13:04:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20200923003421.4561-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.09.2020 03:34, Dmitry Osipenko пишет:
> The DMA subsystem could be entirely disabled in Kconfig and then the
> TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
> fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
> dependency.
> 
> The FUSE driver isn't a critical driver and currently it only provides
> NVMEM interface to userspace which isn't known to be widely used, and
> thus, it's fine if FUSE driver fails to load.
> 
> Let's remove the erroneous Kconfig dependency and let the FUSE driver to
> fail the probing if DMA is unavailable.
> 
> Fixes: 19d41e5e9c68 ("soc/tegra: fuse: Add APB DMA dependency for Tegra20")
> Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209301
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 976dee036470..676807c5a215 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -136,7 +136,6 @@ config SOC_TEGRA_FUSE
>  	def_bool y
>  	depends on ARCH_TEGRA
>  	select SOC_BUS
> -	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
>  
>  config SOC_TEGRA_FLOWCTRL
>  	bool
> 

Thierry, a reminder ping.
