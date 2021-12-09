Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E760DC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242881AbhLIR3g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242895AbhLIR3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:36 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E926C0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v11so10904330wrw.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MARabD0/4tRPvJ2q3gq3hMDxVcq3lmHsCCAcfrcrGRQ=;
        b=Pgh6SkNp8ipGo+YONGbeMrBjOAG2siAvvMxl4Hv8g/SYJCGLEGTh43Cul+zvyymdYD
         TYYIFnIm6fEKQ0lRCiF7lNa3Pa4bvNXYc1frF7mToDMLcx/fg9YSXYgJMUP1d3f7B4s5
         PLylNdV+aciMIs28zNNXhnseeMNX/sSZd36vk7x40ZKmG8wQgDqIb0UElaf9sqbsIOSO
         Bvw0tz1MG6J0ZEFbWuGb5iFnBc50xuu6zSo6z/7g28tqom2AvBDkaN/qRGEkr1Af7IRx
         lP3zrgVBDSRNkcDEI+y4e/34nSYXniPf+1QchEG/gF1ExN5fOHLpsqAq4WednMHaV5AW
         CF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MARabD0/4tRPvJ2q3gq3hMDxVcq3lmHsCCAcfrcrGRQ=;
        b=qo3yGaYPWcUsK+6/9SnYc9OLR3GqvVKz6xUjn6mQTCYA0ifY79Cd2K9FlrqH5AwENt
         lrSZzqSyY1shM1eII0VMmJR9I62oUI2D2HoBDmE49bSWC3M468q0TpCWyeIA6Y5A4sd/
         Jsbhn63D9xF+YWxDcoMy7kyqpkZkKKyUQJTJMUZ85KPMTCmirn7g60FZ4mBCTHboC3PQ
         onyUPT33Y9/ZXavtJedNnCKcNuSStnANRXyDMNzcVxvQkvvXnXN3l/0ZMrqmnIM3cnCB
         8o+q1KKDwI4uGqum4rEe5QY5A4v2qTC8e9x5FmVBAXkHAzaASXNJfxvxZ8+UFN2aa79M
         Vvuw==
X-Gm-Message-State: AOAM530KR7AwbvhP+Qzc2elp6+wf9GfUQZnc1a1yc/IxLnfQkxEN9TRN
        fjSdDfSrAvGyggnOO9Dd/pU=
X-Google-Smtp-Source: ABdhPJytmdKZALxP3eJo+Xg//9iF9Moln4fv2YfXemfZ35DJZUpa9a4BEScMUtCRvzv36EWAbmUcPA==
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr7897594wrz.471.1639070761124;
        Thu, 09 Dec 2021 09:26:01 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l8sm11115858wmc.40.2021.12.09.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 22/30] arm64: tegra: Remove unsupported regulator properties
Date:   Thu,  9 Dec 2021 18:24:55 +0100
Message-Id: <20211209172503.617716-23-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Remove the unsupported "regulator-disable-ramp-delay" properties which
ended up in various DTS files for some reason.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  2 --
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 11 -----------
 2 files changed, 13 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 34276a84c68a..21d7e653ea5b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1588,7 +1588,6 @@ vdd_3v3_sys: regulator-vdd-3v3-sys {
 		vin-supply = <&vdd_sys_mux>;
 
 		regulator-enable-ramp-delay = <160>;
-		regulator-disable-ramp-delay = <10000>;
 	};
 
 	vdd_5v0_io: regulator-vdd-5v0-io {
@@ -1610,7 +1609,6 @@ vdd_3v3_sd: regulator-vdd-3v3-sd {
 		vin-supply = <&vdd_3v3_sys>;
 
 		regulator-enable-ramp-delay = <472>;
-		regulator-disable-ramp-delay = <4880>;
 	};
 
 	vdd_dsi_csi: regulator-vdd-dsi-csi {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9fc4a8f46250..542f51c07781 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -266,7 +266,6 @@ vdd_soc: sd0 {
 					regulator-min-microvolt = <1000000>;
 					regulator-max-microvolt = <1170000>;
 					regulator-enable-ramp-delay = <146>;
-					regulator-disable-ramp-delay = <4080>;
 					regulator-ramp-delay = <27500>;
 					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
@@ -282,7 +281,6 @@ vdd_ddr: sd1 {
 					regulator-min-microvolt = <1150000>;
 					regulator-max-microvolt = <1150000>;
 					regulator-enable-ramp-delay = <176>;
-					regulator-disable-ramp-delay = <145800>;
 					regulator-ramp-delay = <27500>;
 					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
@@ -298,7 +296,6 @@ vdd_pre: sd2 {
 					regulator-min-microvolt = <1350000>;
 					regulator-max-microvolt = <1350000>;
 					regulator-enable-ramp-delay = <176>;
-					regulator-disable-ramp-delay = <32000>;
 					regulator-ramp-delay = <27500>;
 					regulator-ramp-delay-scale = <350>;
 					regulator-always-on;
@@ -314,7 +311,6 @@ vdd_1v8: sd3 {
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
 					regulator-enable-ramp-delay = <242>;
-					regulator-disable-ramp-delay = <118000>;
 					regulator-ramp-delay = <27500>;
 					regulator-ramp-delay-scale = <360>;
 					regulator-always-on;
@@ -330,7 +326,6 @@ vdd_sys_1v2: ldo0 {
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
 					regulator-enable-ramp-delay = <26>;
-					regulator-disable-ramp-delay = <626>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 					regulator-always-on;
@@ -346,7 +341,6 @@ vdd_pex_1v05: ldo1 {
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
-					regulator-disable-ramp-delay = <650>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 
@@ -360,7 +354,6 @@ vddio_sdmmc: ldo2 {
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-enable-ramp-delay = <62>;
-					regulator-disable-ramp-delay = <650>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 
@@ -378,7 +371,6 @@ vdd_rtc: ldo4 {
 					regulator-min-microvolt = <850000>;
 					regulator-max-microvolt = <1100000>;
 					regulator-enable-ramp-delay = <22>;
-					regulator-disable-ramp-delay = <610>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 					regulator-disable-active-discharge;
@@ -403,7 +395,6 @@ avdd_1v05_pll: ldo7 {
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <24>;
-					regulator-disable-ramp-delay = <2768>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 
@@ -417,7 +408,6 @@ avdd_1v05: ldo8 {
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
-					regulator-disable-ramp-delay = <1160>;
 					regulator-ramp-delay = <100000>;
 					regulator-ramp-delay-scale = <200>;
 
@@ -1779,7 +1769,6 @@ vdd_3v3_sys: regulator-vdd-3v3-sys {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-enable-ramp-delay = <240>;
-		regulator-disable-ramp-delay = <11340>;
 		regulator-always-on;
 		regulator-boot-on;
 
-- 
2.34.1

