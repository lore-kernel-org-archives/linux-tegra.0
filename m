Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39792C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Dec 2021 10:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhLTKtG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Dec 2021 05:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhLTKtG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Dec 2021 05:49:06 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2965FC061574
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 02:49:06 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q16so19156647wrg.7
        for <linux-tegra@vger.kernel.org>; Mon, 20 Dec 2021 02:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrFL+333nutm+Hk0ekrxwdiYsKgWdK607ZfAuwXbC20=;
        b=T7I3MoFImxEfb2R1yvjGm629QFBhXTIbLj5TKWBHvBHRVeOkJ9cX2VoDfgSOpAGfg4
         r5f+XusVW6sFrPPmKl6OtDKgMDWUot3HhheJJZUeAQWrDHVtFCy1LJTE0ydKsaGwy3xA
         AKMOgmn15LQ35KSamW+j84sa+QRXMHe3EC1T3fa3WdmbellxHdRx/JMjINwxz0Kbmi18
         wn6aPlGnVOT05Eu14zlmC8IBNwLU5vaVWZ+6D72dyI+QiG64Q+nQNd/VvO0yieKKH5l1
         FjObcdanpreB9OnfuijM8Z9P2jaBk5DTpwXnQixaFPpX+7MvzNz0qkcSZZ4Tv/bR80C0
         dbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrFL+333nutm+Hk0ekrxwdiYsKgWdK607ZfAuwXbC20=;
        b=ghs3T4tbXcSbDPOgBJCBewjAL+brXSXHCtU5lW/Aow0dAPNOqFZpDlFPzUQVNYCA8z
         OloaYchCFynr18TIcHdGtc5IK0uiq5eS+Qt8WXZYh73/I6zrB1viiHM3YkA4dQP+WOIO
         /P8MwiCYPdxXXVWxtaSQDlkmxz38XLPxiJHvr3/UXsOM1wjMByBxhAZDYmGFuHsS388D
         G3nOkzvGxceykCTFTfLOLHKHXGFxN1ka+huUSaPLXJuTZTwgy8jfYFrkN5KBwBoZRcJj
         /eXTsk4Wz2R59MQuKw5g+67dk5nSjSR5SQg6/JZe5B6jtS02VgjqqnEqg2b1jSwySsyn
         kBgQ==
X-Gm-Message-State: AOAM533VvxOlOupRymaVmDnFWzsN7M9vwSqwmpNRdLe5pA+fvfx5VThz
        S9oPsYR9uvi0tpDpOhm3y1c=
X-Google-Smtp-Source: ABdhPJwm5fpVKZp2T9VwXhSqDzKTLAGT0rtcfVRzy+CgaArOgHBbpKMHLhpwsY/JKyEc/VoqaV9fnQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr277449wrz.350.1639997344760;
        Mon, 20 Dec 2021 02:49:04 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 138sm18125767wma.17.2021.12.20.02.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 02:49:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
Date:   Mon, 20 Dec 2021 11:48:55 +0100
Message-Id: <20211220104855.428290-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move the eDP panel on Venice 2 and Nyan boards into the corresponding
AUX bus device tree node. This allows us to avoid a nasty circular
dependency that would otherwise be created between the DPAUX and panel
nodes via the DDC/I2C phandle.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
 arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 1d2aac2cb6d0..fdc1d64dfff9 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -13,12 +13,15 @@ / {
 		     "google,nyan-big-rev1", "google,nyan-big-rev0",
 		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
 
-	panel: panel {
-		compatible = "auo,b133xtn01";
-
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
+	host1x@50000000 {
+		dpaux@545c0000 {
+			aux-bus {
+				panel: panel {
+					compatible = "auo,b133xtn01";
+					backlight = <&backlight>;
+				};
+			};
+		};
 	};
 
 	mmc@700b0400 { /* SD Card on this bus */
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index 677babde6460..abdf4456826f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -15,12 +15,15 @@ / {
 		     "google,nyan-blaze-rev0", "google,nyan-blaze",
 		     "google,nyan", "nvidia,tegra124";
 
-	panel: panel {
-		compatible = "samsung,ltn140at29-301";
-
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
+	host1x@50000000 {
+		dpaux@545c0000 {
+			aux-bus {
+				panel: panel {
+					compatible = "samsung,ltn140at29-301";
+					backlight = <&backlight>;
+				};
+			};
+		};
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 232c90604df9..6a9592ceb5f2 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -48,6 +48,13 @@ sor@54540000 {
 		dpaux@545c0000 {
 			vdd-supply = <&vdd_3v3_panel>;
 			status = "okay";
+
+			aux-bus {
+				panel: panel {
+					compatible = "lg,lp129qe";
+					backlight = <&backlight>;
+				};
+			};
 		};
 	};
 
@@ -1080,13 +1087,6 @@ power {
 		};
 	};
 
-	panel: panel {
-		compatible = "lg,lp129qe";
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
-	};
-
 	vdd_mux: regulator-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
-- 
2.34.1

