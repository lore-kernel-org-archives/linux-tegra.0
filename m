Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545730DECB;
	Thu, 22 Jan 2026 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088338; cv=none; b=aAS4POfG1l3pXYKqwWqtX+ewIM61bUMz/sm2RvYd9Mu7TFhXCJieINlSKnmh+Deywkzk72fAFlt5wNfWZ8ZX1M9P8iJWVretycHw9qSf2a2+3aQ5k5+sdXdsflzrhmkzzuvhxn9foiug0m6mr8AAk1r88JlBxZeHoKTgaGt3Oc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088338; c=relaxed/simple;
	bh=Okir0R3xIu+S1VzwVKG7Y+G7aSI3BC2jqcJVPSkJfZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQGivJD8uMospCvjrO34vGbDKeVUFG80BPxs/qmrzq/RMwbPoDkecOgBM1ZNtufrZUTfFbQLE6TiS6WqrBWPB1wsXwoiGEerYFtLHEX2fz7bkbLQ4f1AevcNaeBvdSycQCKK9pIJ1B4LLHEi3Bl6tUvqj/aqPWdlRwxnfAH2WAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtC5fY7i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtC5fY7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7D9C116C6;
	Thu, 22 Jan 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088337;
	bh=Okir0R3xIu+S1VzwVKG7Y+G7aSI3BC2jqcJVPSkJfZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=TtC5fY7inLZg70y9J8Yu1utpwP/PgjRHfobOODCmZKcUytFxdm3+af9+2FUidGfoW
	 hYfnrPf6T1n704xTaItn5AiBJECHH/35kIVZZ9wVezCpolzsirYZGRHiyLSfYAeRg0
	 EWSd1pBgUHP0sIK3uWpBNU6dqzuxiPvG1B0qM1NqjjxHmzHAynU6gnM57Wrg7oCoPz
	 mSN4LuLAgK/NEFWv3insMgpOZz6BJHbeMICBWalDVNufBVEIs8lOyWDFYXtxUgTEec
	 y8VHFrFynJes8zHyNvDcXOQ7vhFeFJyoPnsQG75JDXOLUmB2BNcWBCPBoXQ3lkU1E9
	 OOOUf4wSpmd/w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Change email address for Thierry Reding
Date: Thu, 22 Jan 2026 14:25:35 +0100
Message-ID: <20260122132535.3772231-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Use the kernel.org email address as a level of indirection to enable
transparent switching of providers if necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..0268186ab1c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8515,7 +8515,7 @@ F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
 DRM DRIVERS FOR NVIDIA TEGRA
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Mikko Perttunen <mperttunen@nvidia.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-tegra@vger.kernel.org
@@ -20010,7 +20010,7 @@ S:	Maintained
 F:	drivers/pci/controller/*mvebu*
 
 PCI DRIVER FOR NVIDIA TEGRA
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 L:	linux-tegra@vger.kernel.org
 L:	linux-pci@vger.kernel.org
 S:	Supported
@@ -25629,7 +25629,7 @@ F:	include/linux/tee_drv.h
 F:	include/uapi/linux/tee.h
 
 TEGRA ARCHITECTURE SUPPORT
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
@@ -25661,7 +25661,7 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
 
 TEGRA IOMMU DRIVERS
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 R:	Krishna Reddy <vdumpa@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
@@ -25682,12 +25682,12 @@ F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
 F:	drivers/mtd/nand/raw/tegra_nand.c
 
 TEGRA PWM DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 S:	Supported
 F:	drivers/pwm/pwm-tegra.c
 
 TEGRA QUAD SPI DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 M:	Sowjanya Komatineni <skomatineni@nvidia.com>
 L:	linux-tegra@vger.kernel.org
@@ -25705,7 +25705,7 @@ S:	Supported
 F:	drivers/spi/spi-tegra*
 
 TEGRA VIDEO DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 M:	Sowjanya Komatineni <skomatineni@nvidia.com>
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
-- 
2.52.0

