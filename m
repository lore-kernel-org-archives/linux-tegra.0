Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1482DC4332F
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E571561151
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhIZXjI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 26 Sep 2021 19:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbhIZXjH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 26 Sep 2021 19:39:07 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8183DC061570;
        Sun, 26 Sep 2021 16:37:30 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v17so3437915wrv.9;
        Sun, 26 Sep 2021 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nB/aCr9uBykZ+RwpipKniwtp2zpGlAKWYzSLSz4DMoc=;
        b=ZfiW+J/lBzY3acXAWtrIG33I5tACKL7YLWDM+ub6X5fVbsPM27urWf2lcCLHBcFRbW
         urMMIiqxJf5RD6z1Avh9bycF2Ol66jc93b+45I9uVW2cCkGNzRr6bh1Ga+1KQqujh/4q
         FnwYvbHW7wMQ9A1Wr8BoIcI1c79bckIqDuit1MhjgQ9HW3eaRHGxRJZyfNc6TzzZmwak
         uAa0TMo0vzgsBQRRsxmZgU7PXbiET0pfGMSDBhxVDcjnfq8hGtYPB8/gH44dGkTf9web
         4xopxv4VfK2NwhXMZUrquxLhW5SnNAVvbg06drvERm1xY6hgmj6AAoID9oGAM86XAvPk
         xd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nB/aCr9uBykZ+RwpipKniwtp2zpGlAKWYzSLSz4DMoc=;
        b=AwbruXh7oN/yADeewWKA04ZUGfglUMh17dY6jRZ1dthlcyu6+xhw4XiOiYoGv2reJf
         jQk1Nf3HObHb2h1TDMo/6yoBE/R4xn8sux3POO7T0E7L4D9T62jJWmHfDMqJgn0stvtZ
         R/2ezCtmXf7wytxvucqJjFD6KFEQXHjAijFj/aT0kuHmbEFjZovrTV/NC6y4UrDkNI4B
         SF+uxGt32OHV4FuqrvCDjGKqNIsa217qqseu2b5gRysPxtMWBnFQ1yNgbwtwoV5ULuUu
         j7cP4V4WUikdILus34Dz2EDR1WxVu2qinrC/nV4+6VqV5ctZotgaqNbfCuZoEh0h1hu4
         5o2Q==
X-Gm-Message-State: AOAM531kYP6Pb6iS66TNt16Vgnxp+6UBadAf+XKod6OpesNS+SPsV8tc
        93b5Sm5GdE0muvR5W/PGHdU=
X-Google-Smtp-Source: ABdhPJyy7QdmZEaFYMrQEh/J3H8D8a/6Z0T5Yx9KjJzuCEd96VvQKRqYOfp7LkaTVYLRCigN4DUsTA==
X-Received: by 2002:a05:6000:2af:: with SMTP id l15mr24848110wry.17.1632699449082;
        Sun, 26 Sep 2021 16:37:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id y7sm12493698wrs.95.2021.09.26.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 16:37:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] Tegra ARM32 device-tree improvements for 5.16
Date:   Mon, 27 Sep 2021 02:37:01 +0300
Message-Id: <20210926233704.10164-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes couple warnings reported by the DT schema checker for
ARM32 Tegra device-trees.

David Heidelberg (2):
  ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
  ARM: tegra: Name clock and regulator nodes according to DT-schema

Dmitry Osipenko (1):
  ARM: tegra: Update Broadcom Bluetooth device-tree nodes

 arch/arm/boot/dts/tegra114-dalmore.dts        | 16 +++++------
 arch/arm/boot/dts/tegra114-roth.dts           | 14 +++++-----
 arch/arm/boot/dts/tegra114-tn7.dts            |  8 +++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 26 ++++++++---------
 arch/arm/boot/dts/tegra124-nyan.dtsi          | 28 +++++++++----------
 arch/arm/boot/dts/tegra124-venice2.dts        | 28 +++++++++----------
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 19 +++++++------
 arch/arm/boot/dts/tegra20-harmony.dts         | 16 +++++------
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |  8 +++---
 arch/arm/boot/dts/tegra20-paz00.dts           |  6 ++--
 arch/arm/boot/dts/tegra20-plutux.dts          |  8 +++---
 arch/arm/boot/dts/tegra20-seaboard.dts        | 16 +++++------
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |  4 +--
 arch/arm/boot/dts/tegra20-tec.dts             |  8 +++---
 arch/arm/boot/dts/tegra20-trimslice.dts       | 12 ++++----
 arch/arm/boot/dts/tegra20-ventana.dts         | 12 ++++----
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 15 ++++++----
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  4 +--
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  2 +-
 arch/arm/boot/dts/tegra30-beaver.dts          | 20 ++++++-------
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      | 12 ++++----
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 14 +++++-----
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 28 +++++++++----------
 arch/arm/boot/dts/tegra30-ouya.dts            |  5 +++-
 24 files changed, 169 insertions(+), 160 deletions(-)

-- 
2.32.0

