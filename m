Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D10C636D4
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Feb 2023 02:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjBCCuE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 21:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjBCCuD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 21:50:03 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCFC45BED
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 18:50:01 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ml19so11880076ejb.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 18:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WR8hXlu/BYrtVyPTl82muaFen2DxWKhdrgyPId7s8/M=;
        b=QHEwTZmDNwcplXS/XoctQn0Xkc720zEqw4643z2uVQvFLOCQJBhUOWWQ8B9oiafj2m
         hTkyPEWCnczxcdz2r/Xh1V8vFUGvA1sOyAcTQoAvw/BTxKweVaZThjL7NSPSeIcSTaEV
         As7r4+yu5KhZmViQq8ocdMUm6Cw6ZDLqGdzSOYEBp+MJL9PsfKrAK+9wsgAr1MLDGHMe
         MXGxh5mXHXtnzloo6cyhiPXspkBuRnjEAmGdeur7qyvZ0faVZterqHdV8/xy0DxibmOh
         yvu3ZW0+KYPBooUGJW945SUBXCUXmRRlmjmZBqWOskY1FlWpDHYXd7zYBa8qiuY8UIHs
         OEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WR8hXlu/BYrtVyPTl82muaFen2DxWKhdrgyPId7s8/M=;
        b=GbTQUUGLO99tRgLnRM3LjjKQ/YP76R5Dwc9TkBumSTMktLb+jFes5hCaFA/bQmihOM
         MbDQx0RWIYKxz451kRNJBOAgz2YHBkKL3yghmXf+UMrQxxTjSdyTX+b9vnqsACZN9aHz
         ABi/eGvFxR2AS/ADXQyGP7lSGmPKRz6vgvPWBXfsbs2E2qRKF+cMoz0NmpM5C0o1jMZ0
         ivTRbm76GNle0b3RW9I2roJ5CAkN6jAVTWlSAG1Est52NHeoTWilsYNu2Pz8viOufyf9
         Z69iCw2wr2TgQ0B1XPfI/OSoiFLDqbJ0t/HOemYMf9295yL+fH9H3bCHB6S27lcu6U9Q
         PHiw==
X-Gm-Message-State: AO0yUKVIJ84GoxSBp2QHBp98BVCttGSuKPtjug7HTwn+Q97O6V4zelc7
        sCLnzf6CLhkshxsWu50H4WUVvg==
X-Google-Smtp-Source: AK7set+ecVqLmDG6TS3QSNxUGtbY8WK8wzUz1GEqh0+5MQf75lNeUmIJohQGjASr/HdMApxBTVZn+g==
X-Received: by 2002:a17:906:edc4:b0:885:5231:359c with SMTP id sb4-20020a170906edc400b008855231359cmr7688184ejb.5.1675392599356;
        Thu, 02 Feb 2023 18:49:59 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id rh25-20020a17090720f900b00887830e535csm656959ejb.159.2023.02.02.18.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:49:59 -0800 (PST)
Message-ID: <63d1da22-84b0-1b02-2766-99cc298a8ac4@linaro.org>
Date:   Fri, 3 Feb 2023 03:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 04/23] interconnect: imx: fix registration race
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>,
        Alexandre Bailon <abailon@baylibre.com>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-5-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
> Cc: stable@vger.kernel.org      # 5.8
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/imx/imx.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
> index 823d9be9771a..979ed610f704 100644
> --- a/drivers/interconnect/imx/imx.c
> +++ b/drivers/interconnect/imx/imx.c
> @@ -295,6 +295,9 @@ int imx_icc_register(struct platform_device *pdev,
>  	provider->xlate = of_icc_xlate_onecell;
>  	provider->data = data;
>  	provider->dev = dev->parent;
> +
> +	icc_provider_init(provider);
> +
>  	platform_set_drvdata(pdev, imx_provider);
>  
>  	if (settings) {
> @@ -306,20 +309,18 @@ int imx_icc_register(struct platform_device *pdev,
>  		}
>  	}
>  
> -	ret = icc_provider_add(provider);
> -	if (ret) {
> -		dev_err(dev, "error adding interconnect provider: %d\n", ret);
> +	ret = imx_icc_register_nodes(imx_provider, nodes, nodes_count, settings);
> +	if (ret)
>  		return ret;
> -	}
>  
> -	ret = imx_icc_register_nodes(imx_provider, nodes, nodes_count, settings);
> +	ret = icc_provider_register(provider);
>  	if (ret)
> -		goto provider_del;
> +		goto err_unregister_nodes;
>  
>  	return 0;
>  
> -provider_del:
> -	icc_provider_del(provider);
> +err_unregister_nodes:
> +	imx_icc_unregister_nodes(&imx_provider->provider);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(imx_icc_register);
> @@ -328,9 +329,8 @@ void imx_icc_unregister(struct platform_device *pdev)
>  {
>  	struct imx_icc_provider *imx_provider = platform_get_drvdata(pdev);
>  
> +	icc_provider_deregister(&imx_provider->provider);
>  	imx_icc_unregister_nodes(&imx_provider->provider);
> -
> -	icc_provider_del(&imx_provider->provider);
>  }
>  EXPORT_SYMBOL_GPL(imx_icc_unregister);
>  
