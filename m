Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0372ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Sep 2022 16:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiIIQjW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiIIQjI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Sep 2022 12:39:08 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F868131EC1
        for <linux-tegra@vger.kernel.org>; Fri,  9 Sep 2022 09:39:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l12so2503873ljg.9
        for <linux-tegra@vger.kernel.org>; Fri, 09 Sep 2022 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=C8EFOrarFgcH9AimKTDz/kV+dDC4aGl58YpTJdmNSjU=;
        b=m4xdA0A0cbvAzvVI69pUofSXJcUZHq8o/kzFhmSVtGPDXMsaRHIbqvCF4PdTp0UAI7
         S+F0Q4RnehEwjK0N+6Fcy9N/PLicbeQawYrjQj91X3xXHpetqLKwnZKZ9qEORyxnYaXD
         mV1KQHXAz75M3s5YnXyC08gKAyRuDa+I6amGAaxshpuUHpEBYZ3Mlf2qV5peTmqSbk58
         7KAtuRMokdnJ7LOZJqxAgVL9TFh+AgPUNwNayVXO8GKj7uP9uDoE7oIzNZcDbi8JNWs8
         Epq8tJ4sotYEql6Jn/3O7I4ORZ+uj+w6fw9Y3eP72ogq9vpkMb96soZfTxZdDGGO0o9e
         ImGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C8EFOrarFgcH9AimKTDz/kV+dDC4aGl58YpTJdmNSjU=;
        b=IcQiG1lEi9YLCkpERZPoXt4oTJyprNcconYBgyHG/ShIE0swoap/u5XGxy8+EvWMii
         LBrkX0dyc2w1fuzp/nqeRG/2GpOLyMg6g5KY7DBlWiZVXh4rPzjAJq/M77fmQ68JtDQC
         gJxjWIIpVS3lVGIXw+aovR6xGwef5kQckf2n6DKU3jxdSbxw2yMsUCbIqqUdyFy7Xk9v
         KUGdWk+Z5xEfwOndNweVtWxf9JUG3NZjJe9Dd825z+G0K/D/XB6mcVQXRZ1Qn3M1nFsV
         WT5jlOx6OPX6/ve2i1KcYrVPlVVhotgbztp5+EvbRQCIRAVHU/jjSBXfrqHYXE9cM0vj
         jOuA==
X-Gm-Message-State: ACgBeo1ggsgu/1LKUoUDgNVpkNgSkNShWCBLBcQxF0u2RDe0dXjf0oIE
        ygXpf3xs2WkoIxvwU4qOdfpxtQ==
X-Google-Smtp-Source: AA6agR4SNJRWarydZ5VLp359Lgv+QR+yZRAFXcH/WrnxMJMgK9lSw/Vl7ODP9YCBx7Qb7RooCS+bLg==
X-Received: by 2002:a05:651c:1cd:b0:261:bef9:ada8 with SMTP id d13-20020a05651c01cd00b00261bef9ada8mr4128624ljn.387.1662741545867;
        Fri, 09 Sep 2022 09:39:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b0026ac3fedd20sm139001ljr.86.2022.09.09.09.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:39:05 -0700 (PDT)
Message-ID: <7585e56e-0983-de27-7c1b-9ec30898d4bd@linaro.org>
Date:   Fri, 9 Sep 2022 18:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: pwm: tegra: Document Tegra234 pwm binding
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220909155258.17908-1-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909155258.17908-1-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/09/2022 17:52, Sandipan Patra wrote:
> The PWM controller blocks are identical to ones found on the
> Tegra194 SoC. No driver changes are required and compatible string
> "nvidia,tegra194-pwm" will be used as a fallback.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
> V4: Mention fallback compatible

The patch is not titled v4.

> 
>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
> index 74c41e34c3b6..331c1e66e8fa 100644
> --- a/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
> +++ b/Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
> @@ -9,7 +9,7 @@ Required properties:
>    - "nvidia,tegra132-pwm", "nvidia,tegra20-pwm": for Tegra132
>    - "nvidia,tegra210-pwm", "nvidia,tegra20-pwm": for Tegra210
>    - "nvidia,tegra186-pwm": for Tegra186
> -  - "nvidia,tegra194-pwm": for Tegra194
> +  - "nvidia,tegra194-pwm": for Tegra194, Tegra234

No differences here. You sent something old...

Best regards,
Krzysztof
