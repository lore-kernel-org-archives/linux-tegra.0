Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD4DC433E1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8F5261A1E
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhCYNDU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhCYNDT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:19 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786ACC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso3065513wmq.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2WPu7kAL1q4h+0RYh+mqLBhq3ffqKO8EiTzgDurYuc=;
        b=Ml9c/DvziLIkmKNowFExNd4w3KMaGGvXTDaHY2sDavPTbklrdO0CdS9uYSw/Mhi7xy
         fsMvkc4uFIYWeqXGRmeBnUj+KB24waK5LibuOLmEmGDjXKoXOhdqoWNu4s7nOvWNy8xB
         ykwKiorHS6zPip0fdkZ9jjtXU5hShV+GYBLpJOYC03pO0Q2eKqFqOdHOpndc4uFm4uF4
         nkTQKk4w89gwyH2sTkEKc7BQDFiH8bqjqbGRiyDuwRulWMuOJUvHjRyIyLnfZRBMpPpg
         mH7MZoIrnM+NWS+2wkhUkEdqaRvlXQPcE4SjBWYIgOQUk5Mb0gV1KCXlUnw0S20SJJ9Q
         3jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2WPu7kAL1q4h+0RYh+mqLBhq3ffqKO8EiTzgDurYuc=;
        b=ScdeC1yeYhJkHIA1Ja6qxRnGbrFn23VhAgiPLMxEeiSK7qgnk/72FHT77xYqx7JfTv
         JAfjXSjH4bDYUthRstT8jomUXG+eNRTf1V9o3HAI/KDm3O2yp787XFvcnl9K4k11G6lI
         uDnVoAjqBuMLiajSjNWx/cELv1ZtpHHjcfuLr4Ul2DXemzDs536e016u7EFtxxFYEZ/l
         DUyQuyptT4YFtlh52XBdg+UkpxWmxsd47nwKD41EaxUV6BHUOiaILMtw+1+4Ell4mhxj
         i53Hu5Z65Ynqhb9NsU+RqzX4C8FTN3dT1epDq8rEpDnn/GXo3IzTlUXYg6Is+jWkt6Ze
         fsXg==
X-Gm-Message-State: AOAM531SWTS4xyzn5zD6tAx97xA2UvEO2QepgjlDnhJ8bYkEQs25zus/
        ZyLrOZ22x+kffOoBuugzAoY3/Nqc0+Q=
X-Google-Smtp-Source: ABdhPJwBE80kgdsbJqdbbvbPWZsiA5GMuJ2QHWb4YxLiisgVdPuYlebUysJdTajlINmwR56phghGyA==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr7873916wmf.144.1616677396065;
        Thu, 25 Mar 2021 06:03:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h9sm6317280wmb.35.2021.03.25.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] arm64: tegra: Prevent early SMMU faults
Date:   Thu, 25 Mar 2021 14:03:23 +0100
Message-Id: <20210325130332.778208-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this is a set of patches that is the result of earlier discussions
regarding early identity mappings that are needed to avoid SMMU faults
during early boot.

The goal here is to avoid early identity mappings altogether and instead
postpone the need for the identity mappings to when devices are attached
to the SMMU. This works by making the SMMU driver coordinate with the
memory controller driver on when to start enforcing SMMU translations.
This makes Tegra behave in a more standard way and pushes the code to
deal with the Tegra-specific programming into the NVIDIA SMMU
implementation.

Patches 1 and 2 are preparatory work that is used in patch 3 to provide
a mechanism to program SID overrides at runtime. Patches 4 and 5 create
the fundamentals in the SMMU driver to support this and also make this
functionality available on Tegra186. Patch 6 hooks the ARM SMMU up to
the memory controller so that the memory overrides can be programmed at
the right time.

Patch 7 extends this mechanism to Tegra186 and patches 8-9 enable all of
this through device tree updates.

The end result is that various peripherals will have SMMU enabled, while
the display controllers will keep using passthrough, as initially set up
by firmware. Once the device tree bindings have been accepted and the
SMMU driver has been updated to create identity mappings for the display
controllers, they can be hooked up to the SMMU and the code in this
series will automatically program the SID overrides to enable SMMU
translations at the right time.

Thierry

Thierry Reding (9):
  memory: tegra: Move internal data structures into separate header
  memory: tegra: Add memory client IDs to tables
  memory: tegra: Implement SID override programming
  iommu/arm-smmu: Implement ->probe_finalize()
  iommu/arm-smmu: tegra: Detect number of instances at runtime
  iommu/arm-smmu: tegra: Implement SID override programming
  iommu/arm-smmu: Use Tegra implementation on Tegra186
  arm64: tegra: Hook up memory controller to SMMU on Tegra186
  arm64: tegra: Enable SMMU support on Tegra194

 arch/arm64/boot/dts/nvidia/tegra186.dtsi     |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi     |  86 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c   |   3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c |  81 ++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c        |  17 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.h        |   1 +
 drivers/iommu/tegra-gart.c                   |   2 +-
 drivers/iommu/tegra-smmu.c                   |   2 +-
 drivers/memory/tegra/mc.h                    |   2 +-
 drivers/memory/tegra/tegra186.c              | 288 ++++++++++++++++++-
 include/soc/tegra/mc-internal.h              |  62 ++++
 include/soc/tegra/mc.h                       |  60 +---
 12 files changed, 529 insertions(+), 77 deletions(-)
 create mode 100644 include/soc/tegra/mc-internal.h

-- 
2.30.2

