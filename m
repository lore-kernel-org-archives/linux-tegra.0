Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDB322DCA
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072397; cv=none; b=fIFTKkevia1jesKF3ewNkCqZOBldzFB0csawSluIAX+mvTPlYFVTiI1kI/VTyn0fb+Z774gg+vvWJ55A1hkCxpiFuaImzlY4N3LZwSF7ie3YpPxC4cPlbybjIN3wh8vSlp2NerMOUcre9TimjkxadmQ00RywMJGpBk7a5nrO0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072397; c=relaxed/simple;
	bh=o77K7lBiiNU3Nw2nvrTyKSx17KCtNvOCyjO6rUUasoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IowxtNlTUyfN5nwSomEzAezHSH7tjU/kfPRkyxRNDQxSzQRDaMYA+Fs7FZkyCF4mIgBqbMji57ijwXuNU2wHf4WhNeixFQwTEiBMowFjX2hvdlQybl7hSJbIDrWZmtGRmK41CfNumvPTjUkCb6WE4U88W1qf+rR7MTLvnWpt67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/ky/l4V; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/ky/l4V"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b9728a353so57929551fa.0
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072393; x=1764677193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsY5WeZZQ7LiYwadFo2jc0S+Rqo5NcKeGdtKvFEJRWQ=;
        b=k/ky/l4VC+e/cR4toTh7IYh1zLV1ZUr6kM7YJSuSQw9LEDgWjpnMwcpzv/E8RSAn31
         gEoXnFUFHbGzQRMvjysZq5QsAtaMj6yoi4i6a2yBwJ6y4Jxys7SAwDTYJcuDj7Km8q4M
         xUwS1W3HVg1DfIUP6lTcWd+A5RdIhn867l/bj17qitb6XDzKckuwCD+5vJMT7sjoweLc
         LxTNmGNXrJPapNGwaz+LgAlvRgunN5GNVZfZfOC4ADss6MqZBZdFe20gLqOGdVsFssYV
         4s3MwmJ0+IbIFdwNB/ZBVFZhxeBJ7BEv2wGRd3owIPfI+bTY0VMK5mzX5FBpmkMsICYj
         N0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072393; x=1764677193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RsY5WeZZQ7LiYwadFo2jc0S+Rqo5NcKeGdtKvFEJRWQ=;
        b=t+9+rVmHbdiog/BbbL1t4lHtQ2nhQYn2J3aNOTuwHWqdBTY4UAZiZuQlNutPD7eAUF
         EOrdnI+m24ck01bxV6Dj2u0hr3h3ffnHg+fcT/Bs1cMt4hz0xNpcfeim5eehiXd5kmrL
         HAYkcUA8dTjO6Thg/j985p+/cNbMh+TJGFdLmCWWs1fi/TkL/P5IMIQJ9z0b0aDFL4Ui
         UcvhT5ZuvmD6FNEykkxPJlxtNI4np9s50E97QhVhJ7w62ASJBfsTvhCd7643G0qU5HZN
         W8BssGFKNoyJfRHwoNBGw1maCOiOQ47KJ3R/Xt7wkCFtH5bKhpgggsb8ixjVAB/XCfrI
         x8sg==
X-Forwarded-Encrypted: i=1; AJvYcCXFFPAyG0iEMLyQbSNmGsa1YK+Nw5TXd6YFgggv70fNcZrOclOzqNPhOnCfhnLArrTcsr2FNWg1gaFtgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIe1zDdSNNFtzTCKXz71Y1EpDGKMlV6j42fJO8vydHn5JCN6cS
	++4JAaBQvvdmTPbAfGpsuVcgOYhf7ECNF/YSsfECrXLod5px6wDLIGhx
X-Gm-Gg: ASbGncslSqO+fDz3iFmRN+4K+goBiHQtRA/fFEb0xYcpzOvJHVsza/0YsPbaP9acjsh
	Zuw99ETczaEI0yRGCS9S8DEMhLEdURMloz9xOYA+3YsxwZxa5V19u+jWHk3I1qhGGAS286dS3A5
	MgyCseCQ2Qb6cI99LD6Df504GVk1Ibs4h6Mkc0+PJM7sp0XtUqgkBJIblHBw3U4YNiIh5oulLDy
	FDJWNr+CWIBiUtTOSSZD2R8W5xPEVjNPyB4FxtC0Re3OHh98ymI2Vs6qYBlFcAW++DkPF2ShWPV
	8N26CJqWBLkC0IBx/OYWmjsZ1yD4OX3HTMrwqKGhl52OhU51IUjSdzZDwAGZU6cWgPlRDY+LCTV
	MsiKRKkSJPN9ZIH34QVFf/ctwJyV0IsrD1B9wXIfG+ME89Gitdkcgq/c8j46Unihk2EYL+LyCYY
	AZLxrLmM5YHQ==
X-Google-Smtp-Source: AGHT+IEdP/dQenZ4+0SzEk4HFyKw5rqkBn8Ymno3xnu3Q7iDvc8YpbqmlkGj2FVO2AanGSctKzK0xA==
X-Received: by 2002:a05:6512:2313:b0:58b:8f:2cf3 with SMTP id 2adb3069b0e04-596a3eb8474mr5564452e87.21.1764072392861;
        Tue, 25 Nov 2025 04:06:32 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:32 -0800 (PST)
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
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 11/12] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
Date: Tue, 25 Nov 2025 14:05:58 +0200
Message-ID: <20251125120559.158860-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
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
index a920ad041c14..6221423b81d1 100644
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

