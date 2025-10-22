Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2C221739;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102806; cv=none; b=bDM/Vjfcz3EonQK7kL/SGsFsrxFfGEIJFW2H6aiqQoOC+pp/gUlSAE3T+kUZBb6dD8YQiUjQ6NhOvRn4c9otEtJeNdhYbmorRQQ1FcgT1O5N0nLSRWXPxjaCCtfibFIASnqbThHqQs/EJ8CECg7us15ZM7PnVcOnic97BEWQjrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102806; c=relaxed/simple;
	bh=/ou2szmYLHFv7ykIjQ/e1wg1hrXhydZMIDKjYoStfrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsRbt2TFXeP4lZgV38RED491JmkKoSL0yJ6HnTmX4cagRGP8FW48Wj71I2XR+YX0PChoeCfn8OCQ1y+odW5G804yvWFD7zYnsf/qwtmp6zaXDdhAMgl0D24xG3/SRLxa2oo3yyXyVxIUx86ysqEIPOagliIeZTJ+lO1pSeTedh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl4rVPDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl4rVPDu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58B04C113D0;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761102806;
	bh=/ou2szmYLHFv7ykIjQ/e1wg1hrXhydZMIDKjYoStfrw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gl4rVPDun0v1CLoiWW0Nu6vQ8D0cpjMKKwo+alGmalQr/MhF0CK9WNOBoRQf4VxU0
	 593ouhhCTIhU0hCrQIShg31ilEbud20m5m0j7skrsWVcSQihZyf0cw6u0XVLDWZA6l
	 knOI0X61RBWNkd3QN+4PT9y9yTyzY9wYrJ6j1LuSh7E0g980vJLQ11w9KGM7JQ+nLP
	 g2+LrBQ1tTpJ5d5uuWn4Ve8sPibVfo8N+LKE2XPMy/hI8F5if5f9omht9Rxx1Vlt3i
	 2MXbDN0p/tzUZ2U8S25Cse+2qamWsjSuI05wtcrr/zRDLk4gFcQXtHfL4tzLYvMeDT
	 AYcH802YlH/ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B15CCD1A5;
	Wed, 22 Oct 2025 03:13:26 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 21 Oct 2025 22:13:22 -0500
Subject: [PATCH v5 1/3] arm64: tegra: tegra210: Add actmon
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-t210-actmon-p4-v5-1-4a4dbc49fbc8@gmail.com>
References: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
In-Reply-To: <20251021-t210-actmon-p4-v5-0-4a4dbc49fbc8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761102805; l=1154;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=wlz7VuhgvpflHfZWQNafqWTwhXBSYIJPNM/UlFKQ87I=;
 b=DaMDkkK2cHyMy2Ob070gvtLJNUxq+kymJLdh642Ql5BFy5V32+ILLY7kEKOLbxpxmY++qMo2y
 u5XxHDkYywPDSP24LZEjdKBpmnty7XbnL1r5C05ZMdowUZeKD8ReWik
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This enables the action monitor to facilitate dynamic frequency scaling.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472af625d9d9e811f5af306d436cc98..6da10db893add44a98fde1666c382511212fd43c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -485,6 +485,18 @@ flow-controller@60007000 {
 		reg = <0x0 0x60007000 0x0 0x1000>;
 	};
 
+	actmon@6000c800 {
+		compatible = "nvidia,tegra210-actmon", "nvidia,tegra124-actmon";
+		reg = <0x0 0x6000c800 0x0 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA210_CLK_ACTMON>,
+			 <&tegra_car TEGRA210_CLK_EMC>;
+		clock-names = "actmon", "emc";
+		resets = <&tegra_car 119>;
+		reset-names = "actmon";
+		#cooling-cells = <2>;
+	};
+
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra210-gpio", "nvidia,tegra30-gpio";
 		reg = <0x0 0x6000d000 0x0 0x1000>;

-- 
2.51.0


