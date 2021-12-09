Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2B9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243093AbhLIRiW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:22 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5291C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q3so10980448wru.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8fOrwnFEnOSSa0e48xbtFqcYxbCDOa4pBShfmyc18sA=;
        b=YwZzEJ7apZUBGv7iAEFnTn92/nM69G+4vkhiF5duvfIN7f7FarCyxXfg9tmxg60pWR
         JxMbyd4qO26fLWzbHLuQywlTW6ZRjY4pxSWZLKeFAAcK1a8qXCMslHE3xD8wdbkM8nCT
         ONV7eDIOL13YoSpskl9f/j16OxFS1NX0GaoX2MBus9NVIGTIdP5yDL2DFk/lcmBbgNet
         zigYgr4W7yp7TgOgou6FTacxFf8cwQzZnTdLur6GtohcbGxaN7ojqdy95ZRvhl7sbH76
         YB0ie4ZnxgmL5BZbQs4pPYcpIdRqu2xZ8e0FTbyuL8nh1eSyZ4eenQPIqKMgLt4AvoQ0
         pUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8fOrwnFEnOSSa0e48xbtFqcYxbCDOa4pBShfmyc18sA=;
        b=BmVVahNtFFs4TybM6K5XQKiLn6Q030euFYtvs1Wo23rybZrbNyntQHQOHJz5xogjBD
         YPmh8annj4r68HOiN2sYz0Bmw0KlXMtOWscu4/F8xhow42eChIJKLaNd1BtUWZFFt8ZH
         VLDUGoXYEMXSJkQ26DnKHEDmQYKGjjLYA0opce6aaVr6psOrl/iwVqcbi1YZgYkUJgU0
         NJxtsye8JEXbYv7AABDn10GQ7tvciKnzGdIS2olLCRFdHCuQpqWsPY/tUdHkduMqLPgH
         5IvMa0NaLjspbRU8FPHUdPS2jRpoHA/wGduZjPM4o3ND82vjSn5OjgyjZDsFKk9V3ld4
         H4UQ==
X-Gm-Message-State: AOAM531h7VXy47e5qRMyWuccad2w0FJ06koA48p4qI5hKPqOH9iHeYed
        AxDjcVTjNIi6nW9ChkF1+WM=
X-Google-Smtp-Source: ABdhPJzLdaMUeBlsnuTpBfsI4MyxBaKjEsymM7Fw5FLsrGj+SK5s0SDA+LpDgG73zIRyptog+4Gduw==
X-Received: by 2002:adf:ee42:: with SMTP id w2mr8174564wro.7.1639071287254;
        Thu, 09 Dec 2021 09:34:47 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t4sm8904455wmi.48.2021.12.09.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 18/25] ARM: tegra: Remove PHY reset GPIO references from USB controller node
Date:   Thu,  9 Dec 2021 18:33:49 +0100
Message-Id: <20211209173356.618460-19-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PHY reset GPIO references belong in the USB PHY nodes, where they
already exist. There is no need to keep them in the USB controller's
device tree node as well.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-harmony.dts   | 2 --
 arch/arm/boot/dts/tegra20-paz00.dts     | 2 --
 arch/arm/boot/dts/tegra20-seaboard.dts  | 2 --
 arch/arm/boot/dts/tegra20-trimslice.dts | 2 --
 arch/arm/boot/dts/tegra20-ventana.dts   | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index e39318f90ffc..e6f69f26b290 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -595,8 +595,6 @@ usb-phy@c5000000 {
 
 	usb@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-			GPIO_ACTIVE_LOW>;
 	};
 
 	usb-phy@c5004000 {
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index d525fb8cdacc..e4c6c1363fc5 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -533,8 +533,6 @@ usb-phy@c5000000 {
 
 	usb@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 0)
-			GPIO_ACTIVE_LOW>;
 	};
 
 	usb-phy@c5004000 {
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index d1debe54320c..3724dc9897fb 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -742,8 +742,6 @@ usb-phy@c5000000 {
 
 	usb@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-			GPIO_ACTIVE_LOW>;
 	};
 
 	usb-phy@c5004000 {
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 0bcd548023d6..090f47fe79e6 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -349,8 +349,6 @@ usb-phy@c5000000 {
 
 	usb@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 0)
-			GPIO_ACTIVE_LOW>;
 	};
 
 	usb-phy@c5004000 {
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 91060bf27499..a38d892ef210 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -556,8 +556,6 @@ usb-phy@c5000000 {
 
 	usb@c5004000 {
 		status = "okay";
-		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 1)
-			GPIO_ACTIVE_LOW>;
 	};
 
 	usb-phy@c5004000 {
-- 
2.34.1

