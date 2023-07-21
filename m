Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C25EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Jul 2023 15:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjGUPMl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Jul 2023 11:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjGUPMe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jul 2023 11:12:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9575930F4;
        Fri, 21 Jul 2023 08:12:11 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9928abc11deso317339166b.1;
        Fri, 21 Jul 2023 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689952330; x=1690557130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaKS1aD7IoFOrXnNJ4icapfiW6dnXTER+KoIo2KHsbQ=;
        b=dPIb2H2FZIRxmaNC4W5CaoxSP8PStHhdhcUhC0UnxaYNxBaXHPxwfpheJKZ3U5LonV
         JVEtw0RPpPchS1BjP0l+Wj55c4xm+gebKmhixQIw2xw/5GBP2K7DQfNvkAfKXXT+KwLW
         3K7ekPFDqdvepPCtvf4WhZ6Fq9WHdLL4/NxS70fFouf5aUf+0bJxvbCbSzDuMOLMjnd3
         4vzf9Kvj/MttmZ0sCUz2jEcVCzUnvQP+XgDecVoyx0skoA1uINZ4uOlRyqxa8Dgz/I9r
         1xZ7DB3fSV9ZXCqLzvHOS3tvhJ75o3e+k6Yj5XOU5b6HEnD9knzKC7vB41OEHMbzVmy9
         LSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952330; x=1690557130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaKS1aD7IoFOrXnNJ4icapfiW6dnXTER+KoIo2KHsbQ=;
        b=haqlszG1bpoUsG4Lj8gd4gx/5NrbWp97OAeX89Vn3wt/8Gth2PXxJW78zfnPB4hhY7
         FOeq4NDSNxn60r/HqejEzdWFnbe0+28Iwz4Jkv1+U5cSFKxEK5YL/yClY3fWxhCSTGPn
         dLTt3NoUGkxWwH4TI9yacpapMGfd5wglDVSvJuxOfOGIwdc+YoR8xmTOunkGYOVMoE0F
         C1Z8tEEtv7P/tr3NHSSEbd+jjglC6c4GsVkHQA6vZq2EZriyZ/jCnAyzNrPf86wYoDYw
         FuqH3QBA1W2REuXed8uBPF2QYSPKEnf4poDGq0QfrZ7fURuo93PQUL8E1AwFN1qXNEIZ
         4qCg==
X-Gm-Message-State: ABy/qLbkz5JXMFImt3/io07X2mIoH61QfyiuLGtLBUa6hAo7W6NFQ3sG
        2SNBZqqbbw+Wwoep4p0jgAI=
X-Google-Smtp-Source: APBJJlFld+DydcCi6ZvBkZ+DQvENukTKHVqvbLr5LEs29mLwFRkT6JWBN6f9dOBReir+LPEgbsDZsg==
X-Received: by 2002:a17:906:1046:b0:991:cd1f:e67a with SMTP id j6-20020a170906104600b00991cd1fe67amr2025979ejj.29.1689952329642;
        Fri, 21 Jul 2023 08:12:09 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id se10-20020a170906ce4a00b0098dfec235ccsm2288772ejb.47.2023.07.21.08.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 08:12:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: tegra: Explicitly include correct DT includes
Date:   Fri, 21 Jul 2023 17:12:07 +0200
Message-ID: <168995231096.3654475.2956844024664587013.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714175155.4068413-1-robh@kernel.org>
References: <20230714175155.4068413-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Fri, 14 Jul 2023 11:51:54 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] soc: tegra: Explicitly include correct DT includes
      commit: 564dadfca01ffdb53cd1eeb0abe70ff6ac890f39

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
