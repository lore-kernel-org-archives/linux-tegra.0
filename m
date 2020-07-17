From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/7] soc/tegra: Changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:57 +0200
Message-ID: <20200717161300.1661002-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-soc

for you to fetch changes up to eb8bb7abbb0b22238b844578970f14fa982fc2b0:

  soc/tegra: fuse: Fix typo in APB MISC warning (2020-07-17 15:47:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.9-rc1

This adds missing SoC IDs for Tegra186 and Tegra194 and fixes a typo in
a warning message.

----------------------------------------------------------------
Sandipan Patra (1):
      soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs

Thierry Reding (1):
      soc/tegra: fuse: Fix typo in APB MISC warning

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 include/soc/tegra/fuse.h               | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)
