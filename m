Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAE34D917;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071493; cv=none; b=Ie5Ry6q59TDHcYImIRhe9jq32oguKyOjIUArOeRAY7kZ9IzNmWBz9BdOc5ScRZ5VkIlcQ822oG8NPD0jgxgobxuwI/knb6zE1zKyL7PbYf173xElkNhoHkgvcwdxQOtsoHe1tOzVb+1ccsdnWMzp8oXKNFVHAy+eBp0dHhGnX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071493; c=relaxed/simple;
	bh=xTp2XiVoB2icnqFo5j90y9E3RVOKSjRVf6kH69cV1Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lN7IZxtUSNssaurffynT2P8oqinHQ3Mp+QqyhuRo4afSB3VGg4/8qUSH+vIsuEH0UY1zmPmFPCWllFsyTOa9Z7ojtueZpIosh1tnFW8x4BrPvDDETS+dPUErkrOMGRwNTnp+VQcm6z+KZU1w3Li9279IADPfJKBpQkuLv4lnHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIgISNXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIgISNXp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B92FC4CEF7;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761071493;
	bh=xTp2XiVoB2icnqFo5j90y9E3RVOKSjRVf6kH69cV1Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CIgISNXpYSqxHA4VJNF3wfotR8xUtkLN7esPBQE9aLpFnTJrwJcWEpuVFlMvKW/bJ
	 qOXoMplcRsSHONQFRNqy3BsAbkl04OQNUdACf4V0jnXedWLT0l0eRCidR3kW22/nYt
	 wR7873yrDYa2e+ttIzdmHXvgUzYpv6fBmBOrKpC4z82S8iuJL2xVBLSA0bdWyA8ekz
	 xerp2iO/ic8pTa+yZLpQvPICa86vKzwkvnaV2J83UO+y9awWcTlHZVsiQsWdS1LP/0
	 3Z40dyyqz524axI5bUVCXrD2iMEjvVUyrNWKUGVd0VA4WZDCGsytgvt/I6E1mHDjHn
	 CE1FDeu6KvLBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD8ECCD1AF;
	Tue, 21 Oct 2025 18:31:33 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 13:31:27 -0500
Subject: [PATCH 1/2] arm64: tegra: Add CPU OPP tables for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p3-v1-1-0c313968b77b@gmail.com>
References: <20251021-tegra186-icc-p3-v1-0-0c313968b77b@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p3-v1-0-0c313968b77b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761071492; l=9142;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=mcK/FZjZ052XZB0ksgNLfD5UB57g4gnCCq2e0lR26io=;
 b=yQUUq1cftN447gw6yyT7VDA17PRaR7OHPb9bzWKiuplRDRZPibMTqMW9n2PfDB9WHGw444Pxq
 YeqScJelOodAoKBXsIr5HC694sXu7YriZBUYgtN6URGMAnNmWZDzSGL
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add OPP table and interconnects property to scale DDR frequency with
CPU frequency for better performance. Each operating point entry of
the OPP table has CPU freq to per MC channel bandwidth mapping. One
table is added for each cluster because the different cpu types have
different scaling curves.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 317 +++++++++++++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 5778c93af3e6e72f5f14a9fcee1e7abf80d2d2c5..d3f6a938a9b019a043ce2de7ec17bd00155b3eb2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1943,6 +1943,8 @@ cpus {
 		denver_0: cpu@0 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
+			operating-points-v2 = <&dnv_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER0 &emc>;
 			i-cache-size = <0x20000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -1956,6 +1958,8 @@ denver_0: cpu@0 {
 		denver_1: cpu@1 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
+			operating-points-v2 = <&dnv_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER0 &emc>;
 			i-cache-size = <0x20000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -1969,6 +1973,8 @@ denver_1: cpu@1 {
 		ca57_0: cpu@2 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			operating-points-v2 = <&a57_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <0xC000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -1982,6 +1988,8 @@ ca57_0: cpu@2 {
 		ca57_1: cpu@3 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			operating-points-v2 = <&a57_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <0xC000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -1995,6 +2003,8 @@ ca57_1: cpu@3 {
 		ca57_2: cpu@4 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			operating-points-v2 = <&a57_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <0xC000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -2008,6 +2018,8 @@ ca57_2: cpu@4 {
 		ca57_3: cpu@5 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			operating-points-v2 = <&a57_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <0xC000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -2182,4 +2194,309 @@ timer {
 		interrupt-parent = <&gic>;
 		always-on;
 	};
+
+	dnv_opp_tbl: opp-table-cluster0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-998400000 {
+			  opp-hz = /bits/ 64 <998400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1075200000 {
+			  opp-hz = /bits/ 64 <1075200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1152000000 {
+			  opp-hz = /bits/ 64 <1152000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1228800000 {
+			  opp-hz = /bits/ 64 <1228800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1305600000 {
+			  opp-hz = /bits/ 64 <1305600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1382400000 {
+			  opp-hz = /bits/ 64 <1382400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1459200000 {
+			  opp-hz = /bits/ 64 <1459200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1536000000 {
+			  opp-hz = /bits/ 64 <1536000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1612800000 {
+			  opp-hz = /bits/ 64 <1612800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1689600000 {
+			  opp-hz = /bits/ 64 <1689600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1766400000 {
+			  opp-hz = /bits/ 64 <1766400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1843200000 {
+			  opp-hz = /bits/ 64 <1843200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1920000000 {
+			  opp-hz = /bits/ 64 <1920000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1996800000 {
+			  opp-hz = /bits/ 64 <1996800000>;
+			  opp-peak-kBps = <3732000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3732000>;
+		};
+	};
+
+	a57_opp_tbl: opp-table-cluster1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-883200000 {
+			  opp-hz = /bits/ 64 <883200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-921600000 {
+			  opp-hz = /bits/ 64 <921600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-960000000 {
+			  opp-hz = /bits/ 64 <960000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-998400000 {
+			  opp-hz = /bits/ 64 <998400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1075200000 {
+			  opp-hz = /bits/ 64 <1075200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1152000000 {
+			  opp-hz = /bits/ 64 <1152000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1228800000 {
+			  opp-hz = /bits/ 64 <1228800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1305600000 {
+			  opp-hz = /bits/ 64 <1305600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1382400000 {
+			  opp-hz = /bits/ 64 <1382400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1459200000 {
+			  opp-hz = /bits/ 64 <1459200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1536000000 {
+			  opp-hz = /bits/ 64 <1536000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1612800000 {
+			  opp-hz = /bits/ 64 <1612800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1689600000 {
+			  opp-hz = /bits/ 64 <1689600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1766400000 {
+			  opp-hz = /bits/ 64 <1766400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1843200000 {
+			  opp-hz = /bits/ 64 <1843200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1920000000 {
+			  opp-hz = /bits/ 64 <1920000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1996800000 {
+			  opp-hz = /bits/ 64 <1996800000>;
+			  opp-peak-kBps = <3732000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3732000>;
+		};
+	};
 };

-- 
2.51.0


