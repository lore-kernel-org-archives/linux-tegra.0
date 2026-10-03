Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF14078C5
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021583; cv=none; b=DEviEVeVnxqRUfGZCsfmn2UvcdaPSM+f60zg/WTrVHVQTtrKOr74DsLutwdK8/twm9Po0CLtOtb36OFvoyDAzwLsK2s70+NEKltEvHa/0FvuBg2upw07MjP+JSPIjmf0knCqmgp5J95XRLX6aC9ZAfHuYMKRA7QJgIIAqbItAy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021583; c=relaxed/simple;
	bh=G8XhxioShejTAX29jJ53hwT4zrUjg1tvAJH6HLO7eMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rQTvtQGPtujGl4sBDyKCBuXhw9dxaNOw7vhmhqSntGIsXTgcdoaJqohHtAmlyNKhaZVIPouWjj8LgncLQJqPGZkMUlKJCLePJzRszPRUaGNtO9xRBH94M1ohaKxaaZWMirm3G2orYkO/YtWrzAaqY7AlvViFVWG+f0XBLqL3SII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+mqO0TO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+mqO0TO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EDD1F0089B;
	Sat,  3 Oct 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021581;
	bh=QQUDK7iQZnXh2lBf7ATl7J/UaIvcvGDIkPs2KRMQAk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n+mqO0TOr77vBtY5/lGabd+8JO8E+Ss6lh2TW12NXZ4q3mGghP5yjuLhQrDE8eE8D
	 7S145Iuf8/zRb8lZFjwdCmLw7qNloUdcTQvs41c6fQlyHO81fl/+FTFbwfjcogCOih
	 n+3wRfJ0ysOmo8AXoKUi/TfY5uo8rkuVIJP1ycn8vdQRcsyLN9YdPY7pnqzgtBq89H
	 2+SByFHcQY6q5NSONE5/3AHklYmMWv+zcZSPnLGU5V3XKqgUq9X/DSyUWk6tlVugbV
	 v5oFaSLoiae9/hDzMBwoTppieOKfj+kmSW5OLP29AqWyooadp1/WCuqDAaKpJ/+4Zh
	 YQujM83GeVAgA==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:21 +0200
Message-ID: <20261003095924.1370238-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm64-dt

for you to fetch changes up to ad4deb2e42ebb94425c003ca3ca39691ebe61e0f:

  arm64: tegra: Add Tegra264 SDMMC1 device tree node (2026-10-03 00:56:24 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v7.4-rc1

This set of changes contain a lot of cleanups to existing device trees,
most of which fix issues with the device tree validation.

There are also various improvements to Jetson AGX Thor and the DevKit as
well as IGX Orin, making all these Tegra264-based devices more capable.

----------------------------------------------------------------
Aaron Kling (1):
      arm64: tegra: Enable DMA Support on Tegra194 QSPI

Diogo Ivo (1):
      arm64: tegra: Move Tegra210 AHUB audio ports/endpoints to SoC DTSI

Jon Hunter (1):
      arm64: tegra: Add the USB Type-C controller for IGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Replace spaces indentation with tabs

Manikanta Maddireddy (2):
      arm64: tegra: Use iommus for PCIe endpoint controllers
      arm64: tegra: Add PCIe wake GPIO for Jetson Orin NX/Nano

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 SDMMC1 device tree node

Thierry Reding (26):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264
      arm64: tegra: Clean up AHUB on Tegra132
      arm64: tegra: Adjust AHUB range on Tegra210
      arm64: tegra: Clean up AHUB on Tegra186
      arm64: tegra: Clean up AHUB on Tegra194
      arm64: tegra: Clean up AHUB on Tegra234
      arm64: tegra: Clean up AHUB on Tegra264
      arm64: tegra: Clean up some whitespace issues on Tegra264
      arm64: tegra: Fix up cooling map names on Tegra194
      arm64: tegra: Fix up cooling map names on Tegra186
      arm64: tegra: Fix up cooling map names on Tegra210
      arm64: tegra: Use consistent key code for force-recovery button
      arm64: tegra: Enable GPIO keys on Jetson AGX Thor
      arm64: tegra: Add thermal zones for Tegra264
      arm64: tegra: Add cooling device on Jetson AGX Thor DevKit
      arm64: tegra: Enable built-in RTC on Jetson AGX Thor
      arm64: tegra: Add FUSE block on Tegra264
      arm64: tegra: Add missing *-cells properties for I2C controllers
      arm64: tegra: Add I2C aliases for Tegra264
      arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM
      arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM
      arm64: tegra: Add thermal sensor for Jetson AGX Thor
      arm64: tegra: Add Tegra132 specific compatible for AHUB

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   22 +-
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    8 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   76 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |    8 +-
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    8 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  113 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1120 -------------------
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1011 +-----------------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 1126 +++++++++++++++++++-
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi |    9 +-
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  |   45 +-
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |   12 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   86 +-
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     |   57 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  106 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           |  794 +++++++++-----
 .../boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h |   20 +
 17 files changed, 2030 insertions(+), 2591 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/thermal/nvidia,tegra264-bpmp.h
