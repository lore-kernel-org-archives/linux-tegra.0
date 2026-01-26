Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F427B327
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454957; cv=none; b=ijXJIuTBIBU+GQ3GLE5ljFe1zo1Rmhf276i2P+4igE2D60vIwQ9BJSnNCiblxN3bDFY1yMjDVsxbVRE4HWmsDmKCznhSLOsSSwIX5UIBnQv3YRmi+QPF+2SaW2sgO9rqCWxK9kF2pELaGjXShShG1aMBtpSya2DNKLHYJlzIIxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454957; c=relaxed/simple;
	bh=K/YDzXBiNteVH+nOqArhS+RjHZkyoXiSKKUdLYsNQrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5D9iPRKhdvDW/GekNLDMhukeZXQxodZoewgvsoetCqSFJI9yno/AEM8iU8Cq0CyKcYwYDeeTs/Kq1Zeyeu1AJNlq7i8ephRR4XqKQKQxXqp81kUinKPeBIlwc0alDhgQekVLT8+zaTkgaRBUT8aYYO4QRW1I68qW/9+s8tvWV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvYnpTlz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvYnpTlz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359a302794so3022414f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454952; x=1770059752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN74FM3RLI2JFdO0Uk/DODkvfl4Zda0PHM200DFyIg4=;
        b=WvYnpTlzfKO22FG7SHj8GDSno5/7Bi4tbYjDYnjss6HIWkV/gixzVd6ji+WaFY83ST
         g8t7i9Ftp1ML1I/AoNUBDRlH+TfETWmhxRXtLKpwLLl8i1vS04nuITb5fKbbZDrS/Zt9
         CXxBqE/1XST6hmMbF7oMMw7IAQzO1EsddD2uAfSdf9a2bNgbA1owkWACg42u+BpnVxID
         QyOceyS3GBlY/fRS29DUZ5ueVzpHo+RQyazfuOdxR53p0wtQITg88wXDQrD7sSNK3BD4
         HGnt5Am1quB6xuVgzf5kCZcXprF7GTFSzat5M3wDOMlbPQyfij+HqaorD36OE8RDn57r
         yqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454952; x=1770059752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KN74FM3RLI2JFdO0Uk/DODkvfl4Zda0PHM200DFyIg4=;
        b=UamFhkjyFdt33pf4e7qwjEl+bva9cSJoo+b/JBJx/7w1qoqncpENluMelvyDDb+XE6
         xyjKwGOIs4kqE1V4fAb6m0Mx0lS6f1+5CVLwO6MuAo2i1B3MD/tOTrJRcvDuijvY3sIq
         66Pw2dXCnsjIAI6T2OQ6UD0itrcemN6ftKG6CpB9lObOeIzQBSbCTWjjoB8vcWW7XCyS
         7hBYHU2Yb2Z/2aR3uwj0skpRzrYAcnd0iUOJjM4f/Ddly2XORdXo529Grw7lCwWhhJQM
         4pww5WQItI9SFiYcLvIbwIV3VtZ+znPNdlupkUJtVw7JOWpq36U6Qf5+ubawWpwEO4ac
         WPbw==
X-Forwarded-Encrypted: i=1; AJvYcCVWKESD/u1mTgk5Z1XVSNIL2oo7iM1Zh6qRalEb9jTB6dc2SDLrlRWJhvLNMuSeFxe0dWBMTucz/qs+WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybG/0SvYlfE9lWozhP9KJCyM8H9XHCYZ15bcp8byyVHKqHE9ea
	b3BZmG6K/TeSgmoyO8QNijzieVTh2WoUUJ5Lh6PPJng4A4Ol0OE8UFh+
X-Gm-Gg: AZuq6aKWf+lDKM+LttANmk1jibvyjTxbX7XHyX4wWzh3wpBYTuquZ7dzrxAX23hrS2j
	p0vayhiXwzMT2j8XLz9xMhdG8vA8LnIXFUVCtWgcGQGnW8LRLB9ljaNmoPlw/z/zYOfJj4NUN0Z
	JP5BOYaq+3P4O9w/eIxMu7VW86liZ050WhXNRtBXIGC2eF+ixki70G+tAwboTLYD/rQPW0klLU0
	EtqUYeFL1s5oiqXMb12iBYlIWcKuItbU+R9qjJabr6RgMN3NDBHKCgt1noFbnV6G59d2HIfHuWv
	jZiy6Unas7b5DQj2E3hCQO2m2zULu1THMEXKhenJgF0+NjQmq/iwJE1cDOsspDzp/GaD5ohzvpu
	4o9diCVNtJMINb1x5Wr4Nj3TtsL+VQsDCJ6heeVVertWjz2NUm/j+lFTJD54VN8oTDPvbqXUnRN
	lbGcIwYfxCxX0=
X-Received: by 2002:a05:6000:18a8:b0:431:a50:6ead with SMTP id ffacd0b85a97d-435ca125a8bmr9533290f8f.20.1769454951834;
        Mon, 26 Jan 2026 11:15:51 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: tegra: configure Tegra114 power domains
Date: Mon, 26 Jan 2026 21:15:36 +0200
Message-ID: <20260126191536.78829-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126191536.78829-1-clamor95@gmail.com>
References: <20260126191536.78829-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add power domains found in Tegra114 and configure operating-points-v2 for
supported devices accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1275 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  126 ++
 2 files changed, 1401 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
index b40a1c24abab..5e66c1dc8fb7 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
@@ -1,6 +1,76 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	core_opp_table: opp-table-core {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		core_opp_900: opp-900000 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-level = <900000>;
+		};
+
+		core_opp_950: opp-950000 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-level = <950000>;
+		};
+
+		core_opp_1000: opp-1000000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-level = <1000000>;
+		};
+
+		core_opp_1050: opp-1050000 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-level = <1050000>;
+		};
+
+		core_opp_1100: opp-1100000 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-level = <1100000>;
+		};
+
+		core_opp_1120: opp-1120000 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-level = <1120000>;
+		};
+
+		core_opp_1150: opp-1150000 {
+			opp-microvolt = <1150000 1150000 1390000>;
+			opp-level = <1150000>;
+		};
+
+		core_opp_1170: opp-1170000 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-level = <1170000>;
+		};
+
+		core_opp_1200: opp-1200000 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-level = <1200000>;
+		};
+
+		core_opp_1250: opp-1250000 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-level = <1250000>;
+		};
+
+		core_opp_1300: opp-1300000 {
+			opp-microvolt = <1300000 1300000 1390000>;
+			opp-level = <1300000>;
+		};
+
+		core_opp_1350: opp-1350000 {
+			opp-microvolt = <1350000 1350000 1390000>;
+			opp-level = <1350000>;
+		};
+
+		core_opp_1390: opp-1390000 {
+			opp-microvolt = <1390000 1390000 1390000>;
+			opp-level = <1390000>;
+		};
+	};
+
 	emc_icc_dvfs_opp_table: opp-table-emc {
 		compatible = "operating-points-v2";
 
@@ -8,36 +78,42 @@ opp-12750000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 		};
 
 		opp-20400000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <20400000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 		};
 
 		opp-40800000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <40800000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 		};
 
 		opp-68000000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <68000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 		};
 
 		opp-102000000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 		};
 
 		opp-204000000-900 {
 			opp-microvolt = <900000 900000 1390000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
 			opp-suspend;
 		};
 
@@ -45,12 +121,14 @@ opp-312000000-1000 {
 			opp-microvolt = <1000000 1000000 1390000>;
 			opp-hz = /bits/ 64 <312000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp-408000000-1000 {
 			opp-microvolt = <1000000 1000000 1390000>;
 			opp-hz = /bits/ 64 <408000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		/*
@@ -64,24 +142,28 @@ opp-528000000-1100 {
 			opp-microvolt = <1100000 1100000 1390000>;
 			opp-hz = /bits/ 64 <528000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
 		};
 
 		opp-624000000-1100 {
 			opp-microvolt = <1100000 1100000 1390000>;
 			opp-hz = /bits/ 64 <624000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
 		};
 
 		opp-792000000-1100 {
 			opp-microvolt = <1100000 1100000 1390000>;
 			opp-hz = /bits/ 64 <792000000>;
 			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
 		};
 
 		opp-900000000-1200 {
 			opp-microvolt = <1200000 1200000 1390000>;
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1200>;
 		};
 	};
 
@@ -161,4 +243,1197 @@ opp-900000000 {
 			opp-peak-kBps = <14400000>;
 		};
 	};
+
+	vi_dvfs_opp_table: opp-table-vi {
+		compatible = "operating-points-v2";
+
+		opp-114000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <114000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-216000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-240000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-312000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-372000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <372000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-408000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-408000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1120>;
+		};
+	};
+
+	epp_dvfs_opp_table: opp-table-epp {
+		compatible = "operating-points-v2";
+
+		opp-192000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <192000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-228000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-396000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-468000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <468000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-492000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <492000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-516000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <516000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-564000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <564000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-552000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <552000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-636000000-1200 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-hz = /bits/ 64 <636000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-672000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <672000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-828000000-1390 {
+			opp-microvolt = <1390000 1390000 1390000>;
+			opp-hz = /bits/ 64 <828000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1390>;
+		};
+	};
+
+	gr2d_dvfs_opp_table: opp-table-gr2d {
+		compatible = "operating-points-v2";
+
+		opp-192000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <192000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-228000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-396000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-468000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <468000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-492000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <492000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-516000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <516000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-564000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <564000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-552000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <552000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-636000000-1200 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-hz = /bits/ 64 <636000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-672000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <672000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-828000000-1390 {
+			opp-microvolt = <1390000 1390000 1390000>;
+			opp-hz = /bits/ 64 <828000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1390>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: opp-table-gr3d {
+		compatible = "operating-points-v2";
+
+		opp-192000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <192000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-228000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-300000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-396000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <396000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-468000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <468000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-492000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <492000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-516000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <516000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-564000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <564000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-552000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <552000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1170>;
+		};
+
+		opp-600000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-636000000-1200 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-hz = /bits/ 64 <636000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp-672000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <672000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp-828000000-1390 {
+			opp-microvolt = <1390000 1390000 1390000>;
+			opp-hz = /bits/ 64 <828000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1390>;
+		};
+	};
+
+	msenc_dvfs_opp_table: opp-table-msenc {
+		compatible = "operating-points-v2";
+
+		opp-144000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <144000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-182000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <182000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-204000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-252000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <252000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-312000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-324000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <324000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-408000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-432000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <432000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-456000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <456000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-480000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-480000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+	};
+
+	tsec_dvfs_opp_table: opp-table-tsec {
+		compatible = "operating-points-v2";
+
+		opp-144000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <144000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-182000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <182000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-204000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-252000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <252000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-312000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-324000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <324000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-408000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-432000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <432000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-456000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <456000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-480000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-480000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+	};
+
+	vde_dvfs_opp_table: opp-table-vde {
+		compatible = "operating-points-v2";
+
+		opp-144000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <144000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-182000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <182000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-204000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-240000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-252000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <252000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-312000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-324000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <324000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-384000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-408000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-432000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <432000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-456000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <456000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-480000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-480000000-1170 {
+			opp-microvolt = <1170000 1170000 1390000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1170>;
+		};
+	};
+
+	host1x_dvfs_opp_table: opp-table-host1x {
+		compatible = "operating-points-v2";
+
+		opp-144000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <144000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-180000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <180000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-188000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <188000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-228000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-240000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <240000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-276000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <276000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp-276000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <276000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-324000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <324000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-336000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <336000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp-336000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <336000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-372000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <372000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp-384000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <384000000>;
+			opp-supported-hw = <0x000E>;
+			required-opps = <&core_opp_1120>;
+		};
+	};
+
+	pll_m_dvfs_opp_table: opp-table-pllm {
+		compatible = "operating-points-v2";
+
+		opp-800000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-1066000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_c_dvfs_opp_table: opp-table-pllc {
+		compatible = "operating-points-v2";
+
+		opp-800000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-1066000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_c2_dvfs_opp_table: opp-table-pllc2 {
+		compatible = "operating-points-v2";
+
+		opp-800000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-1066000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_c3_dvfs_opp_table: opp-table-pllc3 {
+		compatible = "operating-points-v2";
+
+		opp-800000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-1066000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sbc1_dvfs_opp_table: opp-table-sbc1 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sbc2_dvfs_opp_table: opp-table-sbc2 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sbc3_dvfs_opp_table: opp-table-sbc3 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sbc4_dvfs_opp_table: opp-table-sbc4 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sbc5_dvfs_opp_table: opp-table-sbc5 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sbc6_dvfs_opp_table: opp-table-sbc6 {
+		compatible = "operating-points-v2";
+
+		opp-48000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-52000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: opp-table-sdmmc1 {
+		compatible = "operating-points-v2";
+
+		opp-81600000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <81600000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-156000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <156000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-204000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: opp-table-sdmmc3 {
+		compatible = "operating-points-v2";
+
+		opp-81600000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <81600000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-156000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <156000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-204000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	sdmmc4_dvfs_opp_table: opp-table-sdmmc4 {
+		compatible = "operating-points-v2";
+
+		opp-81600000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <81600000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp-156000000-1120 {
+			opp-microvolt = <1120000 1120000 1390000>;
+			opp-hz = /bits/ 64 <156000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1120>;
+		};
+
+		opp-200000000-1250 {
+			opp-microvolt = <1250000 1250000 1390000>;
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: opp-table-hdmi {
+		compatible = "operating-points-v2";
+
+		opp-148500000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <148500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-297000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp1_dvfs_opp_table: opp-table-disp1 {
+		compatible = "operating-points-v2";
+
+		opp-166000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <166000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-297000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp2_dvfs_opp_table: opp-table-disp2 {
+		compatible = "operating-points-v2";
+
+		opp-166000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <166000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_900>;
+		};
+
+		opp-297000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	xusb_falcon_dvfs_opp_table: opp-table-xusb-falcon {
+		compatible = "operating-points-v2";
+
+		opp-336000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <336000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	xusb_host_dvfs_opp_table: opp-table-xusb-host {
+		compatible = "operating-points-v2";
+
+		opp-112000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <112000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	xusb_dev_dvfs_opp_table: opp-table-xusb-dev {
+		compatible = "operating-points-v2";
+
+		opp-58300000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <58300000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	xusb_ss_dvfs_opp_table: opp-table-xusb-ss {
+		compatible = "operating-points-v2";
+
+		opp-122400000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <122400000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	xusb_fs_dvfs_opp_table: opp-table-xusb-fs {
+		compatible = "operating-points-v2";
+
+		opp-48000000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <48000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	xusb_hs_dvfs_opp_table: opp-table-xusb-hs {
+		compatible = "operating-points-v2";
+
+		opp-61200000-950 {
+			opp-microvolt = <950000 950000 1390000>;
+			opp-hz = /bits/ 64 <61200000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+	};
+
+	/* Add usbd, usb2 and usb3 opps if needed */
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f1af206f50ee..143aa45a9791 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -58,6 +58,8 @@ vi@54080000 {
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
 			reset-names = "vi";
+			power-domains = <&pd_venc>;
+			operating-points-v2 = <&vi_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
@@ -71,6 +73,8 @@ epp@540c0000 {
 			clocks = <&tegra_car TEGRA114_CLK_EPP>;
 			resets = <&tegra_car TEGRA114_CLK_EPP>;
 			reset-names = "epp";
+			power-domains = <&pd_heg>;
+			operating-points-v2 = <&epp_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
 
@@ -84,6 +88,7 @@ isp@54100000 {
 			clocks = <&tegra_car TEGRA114_CLK_ISP>;
 			resets = <&tegra_car TEGRA114_CLK_ISP>;
 			reset-names = "isp";
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
 
@@ -97,6 +102,8 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
 			resets = <&tegra_car 21>, <&mc TEGRA114_MC_RESET_2D>;
 			reset-names = "2d", "mc";
+			power-domains = <&pd_heg>;
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
@@ -107,6 +114,8 @@ gr3d@54180000 {
 			clocks = <&tegra_car TEGRA114_CLK_GR3D>;
 			resets = <&tegra_car 24>, <&mc TEGRA114_MC_RESET_3D>;
 			reset-names = "3d", "mc";
+			power-domains = <&pd_3d>;
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_NV>;
 		};
@@ -120,6 +129,8 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp1_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
@@ -150,6 +161,8 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&disp2_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
@@ -180,6 +193,8 @@ hdmi@54280000 {
 			clock-names = "hdmi", "parent";
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&hdmi_dvfs_opp_table>;
 			status = "disabled";
 		};
 
@@ -193,6 +208,7 @@ dsia: dsi@54300000 {
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			nvidia,mipi-calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
+			power-domains = <&pd_core>;
 			status = "disabled";
 
 			#address-cells = <1>;
@@ -209,6 +225,7 @@ dsib: dsi@54400000 {
 			resets = <&tegra_car 82>;
 			reset-names = "dsi";
 			nvidia,mipi-calibrate = <&mipi 0x180>; /* DSIC & DSID pads */
+			power-domains = <&pd_core>;
 			status = "disabled";
 
 			#address-cells = <1>;
@@ -222,6 +239,8 @@ msenc@544c0000 {
 			clocks = <&tegra_car TEGRA114_CLK_MSENC>;
 			resets = <&tegra_car TEGRA114_CLK_MSENC>;
 			reset-names = "mpe";
+			power-domains = <&pd_mpe>;
+			operating-points-v2 = <&msenc_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_MSENC>;
 
@@ -234,6 +253,8 @@ tsec@54500000 {
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_TSEC>;
 			resets = <&tegra_car TEGRA114_CLK_TSEC>;
+			power-domains = <&pd_core>;
+			operating-points-v2 = <&tsec_dvfs_opp_table>;
 
 			iommus = <&mc TEGRA_SWGROUP_TSEC>;
 
@@ -393,6 +414,8 @@ vde@6001a000 {
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA114_MC_RESET_VDE>;
 		iommus = <&mc TEGRA_SWGROUP_VDE>;
+		power-domains = <&pd_vde>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
 	};
 
 	apbmisc@70000800 {
@@ -470,6 +493,7 @@ pwm: pwm@7000a000 {
 		clocks = <&tegra_car TEGRA114_CLK_PWM>;
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -560,6 +584,8 @@ spi@7000d400 {
 		reset-names = "spi";
 		dmas = <&apbdma 15>, <&apbdma 15>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc1_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -575,6 +601,8 @@ spi@7000d600 {
 		reset-names = "spi";
 		dmas = <&apbdma 16>, <&apbdma 16>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc2_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -590,6 +618,8 @@ spi@7000d800 {
 		reset-names = "spi";
 		dmas = <&apbdma 17>, <&apbdma 17>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -605,6 +635,8 @@ spi@7000da00 {
 		reset-names = "spi";
 		dmas = <&apbdma 18>, <&apbdma 18>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc4_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -620,6 +652,8 @@ spi@7000dc00 {
 		reset-names = "spi";
 		dmas = <&apbdma 27>, <&apbdma 27>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc5_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -635,6 +669,8 @@ spi@7000de00 {
 		reset-names = "spi";
 		dmas = <&apbdma 28>, <&apbdma 28>;
 		dma-names = "rx", "tx";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sbc6_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -661,6 +697,86 @@ tegra_pmc: pmc@7000e400 {
 		clocks = <&tegra_car TEGRA114_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 		#clock-cells = <1>;
+
+		pd_core: core-domain {
+			#power-domain-cells = <0>;
+			operating-points-v2 = <&core_opp_table>;
+		};
+
+		powergates {
+			/*
+			 * TODO: Add DIS and DISB domains once DC is able
+			 * to handle them properly. VENC and DISB should
+			 * set DIS as their source power domain due to
+			 * internal dependency.
+			 */
+
+			pd_heg: heg {
+				clocks = <&tegra_car TEGRA114_CLK_GR2D>,
+					 <&tegra_car TEGRA114_CLK_EPP>;
+				resets = <&mc TEGRA114_MC_RESET_2D>,
+					 <&mc TEGRA114_MC_RESET_EPP>,
+					 <&tegra_car TEGRA114_CLK_GR2D>,
+					 <&tegra_car TEGRA114_CLK_EPP>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_mpe: mpe {
+				clocks = <&tegra_car TEGRA114_CLK_MSENC>;
+				resets = <&mc TEGRA114_MC_RESET_MPE>,
+					 <&tegra_car TEGRA114_CLK_MSENC>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_3d: td {
+				clocks = <&tegra_car TEGRA114_CLK_GR3D>;
+				resets = <&mc TEGRA114_MC_RESET_3D>,
+					 <&tegra_car TEGRA114_CLK_GR3D>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_vde: vdec {
+				clocks = <&tegra_car TEGRA114_CLK_VDE>;
+				resets = <&mc TEGRA114_MC_RESET_VDE>,
+					 <&tegra_car TEGRA114_CLK_VDE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA114_CLK_ISP>,
+					 <&tegra_car TEGRA114_CLK_VI>,
+					 <&tegra_car TEGRA114_CLK_CSI>;
+				resets = <&mc TEGRA114_MC_RESET_ISP>,
+					 <&mc TEGRA114_MC_RESET_VI>,
+					 <&tegra_car TEGRA114_CLK_ISP>,
+					 <&tegra_car 20 /* VI */>,
+					 <&tegra_car TEGRA114_CLK_CSI>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbss: xusba {
+				clocks = <&tegra_car TEGRA114_CLK_XUSB_SS>;
+				resets = <&tegra_car TEGRA114_CLK_XUSB_SS>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbdev: xusbb {
+				clocks = <&tegra_car TEGRA114_CLK_XUSB_DEV>;
+				resets = <&tegra_car 95>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_xusbhost: xusbc {
+				clocks = <&tegra_car TEGRA114_CLK_XUSB_HOST>;
+				resets = <&tegra_car TEGRA114_CLK_XUSB_HOST>;
+				#power-domain-cells = <0>;
+			};
+		};
 	};
 
 	fuse@7000f800 {
@@ -670,6 +786,7 @@ fuse@7000f800 {
 		clock-names = "fuse";
 		resets = <&tegra_car 39>;
 		reset-names = "fuse";
+		power-domains = <&pd_core>;
 	};
 
 	mc: memory-controller@70019000 {
@@ -691,6 +808,7 @@ emc: external-memory-controller@7001b000 {
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_EMC>;
 		clock-names = "emc";
+		power-domains = <&pd_core>;
 
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
@@ -885,6 +1003,8 @@ mmc@78000000 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -907,6 +1027,8 @@ mmc@78000400 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -918,6 +1040,8 @@ mmc@78000600 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
+		power-domains = <&pd_core>;
+		operating-points-v2 = <&sdmmc4_dvfs_opp_table>;
 		status = "disabled";
 	};
 
@@ -930,6 +1054,7 @@ usb@7d000000 {
 		resets = <&tegra_car 22>;
 		reset-names = "usb";
 		nvidia,phy = <&phy1>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -970,6 +1095,7 @@ usb@7d008000 {
 		resets = <&tegra_car 59>;
 		reset-names = "usb";
 		nvidia,phy = <&phy3>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
-- 
2.51.0

