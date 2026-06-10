Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B6425CF7;
	Wed, 10 Jun 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104203; cv=none; b=JQ8AnrurVRnGrz0FDxS1Y4YjNPNAA1ks4qqP98jVhPnXIwQaWnqXvsY/tN8DLp7GX0RJ1npRehFFqis2R4+s9Bl0o6VGbPE+C81SISVitP1ls6SWAb4eJ0lhKhmQ34FHpoilj7yAFIGHBOFu3qzDuuv15JgGtDR53HykU1xmKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104203; c=relaxed/simple;
	bh=MZjsy56YpmJ328jnl4Y1aT7yEkjn4FAnrY5uX3ibE3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEFGtBwJOAvcDV/BKIdVSeKXF73l+0SFTKTuWYXkrCQYc5evaao0wn+6BqxnwBYoY6Zln2iXOvEZczacKKrolMWJv6MT9b2Q/Q0VXjtavKPbHswzhySprJNOr923DT/sZumEuuqEILFWHtW/3UGk9TQZUXLmN+BRNrO5n41h/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D330B1F00898;
	Wed, 10 Jun 2026 15:09:59 +0000 (UTC)
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
Subject: [PATCH v2 1/2] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 10 Jun 2026 17:09:53 +0200
Message-ID: <9967bb6d5a9f371a7e02a16e5bc8057bcdb657a9.1781103355.git.geert+renesas@glider.be>
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
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86933f22647b701a..d4250f51b13092a2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1853,11 +1853,11 @@ apm_sram: sram@2039000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts =
-		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+		   <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
 
-- 
2.43.0

