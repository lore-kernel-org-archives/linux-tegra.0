Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C6AC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238463AbhLQQXG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239082AbhLQQXE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Dec 2021 11:23:04 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9C3C061574
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:04 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a18so5057990wrn.6
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yisB2sBDYOOSNkfBetYak0Yx/DrETgULS8zG4daqePQ=;
        b=OMDj0tnPFCx7rdJ4n66c7jwfbEV5TbGi/2QsuYunV38JZhWQ9WIVhjFjylIr45saeH
         JGDr9dmD5/l7Ed4wv0oo2riAAt32c+Z0Rv3UraHtnwbO+VlHzaoRbrPyRdpEXxjGuzuP
         gyFXPIfu+BLWjrSWOmDFVjaRUZlMuXDcWRXe1pYgIPNAPQCH3LVmps07Ii9DmLI6u3H+
         znHJ6hTWQ2twmZMv8XtC+/cUcjc9gYOAo/3yYt1cRw8j7Wx1Z4jwqzTtWOcKcHZu8HTE
         a9Mw4bE8h8z4iKpsjHiIpBEM6y7VCZ2M77K8uR8P/T2fyLdeHd6BoXlqZ5y0dMck6trR
         6q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yisB2sBDYOOSNkfBetYak0Yx/DrETgULS8zG4daqePQ=;
        b=3cQsz/2lQc7ph6bQhlJDMxXYUIb+SFSiM9sgTz0P2yt1e9VnviWRCjdCsbvgwRlrwx
         nGjWTMZvQtL27aLH73X23S/MtefXca4XFHnCDqRlqPrtyLcVMSUlJJkaW6waQ5Fj6xBz
         j09RoXg2FNiqmOYdRtcJZyWlmWhBcvDheoMgsXrgzUBzlZwZqzGwJ5XFMKcBAdEB49tn
         Ir4Rq/o8XWdGoO5Vw2vGzl/dDCXlHakpIe4u/VJTG6JnOLbzozs1rLu39Vis0L+tjyg9
         q1MXN5Ai0RZ+DupiuoxSOJBiAK8evUXAPPQwGOrvVkqiqud4K4uvogqNOCPm5N6zytJu
         mw1Q==
X-Gm-Message-State: AOAM530xIaYpts5iVcuU1neJN19tY03Qfxg2F0vg+tFrE0ezf6xPfq7/
        pvkpahgsvkrKAb9EKDa5PMw=
X-Google-Smtp-Source: ABdhPJydA+0Y50jNwlA466rohG9flJZ+NbDOIQaS9J4G5uwRNEiqf6zwCDo7tNvSoUPZPqBx1tSmQg==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr3104681wrh.276.1639758182735;
        Fri, 17 Dec 2021 08:23:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g198sm8978790wme.23.2021.12.17.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:23:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] arm64: tegra: Device tree changes for v5.17-rc1
Date:   Fri, 17 Dec 2021 17:22:51 +0100
Message-Id: <20211217162253.1801077-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm64-dt

for you to fetch changes up to 914ed1f56581f99094035f1cc989ab4498104e94:

  arm64: tegra: Add host1x hotflush reset on Tegra210 (2021-12-17 14:58:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.17-rc1

The vast majority of this contains various updates and cleanups to the
Tegra device trees that will eventually help validate all of them using
the dt-schema infrastructure.

Another notable chunk of this contains additional Tegra234 support as
well as support for the new Jetson AGX Orin Developer Kit.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add NVENC and NVJPG nodes for Tegra186 and Tegra194
      arm64: tegra: Add ISO SMMU controller for Tegra194
      arm64: tegra: Add dma-coherent for Tegra194 VIC

Mikko Perttunen (6):
      dt-bindings: Update headers for Tegra234
      arm64: tegra: Add clock for Tegra234 RTC
      arm64: tegra: Update Tegra234 BPMP channel addresses
      arm64: tegra: Fill in properties for Tegra234 eMMC
      arm64: tegra: Add Tegra234 TCU device
      arm64: tegra: Add NVIDIA Jetson AGX Orin Developer Kit support

Prathamesh Shete (2):
      arm64: tegra: Add support to enumerate SD in UHS mode
      arm64: tegra: Update SDMMC4 speeds for Tegra194

Thierry Reding (40):
      dt-bindings: memory: tegra: Update for Tegra194
      dt-bindings: memory: tegra: Add Tegra234 support
      Merge tag 'tegra-for-5.17-dt-bindings-memory' into for-5.17/arm64/dt
      arm64: tegra: Fixup SYSRAM references
      arm64: tegra: Add main and AON GPIO controllers on Tegra234
      arm64: tegra: Describe Tegra234 CPU hierarchy
      arm64: tegra: Rename top-level clocks
      arm64: tegra: Rename top-level regulators
      arm64: tegra: Add native timer support on Tegra186
      arm64: tegra: Fix unit-addresses on Norrin
      arm64: tegra: Remove unsupported properties on Norrin
      arm64: tegra: Fix compatible string for Tegra132 timer
      arm64: tegra: Add OPP tables on Tegra132
      arm64: tegra: Fix Tegra132 I2C compatible string list
      arm64: tegra: Drop unused AHCI clocks on Tegra132
      arm64: tegra: Sort Tegra132 XUSB clocks correctly
      arm64: tegra: Rename thermal zones nodes
      arm64: tegra: Rename power-monitor input nodes
      arm64: tegra: Fix Tegra186 compatible string list
      arm64: tegra: Adjust length of CCPLEX cluster MMIO region
      arm64: tegra: Drop unit-address for audio card graph endpoints
      arm64: tegra: Use JEDEC vendor prefix for SPI NOR flash chips
      arm64: tegra: Drop unsupported nvidia,lpdr property
      arm64: tegra: Fix Tegra194 HSP compatible string
      arm64: tegra: Drop unused properties for Tegra194 PCIe
      arm64: tegra: Remove undocumented Tegra194 PCIe "core_m" clock
      arm64: tegra: Rename TCU node to "serial"
      arm64: tegra: Remove unsupported regulator properties
      arm64: tegra: Rename GPIO hog nodes to match schema
      arm64: tegra: jetson-tx1: Remove extra PLL power supplies for PCIe and XUSB
      arm64: tegra: smaug: Remove extra PLL power supplies for XUSB
      arm64: tegra: jetson-nano: Remove extra PLL power supplies for PCIe and XUSB
      arm64: tegra: Add missing TSEC properties on Tegra210
      arm64: tegra: Sort Tegra210 XUSB clocks correctly
      arm64: tegra: Remove unused only-1-8-v properties
      arm64: tegra: Rename Ethernet PHY nodes
      arm64: tegra: Add EMC general interrupt on Tegra194
      arm64: tegra: Add memory controller on Tegra234
      arm64: tegra: Hook up MMC and BPMP to memory controller
      arm64: tegra: Add host1x hotflush reset on Tegra210

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  98 +++-
 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  36 +-
 .../boot/dts/nvidia/tegra132-peripherals-opp.dtsi  | 426 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  48 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  20 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  20 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |  32 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  95 +++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  12 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  20 +-
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 231 +++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   3 -
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  37 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |  40 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  53 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  22 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  27 +-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi |  24 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  24 +
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |   5 +
 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts    |   1 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 541 ++++++++++++++++++++-
 include/dt-bindings/clock/tegra234-clock.h         |  26 +-
 include/dt-bindings/memory/tegra234-mc.h           |  32 ++
 include/dt-bindings/reset/tegra234-reset.h         |  12 +-
 31 files changed, 1606 insertions(+), 298 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h
