Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AB30F548
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207716; cv=none; b=TpqwIvnVTvzOI0v7dr4LDuFrUFRmECqmtod2TH2533LnJk7UunG94P+t6pR7D0G+KsigBc1HSEgq/3BOe36IL6qMoAF5Wj/pHb74Xx2drVODDAIFPNqTxC3LzhCxJCiu0FUuzy7KDUzISTGD9LYTk6YmOdPGcLHrITZpnpyjwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207716; c=relaxed/simple;
	bh=hsFJlLyY1/y3DF+PIoeTfncojNZnsTW5HII3ApYNlTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE0r5JWH30ay8Cdd/owTw3jta44uiiKFfG310FKc3GOHaYILAE8Qn6WxtGu8oE0FqHD6+rx9AgFYDNibpHV9Z1xccyXivNGlPtXzAwb7KgqjPdmJoTMgdXqTtrNJe3YsG3Kdup/Ez620VC65So0RhAYjxyiBbLdxoHCQoPMRuV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws2BNiAY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws2BNiAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BC31F00898;
	Sun, 31 May 2026 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207713;
	bh=IZk3JeyirwoLUBXqZzkAqiX9NeVczzoPY8QHoFEOknY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ws2BNiAYg/sWPPhQozVETTwHhfEFNN8TgQs8a/skT4fGzgB6Zm3MGAZLgXXhsPsit
	 lVrajnEgxLBJCmNOIwG0nFLmoX4UXDL05AgjcDnxnh0OejKStNhTuGFqzrlOGhD1uZ
	 gZR10FqeqFdGpxA+cePfPjI6zvC4/INDTmK+nUCZaJuLBYNYiyJa2XtlPDNDYsfiQ1
	 8Bqdc8NjCSPOuhU+64WDQFHtjoNR5u8rKtRN5NPV6LraWXBqghTn1WZcjUpl80ISrM
	 SAXISlzYRpUAoKZk+YQtiduOZ12KTykHer1tk9Unvl4JpCFMy1bHq+nPqioqCczc60
	 vhtA3WojV1XKQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] soc/tegra: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:19 +0200
Message-ID: <20260531060825.1855391-2-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-soc

for you to fetch changes up to 8b8ee2e56f951ccf41d98eebe73195cea487cd48:

  soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info (2026-05-29 14:42:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.2-rc1

These changes update some maintainer contact information, add a modern
way of reading the chip information and cleanup/enhance some existing
code.

----------------------------------------------------------------
Kartik Rajput (2):
      soc/tegra: fuse: Register nvmem lookups at probe
      soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info

Sheetal (1):
      bus: tegra-aconnect: Use dev_err_probe for probe error paths

Thierry Reding (2):
      MAINTAINERS: Move Peter De Schrijver to CREDITS
      Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse

 CREDITS                                           | 10 ++++++
 Documentation/ABI/testing/sysfs-driver-tegra-fuse |  2 +-
 MAINTAINERS                                       |  1 -
 drivers/bus/tegra-aconnect.c                      | 14 ++++----
 drivers/soc/tegra/fuse/fuse-tegra.c               | 14 +++-----
 drivers/soc/tegra/fuse/tegra-apbmisc.c            | 40 ++++++++++++++++++++---
 6 files changed, 58 insertions(+), 23 deletions(-)
