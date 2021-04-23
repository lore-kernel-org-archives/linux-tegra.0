Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ECAC433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A76DB61350
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhDWQcb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 12:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhDWQc2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 12:32:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20320C061574;
        Fri, 23 Apr 2021 09:31:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u17so74808036ejk.2;
        Fri, 23 Apr 2021 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp/ISs72JT/Ug6i01LrpgSZ/9Ix7eHbExJ0CNZA+2z0=;
        b=OrtIbblL6BhQgYGqijzbVDLblA7afi+WZyTC36UxzOPQwdeosxMnfh0rwI5vztTVp8
         7m0/UeOcCbW+wO3YoGXUtT9ciEjZPgx1l9NT+Sdge/wmG93WCKiZlJ4mLpbetpnosKQo
         mAPUgsjCauUyqAbX5WX+7nChprJFX5Metsloj5SUJ036HUOMobjKetBT03Q22ZJAudZN
         YxzAHeYK9LJUkC80XpuraEXeJldVoQuErgnMrTD8NTCcUlH8B/pS/XPo7aSVOx2ksP+D
         u8UoY6oZqTl6TJise2PsP80Ex7fgoZvKIQ3H8Y4XMn7yP05LAvMdoUp6sZdnpDg02bQa
         Uk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tp/ISs72JT/Ug6i01LrpgSZ/9Ix7eHbExJ0CNZA+2z0=;
        b=k4qzINZ4EaAK48HZSSTC2pBOgM7y5LVWi+c4ByU8nnZu+Nay68kUJDywZLcw4hg9BA
         HZHnWZ8MJIrvGdjpejXpIVafWVS7L8g8HbAhG/ZYGV5TzbR0WhG/beiNRMZgNUdkBT4d
         hl9+5z8G9skVHDY9eqDPgPTQ4XssL4ULghsYOqKB21cRiRWi9hyQHWO50as5dvefcjfH
         5synxa7bkocHvX0ADiXa83Pvp144KgD1QdYmP7XM31Xri+46BTWg2K1aUKNxrVtdLgc0
         Kgn+KJirSQebXyvX3RrRY0Yi/0Xp9vyhqfWQv2SaLnuDhdwFZbXUO6W8xLwCN7ZdjQUA
         +oIg==
X-Gm-Message-State: AOAM5327H5y9g4GABg3AfsvxjQ69L+KHZePt2Ghr8I5qg40ML1NF5T8/
        hZel/cNXvg1yx198+YT2/bk=
X-Google-Smtp-Source: ABdhPJyC462EOqOYC8DCRERSbNz5xA8kwLRP40IbLc2RkpHJ1Ij3qeGHgnr4Sh+iiHPKI54r3HflXA==
X-Received: by 2002:a17:906:1101:: with SMTP id h1mr5291463eja.179.1619195509781;
        Fri, 23 Apr 2021 09:31:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r17sm4979429edt.70.2021.04.23.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:31:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/5] iommu: Support identity mappings of reserved-memory regions
Date:   Fri, 23 Apr 2021 18:32:29 +0200
Message-Id: <20210423163234.3651547-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this is an updated proposal to solve the problem of passing memory
regions that are actively being accessed during boot. The particular
use-case that I need this for is when the bootloader has set up the
display controller to scan out a boot splash screen. During boot the
DMA/IOMMU glue code will attach devices to an IOMMU domain and by
doing so enable IOMMU translations. Typically this will be before a
device driver has had a chance to either disable the display
controller or set up a new framebuffer and map it to the IOMMU.

In that case, the IOMMU will start to fault because the accesses of
the display controller will be for memory addresses that are not mapped
in the IOMMU. The solution is obviously to create identity mappings for
such memory regions. From a device tree point of view, these memory
regions can be described using the reserved-memory device tree bindings
and hooked up to the consumer devices using the "memory-region"
property. On the kernel side, the IOMMU framework already supports the
concept of reserved regions, as well as a way of marking these regions
as requiring identity (a.k.a. direct) mappings.

Unfortunately, the current reserved-memory region bindings only allow
properties of the regions themselves to be described (such as whether a
kernel virtual mapping of the region is needed or not), but it doesn't
provide a way of associating extra information with any particular
reference to these regions. However, that's exactly what's needed for
this case because a given region may need to be identity mapped for a
specific device (such as the display controller scanning out from the
region) but referenced by multiple devices (e.g. if the memory is some
special carveout memory reserved for display purposes).

This series of patches proposes a simple solution: extend memory-region
properties to use an optional specifier, such as the ones already
commonly used for things like GPIOs or interrupts. The specifier needs
to be provided if the reserved-memory region has a non-zero
#memory-region-cells property (if the property is not present, zero is
the assumed default value). The specifier contains flags that specify
how the reference is to be treated. This series of patches introduces
the MEMORY_REGION_IDENTITY_MAPPING flag (value: 0x1) that marks the
specific reference to the memory region to require an identity mapping.

In practice, a device tree would look like this:

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;

		fb: framebuffer@92cb2000 {
			reg = <0 0x92cb2000 0 0x00800000>;
			#memory-region-cells = <1>;
		};
	};

	...

	display@52400000 {
		...
		memory-region = <&fb MEMORY_REGION_IDENTITY_MAPPING>;
		...
	};

Note: While the above would be valid DTS content, it's more likely that
in practice this content would be dynamically generated by the
bootloader using runtime information (such as the framebuffer memory
location).

An operating system can derive from that <phandle, specifier> pair that
the 8 MiB of memory at physical address 0x92cb2000 need to be identity
mapped to the same IO virtual address if the device is attached to an
IOMMU. If no IOMMU is enabled in the system, obviously no identity
mapping needs to be created, but the operating system may still use the
reference to transition to its own framebuffer using the existing memory
region.

Note that an earlier proposal was to use the existing simple-framebuffer
device tree bindings to transport this information. Unfortunately there
are cases where this is not enough. On Tegra SoCs, for example, the
bootloader will also set up a color space correction lookup table in the
system memory that the display controller will access during boot,
alongside the framebuffer. The simple-framebuffer DT bindings have no
way of describing this (and I guess one could argue that this particular
setup no longer is a "simple" framebuffer), so the above, more flexible
proposal was implemented.

I've made corresponding changes in the proprietary bootloader, added a
compatibility shim in U-Boot (which forwards information created by the
proprietary bootloader to the kernel) and the attached patches to test
this on Jetson TX1, Jetson TX2 and Jetson AGX Xavier.

Note that there will be no new releases of the bootloader for earlier
devices, so adding support for these new DT bindings will not be
practical. The bootloaders on those devices do pass information about
the active framebuffer via the kernel command-line, so we may want to
add code to create reserved regions in the IOMMU based on that.

Thierry

Navneet Kumar (1):
  iommu/tegra-smmu: Support managed domains

Thierry Reding (4):
  dt-bindings: reserved-memory: Document memory region specifier
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()
  iommu/tegra-smmu: Add support for reserved regions

 .../reserved-memory/reserved-memory.txt       |  21 +++
 drivers/iommu/dma-iommu.c                     |   3 +
 drivers/iommu/of_iommu.c                      |  54 ++++++++
 drivers/iommu/tegra-smmu.c                    | 121 +++++++++++++++---
 include/dt-bindings/reserved-memory.h         |   8 ++
 include/linux/of_iommu.h                      |   8 ++
 6 files changed, 199 insertions(+), 16 deletions(-)
 create mode 100644 include/dt-bindings/reserved-memory.h

-- 
2.30.2

