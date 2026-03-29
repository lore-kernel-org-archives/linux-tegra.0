Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E910437AA83
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797053; cv=none; b=Q/G0Rf8nnIA42XYIw3ueVz4IqkTLrwsR/WGWT+LG//hq5PvAwc48aQIWPg5lIXGqrFGy99uV03AgKmQQuMp9/bSa/h4UTjMjDbeeeAkwmTrQN1bh132Y3TobDzBLfmIcbWEvhKBSps7MvFLwucFMs0wg2T8Bk3AIbh9a9XGutYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797053; c=relaxed/simple;
	bh=P2wTGkHTJGDVrYxmEmU2/P6KaIGmZDeFXomL2edPRdg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PJkb+vJrrjHMUXR7RvyM/5BAPIBkfMYvz6h5eE/UmwBiiqLwIRqryHrskTC/qZXtHhaPC+zkcM+cXnXB/bvSEbWGfgj/PLqr4a/gNjRL03dSG0AI6ohfDmBTQS2R7V9mlv+W5gMELtZLJboVJGZpvsrAl8BzFMguiqLR9fTzHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwqnF1ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwqnF1ou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A824C116C6;
	Sun, 29 Mar 2026 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797052;
	bh=P2wTGkHTJGDVrYxmEmU2/P6KaIGmZDeFXomL2edPRdg=;
	h=From:To:Cc:Subject:Date:From;
	b=iwqnF1oubbdzl/60R4ybE+vt5J4BI7zfIck5GNPX8r9Fu+FW2CjuAbEMfT8edc4dC
	 SUl225X87kEARiv1UBRoK+uGlDBMrppwwZ0W5rMoWw1bskFj7uN2tMA6wQQOVcRhMC
	 +mf8pYui1pukoqFY7A/MpyYDxB3sKmFLZdBvVA3ED+S29YzkvMHLX1fA09mxqmjJ+N
	 ydZxZivknIPuQpa+0cRwSpKwE08lrHNrsV7DritYX/IfDjG0yA36XOtmPQ7F+RI9hL
	 wR35x4VI1xIprRbDgDdYB+kJXOUw7SgBdnr1WJHZM6rChtYcSS2ook5fOUldhpEvoh
	 eZe8Fi0K6RAKQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:38 +0200
Message-ID: <20260329151045.1443133-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-dt-bindings

for you to fetch changes up to bed2f5b4de6c6fd8f8928f6373ad92e8795c370f:

  dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit (2026-03-28 01:05:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.1-rc1

This contains a few conversions to DT schema along with various
additions and fixes to reduce the amount of validation warnings.

Included are also a new binding for the PCIe controller found on
Tegra264 as well as compatible strings for the Jetson AGX Thor
Developer Kit.

----------------------------------------------------------------
Sumit Gupta (1):
      dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings

Svyatoslav Ryhel (1):
      dt-bindings: display: tegra: Document Tegra20 HDMI port

Thierry Reding (9):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      dt-bindings: phy: tegra-xusb: Document Type C support
      dt-bindings: clock: tegra124-dfll: Convert to json-schema
      dt-bindings: interrupt-controller: tegra: Fix reg entries
      dt-bindings: arm: tegra: Add missing compatible strings
      dt-bindings: phy: tegra: Document Tegra210 USB PHY
      dt-bindings: memory: Add Tegra210 memory controller bindings
      dt-bindings: memory: tegra210: Mark EMC as cooling device
      dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit

 Documentation/devicetree/bindings/arm/tegra.yaml   |  56 +++-
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml    |   4 +
 .../bindings/clock/nvidia,tegra124-dfll.txt        | 155 -----------
 .../bindings/clock/nvidia,tegra124-dfll.yaml       | 290 +++++++++++++++++++++
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |  13 +-
 .../interrupt-controller/nvidia,tegra20-ictlr.yaml |  23 +-
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   6 +-
 .../memory-controllers/nvidia,tegra210-mc.yaml     |  77 ++++++
 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++++
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |  39 ++-
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml       |   1 +
 11 files changed, 649 insertions(+), 164 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
