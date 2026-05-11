Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F63AB281
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485785; cv=none; b=YTTQzkPnqgoqJao1AVDRIQ2Y5d0Ki68EaTH0a7BtN8ONOr4+DbPUr+DluUytkCkdHa+px5JdPy2NYQkRYpydneTj0tjRzAuLoF0tfTPWKhqWSrskXQknwk+dS4SwCmJTTqvg2e/sBi+cbXvQ4AVXkGFiIp0YrjNSbh3F57X83Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485785; c=relaxed/simple;
	bh=3yrZD3kUqUFtnfW7CJEM53Vi/Lg2JOO94rBYam+onYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeCKJ825v0yerXHCqdimRbO5/nTpJ4tLphaiYqbo3S9KAs1YU6bpBQg8Bl7iQPYKq/b8B38z8AL2Lb7R0iSrxBxnhgIgg4rVlPurmcIX4fzzGLMaxnFQRixgLJ/KaFFDocvwCrECKrRotu7p3RukmyhYbYLJ9Qq1RtDzsaZaN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk9C6gRi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk9C6gRi"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3560155e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485766; x=1779090566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=Fk9C6gRiEpQ8S9/nj/p/tziV1YIYn9HeN1oID9+99fczrmCBvqq1WT2bLt1mlKIihZ
         5obica/cztPXv9oAYTZlHTdep7sfM0lnjbD1BtjxazPDWR5Cm3E0hqaiJuXr3AInk28x
         x0d5jINUk7hwDy2DgXD0eIu9UI/NWkvGT4qm/YT57mk/mLJXpWO99AVVaejwXmAAwi83
         DGjQrWg3zkGnD3sKOc8EOjYWxTrurRhD2hjpNAQz+GrtJk0eD6ygy1bgZazJzFxUGUNQ
         3rYpsHu474t5I+BIU/Hxzj+AjxH1pulmDWuKgNA41Cq+MEhYxkdPHR00NjceDq745mPG
         u71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485766; x=1779090566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ZzhB7vHBcFUBfR2BiDFSMeGlYuUMXHq/TSRPK44UZY=;
        b=DRfGDCI4BoHJDOH41V54j6LckO2tG6UarcuVSrA8Y6he+pDVksr2EavG1XZ02sNO6x
         KimDeqOgpCYRZnOoiaXB6XF3uUOI+tlxHLr8lt111rdfUnWhhlG0X6quzNV08EmPbnPc
         j4lyOMyZZFqy/ptVVQKLWu1MaOtD0YtaXhSWghSzYY+XStD1cOnJm2qx4g1WmiDMUsv1
         ve8HKcg3t5Y8VSeDOJP9N6jHdYx+WyEyUHnGn60/LqBsDRXSlS4ajFwj3cICyWRdRumB
         Lr1TUnlyflaT2ep6LY0gpaQFoCROvsceekTzGf/e5oDCw4M/+N00YHLBSp11OhWGErYS
         VMyQ==
X-Forwarded-Encrypted: i=1; AFNElJ99qChVFtEIiVojyBaKU+IVV4NhRM6d2YvFGazukOz910FLjnznj37+d2s2EihQkCL+0jST3bgaJ99Hag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRgWnZf6nvPs0RAbNDPP2wzJTSBb0f1dT+ykOTIqHcI/hZ31K
	hidAny2sgp6US/mNXimoJOv6wz89weGcST0wrwGybMTPENcPSDSeIHio
X-Gm-Gg: Acq92OH/19cyjGPtOrugtxDprm5IOCt57NWNwehDLxdIXsLorY33gzAIfCbPfK57c61
	2IaT4WGjzww/XFuVRbE2yvhYl/uMV6+6ovmYTLnP7+MMweQ150c9jsTPrMPPC52HwXfsa5vAhwB
	2t4Fd22IDeFHtV/5yHIUevXo9XKUEH2UpcM7lw5HWyni7EwMi+IGJpqQQnDmSaWqNTMPMtq/k3u
	NCHLLEFre/1LEeQs4pYubiuu5VaYtqhh0IRnDSJQRrbU7Z9ReB5vzxSizig29tcsmDkrXSxkBhN
	Cp3gsMVBr/DAw1V9DzSic1QWhhrxzD9elSyRwqtqnzMY2I6A09THkDzTUH7P2x8+SN8VbIPOc+u
	fctRNzgmDgfGpAWwcpWNzKvZfr7pHj+cLBcuuxXhCdpimUSMIRymO1SnUn00pW7x+ef+PpyKDtu
	qMcDQJbekkgScH
X-Received: by 2002:a05:6512:2252:b0:5a4:b2d:25c0 with SMTP id 2adb3069b0e04-5a8a949f103mr4343741e87.3.1778485765742;
        Mon, 11 May 2026 00:49:25 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/9 RESEND] ARM: tegra: tf600t: Configure panel
Date: Mon, 11 May 2026 10:48:57 +0300
Message-ID: <20260511074859.24930-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure DSI panel used in ASUS VivoTab TF600T.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 62 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 9296e7970ce4..8b68bfef8dee 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -23,6 +23,7 @@ aliases {
 		rtc0 = &pmic;
 		rtc1 = "/rtc@7000e000";
 
+		display0 = &lcd;
 		display1 = &hdmi;
 
 		serial1 = &uartc; /* Bluetooth */
@@ -55,6 +56,37 @@ linux,cma@80000000 {
 	};
 
 	host1x@50000000 {
+		vi@54080000 {
+			status = "okay";
+
+			csi@800 {
+				status = "okay";
+
+				avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					vi_ppa_input: endpoint {
+						/* Link to the rear camera */
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					vi_ppb_input: endpoint {
+						/* Link to the front camera */
+					};
+				};
+			};
+		};
+
 		hdmi: hdmi@54280000 {
 			status = "okay";
 
@@ -68,6 +100,22 @@ hdmi_out: endpoint {
 				};
 			};
 		};
+
+		lcd: dsi@54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&avdd_dsi_csi>;
+
+			panel@0 {
+				compatible = "hydis,hv101hd1";
+				reg = <0>;
+
+				vdd-supply = <&vdd_panel>;
+				vio-supply = <&vio_panel>;
+
+				backlight = <&backlight>;
+			};
+		};
 	};
 
 	vde@6001a000 {
@@ -1123,11 +1171,10 @@ pmic-sleep-hog {
 			};
 
 			regulators {
-				vdd_lcd: vdd1 {
+				vio_panel: vdd1 {
 					regulator-name = "vddio_ddr_1v2";
 					regulator-min-microvolt = <1200000>;
 					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
 					regulator-boot-on;
 					ti,regulator-ext-sleep-control = <8>;
 				};
@@ -2386,6 +2433,17 @@ vdd_5v0_bl: regulator-bl {
 		vin-supply = <&vdd_5v0_bat>;
 	};
 
+	vdd_panel: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_3v3_sys>;
+	};
+
 	hdmi_5v0_sys: regulator-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "hdmi_5v0_sys";
-- 
2.51.0

