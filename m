Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E18C433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1E8A61177
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235530AbhKNWFj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbhKNWFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:03 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080BBC061202;
        Sun, 14 Nov 2021 14:01:56 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 13so31216528ljj.11;
        Sun, 14 Nov 2021 14:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2/RMDDNKUW81/NSLsMNvwdhPKuNgHO8UBT3kEWNBR0=;
        b=A8s98yAEtUTI3iT9jaFKoyqPOReQ2A9qlFX6uHHoWmjOHc60K/kFSwj9ViS/d7tyvj
         CR2y3wXNLfbCBA4s9Qz/jYLcDmb300gBny0bva1FtLeF3/P/Fow/XFL7zqK4CppApEmu
         TPcyG4oGhWq3fy9C5ZeAh3n4HeR62MzkMlnyvK+PZMtrtYoPBnpHlM10UU5ZlXpIszDW
         /1RXbdPd9Tz84zqgyDTeBBG2Kc4H8nUwGrFv4+kOUa/LU3Xf91xm1c9+QwWG1OdGYlxf
         mmiw7V90Ejj0F/QunhQcOqnz+A9cteorjozupFix5xOpupt1Kmj2fDMUdanSnb98DLlf
         LAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j2/RMDDNKUW81/NSLsMNvwdhPKuNgHO8UBT3kEWNBR0=;
        b=GueCgU9FJNX2o6dRibfyH2+LqS9TnDYm7LcIhJ33BCHoowR+loakvSEUF2hFgueqnz
         tyxGyTbOeUenOJA4NORehjqpC7Gsh29avPhq67QVrXJ/lVA7yV25Fd7BkHkYr4sM8dpY
         ukw9eUlNSETyi+ZR1mKVAP58e4Ww+0fF41XvXTsseVjCA4jZCPbKfeyPw8pFfYVvlbha
         98eVxijs8rdmb086JpnzJci6SNFAvAKwbccOXhUDLDkgBAs5xXHvNTbGtcHMKBMnIMW6
         KCgsYpfJPh7b5OlYryVjUc9QIPvDHXQ4LZA7BHH+zIeG/6frujovdWX6QBnmN6mtBTQk
         T5MQ==
X-Gm-Message-State: AOAM530t7tVcxniXzlXX4rPklzo1dedHAEUpgVh/TPWGB/buakD/SvHw
        Iv2YEcq+oemsqMc80yTfIDQ=
X-Google-Smtp-Source: ABdhPJzM3mrjjEG5A/tfKwjeOJuRmqvbXYVSEv37ZNEm+CLFBemVKM6U0NTtdwNVockf57DrvHOHDw==
X-Received: by 2002:a2e:b7d4:: with SMTP id p20mr32966755ljo.248.1636927314397;
        Sun, 14 Nov 2021 14:01:54 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:01:54 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/14] NVIDIA Tegra ARM32 device-tree patches for 5.17
Date:   Mon, 15 Nov 2021 01:01:05 +0300
Message-Id: <20211114220119.18909-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In this patchset you will find:

  - New device-trees of ASUS Transformer and Pegatron Chagall tablets.

  - New device-tree of Nyan Big Chromebook variant that has 1080p display
    panel.

  - Enabled video decoder on Tegra114.

  - Minor cleanup of Nexus7 device-tree.

  - Renamed clocks and regulator nodes. I'm sending this patch second time
    because previously there was no good reason given about why not to apply
    it. Please apply it this time.

Anton Bambura (3):
  ARM: tegra: Add labels to tegra114.dtsi
  ARM: tegra: Add device-tree for Asus Transformer Pad TF701T
  ARM: tegra: Enable video decoder on Tegra114

David Heidelberg (3):
  dt-bindings: ARM: tegra: Document Pegatron Chagall
  ARM: tegra: Name clock and regulator nodes according to DT-schema
  ARM: tegra: nexus7: Drop clock-frequency from NFC node

Dmitry Osipenko (1):
  ARM: tegra: Add device-tree for 1080p version of Nyan Big

Michał Mirosław (1):
  ARM: tegra: Add device-tree for ASUS Transformer Pad TF300T

Nikola Milosavljevic (1):
  ARM: tegra: Add device-tree for ASUS Transformer EeePad TF101

Svyatoslav Ryhel (5):
  dt-bindings: ARM: tegra: Document ASUS Transformers
  ARM: tegra: Add device-tree for ASUS Transformer Prime TF201
  ARM: tegra: Add device-tree for ASUS Transformer Pad TF300TG
  ARM: tegra: Add device-tree for ASUS Transformer Infinity TF700T
  ARM: tegra: Add device-tree for Pegatron Chagall tablet

 .../devicetree/bindings/arm/tegra.yaml        |   19 +
 arch/arm/boot/dts/Makefile                    |   10 +-
 arch/arm/boot/dts/tegra114-asus-tf701t.dts    |  832 +++++
 arch/arm/boot/dts/tegra114-dalmore.dts        |   16 +-
 arch/arm/boot/dts/tegra114-roth.dts           |   14 +-
 arch/arm/boot/dts/tegra114-tn7.dts            |    8 +-
 arch/arm/boot/dts/tegra114.dtsi               |   90 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |   26 +-
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts   |   10 +
 arch/arm/boot/dts/tegra124-nyan.dtsi          |   28 +-
 arch/arm/boot/dts/tegra124-venice2.dts        |   28 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   12 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 1187 +++++++
 arch/arm/boot/dts/tegra20-harmony.dts         |   16 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |    8 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |    6 +-
 arch/arm/boot/dts/tegra20-plutux.dts          |    8 +-
 arch/arm/boot/dts/tegra20-seaboard.dts        |   16 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    4 +-
 arch/arm/boot/dts/tegra20-tec.dts             |    8 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   12 +-
 arch/arm/boot/dts/tegra20-ventana.dts         |   12 +-
 .../boot/dts/tegra30-asus-lvds-display.dtsi   |   46 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   10 +-
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |    4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |    2 +-
 .../boot/dts/tegra30-asus-nexus7-grouper.dtsi |    1 -
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |    2 -
 arch/arm/boot/dts/tegra30-asus-tf201.dts      |  623 ++++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     | 1030 ++++++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    | 1072 +++++++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     |  807 +++++
 .../dts/tegra30-asus-transformer-common.dtsi  | 1751 ++++++++++
 arch/arm/boot/dts/tegra30-beaver.dts          |   20 +-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      |   12 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      |   14 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   28 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts | 2806 +++++++++++++++++
 38 files changed, 10412 insertions(+), 186 deletions(-)
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

-- 
2.33.1

