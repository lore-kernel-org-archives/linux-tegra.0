Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378490;
	b=nPQtXnHfVS5z9joJdF2J1IabyAbaAMKShwKjnw8eLUgLyNA6HIP4/olAbWSC5u42C2Fv
	 rzThrImlrZQrBHUnxrK7k3xvLr9KQyyJho1Y1P7q/8S6+jG9CMHVx3bszcB24G9tpNokM
	 1PyBKS6wbCQ8osoEDySvrSL8l2r9f5xpQkJHL9e1ovUo7JnvPStGjO1YlpEePUYhmN2sN
	 4xiAL1Rw4fxtuRZZy1agmLJ9mOMTaJ+VPTKyVOXqtOAcmbZbshzBu/Js91wQ0/MgbZUsj
	 d28MPyZH93PcBBWzderce5zBw8rrKicRzp737HUEV5hQUio3bP9oHlkOfIfIVKzKKYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
	b=OzeQ+yUp+5QLzYXOGjq8VmEzniZcEYJqNvAANaJMJFaof/dJUuthzO8DrU7AiQu6mI67
	 LO5iz1HXmSVIY/A77TnAjADOkQZl6XXg2d77ktkfiNw4i0vybLNyaaowZs4ZKuqceZwXD
	 pJgxxHk7YVz41LhL/JGuTbatL2XOkqvpvILsitxDRKZr5IbPB4YdXWVvXT/HQAyrXRIQ1
	 9dC1dOvSYrwr+RRMbcaR/LPSJfSXGm0TVDoaDQFdKtbgzW2qCYLnVACJD8YUPsuyXfCip
	 0O25GMENbsRmdo4b6WBcuBa/RA03X47RokVU9iG355+7m1grJ6KbsbpCGkw8aXYOEog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D1606A333
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147D1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDqZuRao
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so3186080a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378488; x=1795983288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=TDqZuRaoquGiGZvATVP8pSlepL2t8A0gvwLUfyOmbcP10HP7Qhn1od0ZyvZde3LLJ8
         qEnIiKoKBRd3YFaXpALugXXywd+cit4w2y1wnsJ6FC9JtBKTCoEjFOImrmIJS7RnqYyL
         hctyJ3WTseAMn/0RbdoYzLF3GIHyYT/y5pgpdZv7SL8iVEFyy9M8p2wp8KAc/vanlhBy
         5um1WX0Ojr46IqnNW+3utS/Nf+h4fwGq90VhprWiOg0S9fDa8xIqtVkHKRT45HCbD1R4
         35XII89NyqHbAm1zaj04Ll3qxe822TvzczULj59a7Ku0RbsTULMJc6RvicEBa/ka658Z
         rKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378488; x=1795983288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92wTwsZt+a+f9W/sasx/pGyJEXje2AlPj8V3sVGhxus=;
        b=1z1GbY3mCw8IJGKuN7tDEEi8SXv8bvnUD+MrPBZ9WgF3ef181ZoPjEIbhMzAVkzRl9
         //9OxhJgfIUMv0KUaqGROvDfim6e2Z06pawY/bywsyZl27p1aBWPMgv8TRhgy4sny4hG
         qdWv4CDvYLO1pdK+VafcOUzJuyzXz7i4ya0PMQ8hyZy5cImUKF1EgxbFSLsQ7zOtCJZA
         I4ePdpzOPYlQLexCxQT9NEtyEfrmt6bmH6IMfkbUkl7vqnL3GcY3c7zPl5+gMTqIH4tG
         S/DVeN4i9Je8ZQZX+ygGwXiQuErbYQs6Aef8cmYZ4EdrBL8W9BhiJ7VGpU0kmlXldL+k
         WRHw==
X-Forwarded-Encrypted: i=1; AL+hErEj5M9VcpEj69LElVzQMJUd7U5Ocxzb5XmlB3JtBKc+uAAw3Bs0YkJe8K8O73ZuyKyt04/Xtee4WmZvdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8z4cjgyAG9wyTtIoXGCVRNum2yznDQ0S3+08xvMCOFIxNnYcBB
	QvxhKVyzK/A6iRuwbfynmZau//BsqWnrFL7PL683AVJoZq47s4xgK/3o
X-Gm-Gg: AZFdTZfQOsJuTFIX5izC8VwTywvOSGUtPDNuOa8+lu80Lp8NUnvPBfQBh9MK+DBaMAh
	iRKjQc2zGlzDERriSaBzdJV+ERBtDrfc4iP9dq4ScdqYsKJeAW1Ze39mhQ/LK3a7NiW5Sal/dso
	8YVw/rHUUDFukejSvE7m+GdyCap6dbq2fhpct4f518gJuynNDphK1MHw+Q4z+f8oRo8vqce9+Yj
	1DoeuAU5Cz1Y3mRnFL3mqXzZ6cAbFG41+DuzThC/++FK/Q/Wp2p6c9VQGFEOdcgVfQNklriau/A
	WMlz3rAjmNuxSIPT9DujbPof579kcjRPtzykPRtiTy1XFZWV2W+oyiJEJeJZclTL8lukq38s414
	+vVtMS+gSJ2PwFfpWrf4MPtUpzPI5ermi5nxVJH+9rOmFxGgen5hdEwxL7Uq2DMbPM+X6bCPxza
	JVkIod4XeHm/AB1JlgEKmBGagkSy8IWG3yNeHYyKCFmZJnPxxKIL86jLdlVKTJnntYT7P+lzdJD
	eLyrz0QFLA6/jN+gutCTuTNuIzEGYNN5ztd1of1BtScssdG/SpUyur649+DAgKarBt6W3osmsKE
	ZADOnVPZ4dLZ/CU1MW6K/j/O0T86Lc/o4siIjBJCgFuu49xVBjbPkKHvIgDLXin/8NswKLpob/U
	rAlohMu5JIGbzMIZ4zsvJCsOlVhQkvqE=
X-Received: by 2002:aa7:d794:0:b0:6ac:bd53:d29a with SMTP id 4fb4d7f45d1cf-6ba37c7a764mr4696990a12.3.1795378488047;
        Sun, 22 Nov 2026 12:14:48 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/18] ARM: tegra: tegratab: Configure HDMI
Date: Sun, 22 Nov 2026 22:13:59 +0200
Message-ID: <20261122201407.23742-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nodes required for HDMI support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cbf9b45284033..911e5e9d8a0db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -37,6 +37,20 @@ memory@80000000 {
 	};
 
 	host1x@50000000 {
+		hdmi@54280000 {
+			status = "okay";
+
+			hdmi-supply = <&vdd_5v0_hdmi>;
+			pll-supply = <&avdd_hdmi_pll>;
+			vdd-supply = <&avdd_hdmi>;
+
+			port@0 {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+
 		dsi@54300000 {
 			status = "okay";
 
@@ -1031,6 +1045,11 @@ power-sensor@44 {
 		};
 	};
 
+	hdmi_ddc: i2c@7000c700 {
+		status = "okay";
+		clock-frequency = <100000>;
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
@@ -1323,6 +1342,10 @@ i2c-thermtrip {
 		};
 	};
 
+	hda@70030000 {
+		status = "okay";
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
@@ -1452,6 +1475,20 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
+	connector-hdmi {
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
 	connector-usb {
 		compatible = "usb-b-connector";
 		type = "micro";
-- 
2.53.0

