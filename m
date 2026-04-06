Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75431D372
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464462; cv=none; b=RVt/cKkMeAE/PplrpXeXW36JXd+N//SNq7oPc1y9tLzljOZnalZfSZg1JG6pTBj8qCRyzFzeUjJQRm+q1zUAQ5OwEmc3+zzs3dAZIUmP+0LE9v2GA/zG/tf9CczyrYl/jpdDp48ij6HNKLKg+pGsTJOXwSMxt7UuxEjxNeThVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464462; c=relaxed/simple;
	bh=6aWC3dFXQ4/33G52UZnUQtWD/ZRkfe9fBbp8bFxNryw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvsx8Wo9HEhxdVQx/r+Xib+3VJcycgcDBnPunNmjDYCuXQHk1WTZgStx4aaIqG9laUtxyb9SBQjsDDhm43QE394eqqHV1iEfBUfz6G4DxdF+ZtEgJV9VDZdxlkvkN61pNNjiWocu+pPL244X0MjRC65GHRq+B5npidkGX97HR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9ZESV8r; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9ZESV8r"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso27816155e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464459; x=1776069259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=S9ZESV8rU6sgU9+zc2m0vp4VL4aLWb+KF55TkyaRZR+3K9w+VpXef5+bds258efES/
         AsBHletqoAKdSj04Zq5FrPrHS6gm5UsPFNH7Eud3qsRuxSnyKWLoz1LVxyZqB8O1mBC9
         hFtfnTYJGy9m/ZKQDBBWzZhbZEkf73wEiy7qfAfhEGgephgjIaUgy3lauR775UO2CWgd
         3AUJ9qUF6P1gEOl8rCrlb221tm3pM8B+5OkJ5kvyw9JjR7A1wWhDe4+e31F1czYUVszE
         kkeuUmG92pEcoZHEyWe5GwcpYVsB/vHk1xoeuatVZ8Ow/bNB3sCuiu0ylMcIhWWLnkte
         LSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464459; x=1776069259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=IgvXK/Ejb1P5G4cEYAH6DhQ4km+d9Pr7SeMZNC9okEi6bw4tr46kbQdOJmPfcV6Cxb
         NsXkUJZguXaQg2AuPfjFeKkNEmto5DXt41gH8yj7LTHNVpAu9W9cCTxz1BHf6f9VprBS
         24HOObDAv0GGisr9H1G/mIDjJoQuwMGrQ+ubzb8pNq4YaipdGULChLRPkLBm3OTUN3NN
         J5QrpS+JsARIlWePaIQwMPpSbuyXAC5Ek1AeSclwr35EqqnDpdqYDOOSSBStxyRwjlBl
         PopEN0TrIbFo/eX3uKerqZ+D++tL/vOLmEv1SY1ogkcOK5q7xKA72EM5l6HOfX6b5BRW
         gecA==
X-Forwarded-Encrypted: i=1; AJvYcCUyHU/88LuRDQcTAkcXmT9jCpqt+dgk8l4X/rbge27ir+N5OZthpYxGX170mhXsvgpt6ur5p1KPB9X+hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrHmqXb6ZhivHfcNQd0Ci2hYTOSoIHlq5dJSYhjdFZikl+DIX+
	EbhysrYabZzzAEErKNJjY2S5kcfXNN6+HqUDKufSc8PzUOAEexuXFYBR
X-Gm-Gg: AeBDieuGxpw5lvCGwuyzG8eDnpFYtuGt93bzNWio3RQG9s38RsQjEjttnHpCl4z0dpF
	Jf7c+MSHWZAdm7VttNz4SniEE3CJfs8vi6p+Ji3hx5ZXgFd63heTJqjbpqqlRpl9ORAY0q6XwRK
	GVYoSMJPv8XlA6S3J9lWNihyNDHDRTsPyuzQMcbzoZm0gvXDyg0hPG7vWmbzwtd5FlM1N1lJvMx
	M1159Gn2xJNR8cchO6Hgz2zDwS1xvKV8YS04fYZKdz4dk1ybfMIInzdP/mYgZcN822qXVxa+qra
	gs08vJI7xrxRg7bgYwhhwgaRbKrNV+x1f9r9kXiST8A19IqY8s+58qAYfx8sjMOWbAJtB+XK327
	iZz983dgpyCaC9Jn/U6ozOgTRTYSkMPoDKVvPIb1xWgo859ZSFMuWGmrNRLIPFufk3Y3npxxtsf
	ghHms66qKiXF/c
X-Received: by 2002:a05:600c:3b1a:b0:486:fc5f:1ab9 with SMTP id 5b1f17b1804b1-48899775d8emr158863875e9.14.1775464458886;
        Mon, 06 Apr 2026 01:34:18 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899e7e83fsm84241315e9.24.2026.04.06.01.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 01:34:18 -0700 (PDT)
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
Subject: [PATCH v1 6/9] ARM: tegra: transformers: Add connector node for common trees
Date: Mon,  6 Apr 2026 11:34:01 +0300
Message-ID: <20260406083404.31359-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
References: <20260406083404.31359-1-clamor95@gmail.com>
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

