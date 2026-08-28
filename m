Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D49449B11;
	Fri, 28 Aug 2026 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917934; cv=none; b=nh9BL/aYlCq4Xda3vuxvaNnCdTpZcU6kEPCjUex/zC8pK4y7q8JFuR9l8H20ZzbxeyRUBgPscnH5u/UlurHUB1YQlqRJOAvUNzWM2CqVtaZkrG6lDl0lqg3W+gab3F3ozH0u5JP3JTN4nvX3Z6KhDGfJvKYdXBA9XHYzIsbs0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917934; c=relaxed/simple;
	bh=rdQUteIaSUPwsRmpuLSNBayvkd4cABMkIzTlpYcMQiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUoGjtnKS6Iu7ORkJFZFmr7FIACms9OI+6JCh+RywO5IjvRf45RR+ICz1XXrWykBZNNdN4aioxdc/EV1LNPG0aPZlcuhDRKiVEwojvEFZ2Ig6fcahJxvBzoNuaTOUvsKLHSb/hhKShGm5ZNk2SD1D7C0SAbxBmQan/DG8Q1qhVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EB0EhLVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EB0EhLVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949871F00A3A;
	Fri, 28 Aug 2026 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787917919;
	bh=GN4dzhCVNYuFNlRqNx2kYhGqEu7OFj46LaEj9Hl1nmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EB0EhLVLASP5Uv9plkvA4XIi6sxxdNpKm0L3QTjLpvjTNedlXXIecpKn9Php19lXD
	 q3tY3Io6wVY2Y5jNGS2z/DNMJtu0iK3ucgf/ruDnC484Pzutuq+5WScF+7FyZdnVPA
	 Fo4XLFpv/AhVoHhkLvivbqQ8nS8+0NV9JwWvayPkRxUeyQOJSP0xmbd79M23CHgtZx
	 GVbJ1n/Ug4UAe5qG90lvj2kCZlkoPKDslE0Qt70GO0NUHSOGO0oIQLK0dFXzsyNS3X
	 dIPsmCj/dlGVtAT3Gni/G2tb+ISnx40fMiHzNurSqFoLVEbESdhjnNuZbpsv16OZ/y
	 e+5HCe39rTpeA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 28 Aug 2026 13:51:37 +0200
Subject: [PATCH v2 1/3] arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-tegra264-fan-v2-1-a460389d8ef5@nvidia.com>
References: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
In-Reply-To: <20260828-tegra264-fan-v2-0-a460389d8ef5@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=treding@nvidia.com;
 h=from:subject:message-id; bh=Ip51aTiqgLVTRh0twWqTH6fgaUqaeRi7gl82nKxw9Vo=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqkXZZipy8/vc12+p2EJFr9s84nqgFjuEHNUaDN
 yO0oW3l7BWJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCapF2WQAKCRDdI6zXfz6z
 oV9+EACfjqdbdzL6s50BrXFSIqP33pepyF+s5Vk5KbmBWSpZ4PiK1ZGLuiUuFBoyPpC2cwaJbjP
 6dYZVQ3KfCiQF5CfNGQWMM/cNBTSD7zGTV8Wn9qnwX5CzP6q8ZFR9QpFyQfoeRwOxftDWUFgHvg
 HPeChYEYF+sa7agfrFuFw/rOFqlLu3OkKv8lZYE8YtSALmt5MZQvHjZQnKQZZfTes095toszpCJ
 h6FSpkXCU//Dg7+pcx5kkXVlREALTtBBfzLp0tmiBcvkOK9ZsLRBauh0izv1jsfTJQKx4vtMY+a
 PztBmmqkWEaY/jLFRj6Gdwmm3VO9ASZ9JJCrLzOjLrTmY/ZbOtlIzGa3pG4otamJGhu3AlEYXH2
 a/3EvFQOFSgZRxMXcXBNjiLlkK7fquDtUh/bJuYwwLQ8kPYfL+PQo2iTaKMNTazy1cicWXtgEkO
 /R86HV/fS1/SVckFtYdj9UlFlH9WoGw1qnpZPiKQG/sXVylLu6MVYUF5swclheFZvYokdz8wEja
 5U/2D4hTtgP7Bm667fkKT9ZESf1ctF3+ssk/LUREiCGkaMqMpdug1T56W9ctZ50espaej5vLrSu
 UHAZMbwJKjm0Tw7ePQJHxALFRL7cyunTrkofoHVTEP1IqX17xPSAioiZXq9+qdN3BgOPwTX2/9b
 eVtnoUCFzsokX6w==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Without a PWM fan device node to actively control the PWM, the fan will
either stop or run at full speed, depending on the state of the PWM when
the controller's clock gets turned off during boot.

One is bad for the system's lifetime and the other is very annoying for
anyone in close proximity to the device, so add the PWM fan in device
tree to fix this.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix device name in commit subject
---
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 45f8df9bbfd6..4550e843f513 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -9,4 +9,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	bus@0 {
+		pwm@c6a0000 {
+			status = "okay";
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <77 102 140 192 255>;
+		pwms = <&pwm4 0 40000>;
+		#cooling-cells = <2>;
+	};
 };

-- 
2.55.0

