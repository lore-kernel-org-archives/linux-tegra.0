Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF41CCA47B
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239308AbiGHS4W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jul 2022 14:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbiGHS4V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 14:56:21 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF37318376
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 11:56:20 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l23so7335644ejr.5
        for <linux-tegra@vger.kernel.org>; Fri, 08 Jul 2022 11:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lcigr+7qhzmX48vBaS4O1yAbIqvGgXz8MJ5tWHzkL2w=;
        b=S7AZl82CjuxiguT8yH+IFQMzWBMKUHi5kkHvoxX5KISdc610SmqyLGqjoS2/XfxHGj
         6IPc/es5+zy8wMXE4JpF1jgU34lPNqVXEyIN7JcuJZS/PuGO8gA4JgXANbmmTW2dK9jS
         vXl6gSYcjwPZM4ZEFmHFEjtR6miQheizlB07AvinpaaxTb/MwyZPcDt5C1KGzNC/ve3J
         CfSVgRe5y1l0kWxh+lG4qe7iFXfDOem8zjgIyxTfoRD3/sIQh5tqjJ7u1/zHg3QI7sBg
         ZSbnrm597NUddEwm8XW8qNl9bE7kGtgLSm6ESp+NyL76d3dH/xvqIs7kSEjaUrsiX7zq
         MB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lcigr+7qhzmX48vBaS4O1yAbIqvGgXz8MJ5tWHzkL2w=;
        b=rtj40O3qsPYbAg7G6iOtFyQUM74okkElYWLacUl20o72ecO+u88zVle306CzwihNsP
         eN8TiZjFV9oOIL0K5kJBTPF8TZRaGB0t7IjWbKxA4afRRtQ0ikHxcG0hwAoTOVvgaUrD
         W6AwSsBTsNRfLwbsCKoOLO4s7HLnFf50+vw2YJK7pwNFeNRwBTQlEwc5A6IoIB5i6uXT
         vgOtXNSlMxScibh1n+MLN66SuCqQu32aeV1180eX+Ecl870DFsOHsjPAxgXAGsTlZPpi
         AJwg5bnTm7yTDFIPOleO3LPY0S7EbHi6Qb7V0VAHUXz0tFuMAGWwR7uP6gOFDdfoMCi/
         QLWA==
X-Gm-Message-State: AJIora/GT6FnlHtB7OYS9twODnQwQhJBqAVnqmjI1wofZHOee36rbPzR
        oxxs6Y5qxayILZDIl4Yiom8=
X-Google-Smtp-Source: AGRyM1s8q5iyATcoXfEIULl8Ta0Z7t1epXgBJKL1vldly5xR4qRLy9Wcg+osHSxjBFohwlVXnTYa2g==
X-Received: by 2002:a17:907:28d4:b0:72b:307d:fb53 with SMTP id en20-20020a17090728d400b0072b307dfb53mr2035803ejc.84.1657306579287;
        Fri, 08 Jul 2022 11:56:19 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k13-20020a170906a38d00b006fed787478asm20782991ejz.92.2022.07.08.11.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] memory: tegra: Changes for v5.20-rc1
Date:   Fri,  8 Jul 2022 20:56:05 +0200
Message-Id: <20220708185608.676474-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708185608.676474-1-thierry.reding@gmail.com>
References: <20220708185608.676474-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.20-memory

for you to fetch changes up to 5060237b0ee1b1c70fcd9a8048664905b74ba6a4:

  memory: tegra: Add MGBE memory clients for Tegra234 (2022-07-08 10:29:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.20-rc1

Add memory client definitions for the Multi-Gigabit Ethernet (MGBE)
controllers found on Tegra234.

----------------------------------------------------------------
Akhil R (1):
      dt-bindings: Add headers for Tegra234 GPCDMA

Sumit Gupta (3):
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 CBB 1.0 binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra194 AXI2APB binding
      dt-bindings: arm: tegra: Add NVIDIA Tegra234 CBB 2.0 binding

Thierry Reding (5):
      dt-bindings: power: Add Tegra234 MGBE power domains
      dt-bindings: Add Tegra234 MGBE clocks and resets
      dt-bindings: memory: Add Tegra234 MGBE memory clients
      Merge branch 'for-5.20/dt-bindings' into for-5.20/memory
      memory: tegra: Add MGBE memory clients for Tegra234

 .../arm/tegra/nvidia,tegra194-axi2apb.yaml         |  40 ++++++++
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml    |  97 ++++++++++++++++++++
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |  74 +++++++++++++++
 drivers/memory/tegra/tegra234.c                    |  80 ++++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h         | 101 +++++++++++++++++++++
 include/dt-bindings/memory/tegra234-mc.h           |  21 +++++
 include/dt-bindings/power/tegra234-powergate.h     |   1 +
 include/dt-bindings/reset/tegra234-reset.h         |   9 ++
 8 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
