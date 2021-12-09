Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B827C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242904AbhLIR2s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242926AbhLIR2k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:40 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3C5C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:07 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso7132715wml.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZHBTUhOT3awcXS61yx98NX/R7X60+79EfDtACSGhzLw=;
        b=pltHGV1KaD+wWDErvyCpWVn//LqHAkL3msh74nGI3XEdIIgE8Hh7b4ZMqnC0MayAYt
         lhKB7qoeUMuJ+/WqTovB8EwWRFwpW3VHUJY6OHtkSI/t4eKYmZqh0jd8kNTDehkmy4+0
         RUcXhGgHY+ofLuC8UekQZj9aWqkRsNAccRodBEbewxgQijb+ZjkHIkk810HRUt2MLpEb
         uW8Y3FX757J1o/BeJNB6cc80N9y4mTwpQ+pW9h1Tq+NaBHmP3tGqwu2EY0Q+FM1gtOuk
         OAtA8IDteIe/BW3GSu/Oj2CMp2XyqfX2GB0SoIE0H8WtHHhJ2LptC6I81CS3V6s6+L7l
         AzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZHBTUhOT3awcXS61yx98NX/R7X60+79EfDtACSGhzLw=;
        b=b5eZEzNnVR2xTUhWJz4wWUtCwJ2vnPWF+gf7h+yRuGkeMTtlT3eM8ipW+g2ULTnOwz
         enp4vfhCfS3kZH96W2zq+FeX4GkyAFbyPzlHiSgTCO1kGYHHrmqO1fzw5oyoKt6qG1qv
         mqyFBBYHrv97/Beobuk1jVv8CogGzgyZ28lv4JUNH2F2WgMIf5dFJ9mLsAVWUKyx9t58
         WggaRRhvDr4nPTDLYPSWnhZyyjmKKBz395wHhIGu8DTdpDz7TljJ/MIkOzr2FLSpzmo7
         +L6Jty7IDIQ7clJk3bAKlICsrMj6syPvAAasYN2aGrFZ6QijSXar8xdg3I4vohPIWkiI
         eyCw==
X-Gm-Message-State: AOAM530HSz/o05BaBjB9GHpG/EJ72kY/sT1HtheB2a7+fb79IvFlJQjh
        CxgIG8na9+nPInrmM/gW+1uaCIJD2VgrJA==
X-Google-Smtp-Source: ABdhPJxg99CHZ+JhgKDGVX3bMvDYMwvHeB8cjBJDZLAvOJTu5IRmdS/SfK9amusy2xin5JXIK2DZIQ==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr8617920wme.93.1639070705734;
        Thu, 09 Dec 2021 09:25:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id ay29sm355143wmb.44.2021.12.09.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 00/30] arm64: tegra: Various cleanups for DT validation
Date:   Thu,  9 Dec 2021 18:24:33 +0100
Message-Id: <20211209172503.617716-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is a set of patches that gets rid of most warnings when running the
make dtbs_check target for Tegra device tree files on 64-bit ARM. I've
got another set of patches for 32-bit ARM and a set of patches for
conversion of DT bindings to json-schema that I've started sending out
and which may take a while to get reviewed and applied. In the meantime
I plan on applying these for v5.17 so that by the time we get to all the
json-schema conversions we actually start seeing good results.

Thierry

Thierry Reding (30):
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
  arm64: tegra: jetson-tx1: Remove extra PLL power supplies for PCIe and
    XUSB
  arm64: tegra: smaug: Remove extra PLL power supplies for XUSB
  arm64: tegra: jetson-nano: Remove extra PLL power supplies for PCIe
    and XUSB
  arm64: tegra: Add missing TSEC properties on Tegra210
  arm64: tegra: Sort Tegra210 XUSB clocks correctly
  arm64: tegra: Remove unused only-1-8-v properties
  arm64: tegra: Rename Ethernet PHY nodes

 .../arm64/boot/dts/nvidia/tegra132-norrin.dts |  36 +-
 .../dts/nvidia/tegra132-peripherals-opp.dtsi  | 426 ++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra132.dtsi      |  48 +-
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  20 +-
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  20 +-
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts |  32 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  63 ++-
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  12 +-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |   8 +-
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  |  20 +-
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  |   2 +-
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi |   2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  58 +--
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |   4 +-
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |   3 -
 .../arm64/boot/dts/nvidia/tegra210-p2530.dtsi |   2 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  37 +-
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |  40 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  53 +--
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  22 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  23 +-
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |   1 -
 .../boot/dts/nvidia/tegra234-sim-vdk.dts      |   1 -
 23 files changed, 667 insertions(+), 266 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra132-peripherals-opp.dtsi

-- 
2.34.1

