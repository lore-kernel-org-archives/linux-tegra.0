Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7B6D1A7
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454953; cv=none; b=BiehR63BiUhDK6lm61+uA/4c6COwcHfFtG7xkEmy8Tx1H5LgrIpsBHo9V4QzNIuMyeuCdsvJ9IqUu2fZrdcF0nXSgRaMq9y1PW0jNIoV7xAzDnxHXaunwHku+pPYmttVlQbbbRTg/v+dy7n1J6U6+qxlbhZq9U01s/ppAA2bzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454953; c=relaxed/simple;
	bh=mnECYxDi5qAt4CbVbEqLJQQNnuCcPGPXcaLcH68G2YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOur3wuZGXgzohzu8FFPNn/jSx1tUpq0hUxSTjFM+3b268Asb8R0VKxQXz1zAENABokqN2QQAzJNGX/O+FbnxRMRzUP/tUaH+X7WhONFAysH5XTGxyGE522sE48sqpmAzsXwu2hTFHL4u8g2Oy9Vhlmn0Nsuwi31+bXyRfrPD4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C005UX+a; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C005UX+a"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a16a400so4395607f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454950; x=1770059750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Mlj96blry9ZyhwpAMaVj0DHbJ2yXiCQQSxiDRn6kg=;
        b=C005UX+a0+/EJfy9QT2CaUCqfkb8vf/lpxhGNGE0QzQXl3Z51WiybQdlV3NlKW0WOY
         WfQguCbAsIoLUxNrLBbjDOrrDS9yMatHPLQeFt05aotfjPu25S4bbcmPXe7Oi1km3WOn
         RFSll0bjqifXifqgsTLqfuM4TaOKxXS+Nadj6BeAohKJ8s2V1Cv4DW3VWCPz4zegzGiX
         tCeY5m6x0VvXqAmMLj61BNjBZkpHELYD5Pwun1lG5Xxy/A5C4EAN9B3ryyIRtfZz11i+
         mRaz557dVDdlTBm5TiIJtjOAVz5Q3Hs6Ey2eylABGG0NbifpKguDAkh3DnOmwHjtueoV
         rn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454950; x=1770059750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/Mlj96blry9ZyhwpAMaVj0DHbJ2yXiCQQSxiDRn6kg=;
        b=Mus0zf8IKUjatcDLqss33dZlSAv5dPK95e+v4m+Lfppt8ascZSiG4bUPf+2nW9uT5f
         1wh5Y8fP5y/jpehdI1oDf8JaJjPDu0Y892HjZbAcGkrP7qlpstA01k3U0n46l4CSRk2V
         4NqakBBIdRxCHpSJqYK2Q8drgYz9BeSUHEqfCKgPkcim/Lkz35qfc4dTFm4e9+gga0Eh
         VY5oQFLMngUn3GO1Qn0ytq65c8etPGBtHiF6IY14m0z3NqJiyfeU2AVtsXzQbPT0LCA7
         RmXaq1CFtyxQB2yw8sVMmTvu9M9uL3emoRcLtGTdT9LG8rD8Cko7C9hvs1cIs/vYM+C2
         0qzA==
X-Forwarded-Encrypted: i=1; AJvYcCV4mhFeYSDTIR+QMYMwe9MkWyxE9zeC97Ct02RI9rhobs+48NZ+v4jgcPvDAErr8LH67uF/KuDttipczw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2mduO1bewZt7TKNOpjE3vRMPWqOw5hshbZ2FAVwZ9zRqr0y2b
	VrFIfHgDeenM9LXCZFTX9Gf/qAJaOny7QDET/bX0ASOw4RvQSlQv/Kb8
X-Gm-Gg: AZuq6aIAuMD/Lx+m0OU31sut3v8Dsunr/oEgxI5I0QTPTXCicDZtOtZqEz0tpRgQEoe
	Xdrd7s4ofw8Y7fhRwsf8bPTcERluuUZgpGgJz0fbGUN6+fdrfZkNb4H51zD1jjNUVFR8Xe/iqem
	iwFlop34DVmycxoN5vkoM53BhxpxlTe7/bD64ugqTbBZdD2IF8Weiy0qoYjrqj0L6mNsZN5PoSv
	p++Alx8BXBsszpgVUEuJR3cwojdm1rQn8y5r+PTKrojXEMr9iNj1/A78Ma7NNKHv7NIeYzZoGQ0
	L1oBKiN7ieGYQnXQWvni74Ky86T4ouSu7dEcG8zkiFw/bwGewZzucrfHAkosNUKZQyrQZIFOxNL
	A6sk0MgbntAP56xA/aPEhpzpMh/gSK8DICZwCRMODxgs9zN7m8yDCL2L4YSVd1BCnkWp8C0ttVZ
	kdwzqqUpgmAU0=
X-Received: by 2002:a05:6000:438a:b0:435:a287:82c with SMTP id ffacd0b85a97d-435ca0ec933mr8285960f8f.1.1769454949833;
        Mon, 26 Jan 2026 11:15:49 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:49 -0800 (PST)
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
Subject: [PATCH v1 3/5] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
Date: Mon, 26 Jan 2026 21:15:34 +0200
Message-ID: <20260126191536.78829-4-clamor95@gmail.com>
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

Add EMC OPP tables and interconnect paths that will be used for dynamic
memory bandwidth scaling based on memory utilization statistics.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 164 ++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 +
 2 files changed, 173 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
new file mode 100644
index 000000000000..b40a1c24abab
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
@@ -0,0 +1,164 @@
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
+		/*
+		 * T40X can work with 1050mV for 528MHz but T40T which is
+		 * in the same group as T40X requires 1100mV. If there will
+		 * be enough data that T40T can work reliably with 1050mV
+		 * for 528MHz then voltage for 528MHz opp can be lowered.
+		 * T40S should remain with 1100mV for 528MHz opp.
+		 */
+		opp-528000000-1100 {
+			opp-microvolt = <1100000 1100000 1390000>;
+			opp-hz = /bits/ 64 <528000000>;
+			opp-supported-hw = <0x000F>;
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
+
+		opp-900000000-1200 {
+			opp-microvolt = <1200000 1200000 1390000>;
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x000E>;
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
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-supported-hw = <0x000E>;
+			opp-peak-kBps = <14400000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 77ab17f397f6..9acba15fba25 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/soc/tegra-pmc.h>
 #include <dt-bindings/thermal/tegra114-soctherm.h>
 
+#include "tegra114-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra114";
 	interrupt-parent = <&lic>;
@@ -323,6 +325,9 @@ actmon: actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA114_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 		#cooling-cells = <2>;
 	};
 
@@ -655,6 +660,7 @@ mc: memory-controller@70019000 {
 
 		#reset-cells = <1>;
 		#iommu-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -665,6 +671,9 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		#interconnect-cells = <0>;
 	};
 
 	hda@70030000 {
-- 
2.51.0

