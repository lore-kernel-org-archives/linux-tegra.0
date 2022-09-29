Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DE5C6FA82
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 07:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbiI2HBl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 03:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbiI2HBZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 03:01:25 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DBD123D9F
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 00:01:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o2so847317lfc.10
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/IXLbjH5KQJTVAywyqeKJX3mELhE8CvWdqMVSTRdvVc=;
        b=ulNv9ztLuwltm4KnY0u7qOVoQ4PAMVml3FifhKVcV+4Yyhny+3sq6cAuV3U01ktIvt
         NN76w9jfTNbWEhlSUCMKp1f6APBkjyA0Bb98WtHkOs7mV16Rc9IP58+mWxIujwz5G7wU
         wVYdHGXuPVEBfT9OtbNtAGKVuuN8UqtAaKYaikH/AupJm70k5TPBLdIpocGefGdzoQ5y
         EnJH9mIO3GEMJ2i14W3HYcVcMvO1Up1U+gD3ZLdODl5HEF7Tu+UjYTMjdGmcuzq6Qiba
         fcxnTZeed5Ynl/Gbp/RTfL/PFqxRSHylbMC12sAQBAx1LHsMi7BRtfMcXVqjIArVieHy
         2bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/IXLbjH5KQJTVAywyqeKJX3mELhE8CvWdqMVSTRdvVc=;
        b=toglqOFJKmxiOOHx7NgE4l7ROMHdOmr/FUp9b7QptSs8fVnwM6naKrcbypaHLwNo2h
         maDR7gJ4KCnU+satCUaBP+4tnSmlG73Eag2/C9WTao9WM8+PaRvg/FJb8r2aDukibxF0
         BGrdA/XbXfEHIyBh9CzcWWY4SSDOlOJ497dkDJFjZ/Xxl1xuFTFbS9w2OJbvAsoSHPzy
         Qds1D0GjwFkKl34id5z4fw6KvNc38ls6lLr3RGj234hpPOnNuiF1qfWveLBGyNcowRbN
         Eld30/AkltMOJ3fHgINv1vzQfNcWTRMyuR4Bd+OMlGNJwc8RsqxYUpcpKZ280FymU3c9
         SvGg==
X-Gm-Message-State: ACrzQf2nZf5MsHmJ1+JQDpnWqFm1xzBQkBxRBk/BhYXXwSXC8gx/REyI
        eo9u+obJqhvxcFIgnXrsvbVHOQ==
X-Google-Smtp-Source: AMsMyM7iC2rj0wIw/XHeSNZGx3uJYvB4fvO0oao86ygIhhfvcid/LGD+visWqDZnceunDjjMcb0iKA==
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id u3-20020a056512128300b00499d0a33ca8mr707348lfs.665.1664434870569;
        Thu, 29 Sep 2022 00:01:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a2e84cc000000b0026c41574790sm631066ljh.30.2022.09.29.00.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 00:01:10 -0700 (PDT)
Message-ID: <efd42f94-1868-9189-d88e-f03b8c19f866@linaro.org>
Date:   Thu, 29 Sep 2022 09:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/1] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        krzysztof.kozlowski+dt@linaro.org, nkristam@nvidia.com,
        jckuo@nvidia.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220929034221.3817058-1-waynec@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929034221.3817058-1-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29/09/2022 05:42, Wayne Chang wrote:
> Extend the Tegra XUSB controller device tree binding with Tegra234
> support.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> index fd6e7c81426e..7e4eb379bcf4 100644
> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
> @@ -22,6 +22,7 @@ properties:
>            - nvidia,tegra210-xudc # For Tegra210
>            - nvidia,tegra186-xudc # For Tegra186
>            - nvidia,tegra194-xudc # For Tegra194
> +          - nvidia,tegra234-xudc # For Tegra194

Where is the driver change? Where is DTS?

Best regards,
Krzysztof

