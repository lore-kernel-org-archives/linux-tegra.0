Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570841C2EF;
	Wed, 10 Jun 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104206; cv=none; b=ZuNIa/As9SZDrmyxtfDEN98TlKPAOvv0OjlvoxRoO0Cii2Wcz6fAkMaJfpuXBEVaTkoV69ecnLLD/Q/gH1pC/94u2cFkFVpwi20uFP6G4+dmeeQqtK2rEy+h+FahZgOJLT8tLVQGWqW/DBa8L0Cmn5geb2Oi025wKguwnaUDL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104206; c=relaxed/simple;
	bh=UnORoybj1kwAjQwxs/GmgO7PN5XvskdkbObR4fnn0lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGj1itLclSJ1oYeG1KaEt4LRa8tDqBePKbgISV7FGtc2bKNo71Jgxb17cx521/EgnajCFZTaTkbJBxwamopoxk8+1tGyp6OnC6Q9e5foJ9pIfczwIBhKU59UcnsSFkV0qcqpYlU3NPsWDAjtvGUcC1OIjCz6MTZ6KXVbbN5KrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0611C1F00893;
	Wed, 10 Jun 2026 15:10:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] arm64: tegra: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 10 Jun 2026 17:09:54 +0200
Message-ID: <0be8708c53609bb64bfa31d84dffc5c2d56b5679.1781103355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781103355.git.geert+renesas@glider.be>
References: <cover.1781103355.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 04a95b6658caaa92..390609fee09c9da0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4083,7 +4083,7 @@ gic: interrupt-controller@f400000 {
 			reg = <0x0 0x0f400000 0x0 0x010000>, /* GICD */
 			      <0x0 0x0f440000 0x0 0x200000>; /* GICR */
 			interrupt-parent = <&gic>;
-			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
 			#redistributor-regions = <1>;
 			#interrupt-cells = <3>;
@@ -5869,10 +5869,10 @@ tj-thermal {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gic>;
 		always-on;
 	};
-- 
2.43.0

