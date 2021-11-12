Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C74C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B51C160F70
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhKLMim (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbhKLMim (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:42 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB51C061766;
        Fri, 12 Nov 2021 04:35:51 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w29so15198961wra.12;
        Fri, 12 Nov 2021 04:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBEHoURKIBaY3X5BAcdBbjQ4Zu1VyqdYU7IZMgF72QU=;
        b=KRgXGMgbEMCOvx7Q2K9d8BSZW9Jkvl0qYNWkPalWccSZy70bYf+/UzTAluzPl0jrkN
         9zskR1dYQLKAjjEznnG/aVLc/5xjh1ZTcFyursONeDyAmKtX60VVRxAcjwtQy6Ik7b9G
         5vHlZW/H75nrOQWHUeCcNRocJj/y2s7062Q6oc3fs4fveKfrcJxnS6hO9/4wrJm7tn4K
         cYi/PX8wgzEwBSJZb+OCImRgolXcw6xKRp4BZuUOwnWsxIlWfMOxCPxTq5T/R9lRYlGY
         2c4479QZBtbUm7dg2LIwnFRXXvh4LkTbClujHDC2WzlqtjIRmfjSvEwLSTEYSXDuMUuy
         x+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBEHoURKIBaY3X5BAcdBbjQ4Zu1VyqdYU7IZMgF72QU=;
        b=TyrsdYAKpc4hiCBedwf3Uaw4C3sH1le8TnQX1/SlEbJ4NLRchGSyWGFjURz6ulmzJb
         bN5Dvebg6ZUUPO6g9Ghhaw8QJQefSnqVEhhuXaLZYxjpFt/XmkNtP88NuPrTCxR5lgqF
         8fG3GUT9AMzIYKdKfiLR3xGHXjBq+Z9tOlGRb7t/3aqFMjerebohvD8ToDRpQFNokXKY
         BUEW88iEOsxvelTtKM1mSyUmJQlFRM7TcEVwGv+eHHkQyMwkfi5AoBlYDTJmU6ygbcTk
         6ZFOpgoUD5D/0uu8RJl97/LAQusaHkQ0PKiWyuZX+Z/aAoN3gxtwFOpK5oYHy6UQAHID
         71Yg==
X-Gm-Message-State: AOAM533+r79EPhWPBV4n1A5/pkg5RDKEmk+Ynor46UfKkPtmWfczN23l
        gk4sbTZjbMNdnUbai3MJN5I=
X-Google-Smtp-Source: ABdhPJyw2VM2tsSURj3/dtDnvRn1uWyrNMElohylC0CqsZ9EAIEJdjtJUSQzaseLyEAlhGiCGsP1fQ==
X-Received: by 2002:adf:dec9:: with SMTP id i9mr18310621wrn.18.1636720550013;
        Fri, 12 Nov 2021 04:35:50 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z6sm7183458wmp.1.2021.11.12.04.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:35:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] arm64: tegra: Add NVIDIA Jetson AGX Orin support
Date:   Fri, 12 Nov 2021 13:35:31 +0100
Message-Id: <20211112123542.3680629-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

This set of patches adds support for the new NVIDIA Jetson AGX Orin
module and the corresponding developer kit. It builds on the existing
Tegra234 support introduced a while ago for the simulation VDK platform
and updates a couple of details and adds a few more things that have
changed since then.

Most of this work was done by Mikko Perttunen.

Thierry

Mikko Perttunen (7):
  dt-bindings: Update headers for Tegra234
  misc: sram: Add compatible string for Tegra234 SYSRAM
  arm64: tegra: Add clock for Tegra234 RTC
  arm64: tegra: Update Tegra234 BPMP channel addresses
  arm64: tegra: Fill in properties for Tegra234 eMMC
  arm64: tegra: Add Tegra234 TCU device
  arm64: tegra: Add NVIDIA Jetson AGX Orin Developer Kit support

Thierry Reding (4):
  dt-bindings: tegra: Describe recent developer kits consistently
  dt-bindings: tegra: Document Jetson AGX Orin (and devkit)
  dt-bindings: sram: Document NVIDIA Tegra SYSRAM
  arm64: tegra: Fixup SYSRAM references

 .../devicetree/bindings/arm/tegra.yaml        | 29 ++++++++----
 .../devicetree/bindings/sram/sram.yaml        |  3 ++
 arch/arm64/boot/dts/nvidia/Makefile           |  1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 25 +++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 24 ++++++++++
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  5 +++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 45 ++++++++++++++-----
 drivers/misc/sram.c                           |  1 +
 include/dt-bindings/clock/tegra234-clock.h    | 17 +++++--
 include/dt-bindings/reset/tegra234-reset.h    | 12 ++++-
 12 files changed, 139 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi

-- 
2.33.1

