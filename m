Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA67BC48BE0
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D53FE613F9
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhFKQpO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhFKQpO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:45:14 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E1AC0617AF
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:43:15 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso9007593wmh.4
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
        b=iez4rN3vAMHTJIPw2rqGcFe2ApmgbqvQnn+9CpLUWSibs/OeCbNnSVgv3GGKoghC+S
         5fsnNSjwi1bTmhqRtGLauAxXQjSmMZfp4tRqkkqQ37aqobJPwb+7wRskwfQhe84H6rxL
         Qtf+VZL1AnhmTDrki9VdxooGT7kv8tyfT019TSAKELGgfNNpzdZ/WmsphvV1LQ0l6prQ
         HknaZdlHFXjF7CKEl+8pVYd+CNcAvqAho964qMepsN6pHdfEuTR93zTJ9eRE2/XD8S5P
         wGN8/wLlXytNZ/6f6hu54LCrttPat0uvRyCpUlIBzLXHE7hIEAvK236UR68r9GCTCcIN
         bj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kf0RMu96Wd7ucBmuszu/MWcsjJuodgKxcHrTJqiSFWM=;
        b=fahL5Bu3BRUc5chi8CmuKaTGJMWrbOtvRX3I9A/psuiB0JKrZG5dHmwocO2BXrKP1x
         bh0uu2HGfzxpT74/Jv7y67Ja8bj8GhXMx4wNpaabWG/oAjjqxMaYjiICNKgf2TUtZQRM
         1HLZ0kLfq3TNHAAXSYT96z6wSeXLazRq1sB1M97m/Iu69LdaeY77htBJhQjYNPI9KW+L
         NiZuxFotcckAJS/K+/TsGE2jpNctOeOOElrrQ8/wvu6W80n875jFOSYWsZUzuSP2v5c4
         6757wAWg5U+mkDTSFQq2uuuYrNFV6YY9QyoptTod3rhORcbkU5GFtkZvdFiFpm2y0xD2
         tQvw==
X-Gm-Message-State: AOAM533gDi4zFNo9EI9xQIi4UvtJ9n+4uZ221lXWCDJPTShTom2mX+Qr
        c7Y8WUx3E2d7SlQZV+cULWo=
X-Google-Smtp-Source: ABdhPJxrExfJMaXN5MHYDcipIcjUhjeVg0YmkBliymAlsgthJyItoy35E7ZHDiFs7rW8X5omCVe0Vw==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr4982551wmh.84.1623429794246;
        Fri, 11 Jun 2021 09:43:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m132sm6612796wmf.10.2021.06.11.09.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:44:37 +0200
Message-Id: <20210611164437.3568059-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt

for you to fetch changes up to c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.14-rc1

Contains changes to consolidate audio card names, adds audio support on
Jetson Xavier NX and enables SMMU on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

Sameer Pujar (1):
      arm64: tegra: Audio graph sound card for Jetson Xavier NX

Thierry Reding (4):
      arm64: tegra: Consolidate audio card names
      arm64: tegra: Use correct compatible string for Tegra186 SMMU
      arm64: tegra: Hook up memory controller to SMMU on Tegra186
      arm64: tegra: Enable SMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   4 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 595 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 100 ++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   4 +-
 8 files changed, 705 insertions(+), 10 deletions(-)
