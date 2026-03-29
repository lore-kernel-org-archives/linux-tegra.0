Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E037E2E1
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797055; cv=none; b=MzFKS3pk14krWWF4Tolk+3SJks2YP+3N2d0OrKgypwSY9gObbmS3sQZtEPqEnwZZKtSyZ0LS8zilh4SoYcqe9/ynikQ0hwzKGQ4euG4G6sIgCQRmzG0kQDdAsWnS2iqAe5IfKSD3CShBArpE0LScNZt9ll5PcYTL3ncMrtJu/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797055; c=relaxed/simple;
	bh=ohMCJ+s4bInP/pmkvfOwZWL0zoadxQwlt8rMN1PDwgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMRUadTE8ny0SptshUO43Zg0ztsHsOz24ydw2R/ojz6YMzXvFyfD3cKZYEPO0ZkQ/wLxOKUtboeDljYvSLfPW4bPGGNNmnDnd+6tbLsnz642aUn47XCYJFGSJjvuhXAJKJfyKG07phJcVE7MdKyqD0hSeiRX8bcysRzeMZMv87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBn0vyJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBn0vyJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF744C2BC9E;
	Sun, 29 Mar 2026 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797055;
	bh=ohMCJ+s4bInP/pmkvfOwZWL0zoadxQwlt8rMN1PDwgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KBn0vyJOCg5l6xh4DCcDUaDzdNNjf6kNMXZLCTWlekLnSuINkPqGHqnUylK12Vw87
	 fHb/vVnkedCLBOmtr/6Nzzo9O2xXCT64UnN9EWEFD8FWIU6avwSfTmZI4BTmqe4Zvg
	 N69owR+OMNHK8n++DeK6a1C0n6tUsxIpQa3fBRqgAULzS23h+v/6K8AiXNYSz00hi0
	 Bo6LlE+nHRHnF61wRb9zutgEd4ThpAvwNRF8DDl8QydcE58U/jhh0n0YZkxyvM0j8x
	 Rd7TQTyHSBEKXJcbw9e0fkOD8jPzhIvYUs5CQBLBuedpALACzDOy7YPUeUJbs2+Wkv
	 +8yXZZuYlCl2A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] soc/tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:39 +0200
Message-ID: <20260329151045.1443133-2-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-soc

for you to fetch changes up to 4b23febb6b11cd06183bed3d21b87ba7d6a8a1e0:

  MAINTAINERS: Change email address for Thierry Reding (2026-03-28 01:41:07 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.1-rc1

A number of fixes went into this for the PMC and CBB drivers. The PMC
driver also gains support for Tegra264 and a Kconfig symbol for the
upcoming Tegra238 is added. The various per-generation Kconfig symbols
are now also enabled by default for ARCH_TEGRA in order to reduce the
number of configuration options that need to be explicitly enabled.

----------------------------------------------------------------
Jon Hunter (10):
      soc/tegra: pmc: Add kerneldoc for reboot notifier
      soc/tegra: pmc: Correct function names in kerneldoc
      soc/tegra: pmc: Add kerneldoc for wake-up variables
      soc/tegra: pmc: Remove unused AOWAKE definitions
      soc/tegra: pmc: Add support for SoC specific AOWAKE offsets
      soc/tegra: pmc: Add AOWAKE regs for Tegra264
      soc/tegra: pmc: Add Tegra264 wake events
      soc/tegra: pmc: Refactor IO pad voltage control
      soc/tegra: pmc: Rename has_impl_33v_pwr flag
      soc/tegra: pmc: Add IO pads for Tegra264

Krzysztof Kozlowski (1):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra

Sumit Gupta (4):
      soc/tegra: cbb: Add support for CBB fabrics in Tegra238
      soc/tegra: cbb: Set ERD on resume for err interrupt
      soc/tegra: cbb: Fix incorrect ARRAY_SIZE in fabric lookup tables
      soc/tegra: cbb: Fix cross-fabric target timeout lookup

Svyatoslav Ryhel (2):
      soc/tegra: pmc: Enable core domain support for Tegra114
      soc/tegra: common: Add Tegra114 support to devm_tegra_core_dev_init_opp_table

Thierry Reding (2):
      soc/tegra: Add Tegra238 Kconfig symbol
      MAINTAINERS: Change email address for Thierry Reding

 MAINTAINERS                          |  14 +-
 drivers/soc/tegra/Kconfig            |  20 ++
 drivers/soc/tegra/cbb/tegra234-cbb.c | 169 ++++++++-
 drivers/soc/tegra/common.c           |   5 +-
 drivers/soc/tegra/pmc.c              | 662 ++++++++++++++++++++++-------------
 5 files changed, 611 insertions(+), 259 deletions(-)
