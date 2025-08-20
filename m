Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB04343D65;
	Wed, 20 Aug 2025 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702838; cv=none; b=Q7IWlS+SparEqi1wccFich6jo9jy7ibiqoVeJV/Wqfy9L2+s6GwokaRMQKyGsCJ1STvHeY8EqlOTkbpTQawVRJyc91VwJNqJbVqcInHi8BRJLzwqVzg9KahjY8V+dA4BgELt2llMy+r/aCnsasPRJ9peEQadK96co9NfWGLyyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702838; c=relaxed/simple;
	bh=JOuv/MGonXvqUP/qEUbDZLXGaDhcIqk8F6hXwOWt+JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jqe9msBqB0plg9GkVE8IfX9q5Kjonmix3yQM9IW+TjPKjOY1y7kWbK+UNugDt7Q1Yo+L5x3p+Hvh294AJiPJlgnozDBJNmnpr+bVpqu/hHAiIeW0B0qventqXTyvhHFBzY8UKnnzBFJB+KTjPSpT7VH/O1xe79mHocne/yqyRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqPQCycT; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqPQCycT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7322da8so1063488366b.0;
        Wed, 20 Aug 2025 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702835; x=1756307635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffAgsaBt+yeZ0zc6r/i9JozCTywwheb3dvUZnDgxunk=;
        b=nqPQCycTDa0kjCQFCtv3oCQxlehODc9/AFeiB6ZuAvscfflMVXCaZKLOybI5rVlnNl
         HxCafZA5msnEhDbhjFsfhmM2/1zDeXOdJWRSG+b+8/8+ly9VLNDCJFiSP2SgoAE+di2u
         hzibKFRmXGRY5q4zjKe6wVemZenkRZQQfqTAZ2E94znh0/fJKwXAZe8VIZRNWhM5gsJV
         fkcCPv+P9ARlrd6SE1J4M0pVzBBzYYcz/07MfC0jJmrx4sbKSH4cIgSteNp2CTIe0lSd
         CFddAFpu9Qi9Nnzh94Apmh5k+peRoYW3hsqE3+J7wsIycy+u/iNdfgiF3K6oM5T93dbL
         MbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702835; x=1756307635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffAgsaBt+yeZ0zc6r/i9JozCTywwheb3dvUZnDgxunk=;
        b=LId5VvgmEkVY9fQtgeH/WmKOsEvmebP95xW5gFwD1zoLMDKVer3n8285d8SHPG8VVA
         Uy3a4jphcUAzt6TVvJ/DTAm7g+TfccUm0EvfL+RogH/CR8yOudAmBVmsIuNOKQ0z807y
         oIeSawQBYn+vsCp9GodPEnP9PwYB1gyq+6RmcTxrwJlgJqs62DSPIg1NEN6AzJFkESUM
         TRB9pvGE2kDDEeHTvfZvj1d5Tn7l2nTiHe4MUdGMXUyxYcuHwYCyHGJSs5ut9R+u21q3
         rHBfLaBn+W7TCEuVqAQZDyZoUlExuSOaCz5JTLYSyy/wU5FqFlrlcL1Kqz/L0oyK5csd
         BgbA==
X-Forwarded-Encrypted: i=1; AJvYcCUFiByUlm+IEHlN3ZURseP09o4aS030n8iy1nOnnMtszNNCMaYXOCammEz7FVIGwZwLFS12cKuZxZfWQ3s=@vger.kernel.org, AJvYcCXClb56nKhaszlhyC/RJZk61rNdOpFMjU7Iijowk1bPdg6sJeuMhYyJ3LZkkGkzKhkbFtnoVDSgf/yF@vger.kernel.org, AJvYcCXEKc9WhkbB4smKle9QQwlPBQX4y73R1IPPfI7HMxadkEJs38sz4VbncTNp75ch7RyDc9ZYHiLPAMXB@vger.kernel.org
X-Gm-Message-State: AOJu0YyKby/QIf2O9TtEleZgc73xDsWC6YhTvizY1pEsdg7b7ylCnY+E
	tMPo2wIpio1Y4pdKWi6nUZLAkgaT8h7r9bVPweVfaiiDm1+/ayXSrWQ0
X-Gm-Gg: ASbGncvGEfczzbVKPphnnWJGuGd8eAvX1KmwOW9LuBKOg34RolaIAO/Nt44fGtD4fIt
	TI5pLl09nYkTXOqlMGlOiezCazJKwAJxSo9bc7tWD3Z3DyOLU+aJOzgXy9zI3mba9+P2i5SNxp0
	hDs7P7GYLpcNVf4jnL8wydGzXziHKHwgiyB0tGgrQjqk54Jt08AccS+l0lpzGETovsMf3kAG53K
	gwVODq0AqrdI9lQvWbCdjkk/KSdn/k0lAvd+thGW7U1/xHYIDpxz+frgVmaAlOFOBStPQ5KaSme
	OyDhgDZh16p4F5Oj37tF4+MTkcx0E+Kuz/yEpususpBD1Oar5SmTw3T7tOUQRefotX6QIRmENv/
	28Jyoy1XmxA7c8g==
X-Google-Smtp-Source: AGHT+IGRiqm34iTdt3909sGTOtawzj9cGfwdU5Ug/6uytyeHfGkxB2PkwOx02cIKQzJRuPzJa74xYg==
X-Received: by 2002:a17:907:c25:b0:afc:b618:ca7c with SMTP id a640c23a62f3a-afdf01fa122mr277796266b.48.1755702835228;
        Wed, 20 Aug 2025 08:13:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 9/9] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
Date: Wed, 20 Aug 2025 18:13:23 +0300
Message-ID: <20250820151323.167772-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EMC OPP tables and interconnect paths that will be used for
dynamic memory bandwidth scaling based on memory utilization statistics.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 151 ++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 ++
 2 files changed, 160 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
new file mode 100644
index 000000000000..1a0e68f22039
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: opp-table-emc {
+		compatible = "operating-points-v2";
+
+		opp-12750000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-20400000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-40800000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-68000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-102000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-204000000-900 {
+			opp-microvolt = <900000 900000 1390000>;
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			opp-suspend;
+		};
+
+		opp-312000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-408000000-1000 {
+			opp-microvolt = <1000000 1000000 1390000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-528000000-1050 {
+			opp-microvolt = <1050000 1050000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000E>;
+		};
+
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x0001>;
+		};
+
+		opp-624000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <624000000>;
+			opp-supported-hw = <0x000F>;
+		};
+
+		opp-792000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000F>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: opp-table-actmon {
+		compatible = "operating-points-v2";
+
+		opp-12750000 {
+			opp-hz = /bits/ 64 <12750000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <204000>;
+		};
+
+		opp-20400000 {
+			opp-hz = /bits/ 64 <20400000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <326400>;
+		};
+
+		opp-40800000 {
+			opp-hz = /bits/ 64 <40800000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <652800>;
+		};
+
+		opp-68000000 {
+			opp-hz = /bits/ 64 <68000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <1088000>;
+		};
+
+		opp-102000000 {
+			opp-hz = /bits/ 64 <102000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <1632000>;
+		};
+
+		opp-204000000 {
+			opp-hz = /bits/ 64 <204000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <3264000>;
+			opp-suspend;
+		};
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <4992000>;
+		};
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <6528000>;
+		};
+
+		opp-528000000 {
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <8448000>;
+		};
+
+		opp-624000000 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <9984000>;
+		};
+
+		opp-792000000 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-supported-hw = <0x000F>;
+			opp-peak-kBps = <12672000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 97f5ddc197a0..ebac1886e079 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/thermal/tegra114-soctherm.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra114-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra114";
 	interrupt-parent = <&lic>;
@@ -259,6 +261,9 @@ actmon: actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA114_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 		#cooling-cells = <2>;
 	};
 
@@ -591,6 +596,7 @@ mc: memory-controller@70019000 {
 
 		#reset-cells = <1>;
 		#iommu-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -601,6 +607,9 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		#interconnect-cells = <0>;
 	};
 
 	hda@70030000 {
-- 
2.48.1

