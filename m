Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115BE3FDBEA
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021577; cv=none; b=etSUQ+dHQn7FS3JKsRC/yWAhFcROMJp+wVp14tjnyiAbFq3HJAtG4ubu/2sZmkTTWZhI7Y1V4eZuVoSA7LYLFgv4G79hr+nmPbCwqFg0aPDzqvTt9DfoIoH26APsNlOaJGUP2e8IK1ptbuY4Fg+TBMvHd2V6T4LdipuRR32yusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021577; c=relaxed/simple;
	bh=IfgmeJ47Oxr65SldEFg6mtycdKNtt0FmCHkcDPmRSak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eBAb4r9OhpOXOrcwFYgtE0vt5YcmgDbyqD1mZ9AaLhpriNghgatjiRHsljZtn4znsOKU+qRtrfhcEONtY+M02BhvUOSABtkvtGNMUUL6m43HQkOZI0dVGwiQ5f+nJ2H0Vaiv1ijfIPeNvvnIMH8GCt/dW0owharE/Pq9eG8AAaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PybIidDn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PybIidDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360551F0089B;
	Sat,  3 Oct 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021575;
	bh=RlLe9ES4mcBqbTqNdhC9FduZlq++oXYrUweaCi2aKHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PybIidDn5ZFmY6k75NMDqG831uJ7YiN1tU55G0VzovC4Ur69bGMgMscBeo7ofyUKW
	 z7/9LMbnPX4D7ti5sy9rYbmj1kvxpxt7KdO5/m59qZGqTM8ls1iZ41QJh23pIz2Vwz
	 5jFpc8c8F2MsxPVqClj3syxMtw1gxHkTlXoDanuIK7i1m9cGpBuzTeiWBitjG5AnRF
	 mdZrMRzMS4zoI5Rv5jATjnabcr59UZwL6IwzvoJsCqNzUJbSYNFaI6TdvwvbIrbK+i
	 fTyxOrcyaSraxsmQSrqcfunBP8dR7p/XCXCES8prKfV+2/y4zSo4gU6rmeEj+MlpSJ
	 yeI5RDPhu6KiQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:19 +0200
Message-ID: <20261003095924.1370238-4-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-firmware

for you to fetch changes up to 1bbcf4a19f1495f769b69e9569d8c1e81df074f5:

  firmware: tegra: Remove redundant dev_err() (2026-10-03 01:13:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware/tegra: Changes for v7.4-rc1

The bulk of this adds ACPI support to BPMP as well as a mechanism to
throttle bandwidth for various high speed interconnects. Some smaller
cleanup and typofixes are also included.

----------------------------------------------------------------
Aniruddha Rao (6):
      firmware: tegra: bpmp: Move channel initialization to helper
      firmware: tegra: bpmp: Add ACPI support
      firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI definitions
      firmware: tegra: bpmp: Add MBWT BPMP helpers
      firmware: tegra: bpmp: Add MBWT sysfs interface
      firmware: tegra: bpmp: Allow BPMP debugfs population to be skipped

Hemanth Selam (1):
      soc/tegra: Fix typos in comments

Pan Chuang (1):
      firmware: tegra: Remove redundant dev_err()

 .../ABI/testing/sysfs-platform-tegra-bpmp          |  48 +++
 drivers/firmware/tegra/Makefile                    |   1 +
 drivers/firmware/tegra/bpmp-debugfs.c              |   9 +
 drivers/firmware/tegra/bpmp-private.h              |  39 ++
 drivers/firmware/tegra/bpmp-sysfs.c                | 207 ++++++++++
 drivers/firmware/tegra/bpmp-tegra186.c             |  14 +
 drivers/firmware/tegra/bpmp-tegra210.c             |  17 +-
 drivers/firmware/tegra/bpmp.c                      | 434 ++++++++++++++++++---
 include/soc/tegra/bpmp-abi.h                       | 165 +++++++-
 include/soc/tegra/bpmp.h                           |   2 +
 10 files changed, 880 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c
