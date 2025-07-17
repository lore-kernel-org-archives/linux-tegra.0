Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28A2F85FC;
	Thu, 17 Jul 2025 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762132; cv=none; b=k1MvvAGBQBqPcd5mwIWKrBA8RIg1p6X9SDxSRa+M5GVx/gN3/+Xe/i85wCf40xv53KFCveLtPGnQ5Rfqci+M4LUYlIrvskzKLsma56MjsqTN5EkCqazjuC/8KMVnz9/9ND2c2zaaA5faESrcnNQgqVbtsF+PKKoi6mCkISh9GlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762132; c=relaxed/simple;
	bh=ZNKvvXt+/bXU1LK1aGng3ojIseGctVptiaidMgbARDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puK8Z8sf93DDcBl2GOQO22FdKQFEScr02kifW69TYrAlpExkyGVfgQpgq5GYG+O/zd7A8Aba72SYcvILuo2H6gBeLPCshVX55dv95y7xXiq6a00+GAmmcZYZ/BQ3YW5vDKcPFYOAzgnGsJdTI5RrA9PXmq5PLvzcCGAwLrvDS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0viwvB6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0viwvB6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553dceb342fso950138e87.0;
        Thu, 17 Jul 2025 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762128; x=1753366928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jzyEI3ac/uOo6smhtFQv3Lt7kPNZfLb7UDBGDyA0w8=;
        b=g0viwvB6nlPIgCFsYfQA3ugBQvGNsBLHN6AOt0Qpc6GGgKEiDc2TlFskRDpvMylAe9
         sQ6dCsyVu5r5XIzytEDZuTdjjnrEwkzeTKK8orb9Q7ukGa2a8Pcrzm9gn48T8UbbfIbi
         chA0+A7ZhrZyK8wA+egfTjwpvX65nSW/W4hIp7TOsqd7hPv8guKS/l40gSFaVAOX9yS+
         DPJnObbeFCSesJq/RmKgBHTSMFlMmPcfb1WDi940Ve3mkgBgK/zXZe3qIIAYS/ovOIWL
         rNRCTJm4dYBCsYgggnWN4ebETFkVhzJLZ7yNYrC1j6AseVrtbAR7wA3pn3GSAaK7cTvH
         WBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762128; x=1753366928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jzyEI3ac/uOo6smhtFQv3Lt7kPNZfLb7UDBGDyA0w8=;
        b=YFY9N81467ELGCZ5jXpLZ6qcJK3xGOHzpfOZF2RxZxuS2QgkvOYGXPay07A0/U3b+3
         mbNH5s8Ij5+Q97oove3T4EPEZO/lpgelORcYe2eq+xFZVuIlgYQw8PLp7SK1WD3BpoUX
         /jbOWSsA8neu0o1q21B7nz1dNWBz1lZm4xE0anAM4+4eCwl/w7QqthW78shvyjugYfhi
         QkMjWyL+IaF/8leTFvua/CBwCdEvVnwrZV8mVJQyF9lI1PeUFqCxp1qOBU1oAld5wMgt
         +9V74XSgUN19OMa1T8tmZDcUsQ7gPtmNTL2ay7lrZhg/V4S1ex0ZUm3YStG+fgvcFfvg
         G9OA==
X-Forwarded-Encrypted: i=1; AJvYcCVNz5PgB/Cl3+2xImJBHznASykh/qZucLli1zu9JFMRJgClFxiz43EJGIP0OxtiM5xxPy3qR0qbd021@vger.kernel.org, AJvYcCVaNncqf/ZlFoq5lv+zq6dHe8FPxCiCKK5ge9nzphBxGtxSI9EunbJVY/pdcPQKD+u3QzzWT7CxnekMAdLM@vger.kernel.org, AJvYcCVkm6xis3cDZDNb9B9fr5PnuMFES7RHOzdxwiNTXOXLuSrYNxUeSsuEEMyfQ1uClTTe0CDEk4O3djtO@vger.kernel.org, AJvYcCXZRQ7RdJaOSYPUe8cLJ1zikJMPrbS6tIYLz9bsqSAw7j/Dkv2gaJtmih652VOqVfGMCYl5UYlYhqF9APA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8uD2Cvs3MoxNT1sVWCjhiwoVsLfH7+5Ied0SUxsiErIyoHlz
	oCNvUS0CapFXF2R3wsyEovINN00iErzk8bFNnp4pomBMsZTAVq2karmG
X-Gm-Gg: ASbGncu/c5ingS1WsqYws7Q7zsT6qhEra9ZZlvFq+3Y3SC0VP5tgTI/7mXXSHTXJJiM
	lqaM0ptA88J0I117TuI3+WvzoeLV7asHII6uYWv+AQrq8rgNpDHq+VWcq3BuzGDrNAcYhfxUePE
	hchhfEj4+7KDzxj5OmQWMURQ368+3NYtf0bZczqR7mqpBMzBJyO6Svu/3mWOOJgxRYXfFbzNYTQ
	HaBWT5oF+wRENjjbXySsUsu/nhfjCdBvNOjjD578Lr8skxUxwNtE2h/5xggYV5f/O9NB6Qzq/gQ
	WbNyTkI6L91UedA9htgloCDHz+/b0e+ZUhUk2PJAzX4rLgAWdE9Bv5CmqcyYi+BNGV0bLn/VvS/
	A3kGoicGb+ahz4Q8XXJcJzcGA
X-Google-Smtp-Source: AGHT+IESYH2Sz2RGJLeVpKp3IKX4ZOErGb7b+04X70EABSWL+fmITawGH+Sfa4Vm3XmfnZhj3gzEDg==
X-Received: by 2002:a05:6512:3f25:b0:553:314e:8200 with SMTP id 2adb3069b0e04-55a2958fc8emr1141661e87.8.1752762127827;
        Thu, 17 Jul 2025 07:22:07 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:39 +0300
Message-ID: <20250717142139.57621-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MIPI calibration device node for Tegra20 and Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 92d422f83ea4..521261045cc8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -74,6 +74,16 @@ vi@54080000 {
 			status = "disabled";
 		};
 
+		/* DSI MIPI calibration logic is a part of VI/CSI */
+		mipi: mipi@54080220 {
+			compatible = "nvidia,tegra20-mipi";
+			reg = <0x54080220 0x100>;
+			clocks = <&tegra_car TEGRA20_CLK_VI>,
+				 <&tegra_car TEGRA20_CLK_CSI>;
+			clock-names = "vi", "csi";
+			#nvidia,mipi-calibrate-cells = <1>;
+		};
+
 		epp@540c0000 {
 			compatible = "nvidia,tegra20-epp";
 			reg = <0x540c0000 0x00040000>;
@@ -219,9 +229,13 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 50b0446f43fc..c52ad3715505 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -164,6 +164,16 @@ vi@54080000 {
 			status = "disabled";
 		};
 
+		/* DSI MIPI calibration logic is a part of VI/CSI */
+		mipi: mipi@54080220 {
+			compatible = "nvidia,tegra30-mipi";
+			reg = <0x54080220 0x100>;
+			clocks = <&tegra_car TEGRA30_CLK_VI>,
+				 <&tegra_car TEGRA30_CLK_CSI>;
+			clock-names = "vi", "csi";
+			#nvidia,mipi-calibrate-cells = <1>;
+		};
+
 		epp@540c0000 {
 			compatible = "nvidia,tegra30-epp";
 			reg = <0x540c0000 0x00040000>;
@@ -321,9 +331,13 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsia_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		dsi@54400000 {
@@ -334,9 +348,13 @@ dsi@54400000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 84>;
 			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0>;
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&dsib_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
 
-- 
2.48.1

