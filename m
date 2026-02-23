Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF3283FCE;
	Mon, 23 Feb 2026 14:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857191; cv=none; b=MrIsLhhPyZq8Kc4i/F1/b940sdaP1epKYlYDsfG/LtiS7XiV/ne3PHMA2oSkF63TEhRxx2Xv4ZS2EpTwr7Wsd4VYv6M+hwQZUv11/QY3GRBYP469HMiKXX6RPpcIpt0Fm41NWVUQVhIf8TnhUq9sJ/rmu4GgUrlxnbvOvjgaxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857191; c=relaxed/simple;
	bh=596tS2/+5oswjpeJVX/nHjT+QXzhCWzDzDbLOoXRH6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHI7zqLsjYQTdrHukDrvLRZ6az1FQFdWeKWAFxHqgvrCwXsbuSlCexgXURh9Zyqvcb1cvorsD6mgtQfi/xUGpvUu9pitpNHSEtofc5uF2ezKXgQ8jGCYp2FMDFVtdaIRk8BQleZ/wQU9YwZdIc2k1DJJoYkYWtRSGRFR5dxoODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uB6UMtiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uB6UMtiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC090C116C6;
	Mon, 23 Feb 2026 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857191;
	bh=596tS2/+5oswjpeJVX/nHjT+QXzhCWzDzDbLOoXRH6M=;
	h=From:To:Cc:Subject:Date:From;
	b=uB6UMtiPjEjkTp6Fmim8G38cPrmf+5qZMxhF6NWu1Wjs92QgUxtm0UCUMBDZAsoG5
	 B9zqo5YXRgCM/v2U3rLkE4wAuPFkTsWV6V9FnJZOuy4ODAI2HiwffWvDAU/0bim80u
	 d5i1BVblB6T7kWPqxBFsGEsTpqvTJ6+8PrmreES1aI3HDdrRjWcz2BPjqhXxldNy3v
	 6whxBka/9ZNx4kyRw/Lx1WJYkXS4kFXDQMsdjiO3Ng4w6XFZ0SVUrj2+/glGXMUq6u
	 Bp1LYpy2brYtOucDguRC/0CtFrvUIpWtOxCEtexhj5nazC3hgI6uXQcBZ+MkKIqtv0
	 l/t4tnHdKFQgw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 00/10] dt-bindings: Various cleanups for Tegra-related bindings
Date: Mon, 23 Feb 2026 15:32:55 +0100
Message-ID: <20260223143305.3771383-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This patch set contains a couple of cleanups and conversions for Tegra-
related bindings. In total, on top of next-20260220, these patches get
the number of DT validation issues down from 184 to just 88.

Note that technically these are at different revisions because they had
been sent out separately a while ago, Some of these have already been
reviewed, but given that they are fairly old I wanted to send them out
in case there are new best practices that these don't include. I've run
all of these through dt_binding_check. Also I've verified that these do
not produce any new warnings/errors while eliminating old ones.

Krzysztof, Rob, I know that you prefer DT binding changes to go through
driver trees, but given that these don't have any driver changes to go
with them, should we queue these via the Tegra tree (or devicetree tree)
once they've passed review?

I plan to pick up the two DTS changes into the Tegra tree since they are
fairly trivial and unrelated to the bindings changes. I suppose they
could've just been a separate series, but I thought I'd post them along
with the other changes since this is all a concerted effort to get the
number of issues down.

Thanks,
Thierry

Thierry Reding (10):
  dt-bindings: phy: tegra-xusb: Document Type C support
  dt-bindings: pci: tegra: Convert to json-schema
  dt-bindings: clock: tegra124-dfll: Convert to json-schema
  dt-bindings: interrupt-controller: tegra: Fix reg entries
  dt-bindings: arm: tegra: Add missing compatible strings
  dt-bindings: phy: tegra: Document Tegra210 USB PHY
  dt-bindings: memory: Add Tegra210 memory controller bindings
  dt-bindings: memory: tegra210: Mark EMC as cooling device
  arm64: tegra: Fix snps,blen properties
  arm64: tegra: Drop redundant clock and reset names for TSEC

 .../devicetree/bindings/arm/tegra.yaml        |  51 +-
 .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ----
 .../bindings/clock/nvidia,tegra124-dfll.yaml  | 290 ++++++
 .../nvidia,tegra20-ictlr.yaml                 |  23 +-
 .../nvidia,tegra210-emc.yaml                  |   6 +-
 .../nvidia,tegra210-mc.yaml                   |  77 ++
 .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 --------------
 .../bindings/pci/nvidia,tegra20-pcie.yaml     | 851 ++++++++++++++++++
 .../phy/nvidia,tegra194-xusb-padctl.yaml      |  39 +-
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml  |   1 +
 MAINTAINERS                                   |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   2 -
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   6 +-
 13 files changed, 1335 insertions(+), 838 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml

-- 
2.52.0

