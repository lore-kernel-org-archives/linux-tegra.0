Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC21F181F;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761095626; cv=none; b=itcM81Ah8W4DzoepD68HGGNi15vT9+RDWV9i4KKxscL/xo3Tl0DO9Own1MkDk6fZ0P0z+GQFwtLPaNTCF29XZ/GdGUpivfca0+1+6nx67r1tVXO0P8N1qmS+EReIljDWYhcixVEYi7vNW/dRhKfvNNdrumgonQqPVuqifBHhEKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761095626; c=relaxed/simple;
	bh=+dJwhlaz1orm5tpKaUfnd6vJp/1SI3Z/tu4XMtQU94w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDNiUcyjjRrpHOgZAIembjHDedG+v/mYsb+9Iii0+do//WftZ2yYowqOnkdhq+AWl5WfbWtyqj3fUnXks2St4hzk3ezHMJAtOi2+l+ho526nE6f2MFiA3BjAZCBAoQxRlpSDF+S9F2+IuG2R2z9c1TKA4DMEC1agmCKnHjA12Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npuAx/7h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npuAx/7h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A33AEC116C6;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761095625;
	bh=+dJwhlaz1orm5tpKaUfnd6vJp/1SI3Z/tu4XMtQU94w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=npuAx/7hGN/t1Bfom1T9XWHQ4LGFxZrX8HpeB5JHNDxdJ+5f0OC7J+t1aNlhmOV6M
	 qOsiUP2E4qjes6GSjAIE/95CehVZ1KTzNge0lLzguYnKgD4w/qIR1s2ygI8mjC6yDc
	 0NrZMCIUlXHi0eIEjkh0XLxXy/W7NeFhAy43HrccWV8GscUgIViICNlsvUPuXJ6bkf
	 EKt4Nh9AQaNYcXqnLe4/d+ZB2/X94e4fWBdICmMJGvLjagQPDIO+vLgXps3pOAJWCu
	 7PrP2haYOavSTtwf1ExREurxp2XCdRanlypaIXyzDHk7Q3eOfnimwKFnxwNXnOV4Vy
	 em55aSfwt5hww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D204CCD1BC;
	Wed, 22 Oct 2025 01:13:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 20:13:42 -0500
Subject: [PATCH v3 2/2] arm64: tegra: Add CPU OPP tables for Tegra194
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-tegra186-icc-p3-v3-2-68184ee8a89c@gmail.com>
References: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
In-Reply-To: <20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761095624; l=16615;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=rO4CQGLvV2bo0tcNNwbixLW81fdzEyzii59svxI1Uyw=;
 b=5JrZhl+Cq/uvWCct7p+kv/5nCiXkRg0zhidXtKT9G3tu4wVYQkmXomzePkl3Z9y5bGEU33byT
 APmFwrxaopCAyAY4fO8V2tqmDvC3ta8jLkV3gYn+tHCS4UQdfExvHHE
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add OPP table and interconnects property to scale DDR frequency with
CPU frequency for better performance. Each operating point entry of
the OPP table has CPU freq to per MC channel bandwidth mapping.
One table is added for each cluster even though the table data is
same because the bandwidth request is per cluster. This is done
because the OPP framework creates a single icc path and hence single
bandwidth request if the table is marked as 'opp-shared' and shared
among all clusters. For us, the OPP table data is same but the MC
Client ID argument to interconnects property is different for each
cluster. So, having per cluster tables makes different icc paths for
each cluster and helps to make per cluster BW requests.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 636 +++++++++++++++++++++++++++++++
 1 file changed, 636 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1399342f23e1c4f73b278adc66dfb948fc30d326..a6c4c6c73707354f62f778bbea5afaec3fdbe22d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2890,6 +2890,8 @@ cpu0_0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl0_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER0 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2904,6 +2906,8 @@ cpu0_1: cpu@1 {
 			device_type = "cpu";
 			reg = <0x001>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl0_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER0 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2918,6 +2922,8 @@ cpu1_0: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl1_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2932,6 +2938,8 @@ cpu1_1: cpu@101 {
 			device_type = "cpu";
 			reg = <0x101>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl1_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER1 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2946,6 +2954,8 @@ cpu2_0: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl2_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER2 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2960,6 +2970,8 @@ cpu2_1: cpu@201 {
 			device_type = "cpu";
 			reg = <0x201>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl2_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER2 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2974,6 +2986,8 @@ cpu3_0: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl3_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER3 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -2988,6 +3002,8 @@ cpu3_1: cpu@301 {
 			device_type = "cpu";
 			reg = <0x301>;
 			enable-method = "psci";
+			operating-points-v2 = <&cl3_opp_tbl>;
+			interconnects = <&mc TEGRA_ICC_MC_CPU_CLUSTER3 &emc>;
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <512>;
@@ -3181,4 +3197,624 @@ timer {
 		interrupt-parent = <&gic>;
 		always-on;
 	};
+
+	cl0_opp_tbl: opp-table-cluster0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-115200000 {
+			  opp-hz = /bits/ 64 <115200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-192000000 {
+			  opp-hz = /bits/ 64 <192000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-268800000 {
+			  opp-hz = /bits/ 64 <268800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-345600000 {
+			  opp-hz = /bits/ 64 <345600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-422400000 {
+			  opp-hz = /bits/ 64 <422400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-499200000 {
+			  opp-hz = /bits/ 64 <499200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-576000000 {
+			  opp-hz = /bits/ 64 <576000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-652800000 {
+			  opp-hz = /bits/ 64 <652800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-729600000 {
+			  opp-hz = /bits/ 64 <729600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-806400000 {
+			  opp-hz = /bits/ 64 <806400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-883200000 {
+			  opp-hz = /bits/ 64 <883200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-960000000 {
+			  opp-hz = /bits/ 64 <960000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1907200000 {
+			  opp-hz = /bits/ 64 <1907200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2112000000 {
+			  opp-hz = /bits/ 64 <2112000000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2188800000 {
+			  opp-hz = /bits/ 64 <2188800000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2265600000 {
+			  opp-hz = /bits/ 64 <2265600000>;
+			  opp-peak-kBps = <4266000>;
+		};
+	};
+
+	cl1_opp_tbl: opp-table-cluster1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-115200000 {
+			  opp-hz = /bits/ 64 <115200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-192000000 {
+			  opp-hz = /bits/ 64 <192000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-268800000 {
+			  opp-hz = /bits/ 64 <268800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-345600000 {
+			  opp-hz = /bits/ 64 <345600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-422400000 {
+			  opp-hz = /bits/ 64 <422400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-499200000 {
+			  opp-hz = /bits/ 64 <499200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-576000000 {
+			  opp-hz = /bits/ 64 <576000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-652800000 {
+			  opp-hz = /bits/ 64 <652800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-729600000 {
+			  opp-hz = /bits/ 64 <729600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-806400000 {
+			  opp-hz = /bits/ 64 <806400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-883200000 {
+			  opp-hz = /bits/ 64 <883200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-960000000 {
+			  opp-hz = /bits/ 64 <960000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1907200000 {
+			  opp-hz = /bits/ 64 <1907200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2112000000 {
+			  opp-hz = /bits/ 64 <2112000000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2188800000 {
+			  opp-hz = /bits/ 64 <2188800000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2265600000 {
+			  opp-hz = /bits/ 64 <2265600000>;
+			  opp-peak-kBps = <4266000>;
+		};
+	};
+
+	cl2_opp_tbl: opp-table-cluster2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-115200000 {
+			  opp-hz = /bits/ 64 <115200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-192000000 {
+			  opp-hz = /bits/ 64 <192000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-268800000 {
+			  opp-hz = /bits/ 64 <268800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-345600000 {
+			  opp-hz = /bits/ 64 <345600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-422400000 {
+			  opp-hz = /bits/ 64 <422400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-499200000 {
+			  opp-hz = /bits/ 64 <499200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-576000000 {
+			  opp-hz = /bits/ 64 <576000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-652800000 {
+			  opp-hz = /bits/ 64 <652800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-729600000 {
+			  opp-hz = /bits/ 64 <729600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-806400000 {
+			  opp-hz = /bits/ 64 <806400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-883200000 {
+			  opp-hz = /bits/ 64 <883200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-960000000 {
+			  opp-hz = /bits/ 64 <960000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1907200000 {
+			  opp-hz = /bits/ 64 <1907200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2112000000 {
+			  opp-hz = /bits/ 64 <2112000000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2188800000 {
+			  opp-hz = /bits/ 64 <2188800000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2265600000 {
+			  opp-hz = /bits/ 64 <2265600000>;
+			  opp-peak-kBps = <4266000>;
+		};
+	};
+
+	cl3_opp_tbl: opp-table-cluster3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-115200000 {
+			  opp-hz = /bits/ 64 <115200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-192000000 {
+			  opp-hz = /bits/ 64 <192000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-268800000 {
+			  opp-hz = /bits/ 64 <268800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-345600000 {
+			  opp-hz = /bits/ 64 <345600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-422400000 {
+			  opp-hz = /bits/ 64 <422400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-499200000 {
+			  opp-hz = /bits/ 64 <499200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-576000000 {
+			  opp-hz = /bits/ 64 <576000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-652800000 {
+			  opp-hz = /bits/ 64 <652800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-729600000 {
+			  opp-hz = /bits/ 64 <729600000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-806400000 {
+			  opp-hz = /bits/ 64 <806400000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-883200000 {
+			  opp-hz = /bits/ 64 <883200000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-960000000 {
+			  opp-hz = /bits/ 64 <960000000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1036800000 {
+			  opp-hz = /bits/ 64 <1036800000>;
+			  opp-peak-kBps = <816000>;
+		};
+
+		opp-1113600000 {
+			  opp-hz = /bits/ 64 <1113600000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1190400000 {
+			  opp-hz = /bits/ 64 <1190400000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1267200000 {
+			  opp-hz = /bits/ 64 <1267200000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1344000000 {
+			  opp-hz = /bits/ 64 <1344000000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1420800000 {
+			  opp-hz = /bits/ 64 <1420800000>;
+			  opp-peak-kBps = <1600000>;
+		};
+
+		opp-1497600000 {
+			  opp-hz = /bits/ 64 <1497600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1574400000 {
+			  opp-hz = /bits/ 64 <1574400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1651200000 {
+			  opp-hz = /bits/ 64 <1651200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1728000000 {
+			  opp-hz = /bits/ 64 <1728000000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1804800000 {
+			  opp-hz = /bits/ 64 <1804800000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1881600000 {
+			  opp-hz = /bits/ 64 <1881600000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1907200000 {
+			  opp-hz = /bits/ 64 <1907200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-1958400000 {
+			  opp-hz = /bits/ 64 <1958400000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2035200000 {
+			  opp-hz = /bits/ 64 <2035200000>;
+			  opp-peak-kBps = <3200000>;
+		};
+
+		opp-2112000000 {
+			  opp-hz = /bits/ 64 <2112000000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2188800000 {
+			  opp-hz = /bits/ 64 <2188800000>;
+			  opp-peak-kBps = <4266000>;
+		};
+
+		opp-2265600000 {
+			  opp-hz = /bits/ 64 <2265600000>;
+			  opp-peak-kBps = <4266000>;
+		};
+	};
 };

-- 
2.51.0


