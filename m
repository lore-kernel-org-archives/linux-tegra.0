Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AE379999
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797064; cv=none; b=TQeFU2U9ANGf401kNn8pxVSjV7N2XURocj0s5gyrOWu7uPCpeSodoWDO3ZtYeGyQIQfM2b2Yx/ZTZt2w3lVgjan5WSMPHrNZvfsmLHukVYxaWceKzoqN+obl4rGaEgdvBpPCw9z1E2iKYJjuJO+BY6p8Yrzw/hoYnJOD+OIESbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797064; c=relaxed/simple;
	bh=M0Z1EGRJhk11Ga2j5XNT/BdQe2P0sTVW3/Z0KGEXD+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dQmsF6UfDX+kiyo1sxi+vmeGkSaRlhladldVpMGSs5aZeqioag05p5sRatpVgQ7vwC3WAdOceKPkVLvc0QyQ8QL/FyC6qWXkSdas4m+QPlVjhIRaE2/Hwpl4NvS0tkWSLjFdp79zDalwMD1EdLEjCSEPMvLeq6f0eYmc2Az0+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP148kpI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP148kpI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94977C116C6;
	Sun, 29 Mar 2026 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797064;
	bh=M0Z1EGRJhk11Ga2j5XNT/BdQe2P0sTVW3/Z0KGEXD+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gP148kpIifBN/QiM9Y9Sy3Xf42W9rIziwv7KfS8VaUWrXW+jdq+bkLohGOEVauBx5
	 0wnyP71rweuemwyGbq1gkVagcFFtq/Lqgo9pC1JwgJXLKJU5iV4bGZeGpIoUeBqdSJ
	 tlcwOTUP574abdG1eZTdIfkQQZcSxPatKGPqywKIrDHFXZDDA0iNvuu9AqbPBHPdiZ
	 7GeObhVnM/lY66JvRh4MS8Ms/1rb6KeoLd/HzmtaE9BPmBRkuguC/ugm0ox/hKqV8A
	 TrrKhkU17ywNcEzVluAy8d1V/kZWjmO/k9f8jIjGXDE+6qPSyeFB8wvly3Mpzt3i+K
	 16lWo4PcGYR6g==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Default configuration changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:42 +0200
Message-ID: <20260329151045.1443133-5-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-defconfig

for you to fetch changes up to 21e380f272415387454d81788f2d62642e1fe93a:

  ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC (2026-03-25 10:49:00 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v7.1-rc1

Drop the various ARCH_TEGRA_*_SOC options from the default configurations
since they are now enabled by default for ARCH_TEGRA.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

Thierry Reding (1):
      Merge branch 'for-7.1/soc' into for-7.1/arm/defconfig

 arch/arm/configs/multi_v7_defconfig |  4 ----
 arch/arm/configs/tegra_defconfig    |  4 ----
 drivers/soc/tegra/Kconfig           | 11 +++++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)
