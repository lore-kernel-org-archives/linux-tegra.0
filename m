Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8331DF979;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095626; cv=none; b=YOY3QH9bnfOXiG4IS4ss6Yfl8iRUONuBzhwB1ACbayPDjKFCAUtokq68JXuTjVOLLrXr1YW0MWz8kyLo5ncf6uFa9EP5pPRHOHwoWgywV+Qh9N0JnyBVf2bHlrpr4Ab8r0e8Uc3tl8zjLGqbpzHf1ePN/7ZJ5CQ/JuQvq9lje7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095626; c=relaxed/simple;
	bh=xTp2XiVoB2icnqFo5j90y9E3RVOKSjRVf6kH69cV1Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NP3ADskb95cBWkK+IxZi9JwhAOFT05MAi01yYum5ge3h9Q7LyXm+0rUVf0Q0o3+Po0HmaisAyxfa+x9jQGA5XWAmfGFu+Trx37j1Ogk5tC2ffDsL0YPYLhTTFSJuZCxm/T82r8panxLrYsGIAMZQqqSppZeVc63DqjvBgkrFFsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEK/uBQo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEK/uBQo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D89AC4CEF1;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095625;
	bh=xTp2XiVoB2icnqFo5j90y9E3RVOKSjRVf6kH69cV1Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iEK/uBQoS3UYG0qZJWHbuZqCGlqYbEyGSRmdKmmdIxt5sf6NfMKkteNV/lia9C0BL
	 qXziJPomCBXNmPraiLOZ3WuUjfxzbPpUO0THpRdv0C11zAKxwq2RKNZMqhU5bqKK6I
	 QsRtqGGOv37n5VMy6dC09Qz8X+wDlfLxVTicn342BZh5hNAs5aLf3xwYRyLWo+toab
	 mY3oq3BNRXskkM9hZK8CBi0XkDVq3VvVzzDdAjcxjqPemMbgMK+ZeeuP90Cc2kBQzo
	 NVXTCFnz77a5H/Wh5jKiOB+JKSPJM+gs1f5PQLBlTw6dOeurRj2XFg84B2Z+RKV+Q8
	 PBj/p/IA2oUfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D634CCD1A5;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 20:13:41 -0500
Subject: [PATCH v3 1/2] arm64: tegra: Add CPU OPP tables for Tegra186
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p3-v3-1-68184ee8a89c@gmail.com>
References: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095624; l=9142;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=mcK/FZjZ052XZB0ksgNLfD5UB57g4gnCCq2e0lR26io=;
 b=dIB3Y08l67xR2ifVdPcrvUMP4gSyj7FWylp1xpY0rrrmgBD9QC/T0S31+qOa4VEVnoyA26bVD
 S96Ej9GYG1/AOz50VX+Vihuqwgpub0SBwEjwiOc4t8aMFzkX/8woEcH
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


