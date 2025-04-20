Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10F1DB12D;
	Sun, 20 Apr 2025 22:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745188977; cv=none; b=UuT0e8tC4UBPC0Br3QOckAJH4q9jedwcsWQCBRPYwswpNgbHSMRU7zq5gVJEzPBJZRz25NbXVxsVcDOnKBykm7dMd2JHnrrIYy/oQQyinj5gz3pwH/zyXOTBa8HNuOZ4p3zMMzKQU8hSDGX5IdUsC188Hzufo2BtgmRKvol4Zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745188977; c=relaxed/simple;
	bh=YjXGzwoO5wECTiDWnw5EuMK1fiyhHVr3LzggwR5VQDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uEWtkBpzO1gd7kCHJxN7z5z76qOmXRngVumjHY3acNYqih3EZTB8Rz2lQ1NWZGUHBHf+4lBl1M7RXCZ6zy0aqpIGImNyH/z5il7NmPNtM4F1pfXt4yiMzJN+RB1tjZs+FWJqB/FLK+SkOQJPZ9yq2c7j/CeJIu2zIWgfXbgRpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7unFMGp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7unFMGp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9379BC4CEE2;
	Sun, 20 Apr 2025 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745188974;
	bh=YjXGzwoO5wECTiDWnw5EuMK1fiyhHVr3LzggwR5VQDc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O7unFMGpKT6Rfiz7ieJpndzMo/l3m59oNThDfE2YSVftIC9pob5YgBPkANg49OxaU
	 gCq9HTi0Wmuxy6SjifUX1NIdvIobpP5YVptElVCSvVJeCDDNFab5ujTykWptvx3urr
	 mEJ7h2ui03WRrdCFQAS5bzvAy7AqHSYj91Jc3AuRb8I2sOiFQ/wOtZsZOZN6qT/bMV
	 MavmGziViK4uZ4O+YsreUuMGNpXWxlAp6kwrQalGXjD43qFRKml0fkL7KEydM2cVYY
	 /DkfjgsIT5CAzvI0meOVqA38yKJB059klRoX5L5p2EbcGdGZcx5DqIQHeCSFRbDdVp
	 LnxWVBiqM/ceg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B459C369C2;
	Sun, 20 Apr 2025 22:42:54 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 20 Apr 2025 17:42:53 -0500
Subject: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGx4BWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMD3ZIKQ92SjNSiXF3LtCTjZGODtEQT4zQloPqCotS0zAqwWdGxtbU
 AXn/S9lsAAAA=
X-Change-ID: 20250420-tx1-therm-9fb3c30fa43f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745188973; l=2319;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=iN570KuLt7vPq0m05cENwdl1eH7zSuxYdheu8eBhrUE=;
 b=RGDaoSbKWpMTMzRv5hDhqR7bntY29cZbLtxuaOlXWQSiB/eyneLy+rveGmn2vQEpTtYa9VNVz
 EEOOt0lNvNwDx0QPeIxgGIu07wLLjbwXg/VxQPvPOyEpdEJt7A+Vp6H
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This is based on 6f78a94, which enabled added the fan and thermal zones
for the Jetson Nano Devkit. The fan and thermal characteristics of the
two devkits are similar, so usng the same configuration.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 83ed6ac2a8d8f403fb588edce83dc401065c162f..bc02f2eb14bcbd99627c58b398bbf43061c8110b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1623,6 +1623,14 @@ key-volume-up {
 		};
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm 3 45334>;
+
+		cooling-levels = <0 64 128 255>;
+		#cooling-cells = <2>;
+	};
+
 	vdd_sys_mux: regulator-vdd-sys-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_SYS_MUX";
@@ -1778,4 +1786,56 @@ vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu_trip_critical: critical {
+					temperature = <96500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature = <50000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature = <30000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				cpu-critical {
+					cooling-device = <&fan 3 3>;
+					trip = <&cpu_trip_critical>;
+				};
+
+				cpu-hot {
+					cooling-device = <&fan 2 2>;
+					trip = <&cpu_trip_hot>;
+				};
+
+				cpu-active {
+					cooling-device = <&fan 1 1>;
+					trip = <&cpu_trip_active>;
+				};
+
+				cpu-passive {
+					cooling-device = <&fan 0 0>;
+					trip = <&cpu_trip_passive>;
+				};
+			};
+		};
+	};
 };

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250420-tx1-therm-9fb3c30fa43f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


