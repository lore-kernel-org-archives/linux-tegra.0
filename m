Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA04C05027
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 11:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbjBALTK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 06:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjBALTC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 06:19:02 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC849ED8
        for <linux-tegra@vger.kernel.org>; Wed,  1 Feb 2023 03:18:32 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id be12so6055093edb.4
        for <linux-tegra@vger.kernel.org>; Wed, 01 Feb 2023 03:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmkNkwc/roPUBoxOIRfaMs2JmM8/cj5oMwOtaYpttR0=;
        b=DmnxSKU7s6WIyUgSYiMgSy6s+OPOlWELHyjPOLn68AIZ/TRnmhV3B4rswEkHQbvUqk
         Y3nvRwRgX7qEMRWldjUqTrmEmSDuUsjz2RnaVKK2zFbnK3ugSuXqt2Qc9UzNq+PH4GYa
         3JmaNKcn2jcFB4r0BxD6Ps+GbVUFcFbRJueFzcaHEro9R1tC7CXCefdo1+OY7EHnVhSN
         ti3PkVGtzR4StfY990ViG0dDVR2WOvgj5yqV57QApSP3p+XmiqksrGtrUY3ujHsn51/0
         wj9xJVvbjXF93sMxw2SACtJjegkpiv1BjUW+GnKLrWsd8ORz9/1eYHzsBiEvExRHNjoF
         5sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmkNkwc/roPUBoxOIRfaMs2JmM8/cj5oMwOtaYpttR0=;
        b=z9OMlAXVDdFbWuUGwoIroh+xzLYkc2qpigEyoWYGsfyNjfaVZa3YM0eJMY/2whb1AN
         5EHuT2m7PAFNh0mB4Msi5Xmyk1PWzB1tVeht2J2f+DMyz93CDHsyOGc6UJy/5iFrCGSL
         HQ/8rCEYTnj72SWqYHdfFcWWsZZzyeMh8/hacwLzJwsWNFtP2ASRNqn/0WX9jG8nvqAN
         +NN6vqKrTgcY8ikacvetr9TyBoySwD/MgaL0a+d/+T38x3gxd+gOw2/xGYxTVWA2XCDr
         dntE5TjEhtAr4mleOtL3mSb+L9HljNmlC6clx/4lpYa+knTmfJysDle3cyY1dLaKKBS0
         S3og==
X-Gm-Message-State: AO0yUKXvC606IFxr5NhfXmy+SeLnPgIFjBizR7fD3QPyisdFO4u5uO1m
        mgVwwFSjeNoUue1RK+QgVhaLKA==
X-Google-Smtp-Source: AK7set8RBAqgYqL/UHyvViSxh65icsNQZmgKHSdri9gKC/VCfijAbqmy6paNIDeBSH0CtXt3GutdKw==
X-Received: by 2002:aa7:cd53:0:b0:4a3:43c1:843c with SMTP id v19-20020aa7cd53000000b004a343c1843cmr1313349edw.16.1675250311234;
        Wed, 01 Feb 2023 03:18:31 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906065500b007a4e02e32ffsm9949372ejb.60.2023.02.01.03.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 03:18:30 -0800 (PST)
Message-ID: <93bec467-d8ff-efd0-4c7f-69e6bd42afbb@linaro.org>
Date:   Wed, 1 Feb 2023 12:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 01/23] interconnect: fix mem leak when freeing nodes
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
        stable@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-2-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230201101559.15529-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1.02.2023 11:15, Johan Hovold wrote:
> The node link array is allocated when adding links to a node but is not
> deallocated when nodes are destroyed.
> 
> Fixes: 11f1ceca7031 ("interconnect: Add generic on-chip interconnect API")
> Cc: stable@vger.kernel.org      # 5.1
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/interconnect/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 423f875d4b54..dc61620a0191 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -850,6 +850,7 @@ void icc_node_destroy(int id)
>  
>  	mutex_unlock(&icc_lock);
>  
> +	kfree(node->links);
>  	kfree(node);
>  }
>  EXPORT_SYMBOL_GPL(icc_node_destroy);
