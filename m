Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC35C43334
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 16:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiFXQGl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiFXQGk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 12:06:40 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE0D5534A
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:06:39 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso2113244wma.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoVtIIZHjWRSMo13op8m8fPdrTugWCzliMXoc5Fduz0=;
        b=E2P5RbBMaz9Pxf8+72L3Z/PDzQ/7fYcFm6sZRDskl+UpVMnh1QKOsFgfpIm0auYzd0
         Td0lMl1g/gDG0ZbLJzzqQ8RxhRxB6kRmYad0vEDZWGkyiC4SdDyJto0LBd7Um4lqoMBg
         NYuACZFlGUP7DJ2eQNAM5t+PRcUdumGvIMN463iRP+VlEfKFReo/iw7NjEyx+g5OPUfD
         GHGV0fYphI+703QDc495RxlegvHLHoakCytO4+TW0vAVAfbCiKLVbY42EbBtAztwZLRF
         pJR9UIR2UAaZ98ES4WIfAnUt/3AX9XZNCINnfC0lo4bN0FNN/OO5kjFAcijUyX6zkn2V
         ePhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoVtIIZHjWRSMo13op8m8fPdrTugWCzliMXoc5Fduz0=;
        b=35l6yBdgkVOn/NGbpb6kozO+/Zom4N0Rs7Upnd+ee0NiV+RvWkuWio6mAUcQyjltbd
         BtOP9+AUm2rRm6PIG7X33kRprVmSt3hbIxRnWznTRLjRX0JFxhf4HXMIWD/BMVIJnCgK
         EvvMlJlYZLBPiuMPJcJNCk59TivN8ue2XyRXAlIUGDjn3XOCx+0UuRH175NkvaR3cISV
         iO8/1gJhm+Ujfi2I6IRbHihW8JjaNJuEQRt9puRZHGXmse/fjCd1HwppcRbiXLQLZjPF
         1PVed9GCMQkE2ypN2F32GQiryvy2ob5EjxTpMcGVYuONOeXkrYnNkv9YqLS5QvkIcH4x
         OIcw==
X-Gm-Message-State: AJIora870edZJ3zVNnm8ubJLuVLjRLb7m+howR9rRZvUCPp9aNK8XyLz
        PVXHm5SjezxvJzmKlQogxtP+My5RsvsReA==
X-Google-Smtp-Source: AGRyM1tfyiO4rvMCSPBArZEx2r/rZCaadR6ZXZk+61ln039bq0sY4qF27rYjHXorq9wzfyha+qBZcg==
X-Received: by 2002:a05:600c:4e88:b0:39c:7c53:d7ff with SMTP id f8-20020a05600c4e8800b0039c7c53d7ffmr4716238wmq.176.1656086797893;
        Fri, 24 Jun 2022 09:06:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b0021b9e360523sm2754953wru.8.2022.06.24.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:06:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, vbhadram@nvidia.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        thierry.reding@gmail.com, treding@nvidia.com, robh+dt@kernel.org,
        catalin.marinas@arm.com, krzysztof.kozlowski+dt@linaro.org,
        kuba@kernel.org, jonathanh@nvidia.com, will@kernel.org
Subject: Re: (subset) [PATCH net-next v1 3/9] dt-bindings: memory: Add Tegra234 MGBE memory clients
Date:   Fri, 24 Jun 2022 18:06:34 +0200
Message-Id: <165608679241.23612.13616476913302198468.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220623074615.56418-3-vbhadram@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com> <20220623074615.56418-3-vbhadram@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 23 Jun 2022 13:16:09 +0530, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the memory client and stream ID definitions for the MGBE hardware
> found on Tegra234 SoCs.
> 
> 

Applied, thanks!

[3/9] dt-bindings: memory: Add Tegra234 MGBE memory clients
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f35756b5fc488912b8bc5f5686e4f236d00923d7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
