Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17E262808
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785689521; cv=none; b=EFYH1oZFceYRotRvKrSVe0y+YwA6pInSQlAt+rdS7zBVog4yv+BEjS+cxyftQs2BTGVU9qZrDgdDZajk5pLSw6Ie90xC5fH8tdlQAMwyWM6lzvgB6081OE2qQMzQjKWAOwzbqEdLip8e4ut1v5xeecy5FmPzdgnmXGilSOzOau4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785689521; c=relaxed/simple;
	bh=xQiaZNvQD4Q5k3X9baAKnvezLdrI+gQLEIgoNpJue2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQiFUNNgGdaGsXcHWfTEhAxGWG3Cv1Ff4lYywZuW3KhK3NKeqSwcfkFGQkmPrCtuTgSqMEe375TziEn7HOVf/e5PVKAAFYcU1Xx1BDpaL+Ay1mbdOXxNfLcoORSRJkFSy3t0xGGu4T7OdrUlIkGjwjS5nytMY6xlW1IHByMPPLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7y2csQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7y2csQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED7A1F000E9;
	Sun,  2 Aug 2026 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689520;
	bh=sG0etjW1TTaFfFJDT4vpUGJ1qYTZAKtWRAXfYXcyMdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X7y2csQ3YSGCcBQ9e5a0ZN++E+n71Ek5SLuqhnvAAJw0YLwqf/GXjpw+QcRaWhhAM
	 JDsjsFXY/Hmtl5Uh+GVv0unNjBGEsCxmUZUjDxddQiP1JerWO6Dap6PWgvN3nrhqqi
	 bk9ZxAPVB632ukQq8FbdK3hWHFD5pKLkULc+Pmxm/GX1UW1YO+8KCyVu+cSsy3BNE2
	 tGB6W4LA4d/0FcBfBcxf+6OYFdfKPXjX8RCdgi4iBv57olKuMROivze9nwplKLgoCX
	 +LaOcH0gVUvl1W/Y3PqFiQeVM2QUuqKS1n14EYkd1bY54Z2MAObdQbpiXE8WHSRFiN
	 eT4rabI9YzHJg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] soc/tegra: Changes for v7.3-rc1
Date: Sun,  2 Aug 2026 18:51:46 +0200
Message-ID: <20260802165148.1259649-3-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-soc

for you to fetch changes up to 97ffe9cb67ccafb4644f820ef68662217b76c224:

  soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig (2026-07-31 17:56:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.3-rc1

Various small fixes for multi-socket devices, redundant error prints, a
Kconfig dependency as well as a patch to remove FUSE data as an entropy
source.

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Don't register sys-off handler for multi-socket devices

Kartik Rajput (2):
      soc/tegra: fuse: Do not use fuse data as entropy source
      soc/tegra: fuse: Use device-specific instance in suspend/resume

Pan Chuang (1):
      soc/tegra: cbb: Remove redundant dev_err()

Sasha Levin (1):
      soc/tegra: Add PM dependency to SOC_TEGRA_PMC Kconfig

 drivers/soc/tegra/Kconfig             |  1 +
 drivers/soc/tegra/cbb/tegra194-cbb.c  |  9 ++-------
 drivers/soc/tegra/fuse/fuse-tegra.c   |  5 +++++
 drivers/soc/tegra/fuse/fuse-tegra30.c | 24 ------------------------
 drivers/soc/tegra/pmc.c               | 21 ++++++++++++---------
 5 files changed, 20 insertions(+), 40 deletions(-)
