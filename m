Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE674052D4
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021580; cv=none; b=YlgSNcw/Jh7LcaWR458MmlWaTC3SvLcMXMecyAcnpQfUmv1pRlpVjsjBIV3yhLmj23Jzkjp2ak7MZVGzldHy7kd7wsNBfnuYoIImNJ7PMywBsjYOi/ZoPEktLJH6TLfjoWLjo03Ft2PFpQ8SMoTjQnGAJx0Os/ZjDu8nFJ1s7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021580; c=relaxed/simple;
	bh=TO1OFXn140rsQwaJPA3mHkLTkhi5qr5QsGsdvz1BAt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D5EYfedW4hYUxgxEcA1xEfT09c+cRjHK56dXbHUpubR+ZNjrQeUFuaaihS4fFVV0QPMxTIKpwy6szvBU5Np+eJRK+OZ2MVc4P9XC0N3QbSmK3qntb6zT8LJWOUO+GLVqLXDV1JlfKERSEebLBwW+xggkdkcwVQbyWZPF4xGnigk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQEzY9Aa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQEzY9Aa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A1C1F0089B;
	Sat,  3 Oct 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021578;
	bh=zDa65J8U+gkeDjNb7lapYrPffOrSP1UGKdKfaTp+xMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQEzY9Aa3AgifVv00F/pQntz1+yvProCfizNPoMYmPmTpZbQwZ6QqCKYQxUBOH4RO
	 nD/Wd4rBsn36YdmgLVM0ezyWbdIymOP9HCNtfPUaxGz0hpN/R18aQAJ7pwTChNQD62
	 Edk7slFhrTvxZk3tIIILMS6mGCDpdgzlQb8KgdJL1jm9xc93OKmSVLwRGrNJqQT8LA
	 NX1ZRYdoSM2TwpmmaMc3sdrDkM19ckXpjq1gJSvGFi0+X8AEnf7dDiDW1DsB2nRJ6O
	 erjbNvSV6uBC1TMjBbcOvbulWN6G/Zi8//ffByYfUYvFk7vbLfdGmal4iA3MgH+ECt
	 23OgsGVVN5lkg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:20 +0200
Message-ID: <20261003095924.1370238-5-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-arm-dt

for you to fetch changes up to c79aff01aeda4885cf707c17eede8d19617b78f1:

  ARM: tegra: lg-x3: Add backlight LED controller node (2026-10-02 00:50:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Changes for v7.4-rc1

The TF701T and LG X3 devices see a lot of updates and device trees are
added for the Motorola Atrix 4G and Droid X2. The core power supply is
added on Tegra114 devices to make power domains work properly. AHUB on
Tegra124 is cleaned up a bit.

----------------------------------------------------------------
Mikko Perttunen (1):
      ARM: tegra: Add core supply for Tegra114 boards

Svyatoslav Ryhel (19):
      dt-bindings: arm: tegra: Add Motorola Artix 4G and Droid X2
      ARM: tegra: tf701t: Configure CPU DFLL clock node
      ARM: tegra: tf701t: Add core-supply to PMC node
      ARM: tegra: tf701t: Add MC and EMC timing nodes
      ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
      ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
      ARM: tegra: tf701t: Tune MMC devices
      ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
      ARM: tegra: tf701t: Complete power sensor node
      ARM: tegra: tf701t: Configure UART-B line used for GPS
      ARM: tegra: tf701t: Add chosen node
      ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2
      ARM: tegra: lg-x3: Adjust WiFi node
      ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
      ARM: tegra: lg-x3: Lower supported suspend mode
      ARM: tegra: lg-x3: Add light sensor node
      ARM: tegra: lg-x3: Add flash LEDs controller node
      ARM: tegra: lg-x3: Add haptic engine node
      ARM: tegra: lg-x3: Add backlight LED controller node

Thierry Reding (4):
      dt-bindings: memory: tegra: Fix Tegra132 compatible string
      dt-bindings: fuse: Document compatible string for Tegra264 FUSE
      Merge branch 'for-7.4/dt-bindings' into for-7.4/dt-bindings
      ARM: tegra: Clean up AHUB on Tegra124

 Documentation/devicetree/bindings/arm/tegra.yaml   |    6 +
 .../bindings/fuse/nvidia,tegra20-fuse.yaml         |    1 +
 .../memory-controllers/nvidia,tegra124-emc.yaml    |   10 +-
 .../memory-controllers/nvidia,tegra124-mc.yaml     |    1 +
 arch/arm/boot/dts/nvidia/Makefile                  |    2 +
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts  |  885 ++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts      |    4 +-
 arch/arm/boot/dts/nvidia/tegra114-roth.dts         |    4 +-
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts          |    4 +-
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   16 +-
 .../boot/dts/nvidia/tegra20-motorola-daytona.dts   |  107 ++
 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi | 1194 ++++++++++++++++++++
 .../boot/dts/nvidia/tegra20-motorola-olympus.dts   |  108 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |    5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |    5 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  106 +-
 16 files changed, 2399 insertions(+), 59 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-mot.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-motorola-olympus.dts
