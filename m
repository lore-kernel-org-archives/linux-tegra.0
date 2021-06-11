Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9098CC48BE5
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 724D66135C
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 06:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhFKGuE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 02:50:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48803 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbhFKGuD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 02:50:03 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lraxY-00019t-W4
        for linux-tegra@vger.kernel.org; Fri, 11 Jun 2021 06:48:05 +0000
Received: by mail-wm1-f71.google.com with SMTP id u17-20020a05600c19d1b02901af4c4deac5so4047913wmq.7
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 23:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g18pPDMlWCQw8P7WsPDKmd8BzlhyjHJ9IBbVaDXTjEY=;
        b=SzJ7tSp1tFFCawU9KX94CD933Z3D2DaQ4OYW2z3hDWAXz3DqR4QdnQxsmemLdfA78I
         zA0O30VG0IzaWfPSbBilRMl1g0lcBVZc++c1zTfrn2FU84tj5/1fXoaYIerqtdBJiY4E
         fo6RiDnhGK8gS6+Gl/RzTjf37zvctSzaJeqVQf35FOd0tPxNvUAjHJpSzMS3Ol7WoKLq
         Wr1EJ4Uz/E/UUv75IcznxEKLglwqWAjAzqJfY3THoHN3fqWKX1s0jU4yn/g7A9VkZsvR
         sn56Rlh7WuQ7Z5Sk7+pngaAGrY0DLP/z/lNwC70OwZ0sT/MTCB6uWMWGkbZ2gXKnOT+v
         WqqA==
X-Gm-Message-State: AOAM533y0dK6+j4qiMBHJXceHkMNe0gZgGU/UKR0b2Tflla0iOI40oUI
        lPHNFOUPga50RzkjJJBYYqpH4/d/ra8Dxh5faMMeRYjuohjeS7z9ZR/OWHEL5pNMVX5a5eqlp+y
        k4Mo2Is71sf9bJZzMjloHAdq+xYYYZ7PefjYukOyk
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr2208581wri.368.1623394083493;
        Thu, 10 Jun 2021 23:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynbbdfGvQvWU48UUaPoxeMsAdxllaSjaX19MR91AuSg2c9vxcmsbkavMKDfKV0VyN9nT+STg==
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr2208555wri.368.1623394083319;
        Thu, 10 Jun 2021 23:48:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id l13sm6221631wrz.34.2021.06.10.23.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 23:48:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Will Deacon <will@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-tegra@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v3 0/9] arm64: tegra: Prevent early SMMU faults
Date:   Fri, 11 Jun 2021 08:48:00 +0200
Message-Id: <162339404910.6729.11145661496228624827.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 3 Jun 2021 18:46:23 +0200, Thierry Reding wrote:
> this is a set of patches that is the result of earlier discussions
> regarding early identity mappings that are needed to avoid SMMU faults
> during early boot.
> 
> The goal here is to avoid early identity mappings altogether and instead
> postpone the need for the identity mappings to when devices are attached
> to the SMMU. This works by making the SMMU driver coordinate with the
> memory controller driver on when to start enforcing SMMU translations.
> This makes Tegra behave in a more standard way and pushes the code to
> deal with the Tegra-specific programming into the NVIDIA SMMU
> implementation.
> 
> [...]

Applied, thanks!

[1/9] memory: tegra: Implement SID override programming
      (no commit info)
[2/9] dt-bindings: arm-smmu: Add Tegra186 compatible string
      commit: 4287861dca9d77490ee50de42aa3ada92da86c9d

[3/9] - skipped

[4/9] iommu/arm-smmu: tegra: Detect number of instances at runtime
      commit: 7ecbf253f8d64c08de28d16a66e3abbe873f6c9f
[5/9] iommu/arm-smmu: tegra: Implement SID override programming
      commit: 8eb68595475ac5fcaaa3718a173283df48cb4ef1
[6/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
      commit: 2c1bc371268862a991a6498e1dddc8971b9076b8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
