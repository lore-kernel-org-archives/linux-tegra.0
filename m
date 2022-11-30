Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF3EC352A1
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 15:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiK3PnN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 10:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiK3PnM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 10:43:12 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF49C2937A
        for <linux-tegra@vger.kernel.org>; Wed, 30 Nov 2022 07:43:08 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id b9so21324996ljr.5
        for <linux-tegra@vger.kernel.org>; Wed, 30 Nov 2022 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WaRD8QklpytPxehHMCkpfcrlUbphUikLEf5UhMWfO6A=;
        b=zpTYsF7dWZ0po86YDkXdqBLrf5+F59SIKMVyAkkwSByiqAN5PiOJ0FS81M3MrvjvjI
         7mNErpFXMjg0Pj1UGcuEbkIzETRHrY6cUHz83aLY0UIZN5TwPFPHAVUZaOQb6uizLD5S
         70dcPSwFRQaF1b/3Y3DKSn/DlglPUWL0bH4awh+1+OQHQSwAjVfWfKzB03BEb49+indi
         xfe1Gn8DJkUCNMdshJudHDfELpIfyUeudhQdFxegCbo/C3gZCj+N2JxjSTKuGTB8EQBc
         30ieeZjkUJHB9Bvelp2pX+JD4DtpX06jISjnEniViRLbSIv/hsNK0W0dyv3xfljOu6Po
         +sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaRD8QklpytPxehHMCkpfcrlUbphUikLEf5UhMWfO6A=;
        b=nqLJd4RoEhWFXct6/cvxvm/nBIN3U4TBa+SAQ+n0BncfLcb1Lg8ZPagfWfHvT17OcR
         IfaFQGgBhKrMRrO7TzOC9AGSztxEGPkeXgF04004GjE16vS/a2Fvjm33G/03e08fAu7h
         2dXKVeYsY9hPJ7UROY37XdmcYqQw+HMTmWsB5z9nqkCKSwca1iANEfya1wftRfvPjcKo
         XUjs4LLfBEyBNHQXLLzXWzQH2oy3onjzCLNEUzPGbtLwhoYlD3bGailHW81l9iBpaHSK
         gnMfDG64L+za/sPcAMxlE2grkfU/TmXOnBhLasV9913fD4l59Hrn96XRBL9mdu0j1fn6
         U+Cg==
X-Gm-Message-State: ANoB5pn75IFejCtuowiTFrkQh2QrlFO78mxL1ACa5blgHCH6avt/XG42
        5EQl4QLU3lrxDWfTJ5rj2UOqaQ==
X-Google-Smtp-Source: AA0mqf5DYz0oVOKpSHaPEwnZ/v3d763Ft94uD8pE/g2IVBNqbj/CGM+kjxGAk4V8M6Li1hRY8xtJ8g==
X-Received: by 2002:a05:651c:160a:b0:277:6e27:6000 with SMTP id f10-20020a05651c160a00b002776e276000mr18434707ljq.104.1669822987379;
        Wed, 30 Nov 2022 07:43:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m15-20020a0565120a8f00b004b4930d53b5sm297370lfu.134.2022.11.30.07.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 07:43:06 -0800 (PST)
Message-ID: <cb87955b-0cbe-0b32-6cb2-5e6979b7ed4c@linaro.org>
Date:   Wed, 30 Nov 2022 16:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20221130154111.1655603-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130154111.1655603-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/11/2022 16:41, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Unresolved path references are now flagged as errors when checking the
> device tree binding examples, so convert them into label references.
> 
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

