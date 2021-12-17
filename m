Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD24C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbhLQQXH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239082AbhLQQXH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Dec 2021 11:23:07 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F85C061574
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:06 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id q16so5068021wrg.7
        for <linux-tegra@vger.kernel.org>; Fri, 17 Dec 2021 08:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pj4zcvWHSEKGVjWMUZ0syF7x+vXRKdMupJyIRJ0fx2k=;
        b=eBcYxx5AGf3AWD7itGsaakYqClLa2twMqPKEWXPRfPM6mQIfmFYO4AQw6jv3TEQN0i
         PJgRf0aS/PDnQdNyP3y3r+XYWfRQUbwo0DztV29KTnL3xMT4BZua+KwI2JqtMFEH15Yl
         bjWtFmQZjLzsD2kF4/9OhWqLNVlhx5Q/RidpE8n7bnfkHQag5BNkPd0GDtRN+vyGnd4G
         9mjoZrPbtZp5X5hE3JtCV32l5r3WT9JvfZJFCzoVFeUdfRliJk7UcNF1TZl4KlIVypX6
         +y8U1im2OKVRJ8EHmVkPpA2tttc3SOwXIZ5lrX6V8cMZqerL+3XpPJtwzVCh6+gSW2yJ
         qJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pj4zcvWHSEKGVjWMUZ0syF7x+vXRKdMupJyIRJ0fx2k=;
        b=yJTBqKfZiYd2PeTfrkSalq+J0T34xoqNE+JShy4Z8+tGIVYPUr0qLgknwD40IPpC66
         Lx+BqpoWhwyw7BLejg4q0cnZAoUlsKWnQ8gh3GD2K2L3sGtYz6PaqeoSCpilZYrWIESH
         Upx0MdlM/BHQ1+QVPJ1I2+ZOYlmN3IrmfYVfNsqrOVYr+WW56qTDzieu5Lu1BUjU+ICm
         lpp/t2h+RpKPTPXH0nWQ5VGIYFXEmFmH+9H7Ph+SRRR2hhwVYrlHUH+fZj+YflXcWNWf
         fEFFcRac3ZFAXzz6NolweC+y/mlNg//cN4PXN1u3otjeWCtfKR5RJ9fnxmj8XgQPPrkv
         WXSw==
X-Gm-Message-State: AOAM532Vr+WHZ++4XtTI6k88/eGKxH5cYcSlBHs7D7LRyYJl5ohHRPH4
        odwEsAE9Mxyx5Uhh+nxmii8=
X-Google-Smtp-Source: ABdhPJyqJJc4RuVxkas2PjJnvGQ1T24gZQI50wZEhE+W7xT5oKXm9lQ1Zsj+Co5tjai6XleWLGHSzg==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr3460047wri.158.1639758185189;
        Fri, 17 Dec 2021 08:23:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 10sm9746674wrb.75.2021.12.17.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:23:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Changes for v5.17-rc1
Date:   Fri, 17 Dec 2021 17:22:52 +0100
Message-Id: <20211217162253.1801077-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-dt

for you to fetch changes up to bd048487af68a9782ebccc3af6606e9e0d7d9f8b:

  ARM: tegra: Add host1x hotflush reset on Tegra124 (2021-12-17 14:55:32 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Changes for v5.17-rc1

A large part of this is cleanups to existing device trees in order to
improve validation of the device trees using the dt-schema tooling.

This also contains a set of new device trees for various boards that
have been contributed by community members as well as fixes to existing
devices.

----------------------------------------------------------------
Anton Bambura (2):
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF701T
      ARM: tegra: Enable video decoder on Tegra114

David Heidelberg (2):
      ARM: tegra: Rename top-level clocks
      ARM: tegra: nexus7: Drop clock-frequency from NFC node

Dmitry Osipenko (16):
      ARM: tegra: Rename top-level regulators
      ARM: tegra: Rename CPU and EMC OPP table device-tree nodes
      ARM: tegra: Add device-tree for 1080p version of Nyan Big
      ARM: tegra: Enable HDMI CEC on Nyan
      ARM: tegra: Enable CPU DFLL on Nyan
      ARM: tegra: Add CPU thermal zones to Nyan device-tree
      ARM: tegra: Add 500 MHz entry to Tegra30 memory OPP table
      ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
      ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
      ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
      ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
      ARM: tegra20/30: Disable unused host1x hardware
      ARM: tegra: Add S/PDIF node to Tegra20 device-tree
      ARM: tegra: Add HDMI audio graph to Tegra20 device-tree
      ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
      ARM: tegra: paz00: Enable S/PDIF and HDMI audio

Maxim Schwalm (2):
      ARM: tegra: Add common device-tree for LVDS display panels of Tegra30 ASUS tablets
      ARM: tegra: nexus7: Use common LVDS display device-tree

Michał Mirosław (1):
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF300T

Nikola Milosavljevic (1):
      ARM: tegra: Add device-tree for ASUS Transformer EeePad TF101

Stefan Agner (1):
      ARM: tegra: Add back gpio-ranges properties

Stefan Eichenberger (1):
      ARM: tegra: Add usb-role-switch property to USB OTG ports

Svyatoslav Ryhel (5):
      ARM: tegra: Add common device-tree base for Tegra30 ASUS Transformers
      ARM: tegra: Add device-tree for ASUS Transformer Prime TF201
      ARM: tegra: Add device-tree for ASUS Transformer Pad TF300TG
      ARM: tegra: Add device-tree for ASUS Transformer Infinity TF700T
      ARM: tegra: Add device-tree for Pegatron Chagall

Thierry Reding (24):
      ARM: tegra: Clean up external memory controller nodes
      ARM: tegra: Specify correct PMIC compatible on Tegra114 boards
      ARM: tegra: Rename SPI flash chip nodes
      ARM: tegra: Fix compatible string for Tegra114+ timer
      ARM: tegra: Add #reset-cells for Tegra114 MC
      ARM: tegra: Rename GPIO hog nodes to match schema
      ARM: tegra: Rename GPU node on Tegra124
      ARM: tegra: Drop reg-shift for Tegra HS UART
      ARM: tegra: Rename thermal zone nodes
      ARM: tegra: Fix Tegra124 I2C compatible string list
      ARM: tegra: Drop unused AHCI clocks on Tegra124
      ARM: tegra: Sort Tegra124 XUSB clocks correctly
      ARM: tegra: Avoid pwm- prefix in pinmux nodes
      ARM: tegra: Add compatible string for built-in ASIX on Colibri boards
      ARM: tegra: Remove PHY reset GPIO references from USB controller node
      ARM: tegra: Add dummy backlight power supplies
      ARM: tegra: Use correct vendor prefix for Invensense
      ARM: tegra: Remove unsupported properties on Apalis
      ARM: tegra: Remove stray #reset-cells property
      ARM: tegra: Fix SLINK compatible string on Tegra30
      ARM: tegra: Fix I2C mux reset GPIO reference on Cardhu
      ARM: tegra: Avoid phandle indirection on Ouya
      ARM: tegra: Add memory client hotflush resets on Tegra114
      ARM: tegra: Add host1x hotflush reset on Tegra124

 arch/arm/boot/dts/Makefile                         |   10 +-
 arch/arm/boot/dts/tegra114-asus-tf701t.dts         |  807 ++
 arch/arm/boot/dts/tegra114-dalmore.dts             |   21 +-
 arch/arm/boot/dts/tegra114-roth.dts                |   16 +-
 arch/arm/boot/dts/tegra114-tn7.dts                 |   10 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   58 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |  436 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |    2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |    2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   16 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |   16 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |  652 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   39 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       | 1782 ++---
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts        |   11 +
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |  604 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |   86 +-
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi    |  140 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   35 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   45 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |   27 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts           | 1280 +++
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |    4 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |    4 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |   18 +-
 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi   |   82 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi             |   82 +-
 arch/arm/boot/dts/tegra20-harmony.dts              |   21 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |   11 +-
 arch/arm/boot/dts/tegra20-paz00.dts                |   22 +-
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi     |  948 ++-
 arch/arm/boot/dts/tegra20-plutux.dts               |    8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |   23 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |    7 +-
 arch/arm/boot/dts/tegra20-tec.dts                  |    8 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |   26 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |   15 +-
 arch/arm/boot/dts/tegra20.dtsi                     |  162 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |    2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |    2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |    6 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |    6 +-
 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi   |   61 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |   67 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    4 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |   12 +-
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   |    2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi |    1 -
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 -
 arch/arm/boot/dts/tegra30-asus-tf201.dts           |  627 ++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts          | 1034 +++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts         | 1087 +++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts          |  823 ++
 .../boot/dts/tegra30-asus-transformer-common.dtsi  | 1787 +++++
 arch/arm/boot/dts/tegra30-beaver.dts               |   24 +-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts           |   12 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts           |   14 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |   35 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |   25 +-
 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  144 +-
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi             |  144 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 8149 ++++++++++----------
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 2859 +++++++
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi     | 1370 +++-
 arch/arm/boot/dts/tegra30.dtsi                     |  189 +-
 65 files changed, 19640 insertions(+), 6384 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra114-asus-tf701t.dts
 create mode 100644 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts
 create mode 100644 arch/arm/boot/dts/tegra20-asus-tf101.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf201.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf300t.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf300tg.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf700t.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-pegatron-chagall.dts
