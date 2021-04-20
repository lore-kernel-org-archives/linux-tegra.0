Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ED7C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC810613B8
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbhDTR0L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTR0L (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C633DC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id w23so43655068ejb.9
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZfyfBXmpvNOGNHqWWXvQz5+eKb6fUwiVC/YMxfDJi8=;
        b=AfzWpj6hX/iMxUb48cEJkEK0YRgyAjBf5fBCK2TNoF9pyNCIN2T4CIQjxQuDe1G3VN
         e/vfIN2h31KNtZmQz7EbEu73F6vcK6py91JzXWNXTf/rr4EEcgz54xluXRxlZPoPONeo
         SyA0KzfJrLGYySvbog4EvsWWlaspOP6oaKNNZrDNVJzgVU2eG9fy18wcF7+/+MSyP9Is
         JBLrQIXYeA2/n0IdTkw2FR7DWNXI+4p8B+jKhYRcBumY6cf5KU/Gsw0j0rtxEtgBz0Kd
         gqtV1HWJhXaU+gjM45g3EK6O+eJXsLyVOg35LD5JocBzNhLZq9511BiSzKdjfJoBKJwo
         nnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZfyfBXmpvNOGNHqWWXvQz5+eKb6fUwiVC/YMxfDJi8=;
        b=l+d9fmPTBhyBXBjYVqtIK0EHmQaLAL4mNdFYgiLHDd79RJVkNpUFsMlwjxzDkIIzJX
         zcSbvElaSJ2FTU7PNUOZm05jO9gOO8GPb2Wa9aspI+A2wi+o8Me332d7F+lZ6mIJBVC2
         KtCfKI7LPjy3QT7/4nDiyyau+AeK5Lr/LP2ElQSMJ4hd/2+7TTNfX21YRivgJPDn+VYR
         kLXkG0tkGuWr+TQgaAYswLZk8EKXNcANDfUVICiUx6jgcAq+CREpnPL20ya8macKX1Rg
         Q9h1fGUUtHG0FVNcc+eA24e1/5k1jSFZYEM5iRQ6lGrCN7KTe4079EkDmIgqggg0xM3E
         bZYw==
X-Gm-Message-State: AOAM532nHznEoxJsjvXDaE3KuzLfK5Jmun5QJOn0SENj6Tzwu3y3zYib
        QQcDQWTWVXIDkGUnkHwVXfg=
X-Google-Smtp-Source: ABdhPJxWJBFuXcYSTbM8eR6TrJnZTuavdZJzbkEU6SplHF+bINy06dwOkdHRSe7eKzR1ZBcTG3tK8A==
X-Received: by 2002:a17:906:6683:: with SMTP id z3mr29161911ejo.390.1618939536557;
        Tue, 20 Apr 2021 10:25:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z6sm13250574ejp.86.2021.04.20.10.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:35 -0700 (PDT)
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
Subject: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
Date:   Tue, 20 Apr 2021 19:26:09 +0200
Message-Id: <20210420172619.3782831-1-thierry.reding@gmail.com>
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

Compared to the original version of these patches, I've split the
preparatory work into a separate patch series because it became very
large and will be mostly uninteresting for this audience.

Patch 1 provides a mechanism to program SID overrides at runtime. Patch
2 updates the ARM SMMU device tree bindings to include the Tegra186
compatible string as suggested by Robin during review.

Patches 3 and 4 create the fundamentals in the SMMU driver to support
this and also make this functionality available on Tegra186. Patch 5
hooks the ARM SMMU up to the memory controller so that the memory client
stream ID overrides can be programmed at the right time.

Patch 6 extends this mechanism to Tegra186 and patches 7-9 enable all of
this through device tree updates. Patch 10 is included here to show how
SMMU will be enabled for display controllers. However, it cannot be
applied yet because the code to create identity mappings for potentially
live framebuffers hasn't been merged yet.

The end result is that various peripherals will have SMMU enabled, while
the display controllers will keep using passthrough, as initially set up
by firmware. Once the device tree bindings have been accepted and the
SMMU driver has been updated to create identity mappings for the display
controllers, they can be hooked up to the SMMU and the code in this
series will automatically program the SID overrides to enable SMMU
translations at the right time.

Note that the series creates a compile time dependency between the
memory controller and IOMMU trees. If it helps I can provide a branch
for each tree, modelling the dependency, once the series has been
reviewed.

Changes in v2:
- split off the preparatory work into a separate series (that needs to
  be applied first)
- address review comments by Robin

Thierry

Thierry Reding (10):
  memory: tegra: Implement SID override programming
  dt-bindings: arm-smmu: Add Tegra186 compatible string
  iommu/arm-smmu: Implement ->probe_finalize()
  iommu/arm-smmu: tegra: Detect number of instances at runtime
  iommu/arm-smmu: tegra: Implement SID override programming
  iommu/arm-smmu: Use Tegra implementation on Tegra186
  arm64: tegra: Use correct compatible string for Tegra186 SMMU
  arm64: tegra: Hook up memory controller to SMMU on Tegra186
  arm64: tegra: Enable SMMU support on Tegra194
  arm64: tegra: Enable SMMU support for display on Tegra194

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  11 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 166 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  90 ++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  13 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |   1 +
 drivers/memory/tegra/mc.c                     |   9 +
 drivers/memory/tegra/tegra186.c               |  72 ++++++++
 include/soc/tegra/mc.h                        |   3 +
 10 files changed, 349 insertions(+), 23 deletions(-)

-- 
2.30.2

