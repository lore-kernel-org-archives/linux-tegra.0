Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D4EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhLIRhg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243074AbhLIRhg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:36 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733C9C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:02 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o13so10922792wrs.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wJtntXQekOIR717x314CURxiw/snxfdh85IygtZJedM=;
        b=Ohgv3o6GK/obR0N4Of2wSWpGa9tVg9F60ZNpBw82BhP/OawZcbq/9QHVQGKN7tB9P5
         iCEFjs+hcG7TKE8B9FeOYqbEIKKSSB7hZc75xNFkz3ZRLQIoIh+hODcO9hXaIs8cPYpd
         crmJY1lEIVnfG3MQOJFO4BGthH5aIASuqEaEGKABRalJdqC9cwqihHRYx4U1hb7dN1Gi
         m2s4JAwo8eZQM4Rd6mGHVl+o+Ju/bhQ2lzHi+5HHu5GUVpFWvqcxBTvVu+cvphZbOEiD
         TGeQxCLq8n/Ewj+9grdC+uC+ELW1Mx/zCF0yDM2lskJAyGHyLTIUhekKaUTNksa/ldi5
         vEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wJtntXQekOIR717x314CURxiw/snxfdh85IygtZJedM=;
        b=mg3lA6EKws+LBEZangYybNuiOzLeuxUagFlEVPObPyKj04q8Y6gwft40iDpB+6PeNy
         XWscT/t2PCb7ZWCrvkZ5q8qPg1clvLjWvHV/S8nspOeUPCBLeBbQS81QHypQ7Ss+oJ4n
         RfoJEWEJlcOanr5VY41dh4nxqT/ECeXq4S53/Eyo1YQXbhFbiMKCifL7gy5wQ/zpK1vf
         eR3IqF84366DgYLurApphPn3WEi1KzTKm8q+FRwotD72SZm1qDUKg6PHG3EwXc+Y2Ki2
         +3XIqIASskFRZITaoLf2rB63TgJLavwXCUGl+xDE43bmEctya1yaTMu4PxCr0LwZRQk/
         ba3g==
X-Gm-Message-State: AOAM5305r4fP/B7wVhZ4mJBdUovHvV2wBG8jhtmVtOq1Yf7jYz8Ht0SQ
        wVFDbGClJkW2zBXpupp1Vfo=
X-Google-Smtp-Source: ABdhPJwSULsElwpkRR2gTHEgHuf5cm8xCO3OmGzWtmKWi0I6rNdcm6Yi194pqdWgi6TGkIKv0nkOkg==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr8133043wri.224.1639071240931;
        Thu, 09 Dec 2021 09:34:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id n1sm435776wmq.6.2021.12.09.09.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 00/25] ARM: tegra: Various cleanups for DT validation
Date:   Thu,  9 Dec 2021 18:33:31 +0100
Message-Id: <20211209173356.618460-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is a set of patches that clean up existing device trees so that
they can pass DT validation. Note that for this to take full effect a
bunch of DT json-schema conversion patches are needed. I've started
sending those out but want to get these here in so that everything is
in place when the json-schema conversions land and we don't get an
excessive amount of warnings.

Thierry

Thierry Reding (25):
  ARM: tegra: Clean up external memory controller nodes
  ARM: tegra: Specify correct PMIC compatible on Tegra114 boards
  ARM: tegra: Rename SPI flash chip nodes
  ARM: tegra: Rename top-level clocks
  ARM: tegra: Rename top-level regulators
  ARM: tegra: Fix compatible string for Tegra30+ timer
  ARM: tegra: Add #reset-cells for Tegra114 MC
  ARM: tegra: Rename GPIO hog nodes to match schema
  ARM: tegra: Rename GPU node on Tegra124
  ARM: tegra: Drop reg-shift for Tegra HS UART
  ARM: tegra: Rename thermal zone nodes
  ARM: tegra: Do not use unit-address for OPP nodes
  ARM: tegra: Fix Tegra124 I2C compatible string list
  ARM: tegra: Drop unused AHCI clocks on Tegra124
  ARM: tegra: Sort Tegra124 XUSB clocks correctly
  ARM: tegra: Avoid pwm- prefix in pinmux nodes
  ARM: tegra: Add compatible string for built-in ASIX on Colibri boards
  ARM: tegra: Remove PHY reset GPIO references from USB controller node
  ARM: tegra: Add dummy backlight power supplies
  ARM: tegra: Use correct vendor prefix for Invensense
  ARM: tegra: Remove unsupported properties on Apalis
  ARM: tegra: Move I2C clock frequency to bus nodes
  ARM: tegra: Remove stray #reset-cells property
  ARM: tegra: Fix SLINK compatible string on Tegra30
  ARM: tegra: Fix I2C mux reset GPIO reference on Cardhu

 arch/arm/boot/dts/tegra114-dalmore.dts        |   21 +-
 arch/arm/boot/dts/tegra114-roth.dts           |   16 +-
 arch/arm/boot/dts/tegra114-tn7.dts            |   10 +-
 arch/arm/boot/dts/tegra114.dtsi               |    3 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |  483 +++--
 arch/arm/boot/dts/tegra124-apalis-eval.dts    |    2 +-
 .../boot/dts/tegra124-apalis-v1.2-eval.dts    |    2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi   |   15 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi        |   12 +-
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  699 +++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |   39 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  | 1918 +++++++++--------
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  639 +++---
 arch/arm/boot/dts/tegra124-nyan.dtsi          |   30 +-
 .../boot/dts/tegra124-peripherals-opp.dtsi    |  142 +-
 arch/arm/boot/dts/tegra124-venice2.dts        |   33 +-
 arch/arm/boot/dts/tegra124.dtsi               |   39 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   12 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts |    4 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts    |    4 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   11 +-
 .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   |   82 +-
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi        |   82 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |   18 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |   11 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |   11 +-
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |   36 +-
 arch/arm/boot/dts/tegra20-plutux.dts          |    8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts        |   20 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    4 +-
 arch/arm/boot/dts/tegra20-tec.dts             |    8 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   17 +-
 arch/arm/boot/dts/tegra20-ventana.dts         |   14 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts     |    2 +-
 .../arm/boot/dts/tegra30-apalis-v1.1-eval.dts |    2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi    |    3 -
 arch/arm/boot/dts/tegra30-apalis.dtsi         |    3 -
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   12 +-
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |    4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |    2 +-
 .../boot/dts/tegra30-asus-nexus7-grouper.dtsi |    3 +-
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    4 +-
 arch/arm/boot/dts/tegra30-beaver.dts          |   23 +-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      |   12 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      |   14 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   33 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        |    8 +-
 .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  144 +-
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi        |  144 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    1 -
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi |  130 +-
 arch/arm/boot/dts/tegra30.dtsi                |   14 +-
 52 files changed, 2533 insertions(+), 2470 deletions(-)

-- 
2.34.1

