Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657BDC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 452A460FD7
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 11:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhEQLpR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 07:45:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37453 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhEQLpR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 07:45:17 -0400
Received: from mail-qt1-f200.google.com ([209.85.160.200])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1libfE-00029h-5h
        for linux-tegra@vger.kernel.org; Mon, 17 May 2021 11:44:00 +0000
Received: by mail-qt1-f200.google.com with SMTP id s11-20020ac85ecb0000b02901ded4f15245so4952675qtx.22
        for <linux-tegra@vger.kernel.org>; Mon, 17 May 2021 04:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5Fvv9aFKgQhxzUsCXY/N+oIIyId65zhquTqNu9qUlz0=;
        b=luOfec+WQAsAKBPm9lTP4ojkUYiiysqjczG3nIPIxzv1iQdNBcaT42INRHHn6QIJl+
         PJURI/NMU9W4uMh+TBQPREjQuZZTloJgGNU2r9weEFhXy2U85qg4iZCXtxtKe9qpqh3Y
         yKdrXAP3E8nmdAuRWY+TcWB8kJ5QGcOJ1iFL4OmeUFTEu9rdNUh5jKUPoDoxijbaD0a3
         2B1wQJz6bI8cChXntAwPzq9UqzmeITPZrsbTg49AMrcpN+AXbK8iNOJ/zhSCcxvL4smy
         ocTDW5qh2IDdNZ8wlZuJPWbYJaT44p1tz4zGpKgLF9DCY3b8ZjfWjNYFWex/zvlaQkJ0
         98LA==
X-Gm-Message-State: AOAM533S+0jRBQeEuCYluFXm6fi5B5WY9tDcqM8kyoBk3iQIOVhdcKSS
        6wMk+NyuXvHfSUJpkc36VvVqZald/Pwfb7FIhe9xy18MtWRM4FWQigBA/8TNUsMYSkyuZy2LOOq
        YU5REX0LbF/gp9fW85R8Q6xljrTq8Qez7+V88riGL
X-Received: by 2002:a0c:9ccc:: with SMTP id j12mr59633403qvf.30.1621251839280;
        Mon, 17 May 2021 04:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzekY+4oWWNgCfCvb4/vDBz08rN5w6N12FofN3iJ4kMmeKz6bg8jACJajokt9NAdzagfOPWCQ==
X-Received: by 2002:a0c:9ccc:: with SMTP id j12mr59633387qvf.30.1621251839113;
        Mon, 17 May 2021 04:43:59 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.4])
        by smtp.gmail.com with ESMTPSA id d28sm9914558qkl.105.2021.05.17.04.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:43:58 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210516205138.22501-1-digetx@gmail.com>
 <20210516205138.22501-2-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3ea6b48f-af3f-51db-8d7b-1292a68ae74e@canonical.com>
Date:   Mon, 17 May 2021 07:43:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516205138.22501-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2021 16:51, Dmitry Osipenko wrote:
> Add common helper which initializes OPP table for Tegra SoC core devices.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 112 +++++++++++++++++++++++++++++++++++++
>  include/soc/tegra/common.h |  30 ++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index 3dc54f59cafe..c3fd2facfc2d 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -3,9 +3,16 @@
>   * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
>   */
>  
> +#define dev_fmt(fmt)	"tegra-soc: " fmt
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
>  #include <linux/of.h>
> +#include <linux/pm_opp.h>
>  
>  #include <soc/tegra/common.h>
> +#include <soc/tegra/fuse.h>
>  
>  static const struct of_device_id tegra_machine_match[] = {
>  	{ .compatible = "nvidia,tegra20", },
> @@ -31,3 +38,108 @@ bool soc_is_tegra(void)
>  
>  	return match != NULL;
>  }
> +
> +static int tegra_core_dev_init_opp_state(struct device *dev)
> +{
> +	struct dev_pm_opp *opp;
> +	unsigned long rate;
> +	struct clk *clk;
> +	int err;
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "failed to get clk: %pe\n", clk);
> +		return PTR_ERR(clk);
> +	}
> +
> +	rate = clk_get_rate(clk);
> +	if (!rate) {
> +		dev_err(dev, "failed to get clk rate\n");
> +		return -EINVAL;
> +	}
> +
> +	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
> +
> +	if (opp == ERR_PTR(-ERANGE))
> +		opp = dev_pm_opp_find_freq_floor(dev, &rate);
> +
> +	err = PTR_ERR_OR_ZERO(opp);
> +	if (err) {
> +		dev_err(dev, "failed to get OPP for %ld Hz: %d\n",
> +			rate, err);
> +		return err;
> +	}
> +
> +	dev_pm_opp_put(opp);
> +
> +	/* first dummy rate-setting initializes voltage vote */
> +	err = dev_pm_opp_set_rate(dev, rate);
> +	if (err) {
> +		dev_err(dev, "failed to initialize OPP clock: %d\n", err);
> +		return err;
> +	}


The devm_pm_opp_set_clkname will call clk_get(), so here you should drop
the clk reference at the end. Why having it twice?

> +
> +	return 0;
> +}
> +
> +/**
> + * devm_tegra_core_dev_init_opp_table() - initialize OPP table
> + * @dev: device for which OPP table is initialized
> + * @params: pointer to the OPP table configuration
> + *
> + * This function will initialize OPP table and sync OPP state of a Tegra SoC
> + * core device.
> + *
> + * Return: 0 on success or errorno.
> + */
> +int devm_tegra_core_dev_init_opp_table(struct device *dev,
> +				       struct tegra_core_opp_params *params)
> +{
> +	u32 hw_version;
> +	int err;
> +
> +	err = devm_pm_opp_set_clkname(dev, NULL);
> +	if (err) {
> +		dev_err(dev, "failed to set OPP clk: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Tegra114+ doesn't support OPP yet */
> +	if (!of_machine_is_compatible("nvidia,tegra20") &&
> +	    !of_machine_is_compatible("nvidia,tegra30"))
> +		return -ENODEV;
> +
> +	if (of_machine_is_compatible("nvidia,tegra20"))
> +		hw_version = BIT(tegra_sku_info.soc_process_id);
> +	else
> +		hw_version = BIT(tegra_sku_info.soc_speedo_id);
> +
> +	err = devm_pm_opp_set_supported_hw(dev, &hw_version, 1);
> +	if (err) {
> +		dev_err(dev, "failed to set OPP supported HW: %d\n", err);
> +		return err;
> +	}
> +
> +	/*
> +	 * Older device-trees have an empty OPP table, we will get
> +	 * -ENODEV from devm_pm_opp_of_add_table() in this case.
> +	 */
> +	err = devm_pm_opp_of_add_table(dev);
> +	if (err) {
> +		if (err == -ENODEV)
> +			dev_err_once(dev, "OPP table not found, please update device-tree\n");
> +		else
> +			dev_err(dev, "failed to add OPP table: %d\n", err);
> +
> +		return err;
> +	}
> +
> +	if (params->init_state) {
> +		err = tegra_core_dev_init_opp_state(dev);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_tegra_core_dev_init_opp_table);
> diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
> index 98027a76ce3d..e8eab13aa199 100644
> --- a/include/soc/tegra/common.h
> +++ b/include/soc/tegra/common.h
> @@ -6,6 +6,36 @@
>  #ifndef __SOC_TEGRA_COMMON_H__
>  #define __SOC_TEGRA_COMMON_H__
>  
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct device;
> +
> +/**
> + * Tegra SoC core device OPP table configuration
> + *
> + * @init_state: pre-initialize OPP state of a device
> + */
> +struct tegra_core_opp_params {
> +	bool init_state;
> +};
> +
> +#ifdef CONFIG_ARCH_TEGRA
>  bool soc_is_tegra(void);
> +int devm_tegra_core_dev_init_opp_table(struct device *dev,
> +				       struct tegra_core_opp_params *params);
> +#else
> +static inline bool soc_is_tegra(void)

This looks unrelated. Please make it a separate patch.

> +{
> +	return false;
> +}
> +
> +static inline int
> +devm_tegra_core_dev_init_opp_table(struct device *dev,
> +				   struct tegra_core_opp_params *params)
> +{
> +	return -ENODEV;
> +}
> +#endif
>  
>  #endif /* __SOC_TEGRA_COMMON_H__ */
> 


Best regards,
Krzysztof
