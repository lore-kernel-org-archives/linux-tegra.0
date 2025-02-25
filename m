Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D77280A3C;
	Tue, 25 Feb 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494146; cv=none; b=nOUALQhl+WPjjp3Z2nySajLQzcNG7MIT6+s3X7tFjD0eNLvECbL8KeosIDD7Fow87pvSeoA0itreqOAH9m7d4eY6PkSt65ItFnjlU/n/6xPLcasYs7pc0LjnrtHd47fWmoWF3j1pfi5gMH8plQt6uP7IN1B2usZdiseC0JrTLGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494146; c=relaxed/simple;
	bh=1H7MdT6mMQiUjhyWBH1uZOE8TzloP7WhAjZorv9CmIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOW4CJM2WGPB82Zxu1F1jk4EgMxCg5jBvQa1zMmAMNGOVf64ZXpagHcVI6/hYjUXh5tVf4nSm76zZAaiyykq50F0aMenzyRg/e3MFoD8B3W36UaCbEh3gVeYen3tMx2hspz98aKyiFqfQYAjRZo2/lNB69aoqd6dwsXYa6zEAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9cfEavy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9cfEavy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so9576637a12.1;
        Tue, 25 Feb 2025 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494143; x=1741098943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLEyIzG3/GbPqkp53dwIyFCDwWk8dVDyrwEE22fxPk8=;
        b=g9cfEavylwFTuYd47BwRQNsYW7QNTWoFANdSCM7d8ilJzXyK3AHzT1XZZ80jeDdA6p
         FeR7MnxRLfsxVQMieIZYokh1SAP8BRs9I40jZkiHmikATEl76KGpvnNKEFDJBgDSCiiV
         u8+dbooVzg7Pg0WqBQ1g4/A9NWYHRUrgpLIkwHTQYtFI49KjLLlxP1deNu2KIXsOP89l
         1D0aey/XrMfpQDjhCLXMhY0unlJbSfx6wOqQFt9v0jo9amRoYF2vcouwKwE6Xmm7oDJ1
         Uz6PBV6oaTXl0pD+5c/MLfS3nfCLDWhzmXL5wmn74vy8343T1mrRudrll//DnXxyO4A+
         PTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494143; x=1741098943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLEyIzG3/GbPqkp53dwIyFCDwWk8dVDyrwEE22fxPk8=;
        b=T7r2J0Zk4qUFfYgTD9yScDoBJQQ82LrQw6tA1AOP8VPgimWBnVn/7jNqHMJg0xAL0X
         Ns4k6JhBkoa8RXnf/6whLbDV74/PI5vXqJGReD+w3W5PQZhdSzcliVmZ+FLYWw/fQNHk
         soO4ahDo5yz66Ehas66HohU6utpcqPlxg6C6+S+CPOPX8iHQYU2lHDvR9qMeAu/v7ucd
         fI62ni//E3v1jP4NM0g+ruZfPXBAYR3QTQdBgImfJbkkQC+us3hs4Q4Ak96QCyLnWe4G
         q2tE5ZVke9JzftDrDiqip77mMhtSMBuCm37dobUdgzT/20IeaATnaCxwDKz6LyKZaW2Z
         6FCg==
X-Forwarded-Encrypted: i=1; AJvYcCU+/x1D+YuIcXrHJ9Kl7AK6kqkXhMtRP2Nue5Orq5b4uJtpaFUiUTGnAeuE/3S3KD4tw8JBIdXT92iP@vger.kernel.org, AJvYcCUr1EfCyoYE343PakFzNsUCvbycLRRQJ7HRB9HZ/J6yYtTEAAJASKtXN2k3qcQDx5M0kmumVd1+BmMi@vger.kernel.org, AJvYcCVf36izOQ8sIU9A2KAVg9uLFIHn34pYnszWtQkDzcaJM3i/eOQOPjvjljSpkeFWwMCR8LLzroE+hsuf0Js=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXV0F5Q3gxX4PEIMb9Ts0cAG00vUGfZ1ANQfNKICT1lJDu1xw
	gAS64SO7G+ED6d8OsawhfdAw8H3z351riNQeHv4R/RnVZ7u6is/D
X-Gm-Gg: ASbGncs5czSXVfYVBSoozz8xYOtt/75HzOUVg08WClV/+sVCiByIGtSy+s7XWHS9oCp
	tixEvGHk1sCumCgIEE87jV2/quKbDRWyjEZodbs77D88VJao5XkERXs28I8h4Ntq3OjhB2XSeM+
	x5xW1xk0DtoRA9BsyoeLxAkzdUaiRKfBMuQ7mK6YmgcJuPT1QRfGHzLhJewta1wKbwwjQf1BHSY
	8Ky6wTUbvhICzI4QMc9cBehaOUkLmgbVDPpxbTO/9I96jzziaZrFnF5N0e55n+CNDpW6qIpWstH
	nhzteiKEMNyYrvLqng==
X-Google-Smtp-Source: AGHT+IFl0cZIOkE81oRwPtB+GR3FY4GCN3GsY2RzZLaHy3k7F0hzvM0Cqu4NVQ+zm2K3M6nay8al2Q==
X-Received: by 2002:a05:6402:2548:b0:5db:e7eb:1b34 with SMTP id 4fb4d7f45d1cf-5e0b70f07d4mr18208590a12.13.1740494142418;
        Tue, 25 Feb 2025 06:35:42 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff8629sm1298750a12.59.2025.02.25.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:35:42 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 9/9] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
Date: Tue, 25 Feb 2025 16:35:01 +0200
Message-ID: <20250225143501.68966-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225143501.68966-1-clamor95@gmail.com>
References: <20250225143501.68966-1-clamor95@gmail.com>
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
index caf6024d6413..341ec0962460 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra114-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra114";
 	interrupt-parent = <&lic>;
@@ -257,6 +259,9 @@ actmon: actmon@6000c800 {
 		clock-names = "actmon", "emc";
 		resets = <&tegra_car TEGRA114_CLK_ACTMON>;
 		reset-names = "actmon";
+		operating-points-v2 = <&emc_bw_dfs_opp_table>;
+		interconnects = <&mc TEGRA114_MC_MPCORER &emc>;
+		interconnect-names = "cpu-read";
 	};
 
 	gpio: gpio@6000d000 {
@@ -588,6 +593,7 @@ mc: memory-controller@70019000 {
 
 		#reset-cells = <1>;
 		#iommu-cells = <1>;
+		#interconnect-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
@@ -598,6 +604,9 @@ emc: external-memory-controller@7001b000 {
 		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
+
+		#interconnect-cells = <0>;
 	};
 
 	ahub@70080000 {
-- 
2.43.0

