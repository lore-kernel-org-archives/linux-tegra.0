Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5A30CDB6
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207723; cv=none; b=kLOggR/HbvTyzMfB4rg0aMel+1ZdEEnwBhyFL0JwBkvE+hIjLVO54AFrKiFxmLvq/kneWvH/AV6owlnevh2C8XwZkkBwt8nj2OnJTOx9mQjBx8U+SAR+cZNPxpRXptjhBVxtvX7YNfj2sZdUG1vfzHvLKD+2zaDoNyl+lmq8FFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207723; c=relaxed/simple;
	bh=MEsE91thNmIzE74JmiuSkux0TTZrEDaZDlr43IEyAXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMltqwTHsdN/+gRZ+y6U6PkfAeOyA5QdsOBK9Na+S5n1ea4BZUxA+PAS3OBqj2Y2agkFQAQodCayu8HPlM8IKP/clQHiMyJvjPVLbKW7RFq5lbqiTkzITemri1qxvAhHP4HNHD71MCnSn6m8vJPRI001tgdkh/lfz5fhp8538dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL5zcCN9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL5zcCN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC671F00893;
	Sun, 31 May 2026 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207722;
	bh=EXedMa3F9/2rK2uuNFkuGL7VYJbj96K9c+KvBlzH5Lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fL5zcCN9wlgl719jz+O8g0FbMKXNGhkumsMP9mJPA+9l7+Ua+0rOnTW8RMFt6Z/fT
	 jKwBWtJfI9KkKurUx4JXUQ5DDuERHLU3StRYakyOwE+WJhKOjDRzQpL1BoCjUaCJgt
	 MooLA7MYtIPps+M9/R3yp8HGqA+6HriesKehH7Gz/A5V4GktC/8T1xP7qGbZH1uLv2
	 mGPc7nEXyOC3VcBFvTqs6EQxGM0Zo1w1jN/xnI3i/Z+QpTZbaoC8RmV+sWTIa1v0MV
	 6+/9Ba1xGXOFL0OSXc7yDkqMnURqyT0XLbAs/Rh2EDCTgqiqUAXIofNTVwqe/d/0yS
	 hKPBmH6in1ykQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Device tree changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:22 +0200
Message-ID: <20260531060825.1855391-5-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-arm-dt

for you to fetch changes up to 774bc2764647cfd6b65727cfa978d809f11df392:

  ARM: tegra: tf600t: Invert accelerometer calibration matrix (2026-05-29 14:36:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v7.2-rc1

The bulk of this is various improvements for some of the older ASUS and
LG devices, but there's also support for interconnects on Tegra114 to
help improve memory frequency scaling.

----------------------------------------------------------------
Brian Norris (1):
      ARM: tegra: Add #{address,size}-cells to Chromium-based /firmware

Ion Agorria (1):
      ARM: tegra: p880: Lower CPU thermal limit

Svyatoslav Ryhel (13):
      dt-bindings: memory: Document Tegra114 Memory Controller
      dt-bindings: memory: Document Tegra114 External Memory Controller
      ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON device-tree nodes
      ARM: tegra: Add DC interconnections for Tegra114
      ARM: tegra: Configure Tegra114 power domains
      ARM: tegra: lg-x3: Complete video device graph
      ARM: tegra: lg-x3: Set PMIC's RTC address
      ARM: tegra: grouper: Add support for front camera
      ARM: tegra: transformer: Add support for front camera
      ARM: tegra: transformers: Add connector node for common trees
      ARM: tegra: tf600t: Configure panel
      ARM: tegra: tf600t: Drop backlight regulator
      ARM: tegra: tf600t: Invert accelerometer calibration matrix

Thierry Reding (1):
      Merge tag 'memory-controller-drv-tegra-dt-bindings-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into for-7.2/arm/dt

 .../memory-controllers/nvidia,tegra124-emc.yaml    |  174 +--
 .../memory-controllers/nvidia,tegra124-mc.yaml     |   31 +-
 .../boot/dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |  157 +++
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi        |    5 +
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts      |    5 +
 .../nvidia/tegra20-asus-transformer-common.dtsi    |   22 +-
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |  128 ++
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |    4 +-
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi       |    4 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts   |   71 +-
 .../nvidia/tegra30-asus-transformer-common.dtsi    |  159 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |   41 +
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |   46 +
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |  157 ++-
 include/dt-bindings/memory/tegra114-mc.h           |   67 +
 16 files changed, 2302 insertions(+), 208 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
