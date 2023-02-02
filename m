Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96DCC64EC3
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Feb 2023 11:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjBBLKP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 06:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjBBLKE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 06:10:04 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE3268ACF
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 03:09:36 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1074401wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zGhcwfRQP1vbMhQHFBN3FkAYqNe4cdk/CFn8QpsceBo=;
        b=FDpSb+mwnlw8m5dHv+86Ui3ZrmgaXz6GfNCWc2N7biOdmOXsemof67Z+Ql7/ScD270
         vlo8IXDmUvSzX9EhLRxmlbY9GUQ2qr7Mi+Uw9lo8o86w3HSbNgAb2Q3x2R43VIf1Bfyp
         9SKdNxy+e8QEaLvjNrvMFx+Rq7O0NHz4qOzdedbPqbKPI2IRknH0xNWJ/J0HyJg2l+cm
         A1rqYTSdb+EiYaI/wLKGn0+KRytAoOvUcEp4ERC4c/M6ajPmWxxUwL0Nuv8JlRXbwhKx
         0L3YQMXEu7x+DqKQuRcOR0+LyW1/LcIUZxHzR4heBcWPZkJQ5sNvCrtOdfcYipx3Reww
         7hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGhcwfRQP1vbMhQHFBN3FkAYqNe4cdk/CFn8QpsceBo=;
        b=BsGy+uvTqOQ9OaYneNjuILE7j8hHV/V5dfday5t44hwcTnsny2MhdT8DDxh6Q0aspw
         GfZjsvHVF1wo0fOCuFOujiG1+B5tiwit115nhBDS4Ed+RQ85pRvM8tTSkJjrsNwGj5xW
         j1ZwaZyZawC/D6aJPqIK4VJaJRLFaRpPV8807sTpS+Yln7LhEL7C9kmedm+AEbffF2Xb
         8HALBHjO+NM5MPgmqSNW0BAn2YuAMvMqOJvSXPr1iLCAwK/d0DdIDQYLDafjct5MR7e9
         GGGMV0FEy1hGmgmKf0XZSNrbtZ4Xe9rGZVCHlPyzE/OP/ylBFxT7K3EmUH2WY8yFZIRf
         ro7Q==
X-Gm-Message-State: AO0yUKUoLml+QhKpA3VQOOpfgqQNbvU14w/wdcmLPLTkvBWzMhePtE8s
        EuAuIaMxPYc3FWq4tvjBFBQ5YQ==
X-Google-Smtp-Source: AK7set97949CQomMTHJXrUmVYXoP68F1grpSho+nTxTkUvOOSDw/afzyYWDMSQ0qCS57Wk1H9+6yeg==
X-Received: by 2002:a05:600c:35cc:b0:3dc:55e6:fffd with SMTP id r12-20020a05600c35cc00b003dc55e6fffdmr5502802wmq.15.1675336175028;
        Thu, 02 Feb 2023 03:09:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c2e0600b003dcc82ce53fsm4247203wmf.38.2023.02.02.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:09:34 -0800 (PST)
Message-ID: <40d0fff4-5d1c-3e93-1eed-132c7e1aa92e@linaro.org>
Date:   Thu, 2 Feb 2023 12:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 16/23] interconnect: exynos: drop redundant link destroy
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
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-17-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-17-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> There is no longer any need to explicitly destroy node links as this is
> now done when the node is destroyed as part of icc_nodes_remove().
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/samsung/exynos.c | 6 ------
>  1 file changed, 6 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

