Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7025F7A9
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207718; cv=none; b=Il08yPIqZ9BS/tOUdBqmtK03NBAlbfhNFt5gr2wi6bWPj1IUuIuqRJAqBXZudDZKIkN7fH75YW+xOkcIBS0ApsoVrc3dCdwVaKOFDD2vfsS7cg3mPynEKwCpSIe5U0p0SGG9b0yslZAjscagWvH38bkyrgE/m1q1jsE0U48Jgzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207718; c=relaxed/simple;
	bh=nnzWa2QOaCNn/MdWGP0/k/o4JnAzrgs0PDVdMhw6MXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y79J/vJbtA/inDyg7koBoEsbR7205ypeNiUVKWEKBVbGS7AbZ1Nj2WeXhtCnpIfUS9eFp0zeOU0Ee0pyFhKTw54vKnO+nIJQXqZDzo9+YzYdunxW9Ukop+IkiP5NuVlnBC+fQXcrHozY0phZCZGHbEi8owCOUmACgC9uv5GG5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBQFc99r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBQFc99r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBF91F00893;
	Sun, 31 May 2026 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207716;
	bh=fEQdMvhQaZH+w/Xip+f4KJnuDYLdQkH56ziSK2nQiBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZBQFc99rVeEuolU/v41n34dpXjjOijgAlp/iKxFDbCglH2f/22mx8zlyfkTtSQYZD
	 K+CHYHOUa4susBQUDr04Lpuo5EEoZOTOIvQe0wG3cxcACqhoddHIaD+tooE5TdNlhA
	 51OiXNCz9ptMq7JuLKsCJYtAVyiiqINyNay3MIfhsR5HlAPuBCMTMfwGrPzT//IL4+
	 FKKAwV8lV8himzVPFEYcxCYl/Ocjh4DN4bFnIMbEnP3kMy3kz19e6TOqrjwjhWdGRg
	 FmOwi17YTXbLWxhK0UU75B1h/GeCbvVQ+JnBDBnhL6Y/jgfdHLF4JOTMFycVJKY7Hs
	 ykE1JaVHVk2dw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] soc/tegra: pmc: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:20 +0200
Message-ID: <20260531060825.1855391-3-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-pmc

for you to fetch changes up to 2cee7da9743396aff1fd13124109c78975c92ad8:

  soc/tegra: pmc: Add Tegra238 support (2026-05-31 07:21:15 +0200)

I've split this out into a separate branch (it would typically have been
part of for-7.2/soc) because it contains cross-subsystem patches, so the
separate branch would make it easier if it ever needed to be shared.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: pmc: Changes for v7.2-rc1

The bulk of these changes converts existing users to the modern variants
of the API that take a PMC instance as argument. This completes the
transition to multi-instance support, which then makes room for cleanups
and restricting the remaining legacy APIs to 32-bit platforms.

Some changes in this set also clean up powergate debugfs and restrict
the power-off handler to be installed only where appropriate. Lastly,
support for Tegra238 is added.

----------------------------------------------------------------
Diogo Ivo (1):
      soc/tegra: pmc: Restrict power-off handler to Nexus 7

Jon Hunter (1):
      soc/tegra: pmc: Populate powergate debugfs only when needed

Prathamesh Shete (1):
      soc/tegra: pmc: Add Tegra238 support

Thierry Reding (9):
      ata: ahci_tegra: Explicitly specify PMC instance to use
      drm/nouveau: tegra: Explicitly specify PMC instance to use
      drm/tegra: Explicitly specify PMC instance to use
      media: vde: Explicitly specify PMC instance to use
      PCI: tegra: Explicitly specify PMC instance to use
      usb: xhci: tegra: Explicitly specify PMC instance to use
      soc/tegra: pmc: Create PMC context dynamically
      soc/tegra: pmc: Remove unused legacy functions
      soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard

 drivers/ata/ahci_tegra.c                           |  17 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   9 +-
 drivers/gpu/drm/tegra/dc.c                         |  14 +-
 drivers/gpu/drm/tegra/dc.h                         |   1 +
 drivers/gpu/drm/tegra/gr3d.c                       |   9 +-
 drivers/gpu/drm/tegra/sor.c                        |  16 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c      |  15 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h      |   1 +
 drivers/pci/controller/pci-tegra.c                 |  19 +-
 drivers/soc/tegra/pmc.c                            | 648 ++++++++++++---------
 drivers/usb/host/xhci-tegra.c                      |  38 +-
 include/soc/tegra/pmc.h                            |  81 +--
 13 files changed, 507 insertions(+), 363 deletions(-)
