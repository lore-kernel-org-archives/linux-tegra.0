From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:55 +0200
Message-ID: <20200717161300.1661002-2-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717161300.1661002-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-firmware

for you to fetch changes up to 4e87189912bd2167998d82c95bb68f73185069e2:

  firmware: tegra: Update BPMP ABI (2020-07-14 18:03:45 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.9-rc1

This has a few cleanups and the addition of a new mechanism to query
debug information from the BPMP.

----------------------------------------------------------------
Jon Hunter (4):
      firmware: tegra: Use consistent return variable name
      firmware: tegra: Prepare for supporting in-band debugfs
      firmware: tegra: Add support for in-band debug
      firmware: tegra: Update BPMP ABI

Timo Alho (1):
      firmware: tegra: Add return code checks and increase debugfs size

 drivers/firmware/tegra/bpmp-debugfs.c | 436 ++++++++++++++--
 drivers/firmware/tegra/bpmp.c         |   6 +-
 include/soc/tegra/bpmp-abi.h          | 913 +++++++++++++++++++++++-----------
 3 files changed, 1038 insertions(+), 317 deletions(-)
