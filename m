Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D26379999
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797067; cv=none; b=n+xUTpbpifg2t2I/SUuPDA24iIjBtM+m00FnnkUq2RslAD5+2y5fWRsRfwGgu3+loAQnrgTFreQ1gKAVvEiA75pfsloDBtRbIY53iMkLEtIAkM1qJAkV8mTps9ICUzGYaUDkrroFUQ06q83R06GHZtMD2geePg7f7EySm4v/Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797067; c=relaxed/simple;
	bh=uLUM4o+KLJe4YQmeHIHCsOs0ynRLdm3hUXmN7rvPPFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvIITZdcthS8ie77uXFt8pVSfKDlLKcvyrMXVfBXziyfVKn9c2L7Bl+e3vTHudPKtkfueIhaXUOxcv2matT64W9SIHrMJqPvaAHNRXv5WWcCgwL0ocRqfXvcwzqkaQSy7va5KeQr/oTsJftfq76WTTxIkECPc29RRJw6SIWfXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpHv66hL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpHv66hL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58812C116C6;
	Sun, 29 Mar 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797066;
	bh=uLUM4o+KLJe4YQmeHIHCsOs0ynRLdm3hUXmN7rvPPFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KpHv66hLSfg9e8z12WOw30PjF1clNYOndpyZVfBQ7NcAgwDuAHJ1cZywIEFtq2Nap
	 CdiOQ+J3tIPUJP9SyQdeY8IlxfDuvnEzbY2H5I/7NMsf39BGfMaWODgAR1+bLtq/nm
	 6K9C/SgiZ+ZyunoZdytc2IXgkJvNQxjl+QqWxtwtB1GEfYPHcMp6rI2eV8Jsm5E1nz
	 3NSMcLICzlX7C4IT88GqxbnT6geVA03u2fi0N21szbL4Ii3KKeuAnlsj5ezeJFVL8H
	 2/Hgj+GRttUNJx7PxR2/8y+LylFNPaeyFrUVlyHDDiV78FpC8mIDbWD5GuIbIZ9rR+
	 OcdtAVImgjSSg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:43 +0200
Message-ID: <20260329151045.1443133-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-dt

for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:

  arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v7.1-rc1

Various fixes and new additions across a number of devices. GPIO and PCI
are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
it to boot via network and mass storage.

----------------------------------------------------------------
Diogo Ivo (1):
      arm64: tegra: smaug: Enable SPI-NOR flash

Jon Hunter (1):
      arm64: tegra: Fix RTC aliases

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 GPIO controllers

Thierry Reding (6):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      Merge branch for-7.1/dt-bindings into for-7.1/pci
      arm64: tegra: Fix snps,blen properties
      arm64: tegra: Drop redundant clock and reset names for TSEC
      arm64: tegra: Add PCI controllers on Tegra264
      arm64: tegra: Add Jetson AGX Thor Developer Kit support

 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 -
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   6 +-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  12 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 336 +++++++++++++++++++--
 10 files changed, 500 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
