Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29841FF1A2;
	Wed,  5 Mar 2025 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215068; cv=none; b=le7mAKMslTCNVThWo6PhIaNmhs6vKLxKHsTStgdyb3v3xamsYUXD9bZjwO/oeZ5XyYWQ3VW0u/k2wlxvtwP7zqA+fY6cUSU2+9u3eZM8aZHqWzmeeV53nFjLpZCZjdJbX6cVwuYU7OnwNRTptCXPpeJHZyKzsfHDlv4c22xqUOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215068; c=relaxed/simple;
	bh=4kn0alaAsGGXPN7YZT7+IeoQ/dtwpPBvCEYm9hxAS+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2qui6cMjBmqqFONR1yx8B93eotNBpo81QifFkpq9NT3FqrvC2I5AnHeZuspqcfAB1j5pc10o6dQ1xW2w2F4weGFWp2COuTEnshqLSh8kY/8/1mKgnljFAopsZUaT13ep4M+Q8BpFx7SHgNPFl7o9WcQ4GWlAYU7LsIyvFrcC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uln1OaN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uln1OaN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FCEC4CED1;
	Wed,  5 Mar 2025 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741215067;
	bh=4kn0alaAsGGXPN7YZT7+IeoQ/dtwpPBvCEYm9hxAS+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=uln1OaN8EPJRkG/4lBXIoKjv30iTN6/M4db/1cmIwCxcXDBwJ8SOm6Y9H0es7OpNH
	 UsmxUM8G1algdX+Es2HLaRn7rjjQ8JmtVoiEJlTx+HL1cMnBPgHiFA2GeJOj+l5s05
	 k1++sYg74Ytv9B3HM0cy/WUF1U6a7/ij0dKVMC40G64JBZ01ICmYVoo6EmVfNkNgn6
	 Kp0wbcgYm1fNCt40sKBzDf3vxxAzzP0xlK0FOqj7d9DXFvm532KCdRHMfxUW3SVLMX
	 TEgcfOEzqYc+rgwP3DLOXMbroHI+DMuBQ/yU04hxT3IitZ7BHkBj1IjkpnLMzF51d/
	 H5rVjIvfPmIog==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
Date: Wed,  5 Mar 2025 16:49:52 -0600
Message-ID: <20250305224952.2995841-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove "regulator-ramp-delay-scale" property which is both unused in the
kernel and undocumented. Most likely they are leftovers from downstream.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, please take this directly as the NVIDIA maintainers seem to be 
AWOL.

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index c56824d7f4d8..0ecdd7243b2e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -266,7 +266,6 @@ vdd_soc: sd0 {
 					regulator-max-microvolt = <1170000>;
 					regulator-enable-ramp-delay = <146>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -281,7 +280,6 @@ vdd_ddr: sd1 {
 					regulator-max-microvolt = <1150000>;
 					regulator-enable-ramp-delay = <176>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <300>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -296,7 +294,6 @@ vdd_pre: sd2 {
 					regulator-max-microvolt = <1350000>;
 					regulator-enable-ramp-delay = <176>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <350>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -311,7 +308,6 @@ vdd_1v8: sd3 {
 					regulator-max-microvolt = <1800000>;
 					regulator-enable-ramp-delay = <242>;
 					regulator-ramp-delay = <27500>;
-					regulator-ramp-delay-scale = <360>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -326,7 +322,6 @@ vdd_sys_1v2: ldo0 {
 					regulator-max-microvolt = <1200000>;
 					regulator-enable-ramp-delay = <26>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 					regulator-always-on;
 					regulator-boot-on;
 
@@ -341,7 +336,6 @@ vdd_pex_1v05: ldo1 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 					maxim,active-fps-power-up-slot = <0>;
@@ -354,7 +348,6 @@ vddio_sdmmc: ldo2 {
 					regulator-max-microvolt = <3300000>;
 					regulator-enable-ramp-delay = <62>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 					maxim,active-fps-power-up-slot = <0>;
@@ -371,7 +364,6 @@ vdd_rtc: ldo4 {
 					regulator-max-microvolt = <1100000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 					regulator-disable-active-discharge;
 					regulator-always-on;
 					regulator-boot-on;
@@ -395,7 +387,6 @@ avdd_1v05_pll: ldo7 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <24>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
 					maxim,active-fps-power-up-slot = <3>;
@@ -408,7 +399,6 @@ avdd_1v05: ldo8 {
 					regulator-max-microvolt = <1050000>;
 					regulator-enable-ramp-delay = <22>;
 					regulator-ramp-delay = <100000>;
-					regulator-ramp-delay-scale = <200>;
 
 					maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
 					maxim,active-fps-power-up-slot = <6>;
-- 
2.47.2

