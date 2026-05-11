Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD49230264
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485783; cv=none; b=Rg8yyhqkfMR+Q1OBJcvMhaA4MVJ9byIPXTMq9ZwPMs8SFud6cmP7/Va56UhnHsKTxTxGSovSHve+qaoFaC2HHVpWxVn3E6Ir6qwm9bQH1PQJVc0ieHVYo73ubUeTWyE1O8wopU+YLqge0XypXYtSt7W3mbROCtiBrJVXn7mK4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485783; c=relaxed/simple;
	bh=6aWC3dFXQ4/33G52UZnUQtWD/ZRkfe9fBbp8bFxNryw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8EDZIlzZfMXuh9jj++UwzGuYb6bDdHvjwI8teJcisyJqfwZiTyyZhp0EZyNBMR+13lBYpG+xyL2t43X+dmY9U5+rj2qzmmzM/MD3mx86a+ZmnW1KvJyPBmA0JjtpVXafMzhpty4t381Zj/Tz8X9qE4cV3Z7nk2hTq4cienadVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtonUzBE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtonUzBE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a746f9c092so6356952e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485765; x=1779090565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=QtonUzBELFdH7FEphXJz+8UhfIYN9BdBPFh2uvtUewzDQUnVtYxV5QymNM4fVmvIy7
         9Gy3/4FVBuz7tLQgaDtUepEODJXnjRgmLNOZLFzUIJXt9bNSfl9oFw9uCZKHUYw+/FKA
         LxNVKmgj4AAsSLSTmM/wq3im5zlAo2/rtgrlBTWg411Iwog4ncIDmKajphzSfo+m4IaA
         36S1nwsztSHyJW8FR3iVYoAsfiIivkOo1ZIRCXK2yuuYdc9BPFVpYHw3Ff31H6NLYkFv
         tDznE59T9A+XW+uoUs92dajrMOlIS6U+626Au8tggQvUWXKMFzYXOYk013T7YOHUrjRz
         EfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485765; x=1779090565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=B8K73dO8iJ1hPBj/mA60K1F6pRGe9REhYMb05YtXb3kYoe4wfMA3hKJmSGs+my14J3
         vNjkGHelUHOsHwFFbMIw4jZH32A7VVpdQ/GYDFAl6N0UMS0UZo3ElY9S2nH+ZqMOsUKl
         15a6go4EMzjEOjW3lCOOM7pEWxVZ4Xq5EWVgpqmCgihmWCRiWxAiLdeSYFS84gU8gR0v
         iscYtXk5vC8HEVaNlOhKkhvHHTNIjW4DR8ZAcX4/bL7pWEIRnmDH+JcvOFRcMv+s5Zie
         1RYbA99xhJnXTWl4AipFIinmHHEu0c8t4M8LItTrm5piDQfL3Oi2GfNcAZyL98iEABnX
         myGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p6J0nmUmJHyJU2yd+BIgFAiNsXd/v138O7pTqkENutR41YkgGB+0BcLYD9Z1Wn5isMg05YnGSRsXOoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpILYCgI3CxtAw25GHyt/WHjvNjU/7rlvqvxV+tHZC4T9Nzcb
	pDdVhtRKRUDdcP12hL0YtaSjhubOX9fAamIuHssY3GzbA3bY4FBVaDMZ
X-Gm-Gg: Acq92OHVpbHtpL78XxIxQy75+9JfwuVn70f60v+uKI1BeLrTEYCd6svRWvB8vWJczmX
	IFyMFV2krK5GBOP8z4kv31q03St0tXzXgjau2o+P3pWt/8ZSGrlX8ZPiRonV6DNLq9p3GO41KjY
	oKF8IGSd3wHnKmOm3MpyUJqTsQS2fSq4d8oW5sTh4r4D1zYivtZfPILh1iPzNxuDX81C3EgGKuw
	fsvJ9aPX4ekmYVJS9jhyLHxxLexaI/sT74/KEJPBUf8bL+rDamPJiiLIZQvOmku5AOKJl9g//Y0
	Mq96tjq5CRgH/ASQhgSS3jBgHx3tNc9DkRkMoCcndi9uVu9dzTGUPnSAGIDSQiAMKzGFM0tFAD3
	FAsmSSYR/F/lx8Gw54yrWUNSfqRYjDc02oAT2eIwxwdnfuFrzcHsBUyZaIe8lCfX3FzwdTcmQXP
	lxvyTtxNZlc2Ox
X-Received: by 2002:a05:6512:3ca2:b0:5a8:7007:8346 with SMTP id 2adb3069b0e04-5a899bca566mr4378323e87.23.1778485764582;
        Mon, 11 May 2026 00:49:24 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:24 -0700 (PDT)
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
Subject: [PATCH v1 6/9 RESEND] ARM: tegra: transformers: Add connector node for common trees
Date: Mon, 11 May 2026 10:48:56 +0300
Message-ID: <20260511074859.24930-7-clamor95@gmail.com>
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

All ASUS Transformers have micro-HDMI connector directly available. After
Tegra HDMI got bridge/connector support, we should use connector framework
for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra20-asus-transformer-common.dtsi      | 22 ++++++++++++++++---
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
index 73c7ee378865..fe05cfd2312f 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
@@ -79,9 +79,11 @@ hdmi@54280000 {
 			pll-supply = <&hdmi_pll_reg>;
 			hdmi-supply = <&vdd_hdmi_en>;
 
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1029,6 +1031,20 @@ key-volume-up {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	i2cmux {
 		compatible = "i2c-mux-pinctrl";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index d4a7bae51830..76db928b53bc 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -166,8 +166,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1701,6 +1704,20 @@ key-volume-up {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	vdd_5v0_bat: regulator-bat {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ac_bat";
-- 
2.51.0

