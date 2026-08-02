Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A0184
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785689524; cv=none; b=NvZqWrH7P1m0FjM8dr7c0dI3G48WAQmCNF8P5VaB8YmwVChM7kliTzQPgrsagjemDaAv8sH/VZGyKupgWc7auO7WWllt7VpxzAzGSzqqyFFs2+5pGjB6/9QotBR++ikg53GvhMXfpcc2trYiFmiuC9gAGSn9r1vtjevHQ3fnguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785689524; c=relaxed/simple;
	bh=f6Q7RAXD9fCLJ3Oz64TJ+Uq3RPu8BOXcfO7sJe5eKB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qoixBDqgxnGyvAh6Hx99zYBO2lyJGB//19TmjMOhN6ZieA/QERC+xVxLjWwZhcjre5oXd68QO5xCHhG12uU/nc/r2BKwtBGf68rE9n1HijLD2/XGTvCZW8jdo+ALR/+vuiOvvrrS4BoaNB/p8Tu1qPQMp/UA4g3Uwt83TrkoPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxTYIh/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxTYIh/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD25D1F00A3D;
	Sun,  2 Aug 2026 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689523;
	bh=xg5YiNvc+9iDAWqaWtg2ClRCsBlk2Sx5Fu/cDc87liA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JxTYIh/D+Wt/Iil606xlmNdKS3bPm+U1rutxpG5M2KYdsVrFV2lwihRzeB9cF1sFq
	 ur1ye8IQFlKDw3VwawI/TB41IXbzPmpT2OR2BfDvDYknRLMXJTcf3SzkWsFtErCUvo
	 f6iXiEFUuexY1SAVDViDJNEBUQpIjXpvEgw2EE2y4dDxkQyhqzVPdZYlNiiUaFCt8L
	 tQPgtTsVFJxooYGQC3/AQ1IW3gbTJvRnvJeHU8oADV03fVm/tTWg635CDEe9dVYExp
	 c3rEREWv1pYeJsleavNkMpjYYXj60NO2HjwqmrKjv4V+nWiOwhcx9gWvqcX3gQoG8+
	 Jdvpi0wvWwtvw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:47 +0200
Message-ID: <20260802165148.1259649-4-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802165148.1259649-1-thierry.reding@kernel.org>
References: <20260802165148.1259649-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm64-dt

for you to fetch changes up to 2aedc7afffc61449ddd44bf2a4b3195729cb46ac:

  arm64: tegra: Correct Tegra234 p3740 interrupt flags (2026-07-31 17:55:32 +0200)

Note that this is based on v7.2-rc5 to resolve a conflict in the base
Tegra264 device tree include.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v7.3-rc1

This contains a new device tree for the Lenove ThinkEdge SE70 Edge
Client device as well as a number of fixes and cleanups for Tegra234 and
Tegra194. Tegra264 sees a number of additions to enable more features.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Enable GPCDMA in Tegra264 and add iommu-map

Ashish Mhetre (2):
      dt-bindings: iommu: Fix interrupt type in example
      arm64: tegra: Fix CMDQV interrupt type on Tegra264

Geert Uytterhoeven (1):
      arm64: tegra: Drop CPU masks from GICv3 PPI interrupts

Jiqi Li (2):
      dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string
      arm64: tegra: Add Lenovo ThinkEdge SE70 device tree

Krzysztof Kozlowski (3):
      arm64: tegra: Correct Tegra194 p2972 interrupt flags
      arm64: tegra: Correct Tegra234 p3737 interrupt flags
      arm64: tegra: Correct Tegra234 p3740 interrupt flags

Mikko Perttunen (1):
      arm64: tegra: Add Host1x and VIC on Tegra264

Prathamesh Shete (1):
      arm64: tegra: Add pinctrl nodes for Tegra264

Sumit Gupta (1):
      arm64: tegra: Populate CPU and L2 cache nodes on Tegra264

Suneel Garapati (1):
      arm64: tegra: Add GTE nodes for Tegra264

Thierry Reding (3):
      dt-bindings: gpu: host1x: Fix email address
      Merge branch 'for-7.3/dt-bindings' into for-7.3/arm64/dt
      arm64: tegra: Properly sort devices on Tegra264

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml |   2 +-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |   2 +-
 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 .../dts/nvidia/tegra194-lenovo-thinkedge-se70.dts  | 111 ++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   2 +-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |   2 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |   2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  10 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 577 ++++++++++++++++++---
 14 files changed, 632 insertions(+), 92 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
