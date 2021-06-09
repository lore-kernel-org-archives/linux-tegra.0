Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33BCC48BCF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A727661364
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 11:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhFIMBM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:01:12 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:36534 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbhFIMBL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 08:01:11 -0400
Received: by mail-lj1-f180.google.com with SMTP id 131so31325899ljj.3;
        Wed, 09 Jun 2021 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8h2Tk8aBPc/iaCITxAcn87/DrSk8zNe5RTwQkE4qwIA=;
        b=J5vAbp5yYNNWYMqneMYO3QID9Im23AK33Ci4F7MVIUWXw5ZPHha9uKO6f50JJWUuUn
         YJm94gbKSKvZU4nuLHPsl9M+PCMaQpUwhAUtPPdMwios9JWH5AVsCUmxFQzvqY07zfPr
         Y8WDs74iEzIJn4KITWdUe0y0u07AXeR984z8znDhHFSqMR5wM6iF9PXxS1OWOXU/Uc+7
         k6HU312U8st+dfPkR8cOkQ5Gjpum9rxp1XkE6+jbP6vAaU7+pNQabM5i/sJxmhzRYw8m
         2UEnPc93Ajk14T7qYP7nTvaqAYRKjCqgUgPOoFB/lzpO/QKNUT+cZW8k4VRS1ZDcoJer
         qHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8h2Tk8aBPc/iaCITxAcn87/DrSk8zNe5RTwQkE4qwIA=;
        b=EqDoIh6Y8FWQcMtbs9RzZF+doghnWYAUsdzQK/BnabGwvMEZg66rd7vHRo9mbGqZtu
         UNUx2hnFT/hakhT12VRJUJ6Mg3y7n2DaV+hhUv+QY2DOC+gL700dlnoA4eluRQU1cUTh
         YZBDZ721bNTLQPXufNG8LdvlsQhYFfE8kPq5QOntYiNHb2/8Up7gbPS03hoPTM3U+Cgs
         JaxP82X/Uc+5HOypEYHEB9WMrPB+wq0DAfwVy1ruWmrIYOaBC6YnTjXSPcfcM6h1zGEE
         yhSLJmk5FTXk8uXLapA0mMFaqPUQzRSUTWvuwg8QTVffPKQHI13BQkQvmh0DytIG6nBy
         0EIw==
X-Gm-Message-State: AOAM533Sk24v+ZgVQkWZ+XptowetPIa+9xuAIX7N3WeDzNW4e66wB0ux
        TPn5Qy4Ii6nD8uJ2UdipVrnsH9VoRwc=
X-Google-Smtp-Source: ABdhPJyXUei0TqGN1j9fV39yK8w32s4YHopGTlsxhxbWJshSrganTkW3vgO0DSSMx/CEGj0GFBYHoQ==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr21534561ljg.77.1623239880962;
        Wed, 09 Jun 2021 04:58:00 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id w17sm339815lfn.5.2021.06.09.04.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 04:58:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] memory: tegra: Add missing dependencies
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609112806.3565057-1-thierry.reding@gmail.com>
 <20210609112806.3565057-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0c762772-929e-2eb8-6568-4aa82ea2f9ad@gmail.com>
Date:   Wed, 9 Jun 2021 14:58:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609112806.3565057-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.06.2021 14:28, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> When enabling the COMPILE_TEST Kconfig option, the Tegra memory
> controller can be built without ARCH_TEGRA being selected. However, the
> driver implicitly depends on some symbols pulled in via ARCH_TEGRA,
> which causes the build to break.
> 
> Add explicit dependencies for OF_EARLY_FLATTREE and OF_RESERVED_MEM to
> the Tegra MC Kconfig option to make sure they are selected even if
> ARCH_TEGRA is not.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/tegra/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index f9bae36c03a3..ecfb071fc4f4 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -48,6 +48,8 @@ config TEGRA124_EMC
>  config TEGRA210_EMC_TABLE
>  	bool
>  	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
> +	select OF_EARLY_FLATTREE
> +	select OF_RESERVED_MEM
>  
>  config TEGRA210_EMC
>  	tristate "NVIDIA Tegra210 External Memory Controller driver"
> 

Will this work if CONFIG_OF is disabled?
