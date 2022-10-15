Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C23C43219
	for <linux-tegra@archiver.kernel.org>; Sat, 15 Oct 2022 15:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiJOPTX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 15 Oct 2022 11:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiJOPTW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 15 Oct 2022 11:19:22 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B5726EF
        for <linux-tegra@vger.kernel.org>; Sat, 15 Oct 2022 08:19:20 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id hh9so5406526qtb.13
        for <linux-tegra@vger.kernel.org>; Sat, 15 Oct 2022 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lnInENwLybwBq+BGW9XxaGeEpI0F9YvSORSJTCPbgo=;
        b=tH2d2Fg2+rkIGI3g30tLYVACKy0d5S84UFuNYvLPX2jB7j1OU1s7hRZuvtaYaThLl+
         DVRX+YUAGvtLKD3k1P+nvbXARq1pZqxR+3jcthoC732WsTyygYmvBpNy0ogD83ytNN0o
         mct2GWnXik+WHSCVd8mXSryojXZ4tKde5eRzbSxYGRCMd7WGBsjihW5p/VfdA6h+QYSo
         4mvukBY/TajIL/LhoFP9fMi6Dxy7BP/AxIYoRIhBV1JvAf8GJMMLT3OPKk7DEsj8dD5r
         SgnimZMd+cNj6EcFymL/976s/bkyjFlv7uaNDY8zdHzGGO+rwOvEKXUZSXKZRSP79Gu/
         Do2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lnInENwLybwBq+BGW9XxaGeEpI0F9YvSORSJTCPbgo=;
        b=b/GkuvWzpHH/A+bZ+bI6QdTealajUUC3kWOm3pK2ULSl7/iekavmBOiU1r3aOnTdTY
         uaunHIBbdCx8hto2NSZVy71Jb59lE1FvZkO/u9NpEilH99eXVK/4bJwsekOWgIx1ir+C
         rlIAtRCe/iKaFiScPZM0jcg8kH+9BHIMVDGWBRXBKIGT3YdmnWDEz0DCJ6QtXgiNMvnG
         gZEDnBXF6BZukcFYezcnFIoAQ4sgpo/0JvY2DAm3wpvgQBMTmSfZj7AsKApVnAXTf15B
         wzRgl8x1Rat5wEGIUaxAt1/N8ub5Kim5gfFzSMKYmJc+J3gVmygKL4dDuUiUJgCpvTzI
         xk3Q==
X-Gm-Message-State: ACrzQf0sQXOOeOwYrR91v6++2FhrErU+3l/J7IIcCixYSSUF6Gi2Z2i+
        56hJdcApfyZD1vJIF8R99ZKf2Q==
X-Google-Smtp-Source: AMsMyM7SK8HhtjT3RcbC18eK6Wx6yTJR3yAlueJ7R3Fy7tkuEa2py8ydKmqXp8AC0za/7RsOMMmaNw==
X-Received: by 2002:a05:622a:13ce:b0:39c:c82a:4584 with SMTP id p14-20020a05622a13ce00b0039cc82a4584mr2279261qtk.150.1665847159474;
        Sat, 15 Oct 2022 08:19:19 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id fz25-20020a05622a5a9900b00399ad646794sm4165768qtb.41.2022.10.15.08.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:19:18 -0700 (PDT)
Message-ID: <608e194f-3137-ceb7-f9e9-155010ce1afa@linaro.org>
Date:   Sat, 15 Oct 2022 11:19:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Cosmin Tanislav <cosmin.tanislav@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nandhini Srikandan <nandhini.srikandan@intel.com>,
        Rashmi A <rashmi.a@intel.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-iio@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20221014205104.2822159-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/10/2022 16:51, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
> 
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
> 
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

