Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC4342528
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716972; cv=none; b=cQTu2tI7cvsKbEKEfvc7vEtZSULoQFiHLfCoJPr5WR9Na8Bbv/c7rgBkee+vIWpIULQg5F4dWzaO/q5zmBked8J5mRp3dgg7Q+hpJ/9eDWE6TXMNROtDHRiSb2+tj+DX1ij5DvYQ5ci8Y/ZgISqbryZCtKDYvU6EOq1F590qO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716972; c=relaxed/simple;
	bh=lMzEsshGSRJZOWfPu29o542XgKUbh2dLItyfJE9Cz+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd1hS3r63JbWy2VZnDYQsRyt0cja615bTtDzVDXXWK4OCzBC22od7uxNc4VBqzBrqA0fWHki3ZseFrVR+UFJac7zF13mBZLpth7Jsf5CUhrBDr4N8tcnWSVyLDzBaZeztF1PG7N/Gdm2zK7qrLy8EhTdU3SPokNZAxLXYX2coZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2uoyaGQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2uoyaGQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dd263bf42so5551372e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716969; x=1771321769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=docz6ooNYgx/jlwVUrg5MGlatBXXa4vDb6cy3X3gZsU=;
        b=b2uoyaGQbsxgAC77F4YMPXp0hLKygphMNDbGTfSnXAZvFk+su1jOoiOMo/BmJtPOVh
         FFY9TuRz6y8fLjkCpp0cFk4i4CJM0iuRE/xE4s852D/Q64jk0bVwBqaIVIPUgXaN8cQy
         sadn/1KSxGNNQsv8lsipTICuoxjkHHzkpGEbbhRwavWXpN14yYkV54oW1FCJzDXcKMy9
         S6ZgUcD64w7uOmF+Tr8985AtJ/8zmSxDBZ1HqYh7bebu19cFZyD+6TFy6XUBnKSC7xnG
         yfDbYzK9bIhVZ8yavoaUCYgyvVETzyNNOR28bAkgEgSLtmfrgwCiqus6loLC+V24YCTz
         9Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716969; x=1771321769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=docz6ooNYgx/jlwVUrg5MGlatBXXa4vDb6cy3X3gZsU=;
        b=v1nyLxQ3/cJq4TU3PLwhOVZc9J7mYvRUVvQpeXq3OZIESebsEd1e7us2IZQKiJbXAg
         kZVIppHrGzDbVT/0QniYTVMoDctHLwDR6Vag5w0LJ/Wq+pu7U+c2ffB1JW3RJ5anGUfY
         5GGTIF+Q1tvBzGwFoU+5DaEwquR9nvLzgAI337fz7eSDZ6rNm3iQC9fGyWKo+CS5wnbG
         jcD+IBjlzMD0k3YD9DXco7mshF9Zh5kMpRMJ1289966xy5iggiQUumsWsFOCyU0Zz9RD
         MJJkkS1f9xQ79zFZI7CwJU68dcLA+X2CIurhLfF+1mV1MNeShuBMhS0LZ67KST3hVGRj
         M8qA==
X-Forwarded-Encrypted: i=1; AJvYcCU/BnZ9PIOua/3C5HzjFoP9+ba8DO/UonKyQJLyQ3VgKw0nqAQMePnzB89TMJjGRXMAZ8S7cJ+ETkDqKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcauK/Abrk05uvqKy614g7CQADYk9k3l3a1w0LNyLOB1t1rAic
	k4DBRh3kzJVsnVsmBFypdYbhI3yrR5PR2qx2YZ2TPuDRko1UveJcL7y0
X-Gm-Gg: AZuq6aIkDgUsCTtncyLc5dV41BCEb5UHHnpi/y5HdRsMVjcuWBsQG4NvsnfVqyj5pVb
	anI+26HMIDyO//F9AId9jeGfKZ804pBJ7PXhm4cN0YHiI3IfilRMhMRVNm6rZ1tc4XUAxpdP1a6
	R216dy8r0e/m2D6ggZjEsnskeutU3/ZyigPDFqtUdmh1xxlvjoYlbD76lJZfACycLRS/L57Zb8Q
	NjbmXXaLQUIcTYnFWP1kHA0BpghusEupRE+rANCc3bB0nZSv9CNYf+nYqoQzImAkGmn8ZLQ3sbx
	hbL5by/DV2Gopw+ic5QSu9D7ccAffkq+Ckve3BxbIOHvs/z4ts9zaijVJ4VDtK1nikrEvqNDBmm
	cB1OG1kAGtxWhivO/MlFCsYrbHyyY5xYhUkUC5fMXyOwIqEnmNkEQzKaPjCZKnKCbgUGTHGmRFX
	hI51Xt+rRquiT5
X-Received: by 2002:a05:6512:b16:b0:59e:1663:941 with SMTP id 2adb3069b0e04-59e55b7404cmr537077e87.3.1770716968637;
        Tue, 10 Feb 2026 01:49:28 -0800 (PST)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:49:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ARM: tegra: transformers: add connector node
Date: Tue, 10 Feb 2026 11:49:08 +0200
Message-ID: <20260210094908.14276-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210094908.14276-1-clamor95@gmail.com>
References: <20260210094908.14276-1-clamor95@gmail.com>
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
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 ++++++++++++++++--
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
index 73c7ee378865..51d99998d836 100644
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
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -951,6 +953,20 @@ clk32k_in: clock-32k-in {
 		#clock-cells = <0>;
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 1ed0536ae3fa..498780a96cf9 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -67,8 +67,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 
 		lcd: dsi@54300000 {
@@ -2302,6 +2305,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index 53382e10f29f..0b0713d62e32 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -166,8 +166,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1713,6 +1716,20 @@ clk32k_in: clock-32k {
 		clock-output-names = "pmic-oscillator";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	cpus {
 		cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
-- 
2.51.0

