Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E288C43334
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Jun 2022 06:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351240AbiFVGuy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Jun 2022 02:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351565AbiFVGuv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 02:50:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0CA35DDE
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jun 2022 23:50:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id cw10so8370557ejb.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jun 2022 23:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hDecnGG4JqyqaEmTekjzP5TBFNFZlOAgs9hf2jW2DzU=;
        b=ZTCaVUax35P/NMEV0BrfMR1PGal2Fyisxi/nTx1vzSLlDQjPRULxmzs1bl8qWG3i45
         BhZOIHDp7X4mvWkIzdavkKVhF44fcyFw4j5iaBnZd9rJ0JRQ6O796iPmeCvxXcoOWPKN
         XUqrn4QMsixzrfKAJxuU+mWbDW2x0vwMIji3h66T9WTMwBtyEZ16lPk+hr2i6tj5UZTq
         pgWCZ/U9rHJuVjdlZ86wneJE4e/098gBAw/opNv1/AGxFnY9jMtXwn33whvZeDBvmQXT
         wwnVx2rcT/gwfzeK0w71Rl+sg1mxc5pyvy7ZD7g3GCmZi0+gVzXYjIS/JuOssukUr9bW
         QWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hDecnGG4JqyqaEmTekjzP5TBFNFZlOAgs9hf2jW2DzU=;
        b=gda4VxZ+ipRs+W2cLF0RsF1xDV7aYWSDmoF4tR7fzNgqxzwkxysHW5wWOeCxDVVu25
         btjGByUbYdGQC9z/pzxnmehDmjXLyNwZOjDKw7Oi8q9c/Z1udycr4JOuXmGHcdtPlWgF
         jTTYUTRLgvxREZGoqNR3IyE9/Z5Ew5yq8KkKX/DglOMj1nflCvG91Bo7PNtCSvZ+hruW
         9VPX2ldamUajk9gsDvIRFbVujb8wX7D4U+MQoGJ17R8qW69Qx/TNUwp9tFydXigAS2ij
         y462oX9MfAcSrXiEp6vZ9G7ekotFU2ki2292Kzwler+lAyevFw4DpvlXFntInWA7KufI
         Wm8w==
X-Gm-Message-State: AJIora9CsebJjMTVRmapJiM7pb4uvWvRmUBm8PDjj9FLIhKspFicbRPM
        Ydv9Mg9YkCX9uLC2OFX/d53XOw==
X-Google-Smtp-Source: AGRyM1v6P9lcbhtpyb9iwwfskLAwO6UuTNjyafIdu9H1nHALG62CuEf9jvAvCWxhr00K6eTtKh+79w==
X-Received: by 2002:a17:906:530b:b0:722:e9ad:e90 with SMTP id h11-20020a170906530b00b00722e9ad0e90mr1749111ejo.676.1655880642434;
        Tue, 21 Jun 2022 23:50:42 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906308700b00722e7e26d22sm1556075ejv.58.2022.06.21.23.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 23:50:42 -0700 (PDT)
Message-ID: <bdfc94d0-c634-c391-d74b-2104cbf82b22@linaro.org>
Date:   Wed, 22 Jun 2022 08:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] memory/tegra: Add missing of_node_get() in
 tegra_emc_find_node_by_ram_code
Content-Language: en-US
To:     Liang He <windhl@126.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20220622042824.4094625-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622042824.4094625-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/06/2022 06:28, Liang He wrote:
> of_find_node_by_name() will decrease the refcount of its first arg and
> we need to add a of_node_put() to keep refcount balance.

We do NOT need to add an of_node_put?

Anyway why do you add of_node_get which is not explained here?

> 
> Besides, during the 'for' loop execution, the refcount of 'np' will be
> automatically increased and decreased. There is no need to call
> of_node_put() again.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 25ba3c5e4ad6..e43a5f8e188e 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -477,6 +477,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  
>  	ram_code = tegra_read_ram_code();
>  
> +	of_get_node(dev->of_node);
>  	for (np = of_find_node_by_name(dev->of_node, "emc-tables"); np;
>  	     np = of_find_node_by_name(np, "emc-tables")) {
>  		err = of_property_read_u32(np, "nvidia,ram-code", &value);
> @@ -484,6 +485,7 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  			struct device_node *lpddr2_np;
>  			bool cfg_mismatches = false;
>  
> +			of_node_get(np);
>  			lpddr2_np = of_find_node_by_name(np, "lpddr2");
>  			if (lpddr2_np) {
>  				const struct lpddr2_info *info;
> @@ -521,7 +523,6 @@ tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
>  			}
>  
>  			if (cfg_mismatches) {
> -				of_node_put(np);
>  				continue;
>  			}
>  		}


Best regards,
Krzysztof
