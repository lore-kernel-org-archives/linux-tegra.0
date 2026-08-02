Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6E184
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785689519; cv=none; b=P/rGpXZ78bQaQcUd3Mx+SWIVqAm3SBYG99mxFVHwQYP8GqXcWn0q/9AuWU3j8BrEZ1QJKhQR08XB3dP6x3r+qmHshFohz1Qtpbm+nUJ88A6lP90+my6GSDFnGXv1T7UC2VQnw3B5JMJwJpmPGNEd5MIItKsjR3ivCPtf1QbNAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785689519; c=relaxed/simple;
	bh=DLl7qCuDabBBsntipFyA57AZA4hGIvSGayJXK/Sq3h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TnZpEbHGmzuAhcg7GQRyis1oPB/FuWCqW3/gmVMwEylNAd1dFSwpzSepkvi17EauFV2oIUqEvQoDvN7xrWXNy3WdjzYAcF9NYx5KtpOejH7ApDyVWtyQ4du9iUJMdLnOwX1enYHywjIm57N5qZWezml/76I+WWnx9RVpbql8FSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1xtCelO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1xtCelO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CBB1F000E9;
	Sun,  2 Aug 2026 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689517;
	bh=aLpW5gyeatCqgQWKADGdyPp0PG5hne5uctT7k5F0+o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e1xtCelOubxggcgyim5AsDat5rCduuOaGe/Rob3ALVg+lNu1GkfnhUyl93xAblFUv
	 NfJG31C8PT3Ws/87UTKdQy2LpKIY9DnZ9aSRVsJZfMNe6+fgR+M6zQIT+kLGeByVN5
	 WCFogF6GYyz8lXxIqtfv95hvPpdhiTz1l8uwRwVYEkj6M1/An1UZLCoGbHMJJiEa3K
	 WOLEBGy0Z/75nNZ/wp/tQ/GFXTnQsH+ODYhSeHkDhtB0+PX1kzGUT+qsbgGlMk4RDj
	 lOgyLIY1e0wA8e4eOp6LsjKRqg/iiUyOLUhzaf2gOcMWI3BN6p0j0zadJYvJ2y8oTE
	 JzZfMsHYBq8Nw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] ARM: Core Tegra changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:45 +0200
Message-ID: <20260802165148.1259649-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802165148.1259649-1-thierry.reding@kernel.org>
References: <20260802165148.1259649-1-thierry.reding@kernel.org>
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-arm-core

for you to fetch changes up to aa5d0900ee9d5772a23316ef129d3c29b497d721:

  ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__ (2026-07-31 17:39:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: Core Tegra changes for v7.3-rc1

We haven't had one of these in a long time, but a __ASSEMBLY__ cleanup
patch and a OF reference leak fix came in that make changes to the core
Tegra code.

----------------------------------------------------------------
Thomas Huth (1):
      ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__

Yuho Choi (1):
      ARM: tegra: Fix OF node reference leaks in IRQ init

 arch/arm/mach-tegra/irq.c    | 9 ++++++---
 arch/arm/mach-tegra/reset.h  | 2 +-
 arch/arm/mach-tegra/sleep.h  | 2 +-
 include/soc/tegra/flowctrl.h | 4 ++--
 include/soc/tegra/fuse.h     | 4 ++--
 5 files changed, 12 insertions(+), 9 deletions(-)
