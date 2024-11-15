Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1411D79A5;
	Fri, 15 Nov 2024 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731699291; cv=none; b=BPr7SfJ0jPL2Sz3Usy9xJsexZrNy0ChpmQVTU8e+QR0MHIB1BitHJ+b1LkRkLhCZEIuUgnJN55XjZFXC9T2zFFj3drrbfVuGKVYZS0jlYYr3ATX3PEJqvdABB4oNybr+IkF1wkjjX93BpxHJzR7tzMBI86cF2SStyUzyuHVyDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731699291; c=relaxed/simple;
	bh=5Q9fb8YDBxlFGYuLZvt1DcCGk2Ua47pSnRgtP5m+60M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRHEOkzozmKwtHe74i2ywbbHWPxj/NAOt9rq9JbFYE585+QUCOLSAT3ecpLeNPKV8xsSWpmxh1sVxho8I1jIZhrOb4MCQj3sivkgKLAPt8ZMbPNWN+mDcLIFq7w7vXZ4nRwU1U/+QrLcYPmiKJR0TOwFJpWFXHeQ2kCOKzb4Pgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7SsUaBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7SsUaBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57922C4CED4;
	Fri, 15 Nov 2024 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731699290;
	bh=5Q9fb8YDBxlFGYuLZvt1DcCGk2Ua47pSnRgtP5m+60M=;
	h=From:To:Cc:Subject:Date:From;
	b=V7SsUaBe5yRM1mlp0O37yz41ODpSVlqeplh947rtxHuP2+M8YTemu/akhXBwCds0d
	 UVjwZsHFnoeyPYrcKtxlt5LgBzXammuHPxhv9lk2/iFl+q36eTS+ITzmw9inqVA4Vc
	 MPURP2Ddx+GhFYVBVc3oPiaQpxi9erQcYB/pDGbB1Y2F5VIQ+k0meL9XullVTMMJ3S
	 Aml5kYX4LvZM2KVi4zg6JYSyE0esp5tD0+RQ3+spfItb8zrkCdRDZbAHmZLER39yrD
	 2LFr/OSxE9nd5ALx9G1fG1YRmz575sx3ThxACdP4JO732t+i1gdXPqZhz0RMA22hB/
	 BP56aOCe3haPA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
Date: Fri, 15 Nov 2024 13:34:44 -0600
Message-ID: <20241115193445.3619074-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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
2.45.2

