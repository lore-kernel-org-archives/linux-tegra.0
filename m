Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A5446C17;
	Fri, 28 Aug 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917941; cv=none; b=ENl2PTOepKJb7BwKMDylmrE8ituqVZ+3YuV5vSXOiKjdfA5S5VtHzLi4efKeGjxx7EydBUJoEPAcbmFFdBYniL1KmYKa0yxFxJEQBRYiBswrxzibaEWgNT6Hft9qHXEAGMAT7ltyEM89Ng6syxou3RgWeySKUCHay+dDYDIX7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917941; c=relaxed/simple;
	bh=O1rzJtMcm6mFTSRKAvHPql4xwRZfD99a2m32PaIgH9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9C3pHpHjspUw+QZfB/AgKU5FFZHAHtwKFph+eKiHanIXAKEAD0y2re2o3l3Se//NnuYILBRwAYq1TnoxUuVNwrGSgn4zbJpJ7zD1brzNi3hlbZBXQneuQQuq4D+jtdfG4FqxPAG9HghruEFarEXRV4TgFlQNhvIlXkKTFC7KQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMvRSGzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMvRSGzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372881F00A3E;
	Fri, 28 Aug 2026 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787917924;
	bh=a+5yaFkrJOw9/iYBFvWXyxER2EtDDURsdnRYrxTdIcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PMvRSGzG4PhWf4yoZtgKYnnKGmny1GBSM0fH81xluucpzRYUDD5zu8fB0WowZIGqF
	 QReN8ASuhTTqJr0VNJZPv763dDcnBS6S27Eutqv26hp/DB9ZGvdzF9MvALayfxydMD
	 YJgTMbQXU3sMIPvfA+GBhMfR76DC50a7FvZ0v7n7zQRuBxDoxf0vBIUtcO7TNOgown
	 SsxKk+81rUQRXpaJT/UVsBc8WrtmnvfeTn3uc57hyQ5Q27hjYm1KUegg3dnmYzCUn5
	 EJaU9+fFF4i5qp6OmOzEWTw8Yny9hUXoRK56D4soc4ABKQ+qUwhaIyzQ09Iyvu756y
	 c+Rruo2dL0jPQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 28 Aug 2026 13:51:39 +0200
Subject: [PATCH v2 3/3] arm64: tegra: Add cooling device on Jetson AGX Thor
 DevKit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-tegra264-fan-v2-3-a460389d8ef5@nvidia.com>
References: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
In-Reply-To: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745; i=treding@nvidia.com;
 h=from:subject:message-id; bh=ffBQB+0ihS+VzjDCPSRBlHFSrJqDD1qnX5rd3sZ0miQ=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkXZZ4QnqtN3MtgsOz+koisIFUDxJSir9NNrVk
 +ZD+3RoX2eJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapF2WQAKCRDdI6zXfz6z
 odYaD/9MUVW9RqJVAomHU71wXNF3em9Mq6Wc0qO7AXnluaGqX9sPXmk/sD7lf1Jz/X5RfEf1cby
 iNDjCn9vSoGVzRDJDkYynSbz7f9gepuU3XmG/pyux35kYB6tqoYGyuyVTxJNRdKqnIb7l334TCa
 aSNS3LEHYF1l8kTJ8cCaMketb2zbHdiDTp+ksd6fLDlgu+DMTi97k8wwzmFku41gg6f2tQwgIeb
 0ny4NxKCRrVfIlBeg+ka+4yCWBNy9UleJfSrIaZrCgEWHaqUeOB9xOsxFKJlV072JDhmxk51QLx
 g0RqZLP5fiQ263D2qFqLMfPHTvgl4w9SEDPOmIj0JID+uZrvcTVkGnka3uaxWtQ9C3n7fjv0+Sb
 u3A3RJNyYV5k2+uBT5SqrI5K1yTo+fJ1/+u7R6RFI0H/iB2rvel0ivPkas2AkPNZwiaMrm0vSfU
 5ybFToIhWd1GRbkt0FLSkGltJ6UcFBTabDQ6QQcDJcKNfb+xik0NOGbHULSBCLLzpAjyyjql0CN
 CO+SU4kL8MOEhQ4pwWujsONULBfum18GLtkqYzvLhxbu5SAlrmv1/koa5CaPxGNaSXvjJxGJdj+
 Qua8BfRbV/SPZ/weUdkS809dGl7B5Y9AgyBdo9E2YpD2rPkHV2lPWIwfShS9XR3l9RVEuAziZ1I
 rK1vNyVlAc0z10g==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Monitor the TJ thermal zone and use the main PWM fan of the Jetson AGX
Thor Developer Kit to actively cool the device if needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     | 32 +++++++++++++
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 52 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index 58cd81bc33d7..d4c9f45e03c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -39,4 +39,36 @@ cmdqv@6200000 {
 			status = "okay";
 		};
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <40>;
+			polling-delay = <1000>;
+			status = "okay";
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <40>;
+			polling-delay = <1000>;
+			status = "okay";
+		};
+
+		soc012-thermal {
+			polling-delay-passive = <40>;
+			polling-delay = <1000>;
+			status = "okay";
+		};
+
+		soc345-thermal {
+			polling-delay-passive = <40>;
+			polling-delay = <1000>;
+			status = "okay";
+		};
+
+		tj-thermal {
+			polling-delay-passive = <40>;
+			polling-delay = <1000>;
+			status = "okay";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 4550e843f513..dd042e57839a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -22,4 +22,56 @@ fan: pwm-fan {
 		pwms = <&pwm4 0 40000>;
 		#cooling-cells = <2>;
 	};
+
+	thermal-zones {
+		tj-thermal {
+			trips {
+				tj_trip_active0: active-0 {
+					temperature = <80000>;
+					hysteresis = <0>;
+					type = "active";
+				};
+
+				tj_trip_active1: active-1 {
+					temperature = <86000>;
+					hysteresis = <0>;
+					type = "active";
+				};
+
+				tj_trip_active2: active-2 {
+					temperature = <91000>;
+					hysteresis = <0>;
+					type = "active";
+				};
+
+				tj_trip_active3: active-3 {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map-active-0 {
+					cooling-device = <&fan 0 1>;
+					trip = <&tj_trip_active0>;
+				};
+
+				map-active-1 {
+					cooling-device = <&fan 1 2>;
+					trip = <&tj_trip_active1>;
+				};
+
+				map-active-2 {
+					cooling-device = <&fan 2 3>;
+					trip = <&tj_trip_active2>;
+				};
+
+				map-active-3 {
+					cooling-device = <&fan 3 4>;
+					trip = <&tj_trip_active3>;
+				};
+			};
+		};
+	};
 };

-- 
2.55.0

