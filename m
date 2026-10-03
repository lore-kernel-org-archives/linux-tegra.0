Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5A4078C6
	for <linux-tegra@vger.kernel.org>; Sat,  3 Oct 2026 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021574; cv=none; b=DS9q1Qm3itqkLrOhY1cX2IMuwcB5IYpq/YSjWgnV5kIiMLCCb+tjjKbUJO/JONxJGwLxWZfkCGye2f2fpfHP3g9gp49BcWLq3QsE5uHJLYBaGURP8j6DLTieA/xpEqohCbGGTBgBMyF+nz3njBOBjBqrijZCAYDwQbx0sojDdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021574; c=relaxed/simple;
	bh=eghuDPq1JgtV4ZpEapl8uCRBSN/sYcBfeJ+vq6zr198=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CBCvGCM/zKDo1pwlF1bi6OALAQ2R3Rvk71GG042Q/QrGvYYYUCIOV+7p0pI/SKan01gqwETYjIWzepE4g2oZz32IRoDNNp17nbivPrnki58SyMTFwPn1FUP0W1dpjwDyX7gJ3DEfCMQf0APxIIEcbqo6rpzH8iuzfhonXZWirLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJYYDCJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJYYDCJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5835A1F0089C;
	Sat,  3 Oct 2026 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021572;
	bh=UlXSyrbn6Izhv2YrILB6nNFYLC6BiF83ixfo3PpN4nE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LJYYDCJR0KdqSvfB+0POSrfn+vCZOJ5f8rSO/r8nYfW3Q9x9TRYl8G2Bz9V/XYhhX
	 XV2iOtl3nzyoFbD0TccrGsDgZPDLiWoVdfnusxwjl7U5OJzl2RYNQkWQhjWTEFMCPb
	 WtZRkfi9xmVvsICJYDX1/V9RvPh71iVfUTVbNAqSbaQ6AAahHMvPuGM2S5WVN1b2Xp
	 X/qUih6XybBwSN0xtcR46g9NUoSyPJggaRmj1rwF+fZLN8ZhrwKRSvXZtZkMoiKk+C
	 4rVWqwQkaZcVLFz8zkn/r0btCnXkmEn7RONr1iVE1BnDhqlKow7jWh4Bilf3zKEdO0
	 8d/H4JbLKSwRA==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v7.4-rc1
Date: Sat,  3 Oct 2026 11:59:18 +0200
Message-ID: <20261003095924.1370238-3-thierry.reding@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.4-soc

for you to fetch changes up to 4eaed7ea6ab36e1160d660b05551702c36dfed6c:

  soc/tegra: flowctrl: Release OF node reference on error (2026-10-03 00:47:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v7.4-rc1

Adds various bits of core Tegra SoC support for Tegra410, Tegra264 and
Tegra210-B01. Tegra234 can now be woken up via PCIe. Some references
leak and other fixes round this off.

----------------------------------------------------------------
Aaron Kling (2):
      soc/tegra: fuse: Support revision B01
      soc/tegra: fuse: speedo-tegra210: Support revision B01

Alexandre Hamamdjian (1):
      soc/tegra: pmc: Add Tegra210B01 support

Geert Uytterhoeven (1):
      soc/tegra: pmc: Make sure clk_init_data is fully initialized

Jon Hunter (1):
      soc/tegra: fuse: Add Tegra264 support

Kartik Rajput (1):
      soc/tegra: pmc: Add PMC support for Tegra410

Manikanta Maddireddy (1):
      soc/tegra: pmc: Add PCIe wake event for Tegra234

Thierry Reding (1):
      soc/tegra: cbb: Fix loggger -> logger typo

Yuho Choi (1):
      soc/tegra: flowctrl: Release OF node reference on error

 drivers/soc/tegra/cbb/tegra194-cbb.c     |   2 +-
 drivers/soc/tegra/flowctrl.c             |   7 +-
 drivers/soc/tegra/fuse/fuse-tegra.c      |  12 ++-
 drivers/soc/tegra/fuse/fuse-tegra30.c    | 168 ++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse.h            |   7 +-
 drivers/soc/tegra/fuse/speedo-tegra210.c |  22 +++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c   |  51 ++++++----
 drivers/soc/tegra/pmc.c                  | 165 +++++++++++++++++++++++++++++-
 include/soc/tegra/fuse.h                 |   1 +
 9 files changed, 405 insertions(+), 30 deletions(-)
