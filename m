Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6E6C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F0C561139
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 08:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhDZIrz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 04:47:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42450 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZIrz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 04:47:55 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lawtd-0004pg-Ed
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 08:47:13 +0000
Received: by mail-wm1-f71.google.com with SMTP id k15-20020a05600c0b4fb029013886a4b6a5so3217952wmr.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 01:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WNiJ9j/ReCCELnSWT4R1Xa4Eh6A3I3MqyvJFgayyiu0=;
        b=IDE2K0jEttpkSTuRKcovlz+81+xYQfgx9N6ZUuVh6ghUAimY6zCeBU4nCIP3eyy5bc
         4+E/8dtv3uAYxJABUZgzcOrmmQgMCCL5QdPwgf/oIp3SpVimafZYSrtqvKd8P4lCG+73
         db/JeXihv5V8NCSXcnLcH8aVeEy2kwTCQhIP1NQ3s7J4oLn+QnmHf5OYKiGNvy+IJ8n7
         8GQnIJ1QK0bLcRqbB0nM/shcYKsXBvGxPKgxJmTb76R6PSqiLIwwF1IjEnqiCPWjtSUN
         3pZjGszMBAVvORTsiWDnP2TKw2zGGHkvUkFJe4m+3m2t2G+9jNzaI4pwfAC/whQ4ivTK
         OtoQ==
X-Gm-Message-State: AOAM531uVlUy2Km+THGk0ifHlT7yGGaUuFnCjAHpSt6my/2JXUcR9Br+
        JR/DJ6mXalAP9alqOgOhLBIYj4lVUbSw7iirPCLyIDWfPsE9pxLwnnxnbM/NiwQMgE25YXxc+L8
        Sm33fSRusIwFEil1NYEIUuK7AjuDocWshd8UJp6lX
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr20054569wmc.51.1619426833031;
        Mon, 26 Apr 2021 01:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrUFfbGUozT8GEmNRuPdPF+EWL2jPVTerTlxDnmXt9wwCFYRqudvrmg9R48/z7Z4pCqLkpZQ==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr20054556wmc.51.1619426832804;
        Mon, 26 Apr 2021 01:47:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id l9sm19848389wrz.7.2021.04.26.01.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:47:12 -0700 (PDT)
Subject: Re: [PATCH 03/10] memory: tegra: Push suspend/resume into SoC drivers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-4-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d1626fd2-90e3-7a26-51b8-497a344aee6f@canonical.com>
Date:   Mon, 26 Apr 2021 10:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 18:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Continuing the scheme of unification, push suspend/resume callbacks into
> per-SoC driver so that they can be properly parameterized.
> 
> While at it, also move the ->init() callback into the new tegra_mc_ops
> structure to keep things clean.

Please split this part. This is just moving pointer from one structure
to another, quite small change.

The rest of the patchset is quite different - you now call
tegra_mc_suspend() from a per-SoC driver and move the code around.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       | 24 ++++++++---------------
>  drivers/memory/tegra/tegra186.c | 27 ++++++++++++++++++++++----
>  drivers/memory/tegra/tegra20.c  | 34 ++++++++++++++++++++++++++++++++-
>  include/soc/tegra/mc.h          |  9 +++++++--
>  4 files changed, 71 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index b7e104bf6614..2b21131d779c 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -829,8 +829,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  
>  	mc->debugfs.root = debugfs_create_dir("mc", NULL);
>  
> -	if (mc->soc->init) {
> -		err = mc->soc->init(mc);
> +	if (mc->soc->ops && mc->soc->ops->init) {
> +		err = mc->soc->ops->init(mc);
>  		if (err < 0)
>  			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
>  				err);
> @@ -867,30 +867,22 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int tegra_mc_suspend(struct device *dev)
> +static int __maybe_unused tegra_mc_suspend(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
> -	int err;
>  
> -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> -		err = tegra_gart_suspend(mc->gart);
> -		if (err)
> -			return err;
> -	}
> +	if (mc->soc->ops && mc->soc->ops->suspend)
> +		return mc->soc->ops->suspend(mc);
>  
>  	return 0;
>  }
>  
> -static int tegra_mc_resume(struct device *dev)
> +static int __maybe_unused tegra_mc_resume(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
> -	int err;
>  
> -	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
> -		err = tegra_gart_resume(mc->gart);
> -		if (err)
> -			return err;
> -	}
> +	if (mc->soc->ops && mc->soc->ops->resume)
> +		return mc->soc->ops->resume(mc);
>  
>  	return 0;
>  }
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
> index 8e77567d1378..9d3fdb609d55 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -45,6 +45,17 @@ static void tegra186_mc_program_sid(struct tegra_mc *mc)
>  	}
>  }
>  
> +static int tegra186_mc_resume(struct tegra_mc *mc)
> +{
> +	tegra186_mc_program_sid(mc);
> +
> +	return 0;
> +}
> +
> +static const struct tegra_mc_ops tegra186_mc_ops = {
> +	.resume = tegra186_mc_resume,
> +};
> +
>  #if defined(CONFIG_ARCH_TEGRA_186_SOC)
>  static const struct tegra_mc_client tegra186_mc_clients[] = {
>  	{
> @@ -701,6 +712,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
>  static const struct tegra_mc_soc tegra186_mc_soc = {
>  	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
>  	.clients = tegra186_mc_clients,
> +	.ops = &tegra186_mc_ops,
>  };
>  #endif
>  
> @@ -1909,6 +1921,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
>  static const struct tegra_mc_soc tegra194_mc_soc = {
>  	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
>  	.clients = tegra194_mc_clients,
> +	.ops = &tegra186_mc_ops,
>  };
>  #endif
>  
> @@ -1961,22 +1974,28 @@ static const struct of_device_id tegra186_mc_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
>  
> -static int __maybe_unused tegra186_mc_suspend(struct device *dev)
> +static int __maybe_unused tegra_mc_suspend(struct device *dev)
>  {
> +	struct tegra_mc *mc = dev_get_drvdata(dev);
> +
> +	if (mc->soc->ops && mc->soc->ops->suspend)
> +		return mc->soc->ops->suspend(mc);
> +
>  	return 0;
>  }
>  
> -static int __maybe_unused tegra186_mc_resume(struct device *dev)
> +static int __maybe_unused tegra_mc_resume(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
>  
> -	tegra186_mc_program_sid(mc);
> +	if (mc->soc->ops && mc->soc->ops->resume)
> +		return mc->soc->ops->resume(mc);
>  
>  	return 0;
>  }
>  
>  static const struct dev_pm_ops tegra186_mc_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra186_mc_suspend, tegra186_mc_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)

What's the benefit here? You basically define your own suspend-resume
ops, on top of PM suspend-resume ops... Before it was quite obvious code
- the Tegra186 MC driver had very simple suspend/resume which did simple
job. Now it feels like trickier code to follow - Tegra186 driver calls
it's resume (with the same name as others - another confusion) which is
a simple wrapper calling somewhere else (need to jump to assinment of
resume()).


Best regards,
Krzysztof
