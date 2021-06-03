Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25E1C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 973F0613B1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhFCQqp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhFCQqp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:46:45 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D30CC06174A
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id jt22so10212724ejb.7
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rVr43q21YvffQjChkPWUcI2ScgfaIcHVrqYlABk7dec=;
        b=WQhBmtRwXgI6m5iQhMkj9hoEJVfreNZxFRV+7f9uqHbaNxKpFwYxHOuzlGhSFxSqDQ
         Z+caS2pe7ZUIRkggw/8uDPEpbgvxlD7MszlPTx3ChXn4j3L0I/iid8BExBNj1ntFffsP
         P8Wkzt/MXT5Dco56uZB3WD/1SrQ/CnTbBOp0ZFPkerWD0Ip7sEGvSHkKpYUGUcpw/Khu
         HDNssduz88YziRNdRKa0/hLBeyjEhowAVj3AMm7tWcACp6D0VXBlkiJ69FQVWOGKimJI
         h11S7zwozVjyAGp2OxoCqhu3+sfQ+EX7lZnR5Z6BUn4m9xl6wK5W6gibH9JTWS1u6yxH
         J04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rVr43q21YvffQjChkPWUcI2ScgfaIcHVrqYlABk7dec=;
        b=NLYSrx5JX5tB3NyuaqZHDRgH7g5ZwcoyAeZe+5gVu1VuhnL8QLgMgYKf+WkkGCjK0P
         Oqjyk6qgx9TjNkH39hig3vsQSCciyGrHIZmYa/YvKDrlvPFJ0Tnv57rNpXfjZTzznUOU
         lO0GEOVA1DGzEFm/spFsY3sbWzVgdvfZmujDm5l4NwvOGG80bh17GsxbILadR/1wIRwg
         rvEDGBbewW0IqxVGo2av1MH/LrQvL2OMt4edIUbK7bEYrGzC05GTbQStelceeImDIq4J
         t2Upec1aPH+YpjPMV44ecXiNK9RBATy5C321eF8b/zw3PQAOleXZpDRYws7nrsQCUAIs
         tjKw==
X-Gm-Message-State: AOAM532G2BOlwWbdItRRU2uxHjHSAZYwV+EBzjcO51kMKkJPIX5Ep1qo
        rmlOBh33pfAkxdKhP5ZylzI=
X-Google-Smtp-Source: ABdhPJyxuKFzTXzdUUuuRg5+fasUmQpB/t2zP4zUfnwWo9ap4jiRhmDgHF8d2hjtKx2m6KQTLYRBhw==
X-Received: by 2002:a17:906:17d8:: with SMTP id u24mr308766eje.106.1622738698879;
        Thu, 03 Jun 2021 09:44:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m4sm1694353eje.8.2021.06.03.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:44:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/9] arm64: tegra: Prevent early SMMU faults
Date:   Thu,  3 Jun 2021 18:46:23 +0200
Message-Id: <20210603164632.1000458-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
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
this through device tree updates. Patch 10 (that was included in earlier
version to show how SMMU will be enabled for display controllers) has
been dropped for now while waiting for the identity mappings support to
land.

The end result is that various peripherals will have SMMU enabled, while
the display controllers will keep using passthrough, as initially set up
by firmware. Once the device tree bindings have been accepted and the
SMMU driver has been updated to create identity mappings for the display
controllers, they can be hooked up to the SMMU and the code in this
series will automatically program the SID overrides to enable SMMU
translations at the right time.

Will, Krzysztof: as discussed, it'd be best if Krzysztof picked up patch
1 into the memory controller tree on top of v3 of the driver unification
series I sent out earlier today and then sent out a PR for Will to merge
and apply patches 2-6. I can then take patches 7-9 in via the Tegra tree
since there are no hard dependencies.

Changes in v3:
- move hunk from patch 4 to patch 5 to preserve bisectibility

Changes in v2:
- split off the preparatory work into a separate series (that needs to
  be applied first)
- address review comments by Robin

Thierry

Thierry Reding (9):
  memory: tegra: Implement SID override programming
  dt-bindings: arm-smmu: Add Tegra186 compatible string
  iommu/arm-smmu: Implement ->probe_finalize()
  iommu/arm-smmu: tegra: Detect number of instances at runtime
  iommu/arm-smmu: tegra: Implement SID override programming
  iommu/arm-smmu: Use Tegra implementation on Tegra186
  arm64: tegra: Use correct compatible string for Tegra186 SMMU
  arm64: tegra: Hook up memory controller to SMMU on Tegra186
  arm64: tegra: Enable SMMU support on Tegra194

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 11 ++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  4 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 86 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  | 90 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 13 +++
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |  1 +
 drivers/memory/tegra/mc.c                     |  9 ++
 drivers/memory/tegra/tegra186.c               | 72 +++++++++++++++
 include/soc/tegra/mc.h                        |  3 +
 10 files changed, 269 insertions(+), 23 deletions(-)

-- 
2.31.1

