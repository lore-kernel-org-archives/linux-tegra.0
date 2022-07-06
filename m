Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C07ACCA47C
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Jul 2022 07:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiGFHf1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Jul 2022 03:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiGFHf0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 03:35:26 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A5822B12
        for <linux-tegra@vger.kernel.org>; Wed,  6 Jul 2022 00:35:25 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id n15so17338071ljg.8
        for <linux-tegra@vger.kernel.org>; Wed, 06 Jul 2022 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a7SBBN/6Q+yYGFLJGBFyvXLFrv4d27155jl/U2Ur7OU=;
        b=F1H6LB8Y6yov5/czicr7HsJnGPkDH06fqWNhCEVV7n84eMzbdFz4E1J+iwIlM54OGz
         XYqaqAknMiiuAxR4G+1mTV95uJNT0lmYpXIY9bGcIC8oPAFNKuE+qkAZywYdW+bubuG2
         ufH/miJCv7ZU668lxDjY3qFGpmcm4qLHutXldBciUO5W4CrLgTI9V04QbNlX1LvVbHpz
         kwWKvGJnTCGzVj5Gb5/MbD7OWnikjIsZxmJkv9T1f/mEVdMUA4ZytftP6iGl1J05o+w/
         D00o9VMooe1JwRbYenhN//RUBN12zaQXvtp9zaO4tUq3gvpmDg54E5j9IIvTCh5pf97C
         pi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a7SBBN/6Q+yYGFLJGBFyvXLFrv4d27155jl/U2Ur7OU=;
        b=aBBeg4GcE1pTMXMBA7xmc4VQ6vxaft5CYRw0QJRXoXVBjrG1LkB+lanVwEIvBuk1gu
         B4rJA0pLFSgIQAH7OP5h4cbfzV3TW9zCpvRiUbY4zxQV423VR6ptaIRiLGqcxTeTCYfj
         27lXTRPDqdJe+QyU6SPqTlqUmyrxBa1nDu508vOi8gDRpVsm3sS+oqAa8hrSIPC+vCID
         N0hcKOaopaShGGaVMOwGIWy5VEDOaYR6Md+6QSg1WqpLDV/WU5n4Gwtfm6xp8WCyxcio
         UlB5U82OdK7hxoXWqGcv+KI3H63ABewASYu6x0zjJNjFL+Yz/+ZMK+3PqBCjv19U8L9e
         TwhA==
X-Gm-Message-State: AJIora/hkBixUkfqEKBqkaGiSSQ8ktEVR3Ei13NH2BA81vZFHxO6zxaD
        h9iOwIQJIVDgoiZ6azSinEqCOA==
X-Google-Smtp-Source: AGRyM1tIy92y3ezGklgrGYEunVuaUNyqnih+pWX3z3d8xNohinEwVOLDFyHAYMksSn+6bCvc1o481g==
X-Received: by 2002:a05:651c:10b8:b0:25a:9bc0:2110 with SMTP id k24-20020a05651c10b800b0025a9bc02110mr22950012ljn.234.1657092923638;
        Wed, 06 Jul 2022 00:35:23 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24bd2000000b004811dae391fsm4662801lfq.48.2022.07.06.00.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 00:35:22 -0700 (PDT)
Message-ID: <708c4a86-731a-c2a6-e3d3-df23ae7c35b1@linaro.org>
Date:   Wed, 6 Jul 2022 09:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next v2 1/9] dt-bindings: power: Add Tegra234 MGBE
 power domains
Content-Language: en-US
To:     Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kuba@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, pabeni@redhat.com,
        davem@davemloft.net, edumazet@google.com,
        Thierry Reding <treding@nvidia.com>
References: <20220706031259.53746-1-vbhadram@nvidia.com>
 <20220706031259.53746-2-vbhadram@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706031259.53746-2-vbhadram@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 06/07/2022 05:12, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add power domain IDs for the four MGBE power partitions found on
> Tegra234.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
