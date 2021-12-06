Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44177C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Dec 2021 16:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbhLFQX4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Dec 2021 11:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhLFQXz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Dec 2021 11:23:55 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5F8C061746;
        Mon,  6 Dec 2021 08:20:26 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a18so23604717wrn.6;
        Mon, 06 Dec 2021 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xwncQQAac6IfDJk1knX+2h2Wrx6j09m/Y6dZDfB39j0=;
        b=U1dFjm3cmW1oc7DYs0aB27zpHJfgzjIMYnW486BWozrHhxQLOflEaAgPwspSuDcba3
         JaD66hjFG23XzSTrH4KKak+xNwNbTr3zzy6rVptgYYE/Qq63L+bHIv9k2boDwA69EOM8
         VhDJm2pVShdGAKckFIBL8EJqAJ9/BYP71UsCuD6s5SKpoJrIOWm4zBbze5Aq4YSR7b0Z
         RV+EIfmGdi/grbE0s3FxV4mv4edJ7Ujj+kKZOJ9yETgESrFPo+QaoZ+EsCQR+5EuT0Qu
         I12wRK+xu5eIPNtL6Cyh6GL4nTHfvGFwbL6eLB+e3QN3LHETB6N77L+/WsZ3X2bqpDi3
         gpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xwncQQAac6IfDJk1knX+2h2Wrx6j09m/Y6dZDfB39j0=;
        b=ca9L0U4PGPz4RWBC5AqQge3V+Zdb5sjt1OVPtnmDr253yV9Zec3aAMDKLCDk1L4j3F
         Xkb5Y9RaRkhoHqROeyflDZafabPcvVbH6ZQ+G+q92QRkX47NXgFzt+TTTKtaQ54DF2jF
         nvHzq+FmWX32MBBT/zGdMFhQNRqlY5VBeahALo4EdSr9+Kq2G3Sxhyt8WvC+bqNPcBG7
         Gm7hl4Eh83pRJ8E4mNiIaNY/vVZwuw4xl3DmY18oRZK638aESXnK6TF8WFkXkw8Ps6Gi
         Hj1uIouCt3sIP3ZwZzo72YnEOVuHEW+8CXKS6i5zbjLduJCV+XAE9NvQmrdR3gHOWtnX
         eHBw==
X-Gm-Message-State: AOAM530jj0okH9oOgFnlvdvzDSzHkpyjR/moaY5MSKS/rOgLRDNDSgde
        YZK3+rd6NLkuGt5tmtKy3Vs=
X-Google-Smtp-Source: ABdhPJxldM606J8pwZmiVPnvbkTugm17CBNawuBNgy9kM78aJUOdhEc1fv/uBvumcgErYxLt2jR/Hg==
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr45528736wri.285.1638807625386;
        Mon, 06 Dec 2021 08:20:25 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id n32sm11045750wms.42.2021.12.06.08.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 08:20:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: tegra: Rename SPI flash chip nodes
Date:   Mon,  6 Dec 2021 17:20:24 +0100
Message-Id: <20211206162024.243641-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

SPI flash chip nodes should be named "flash" instead of "spi-flash".

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 3 ++-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts    | 3 ++-
 arch/arm/boot/dts/tegra20-trimslice.dts   | 3 ++-
 arch/arm/boot/dts/tegra30-beaver.dts      | 3 ++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 82caefe5928c..e64199ba82cb 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1084,7 +1084,8 @@ pin_gpio6 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 35ab296408e1..b2b3eea81232 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1655,7 +1655,8 @@ spi@7000d400 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index e6b54ac1ebd1..02cf986c7567 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -881,7 +881,8 @@ battery: sbs-battery@b {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q32dw", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 4bc87bc0c2a4..beae368f827a 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -287,7 +287,8 @@ dvi_ddc: i2c@7000c000 {
 	spi@7000c380 {
 		status = "okay";
 		spi-max-frequency = <48000000>;
-		spi-flash@0 {
+
+		flash@0 {
 			compatible = "winbond,w25q80bl", "jedec,spi-nor";
 			reg = <0>;
 			spi-max-frequency = <48000000>;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e159feeedef7..f724abcdb1a5 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1898,7 +1898,8 @@ core_vdd_reg: tps62361@60 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@1 {
+
+		flash@1 {
 			compatible = "winbond,w25q32", "jedec,spi-nor";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 448f1397e64a..e7bfe0e5ee06 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -374,7 +374,8 @@ vdd_core: tps62361@60 {
 	spi@7000da00 {
 		status = "okay";
 		spi-max-frequency = <25000000>;
-		spi-flash@1 {
+
+		flash@1 {
 			compatible = "winbond,w25q32", "jedec,spi-nor";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
-- 
2.33.1

