Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23635C433F5
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Nov 2021 14:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236740AbhK0Obs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Nov 2021 09:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237867AbhK0O3r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Nov 2021 09:29:47 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BBAC061574;
        Sat, 27 Nov 2021 06:26:32 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id v15so24714816ljc.0;
        Sat, 27 Nov 2021 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E9+cZEnmvm0RxfQ5UYDvn5h2mWVV3XWLgBwmveHQv28=;
        b=lPW9/XvPhbwbt0sZVEkqDsvClNCL3TXWAemTOF9cqK/YIFy9LrtRsO/vMYuD9HSBdv
         QgNMQo//6fRSuxPgHfTTSdVg+LcZ2LZot/EY0QqUbh9rFgljWxnwXWxHdddNM4bzfS7w
         AJ7AsieZ7P0LM9I1RxknMKpOD6+9BZ8e9Q715UAmHI7gsVMmgdoXFgot7mlAOzuHUVUQ
         ERV4iw3PdK/lMUfzG+FXuJR5jLryJCGjY8K/7WIbWJ8fV9nXVowwrhROKvlP3YYXdW7a
         Ey1RN0/I96sTFGVRWEOTrsSqN6GDRyBSe2Pr+7HloPgmmieyeVhyn6ap5X6B4D7hVs2l
         dfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E9+cZEnmvm0RxfQ5UYDvn5h2mWVV3XWLgBwmveHQv28=;
        b=vaGxfzuNt3KV2F2mm6UV5nwIbN0yTJoRkj8b8+XCwq64wjqcak0Sdv/g4yn+d4lRKI
         J2UxazsdiiRzuNt+W6AXNJuhnBLDfsPt67x3iOOSQhPilBKnY3JQGnMWUrX9PyhKTm3S
         CbhC4ir9kYrAXZQRo3hAmCmid7O+/ErU/qHPRhdgE1bA6RwCMvpiYcU83dWjgafz+EA9
         i6Tac7UYClrHnYr7cuJbEbah7kMpb5M0vRAZBVrMlPJoRFVyRF5n7aDeOw2YVGuvMMHW
         CmP3vhGtt43WOLWh7BE1pFPOwX5MmnLZR/3+a6cse+0bYoDjehSLShlZWrIydli8svPs
         FoDg==
X-Gm-Message-State: AOAM532BABqP2SRV+YE1Fk4p7obDageQ1JHKVg57lMDe+wK4nvG/9ZU9
        QQeAK55MDjQBymYt+0pnkkc=
X-Google-Smtp-Source: ABdhPJw/BO7INRL1s/Dj7RX1CrVpXWBTTUTNsDnGcW/Ls+RUS9Rc0eEOZ/a+L6qlq1MSpBgMqWpOtg==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr37741038ljn.354.1638023190980;
        Sat, 27 Nov 2021 06:26:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t22sm812382ljg.83.2021.11.27.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:26:30 -0800 (PST)
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
Subject: [PATCH v3 00/14] NVIDIA Tegra ARM32 device-tree patches for 5.17 (new devices and more)
Date:   Sat, 27 Nov 2021 17:23:13 +0300
Message-Id: <20211127142327.17692-1-digetx@gmail.com>
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

Changelog:

v3: - Maxim added couple "FIXME" comments to Transformer device-trees for
      things that are yet missing on kernel side, and thus, can't be enabled
      in the DT for now.

    - Maxim also found that v2 had a small problem in the patch which adds
      device-tree for Chagall tablet. Turned out I made a mistake during
      rebase of the patches and haven't noticed it, it's fixed now.

v2: - Svyatoslav and Maxim made couple corrections to regulators, comments
      and default brightness of the device-trees.

    - Added thermtrip node to transformers DT as we now have PMIC fix for
      it [1], it works properly now.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20211124190104.23554-1-digetx@gmail.com/

    - Changed sound card model names to make them per-device and consistent
      with the names that other Tegra DTs already use in upstream. This will
      prevent potential ABI breakages in the future if we will find that sound
      of some device needs extra differentiation.

Anton Bambura (3):
  ARM: tegra: Add labels to tegra114.dtsi
  ARM: tegra: Add device-tree for ASUS Transformer Pad TF701T
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
 arch/arm/boot/dts/tegra114-asus-tf701t.dts    |  833 +++++
 arch/arm/boot/dts/tegra114-dalmore.dts        |   16 +-
 arch/arm/boot/dts/tegra114-roth.dts           |   14 +-
 arch/arm/boot/dts/tegra114-tn7.dts            |    8 +-
 arch/arm/boot/dts/tegra114.dtsi               |   90 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |   26 +-
 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts   |   11 +
 arch/arm/boot/dts/tegra124-nyan.dtsi          |   28 +-
 arch/arm/boot/dts/tegra124-venice2.dts        |   28 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   12 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 1191 +++++++
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
 .../dts/tegra30-asus-transformer-common.dtsi  | 1741 ++++++++++
 arch/arm/boot/dts/tegra30-beaver.dts          |   20 +-
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      |   12 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      |   14 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   28 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts | 2807 +++++++++++++++++
 38 files changed, 10409 insertions(+), 186 deletions(-)
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

