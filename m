Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A68C636D3
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Feb 2023 02:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjBCC6i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 21:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbjBCC6h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 21:58:37 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC98E34033
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 18:58:31 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id qw12so11801145ejc.2
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 18:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hr14rJhyuOYS8CCUPkhJr0V/RzyGfQ4WdWOK9XcyHds=;
        b=DPYTk9LfruNrk0yQfRVEMZfhRtdFK/yxKmc6GwnKAYfCLVOGHi+ZWILSVVaHo/h4Rj
         j9PnLd7WJkD3q1H45Ojvmmwv5e8zj9mPpPaoZSOORM4TlcNoaIGvwAYMcxb//kbZSocz
         4PmfYKbAcpc9BTzUlt1Xf4qN/sd2hxJpH8duI7IqxnXR9xvxdiiXwNRwJsgRByiI+JpC
         2jk/uV9pr4sxIEa3yZr1QdYtcUVXpWnxKsRbu/uU4upnB4uGTDkmVyPQ4BLKxcpHhyuo
         U5kE/5oZN62u9tOpIAq18vaGybiTK+B77zK3K+pU4qtkJW8T3X0YITk0FUiJIuhShbkf
         ejXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr14rJhyuOYS8CCUPkhJr0V/RzyGfQ4WdWOK9XcyHds=;
        b=xW0nD1ydBxXIdOYg1AoU2h2qkVfZg53EqVyxRw+hBPt82dYOYLP0ZP1WBjx3JtePUJ
         Q8MEz0/anuOl6nZlB1XJDVedH9/iv6uPGVIsl7DI0Z5Qt8jQb1MQG1OwOxUEjAIczlOj
         zgY1yWxtwDMBLcqb5tks/I8XfNbh6CwyTzMNI4xllVWb2I7JgqfvQt9na2vMxufWSyxD
         sGVPN4LpSx3tv7FH7xbNOXNOXsVLfDNJxr+aMIVbi+OHoKsjev3Q3NTSOYqgO9TWT3uI
         2Om/v3+jVHBxpR/XytcaRIuUBNbvJn2Ga0MCq2wEMzEHuSWGHIOmPDb9hZDMon2vkZK/
         A1Zg==
X-Gm-Message-State: AO0yUKXUwM00Fm8DNYBGo497aJtaek/UfIQmeYgsQxgrsCjlBytZWIDe
        rQTId2mzOcXqZxGiZeQ1fK/vcA==
X-Google-Smtp-Source: AK7set+a/A9kd8g19vDm6ooyY/CnSwtS6HJyTItZX2sRwOTPiG+M9P8aPtzxyDm5bR2gT/CPNNQFuQ==
X-Received: by 2002:a17:907:2d28:b0:88d:f759:15ae with SMTP id gs40-20020a1709072d2800b0088df75915aemr11932550ejc.42.1675393110296;
        Thu, 02 Feb 2023 18:58:30 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709064bda00b00886c1a02d20sm680121ejv.47.2023.02.02.18.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 18:58:30 -0800 (PST)
Message-ID: <e77f197c-199d-a88b-deda-67ec6fd1c456@linaro.org>
Date:   Fri, 3 Feb 2023 03:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 21/23] interconnect: drop racy registration API
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
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-22-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-22-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> Now that all interconnect drivers have been converted to the new
> provider registration API, the old racy interface can be removed.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/core.c           | 16 ----------------
>  include/linux/interconnect-provider.h | 11 -----------
>  2 files changed, 27 deletions(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 93d27ff8eef6..b8917823fd95 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -1078,22 +1078,6 @@ void icc_provider_deregister(struct icc_provider *provider)
>  }
>  EXPORT_SYMBOL_GPL(icc_provider_deregister);
>  
> -int icc_provider_add(struct icc_provider *provider)
> -{
> -	icc_provider_init(provider);
> -
> -	return icc_provider_register(provider);
> -}
> -EXPORT_SYMBOL_GPL(icc_provider_add);
> -
> -void icc_provider_del(struct icc_provider *provider)
> -{
> -	WARN_ON(!list_empty(&provider->nodes));
> -
> -	icc_provider_deregister(provider);
> -}
> -EXPORT_SYMBOL_GPL(icc_provider_del);
> -
>  static const struct of_device_id __maybe_unused ignore_list[] = {
>  	{ .compatible = "qcom,sc7180-ipa-virt" },
>  	{ .compatible = "qcom,sc8180x-ipa-virt" },
> diff --git a/include/linux/interconnect-provider.h b/include/linux/interconnect-provider.h
> index d12cd18aab3f..b9af9016a95e 100644
> --- a/include/linux/interconnect-provider.h
> +++ b/include/linux/interconnect-provider.h
> @@ -125,8 +125,6 @@ int icc_nodes_remove(struct icc_provider *provider);
>  void icc_provider_init(struct icc_provider *provider);
>  int icc_provider_register(struct icc_provider *provider);
>  void icc_provider_deregister(struct icc_provider *provider);
> -int icc_provider_add(struct icc_provider *provider);
> -void icc_provider_del(struct icc_provider *provider);
>  struct icc_node_data *of_icc_get_from_provider(struct of_phandle_args *spec);
>  void icc_sync_state(struct device *dev);
>  
> @@ -179,15 +177,6 @@ static inline int icc_provider_register(struct icc_provider *provider)
>  
>  static inline void icc_provider_deregister(struct icc_provider *provider) { }
>  
> -static inline int icc_provider_add(struct icc_provider *provider)
> -{
> -	return -ENOTSUPP;
> -}
> -
> -static inline void icc_provider_del(struct icc_provider *provider)
> -{
> -}
> -
>  static inline struct icc_node_data *of_icc_get_from_provider(struct of_phandle_args *spec)
>  {
>  	return ERR_PTR(-ENOTSUPP);
