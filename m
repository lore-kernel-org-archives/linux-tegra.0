Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54EBE6C;
	Sun, 27 Apr 2025 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745784338; cv=none; b=D4wNuQsHKsLKawEXzwaqoPRnLYIYj5vVOuaodcisfFTBe76b0thE4NyCjdFrZPMuYVIqftknze5NDBCcdJv4Wx/MvJ+4hrXo6MEk6c0vIzQAG2KwGMVUmBPuk9nTy9cBIXfGZCt+GXrLgdRawJPImIpZBXhyZuIWZKjcCfiV1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745784338; c=relaxed/simple;
	bh=a0gI/5DGFlZFOGml+pr6M1Tp57UMxymn1b8916skRZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=muG4Ig8OeutDVUlGUU2D1tHLurP+RYPRfnJp9miHkiy03tv5FxegodLrSO0T/IS7mBsJbTk9bmzmqut244vCy+0/oQ8I0SEA9LdbccoEuC82ArLfUuMONn4ig4DQAeNVJlGpNSKoyvalso9XsJeTYP8uKtY8/q2u1wMqUNmcIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyZnCmKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyZnCmKM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB7CC4CEE3;
	Sun, 27 Apr 2025 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745784337;
	bh=a0gI/5DGFlZFOGml+pr6M1Tp57UMxymn1b8916skRZw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=MyZnCmKMg1JE2OgrlMil9Pr4qQZ5xR50VJECoMzFFSJS0Owpra66+oDQg7Lx93qkl
	 AQa5yNydG51KbAwbSsbXBzk29GpZAgf7QPXrk3TIfl7z4YdbTGgiAfjMTvfP/+GhrG
	 c8LJMnVyr8U/FVjVtcb/Xsl6Y8LdoLcEMyaJV+bci0PxhsSqb2AGxxXo/oxykenwVG
	 kdqAmCBawRW5TqCBIPYkYnG9j7xiyAtCMHW/bMTizfw/v4wWRU8sNwqw0nsJWJTsDG
	 Vln0tY+2OzYQXBwPiFAahhGkbbg/MwKgsK4U80tOGGva7g58+BlTT2vPNkWI6uemX0
	 tBVckMu5Bjd+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EC4C369D1;
	Sun, 27 Apr 2025 20:05:37 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 27 Apr 2025 15:05:32 -0500
Subject: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX2 Devkit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-tx2-therm-v1-1-65ddb4314723@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAyODmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMz3ZIKI92SjNSiXN3k5FRDS0vLRINUkxQloPqCotS0zAqwWdGxtbU
 AxtftiFsAAAA=
X-Change-ID: 20250426-tx2-therm-cce1999a0e4d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745784337; l=3494;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=TW0EJ+Fija24t/QHZjDcvnNH954zMaFPLdXKDD11nCU=;
 b=jOK3dOpFlZ4UPEDkwmQSri5PRFgH9aFNSld0lj7Wc3DDO9EMsCjlO2Z+rzCOuxVtZOUllpCNP
 J1QPgsqZNcfA9jzWUkPg4lXJYFx8QZQvR42bJ9UQI/G8QiYnNjSDGhg
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This is based on the existing configuration of the Jetson TX2 NX devkit.
The fan and thermal characteristics of the two devkits are similar, so
using the same configuration.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 15aa49fc450399c7bd525adcdb6e92a27a185805..a50fd205daa868d58baa6af085d6409560c5c740 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -2409,6 +2409,10 @@ eeprom@57 {
 		};
 	};
 
+	pwm@c340000 {
+		status = "okay";
+	};
+
 	pcie@10003000 {
 		status = "okay";
 
@@ -2508,6 +2512,16 @@ key-volume-up {
 		};
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm4 0 45334>;
+		fan-supply = <&vdd_fan>;
+
+		/* cooling level (0, 1, 2, 3) - pwm inverted */
+		cooling-levels = <255 128 64 0>;
+		#cooling-cells = <2>;
+	};
+
 	vdd_sd: regulator-vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_CARD_SW_PWR";
@@ -2556,6 +2570,17 @@ vdd_usb1: regulator-vdd-usb1 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	vdd_fan: regulator-vdd-fan {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_FAN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&exp1 4 GPIO_ACTIVE_LOW>;
+
+		vin-supply = <&vdd_5v0_sys>;
+	};
+
 	sound {
 		compatible = "nvidia,tegra186-audio-graph-card";
 		status = "okay";
@@ -2621,4 +2646,88 @@ sound {
 
 		label = "NVIDIA Jetson TX2 APE";
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				cpu_trip_critical: critical {
+					temperature = <96500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <79000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature = <62000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature = <45000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					cooling-device = <&fan 3 3>;
+					trip = <&cpu_trip_critical>;
+				};
+
+				map1 {
+					cooling-device = <&fan 2 2>;
+					trip = <&cpu_trip_hot>;
+				};
+
+				map2 {
+					cooling-device = <&fan 1 1>;
+					trip = <&cpu_trip_active>;
+				};
+
+				map3 {
+					cooling-device = <&fan 0 0>;
+					trip = <&cpu_trip_passive>;
+				};
+			};
+		};
+
+		aux-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				aux_alert0: critical {
+					temperature = <90000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				gpu_alert0: critical {
+					temperature = <99000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };

---
base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
change-id: 20250426-tx2-therm-cce1999a0e4d

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


