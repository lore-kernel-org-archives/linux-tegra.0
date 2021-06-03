Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC1CC47082
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0605613FA
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 19:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCTxN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 15:53:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49628 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCTxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 15:53:13 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lotNH-0007IX-58
        for linux-tegra@vger.kernel.org; Thu, 03 Jun 2021 19:51:27 +0000
Received: by mail-ej1-f69.google.com with SMTP id e11-20020a170906080bb02903f9c27ad9f5so2359288ejd.6
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 12:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJZ+G8sCfXxUci2WJeauNczN90DwVJP1oUWm75cpx6c=;
        b=cU/tptwkO0OPNz6vZH0kBOe/TbYPAuVS8P7arNKKxkfRTGzpJgAwSNh5YzBptseiZs
         5YwVWt8H9wPiQMCilMUuI8hdsACkVNQFJUtTdCNAJRQmaaLtnr/NGtI/BEwa69zgD1/I
         LQ4XfwTjMxhFlkd7FZfbeYvI+u14rCcdT+clalsaT8WAbc9ccMfORnPy9vw6HqwTZMZe
         PbREFcoAHRFxhBaBiKi7sKxbqv18XHJBr2g/GOIeTiH9uACci3r+6cmwTI1YbsuHUDWC
         71OSqX0kTqJolmZLxuZ3AJzQjT5R0Ahg4mFunaAMpuKYEARGH+Z6ubPFDlAxeUjUZ668
         lV0w==
X-Gm-Message-State: AOAM531+njqIF7os//+5J4YEI0GxJ6yDl34eDdFkCecfDsn52+h+Du8w
        ZTOI+FeXddZqiqY/PUO7qenJpaFzkj/fpdwVhbw3u0dKFyTMfgCt8Ncz3LG+J5Bd00mRTFVe8i2
        3dHyIoE/NHYYvjcLTvqysFcaNrSAHAz00vKvLwtVk
X-Received: by 2002:aa7:c450:: with SMTP id n16mr1062121edr.386.1622749886847;
        Thu, 03 Jun 2021 12:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5tmDUGs4U6g+UPVgs3XLfovlFqRM0G4ESDQqLS/sOG1jvSmsdXwNULc9nDt6jQqOsdsnYUA==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr1062113edr.386.1622749886743;
        Thu, 03 Jun 2021 12:51:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id n15sm2185505eds.28.2021.06.03.12.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 12:51:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-tegra@vger.kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org
Subject: Re: (subset) [PATCH v3 0/9] arm64: tegra: Prevent early SMMU faults
Date:   Thu,  3 Jun 2021 21:51:22 +0200
Message-Id: <162274987317.22918.7304733660172079088.b4-ty@canonical.com>
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
      commit: 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
