From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 05/11] firmware: tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:05 +0200
Message-ID: <20200515145311.1580134-6-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-firmware

for you to fetch changes up to b720aaa347f227c416e8aed2f12ca62ea4f1cd4e:

  firmware: tf: Different way of L2 cache enabling after LP2 suspend (2020-05-06 18:27:26 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.8-rc1

This contains a change that makes the BPMP driver a regular driver,
which fixes some weird suspend/resume ordering issues. Another fix is
also included to implement another way of enabling the L2 cache after
LP2 suspend.

----------------------------------------------------------------
Dmitry Osipenko (1):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend

Thierry Reding (1):
      firmware: tegra: Make BPMP a regular driver

 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 3 files changed, 23 insertions(+), 8 deletions(-)
