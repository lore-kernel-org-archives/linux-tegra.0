Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A112392825
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273432; cv=none; b=Vj/fd8PoLxEr23sqaEgZ7eftMhsKr/Jt85ROphwCGcpixI/1G6LEt1idMn/l06ajE6eypkOmr0RckVOOAqSKpOb4kvz612El47j23E/q3Ruq4i5egmpNPDo73WaTF0PVay2i/4Z0Xu6fzEcdk6VQNH3JrMAEa0eAPY4c4+87oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273432; c=relaxed/simple;
	bh=qSrCgh+4XtSTHFKXkD55JTmBjh0D3a80fDw/cAmrMBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PagqClDES1cTuJfWEjeIAgqoZd6kB8xoq+Mx6zHoHCu/j1iC1aopF0Ptn7qSfhA4qXmcGU1fvjPlx5poZE0OcTqLB8XeE+i0+XHmF0SyKRERQDfKeIGl3AiJMmOgewvsesrMqU+Zx8NXAEf+3s5iurkZHJr3A8IFVaVvNNLlU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAPGN6PH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAPGN6PH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so8169122f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273426; x=1777878226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brRZaSzk1Ki4surz9OOhhrisdsM0eqG68gsLgN0ZC/w=;
        b=BAPGN6PHjG+B/xg9fxS1NV0TSwR7xosaYE2A1yNwcLdq2FwgvSIgzFDEfD20H5wRyY
         HszMBoAH8Zxp3lYUIilUeN76+T1J/KG8ZrQUx+IbAqz78Gme/RZDzV0cxTUvmyZc7Zm8
         3oC0Ht0nUb+x1IvKn/vVVpsPnogzNn/1MBDnKabjYUnFExBWUNWQWke6o9USB5vlOe4W
         4LBchcqJLmPT82suW94L449fiBsNZWJQn0+fzrp/ZGVhJ4JQ0qUGxNi0Puk08XxxXAUe
         yzZxaRmZJhQP2lmZwPAPQ3pIIlKqNs5hyuDkF03qYpwAkBkqo7BoCQ+AEtuRBy1VBtrt
         /LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273426; x=1777878226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=brRZaSzk1Ki4surz9OOhhrisdsM0eqG68gsLgN0ZC/w=;
        b=rwIAri3e4dQyBG4/M27ITcyYhadGCcKFJGQ4ypg/fvHme2adIa0P0u7950g3vZ7/Rm
         HVVTtPLVBVMMi7Gvsc2AZ+G6QS2abyF0UVnLhcZmdUerYYmaKTQ76gg6KVYRuvgMtl57
         5U9+YcW3/mBr4cMWR7RGF51I3iPmu6La2IWX053nWrXfi1yLoxiJKGQsSraSBUANEybx
         6SL0p34CFitAllJJgO+Tx63TtmeoNPuNH75xwX7ywwevWjzpsy0Dl2i2JR5FJu03XWfL
         8IcDtopqCAEb7onlxgN0l/UhiDwj2oDl3/DHCmIZkAtVMzwtQXHk7e/H2lC2lVsbGbK4
         EgQg==
X-Forwarded-Encrypted: i=1; AFNElJ8oNbVoJPSePI4nwGGaasNtkHyaDGiQcm2Edsre6AzewkK7PzdzMDpohA0TZR574yPF0ZVmlnI3XJC7Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GqRdIS5Gnv7tHDJSvXzbEauV4dG4+4GbfH2Mw63uP+WUQm8Z
	bTjhuty51GBHxprhpq1bkyhH93vwmzMBARng4eadaaVQ+aL2Sbr8Qve0
X-Gm-Gg: AeBDievvOjNZ3M5fc2i1OrTxJ4T4eqMQLWXrazMGalRoAhKTaOrzQOnvXkYx2Spls9W
	W7/HiwujnJC0QRjAEFF+0UEl8XnIqaGHqr5yYO1XCX3cQq6ma1RdE1VqBvUxFBfjh4c5zziLudl
	8tuJL3UOMDbzonlLobcqxvLyW+R4nELIbwZqcP6GJQn8q+tZ9JA1PekskWUjch5qWxswmTs+F6g
	rdyeP1RQMvS1vWiXxwLpLf8wj3p5F4f6XwwQOZai6QU4vTOrIf+3XoCW6OIym5hiJY6YPgxBwrz
	oIfDCmUwRep2an/KQIVkOTFWE6PRatJlj1128oCzZKwhzPSUyUUQIC4Px3QhK4aLy/PuxPj7g5C
	a9TtEUOs+qs+I30Y0uAaczVODgTDQ8ASsqsx6QxhsUix9qwLDbWqWu4kr6BF55b86e7vseTbI8u
	SQnAyU76aCacX1L7Bfv2BreYEjQ5fydreK8w==
X-Received: by 2002:a05:6000:2dc4:b0:441:37b5:fc04 with SMTP id ffacd0b85a97d-44137b5fc4amr13855964f8f.14.1777273425028;
        Mon, 27 Apr 2026 00:03:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: tegra: Configure Tegra114 power domains
Date: Mon, 27 Apr 2026 10:03:12 +0300
Message-ID: <20260427070312.81679-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
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
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1275 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  126 ++
 2 files changed, 1401 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
index b40a1c24abab..bab6122dba48 100644
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
+	/* Add usbd, usb2 and usb3 opp tables if needed */
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f46406b06a07..a5958f3a965b 100644
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

