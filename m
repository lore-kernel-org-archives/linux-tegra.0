Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC33793AD
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797061; cv=none; b=IqWwi40r3UCah+hAqJHk8LUQSD8jUAGhpq9y0+PE5DA8oAIrC03FwLhi/u4WINHEV42Yd/unWaSJaD8kA4pzOeYdnU4327auc5afyLB5gq8UbPdJcd0d1RTYTFPbY0n6wjWFWwz7oA4GW6O1yTlYe8AlFZEozks/+TyingTfar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797061; c=relaxed/simple;
	bh=1V/ZmE92fpR02Fi0xVWMi+6+p0QBtEM2/+YEMgeWtQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hd4X04qYDWuxWCAVqV2LmXK9SiPbWIUH3zwXa5ihkbYwI0czCC7bjSacEbS/6nTVMrGSkAwamj+SaOMsKdmeTQxT2tPB/eqJ47Q8AqWb4SpQOTQ/BHOcGbOwxMQmGc8Utb/4W7ZTIMrK/bvHOXi1+cb6HLHjJQcMjdSyaxkoRWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXVJmdvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXVJmdvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DBFC116C6;
	Sun, 29 Mar 2026 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797061;
	bh=1V/ZmE92fpR02Fi0xVWMi+6+p0QBtEM2/+YEMgeWtQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXVJmdvRc4VDmPDKXgJhIms9hL6UNTQnVa44SQacZPTnvMB53IY1x7suwXpA7TDTn
	 f/jBZ7b6t2BcoPALEmuE8+vLTb+CknqR1s7VaLLF/wdrwBUaxZL5mj2vpEUSZhyl2o
	 L0eHbv5IvER9f16erJz4ZsS9CuxtQobUVucJ9b140dVBcnDoMy9VUTo0wAYpMNVyiv
	 7g09OXp3q4jS5Y84y2ejLk9kuvyH1ojwMsvGZiC7D9F5UwVmWtqv7dexqIGWOFSNnb
	 LYuvbKrPC1aWnLiMGeDSpj1ixMf838sOIkLt4R/7i/Dmb9ROs0z43pka46TYcGMv8U
	 iLJj6YYTSgUfQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:41 +0200
Message-ID: <20260329151045.1443133-4-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-dt

for you to fetch changes up to ce74a6c6d88ba9ee29a6b99ac97ffcded577c85d:

  ARM: tegra: paz00: Configure WiFi rfkill switch through device tree (2026-03-28 00:56:36 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v7.1-rc1

Various improvements for Tegra114 boards, as well as some legacy cleanup
for PAZ00 and Transformers devices.

----------------------------------------------------------------
Dmitry Torokhov (1):
      ARM: tegra: paz00: Configure WiFi rfkill switch through device tree

Svyatoslav Ryhel (8):
      ARM: tegra: Add SOCTHERM support on Tegra114
      ARM: tn7: Adjust panel node
      ARM: tegra: lg-x3: Add panel and bridge nodes
      ARM: tegra: lg-x3: Add USB and power related nodes
      ARM: tegra: lg-x3: Add node for capacitive buttons
      ARM: tegra: Add ACTMON node to Tegra114 device tree
      ARM: tegra: Add External Memory Controller node on Tegra114
      ARM: tegra: transformers: Add connector node

 arch/arm/boot/dts/nvidia/tegra114-tn7.dts        |  13 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi           | 221 +++++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts       |   8 +
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts |  21 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts     |  23 +++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts     |  33 ++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi      | 174 +++++++++++++++++-
 arch/arm/mach-tegra/Makefile                     |   2 -
 arch/arm/mach-tegra/board-paz00.c                |  56 ------
 arch/arm/mach-tegra/board.h                      |   2 -
 arch/arm/mach-tegra/tegra.c                      |   4 -
 11 files changed, 482 insertions(+), 75 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-paz00.c
