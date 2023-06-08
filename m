Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB64CC7EE29
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jun 2023 16:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbjFHQh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jun 2023 12:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbjFHQhX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jun 2023 12:37:23 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BD630FA;
        Thu,  8 Jun 2023 09:36:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30ad99fa586so828077f8f.2;
        Thu, 08 Jun 2023 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242192; x=1688834192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=586uKuWxkuY7vLLEPLBCsWENCI12nOjQXtB1kKMYKvY=;
        b=BI8eZg8a68BpLbUZNChXHgs8eb+cn9jc4i82mYdV3v0zuR9EvO6AnJfx1ewZ0yG4KZ
         SuAAFzu0/WN9wT4sheZFRLMmgnu9xYiOk6l127l/bonmxuJi6xrUfOEWkvK9Owgni6p+
         vxCqlEftgAflbb4eeUVQpTcsSGmbYknOOqWLfKgI7HgmvafgXnQ7+hC8xzVwnwznK07y
         Vk1Epk6/ziWKdiq0bf1VRXbgqH5mrBkd320eMVGElP9QVy0Ba3tT/fQ+fB8nNBMWxsk6
         TzY08q1tG391FYg8jkA6ZtBNtAfSqjZjx4iGfG2InX03lntJm90wRwL3gIlbKfXhHzEf
         SYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242192; x=1688834192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=586uKuWxkuY7vLLEPLBCsWENCI12nOjQXtB1kKMYKvY=;
        b=LY/pecar9NlJJ/q9ILi0oruZO60PIEfAc5X7hyOy2gJ3Poh67HXZ6DurDn5oOEFIge
         rZ2DZJloUWwkJOlbl15/9NViRDifr6shEU8v0Fp9dSrlN1EYYrAYPPEmJuqRrDCXlPNd
         OifCmPBygRtUH6c41imkwDzgmeCFHA8ONFSzSb3OvcYvJupE+Wt1xBflTp/LqVIf4vQd
         eSiEZXim7OO9w37I6AgMm7XUq2aysDm1iM4yrTFR+ajpmAO7sstECUbADy5VBPRntDCt
         xGnD3bQ2kNaubqVPei/+PBKCiHErJrKwDGXXN3n4sYL7rEPAdv2SoHMn9ge4XyjYfjr6
         JFGA==
X-Gm-Message-State: AC+VfDy1KaKwd9jw0u1QjE47afr4SoCJKHVNMdiOdnUgGnUfLJGnz04n
        ifFv5rZM55c1eTS6ePkXI+4=
X-Google-Smtp-Source: ACHHUZ6+Z4GlREG3lpPQfofxPuSmJcAa6Sk9k+FXR3sw8OEeJi+SUVrGRz7th5RklM32wZ8eg05XRQ==
X-Received: by 2002:adf:fd8d:0:b0:30e:4943:ac0d with SMTP id d13-20020adffd8d000000b0030e4943ac0dmr7500621wrr.59.1686242191814;
        Thu, 08 Jun 2023 09:36:31 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b002ff2c39d072sm2017445wrx.104.2023.06.08.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:36:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
        arnd@arndb.de, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH v2 0/2] Enable GPU on Smaug
Date:   Thu,  8 Jun 2023 18:36:29 +0200
Message-Id: <168624214852.1815116.3764090651874544874.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230516082829.15326-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Tue, 16 May 2023 09:28:27 +0100, Diogo Ivo wrote:
> This patch series enables the use of the GM20B GPU in the
> Google Pixel C.
> 
> Patch 1 adds the needed regulator DT node for the GPU.
> 
> Patch 2 enables the GPU in the DT.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: tegra: smaug: add GPU power rail regulator
      (no commit info)
[2/2] arm64: dts: tegra: smaug: add GPU node
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
