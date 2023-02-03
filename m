Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85E8C63797
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Feb 2023 02:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBCC6F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 21:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjBCC6D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 21:58:03 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C5C8B31B
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 18:57:39 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z11so3968413ede.1
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 18:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKQmygBEZeRuMWlXEwKwIU+7fft7wguti267JsfX7ks=;
        b=pdGroF1ZfQZvyVUZhL+/+VNj6+FaGPWlAKE0M38vEiILELEPIWtChPgPv23p+HKltr
         a6p1N/E5L3msAOptVOq42/Tz6tGTyET+J/6rzW5EHALrSfksBCaMWgyzWZAztloWbEVU
         0u7B6ejkb+1plJquBzUgK+7U+iEsOshoDPe9HpQF4f449d5/TZBWfat7a8AcBcfCx2XP
         Ewd9zIkCyUIBjzHhCA5DMrWw6NNGO8FMwqRxq9r07o7shKMhglJCn4qAG1e5Hvh/zRRt
         0zDZUcLeMsF7PwqrXiH0IMs6RCYMlgbCdLGcH1HNi8J/fu+lse3Lr7gxLMtuOn3srHQX
         XtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKQmygBEZeRuMWlXEwKwIU+7fft7wguti267JsfX7ks=;
        b=uu477bO9rRMXo88uhcfRO+BoSCvnI16CW8gfwZRWjkmONiytTGisJFaus5VTodeEO7
         K8uoMivVxVPA/6urytWxVl2zEjjQnQbXzJJMQtyJhuW8EIciR+ReqX7pvS5zDr1nXCKJ
         lCuSHo9TyCepGNB+K+Vcnh2wi8JZ6SdYrkH/k+NBBfWLy6yTFXt3Trw1EHBSU9/cJzPn
         r+XKcwTEg/cr63vFLwmbDk3QwnjYXQGzYrLy671soE2ZCVFnjrWi9EuAybGk3HU3DN/H
         UTc+dHDSP723vrL5LGi5N0GAI5ES3zciHy7qLIFaFSp3xY4qWYN/De6jyyfP4QZ/oRGQ
         ltKw==
X-Gm-Message-State: AO0yUKXoFbIwylr6eUIZCqiv14bfvfd2oe0p+89QC+NgxtxbmCEt+PIV
        aCbm+XQILwSSbjD1TJIFtX+mhg==
X-Google-Smtp-Source: AK7set+d9yOcvNKsYTYBPkS9RL4yLRG5jvK5E0pBXawOp2p5FFeqCH5W3HQFV4iwfuvJ54JWiqdVbA==
X-Received: by 2002:a05:6402:3589:b0:4a4:d49b:34a6 with SMTP id y9-20020a056402358900b004a4d49b34a6mr8854268edc.9.1675393058450;
        Thu, 02 Feb 2023 18:57:38 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id et6-20020a056402378600b004a21263bbaasm480519edb.49.2023.02.02.18.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:57:38 -0800 (PST)
Message-ID: <5b089f60-6dec-50f6-dea3-54170bf7fef7@linaro.org>
Date:   Fri, 3 Feb 2023 03:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 13/23] interconnect: qcom: sm8550: fix registration race
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
        Abel Vesa <abel.vesa@linaro.org>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-14-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-14-johan+linaro@kernel.org>
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
> Fixes: e6f0d6a30f73 ("interconnect: qcom: Add SM8550 interconnect provider driver")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/qcom/sm8550.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/sm8550.c b/drivers/interconnect/qcom/sm8550.c
> index 54fa027ab961..7ab492ca8fe0 100644
> --- a/drivers/interconnect/qcom/sm8550.c
> +++ b/drivers/interconnect/qcom/sm8550.c
> @@ -2197,9 +2197,10 @@ static int qnoc_probe(struct platform_device *pdev)
>  	provider->pre_aggregate = qcom_icc_pre_aggregate;
>  	provider->aggregate = qcom_icc_aggregate;
>  	provider->xlate_extended = qcom_icc_xlate_extended;
> -	INIT_LIST_HEAD(&provider->nodes);
>  	provider->data = data;
>  
> +	icc_provider_init(provider);
> +
>  	qp->dev = &pdev->dev;
>  	qp->bcms = desc->bcms;
>  	qp->num_bcms = desc->num_bcms;
> @@ -2208,12 +2209,6 @@ static int qnoc_probe(struct platform_device *pdev)
>  	if (IS_ERR(qp->voter))
>  		return PTR_ERR(qp->voter);
>  
> -	ret = icc_provider_add(provider);
> -	if (ret) {
> -		dev_err_probe(&pdev->dev, ret,
> -			      "error adding interconnect provider\n");
> -		return ret;
> -	}
>  
>  	for (i = 0; i < qp->num_bcms; i++)
>  		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
> @@ -2227,7 +2222,7 @@ static int qnoc_probe(struct platform_device *pdev)
>  		node = icc_node_create(qnodes[i]->id);
>  		if (IS_ERR(node)) {
>  			ret = PTR_ERR(node);
> -			goto err;
> +			goto err_remove_nodes;
>  		}
>  
>  		node->name = qnodes[i]->name;
> @@ -2241,12 +2236,17 @@ static int qnoc_probe(struct platform_device *pdev)
>  	}
>  	data->num_nodes = num_nodes;
>  
> +	ret = icc_provider_register(provider);
> +	if (ret)
> +		goto err_remove_nodes;
> +
>  	platform_set_drvdata(pdev, qp);
>  
>  	return 0;
> -err:
> +
> +err_remove_nodes:
>  	icc_nodes_remove(provider);
> -	icc_provider_del(provider);
> +
>  	return ret;
>  }
>  
> @@ -2254,8 +2254,8 @@ static int qnoc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
>  
> +	icc_provider_deregister(&qp->provider);
>  	icc_nodes_remove(&qp->provider);
> -	icc_provider_del(&qp->provider);
>  
>  	return 0;
>  }
