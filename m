Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F651C54EE9
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Sep 2022 12:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiIHMNk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiIHMNi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Sep 2022 08:13:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA51E55BF
        for <linux-tegra@vger.kernel.org>; Thu,  8 Sep 2022 05:13:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q7so27407503lfu.5
        for <linux-tegra@vger.kernel.org>; Thu, 08 Sep 2022 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CdTbzayCWTpd5wt/KieqkvbzD1bEPUGBRGGODsZ9rls=;
        b=DiH1e9VsgX7T95VSZ2Z9aEMHESPF3rbmT++m2zbpKfSg12yOg5KQkmFf+wkMJUKmKy
         GmDUo/FLJ/Z/h5E5muTlVudD3kjLuOo14UAdm38OCGGVEU6nKIURxSeSusgbvm97yeGO
         DfN921K/VOud1cuajk+Lvetf8nSqVJkuwpACimFczoraXc/e2slbOkdGH/I7wNkYtagL
         KIEVmh+ywzO/+aExdEGVMTWUUWFJINX6L/A1ihT2cd1DcP/qB48zJ2KiVvKPCJwhIqef
         pnLLSVS1rpuHUnmrU3ZaTPiotpMM50s76orGpG9fBXdnA8WJ8q8UJCwHbX2Gyu471U+e
         Nx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CdTbzayCWTpd5wt/KieqkvbzD1bEPUGBRGGODsZ9rls=;
        b=tkKwxNFf8YtBS/x9236YtmtCIoD4LiEnbkmGqcllqoUC/pZAvJaRQx1AgBswoj0y0H
         ojk7/x6v1fBfIaJl4eIsGFrCn/9K2bbDbu2xFtfFjug9RWZbrCo3fAtR1PdOSazOLfYi
         IlxcQ9wcLXqt+sfTvUf2X4zGJFgj1Tid1DlOxEFWJeR7XZJC7SCBxCIzXeEdA91KegtE
         lBPYlHNZR5/xFWwwu11lyaGKuSwMQVWK5v/C5N50Ry8a90QUhOQnnXxeE/Ddp0tedOAx
         /mCRwbn4avq+Y2zEqA9mmC2CiiswoTo4pL2hHVionRK/65p/uvJ4ELlYo/x6DK06+eww
         00lA==
X-Gm-Message-State: ACgBeo3LTUoTki71P5m9EhTOQjaIVesEbYQ6I/+7e3+gwNcJYTZ5QEJf
        FYwZa1dUDD+bDltDP4MMbBIldA==
X-Google-Smtp-Source: AA6agR4ROtO1banKCTqX6GzhOCTGZsXNy9bx/yMxFW8AkEFsUDy2TxCY1EHHk1Udcg/9Ec4uBnr9+Q==
X-Received: by 2002:a05:6512:1112:b0:494:6e1c:f889 with SMTP id l18-20020a056512111200b004946e1cf889mr2436191lfg.423.1662639215402;
        Thu, 08 Sep 2022 05:13:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v4-20020ac258e4000000b0048ae518364dsm173890lfo.148.2022.09.08.05.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:13:34 -0700 (PDT)
Message-ID: <75d5e29e-7418-3b8f-f549-6a69fd479852@linaro.org>
Date:   Thu, 8 Sep 2022 14:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] dt-bindings: pwm: tegra: Add compatible string for
 Tegra234
Content-Language: en-US
To:     Sandipan Patra <spatra@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bbasu@nvidia.com, kyarlagadda@nvidia.com
References: <20220907062545.30203-1-spatra@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907062545.30203-1-spatra@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/09/2022 08:25, Sandipan Patra wrote:
> Tegra234 has 8 different PWM controllers and each controller has only
> one output. Add a device tree compatible string for Tegra234.
> 
> Signed-off-by: Sandipan Patra <spatra@nvidia.com>
> ---
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

The commit msg suggest it is different. Are you sure they are exactly
the same? If not the same, but compatible, you should use fallback.

Best regards,
Krzysztof
