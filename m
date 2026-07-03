Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39A3DF009
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 14:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089647; cv=none; b=YqmlJ4ggvC6GVZT32GOfMxt6SkZkr8vRGSN13qpe3sy7qbqmeRF6QHirOZd4nhaoSNDjsTJfY6ZVWpbJ+webGet9QHl2N/jPOSQSwYETYLANxTWtefGM6RoEfg2gKz3vcQJmH2UQVf3wRTQbZtZ+GjmLvFSGSU3L2ZjpzfAaOVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089647; c=relaxed/simple;
	bh=3+JLXX31hxBviKs2GIime30uUFEJsrl9Gdp+NubrPsM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qxpxMmJavpzVKOlZYOBGaiDFfExsSF0af2zsnUOIUTlCFUl8divNnWs99RkkUeTp3R23C7CtEADAI0Tf9Jy7aUdftF37bM+zXejJPVNyC5JMB3U86UgwixA+4pNOJI7POZs+wu+DkmYdpnbt+r/5sIVgBYUvcxqeaMcFG/+4+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2CiCfqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2CiCfqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D70B1F000E9;
	Fri,  3 Jul 2026 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089645;
	bh=Pf36wxJupHA4Xe6B/0FbJUyw03mQL+xsO5YFqwowTBc=;
	h=From:To:Cc:Subject:Date;
	b=U2CiCfqCnNyy/YHBAdxdljAnfG3k7NegO4Wn7foBU7NR2aRSeV3pX1zV1NVr27gd0
	 hpsTxJRicXbv7EH0SpA7q9DxAljSe+tBnLWujFOmDKA7z80mIpBpx3NthgNVJFoiIo
	 1w2KyP1Txy5TxIU2c1EIy+66F6MpRG76hgAQM6K3mMoek9qROuMT+BATVvbHkOQcNt
	 g4ucBImatA1y2kGPWq7dHp+Rptk185M0K3kMxL406SKp9EEbD3JuiwmpmcqZCNg86W
	 gqvRoh/0bnOn7rOlRnOorKgBKjmRkuPcwXNxjJmrOpCW7Z7L+Q7UKaMsFgZqU1ijva
	 wMXRIwOci8Sqg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] soc/tegra: pmc: Fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:35 +0200
Message-ID: <20260703144042.1190046-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
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

The following changes since commit 2cee7da9743396aff1fd13124109c78975c92ad8:

  soc/tegra: pmc: Add Tegra238 support (2026-05-31 07:21:15 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-pmc-fixes

for you to fetch changes up to 813e034925814858cc52e7de321ec4848314e15d:

  soc/tegra: pmc: fix #ifdef block in header (2026-06-22 08:52:46 +0200)

Note that this contains a patch for the Tegra DRM driver that I'm taking
through this tree rather than drm-misc because the commit that it fixes
came in through the Tegra tree as well.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: pmc: Fixes for v7.2

This contains two fixes, one for a bad error unwinding path and another
for an #ifdef block that wasn't covering all the combinations correctly.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc/tegra: pmc: fix #ifdef block in header

Christophe JAILLET (1):
      drm/tegra: Fix a strange error handling path

 drivers/gpu/drm/tegra/sor.c | 6 ++----
 include/soc/tegra/pmc.h     | 5 ++++-
 2 files changed, 6 insertions(+), 5 deletions(-)
