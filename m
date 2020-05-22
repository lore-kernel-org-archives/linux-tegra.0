From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL v2 05/11] firmware: tegra: Changes for v5.8-rc1
Date: Fri, 22 May 2020 16:28:44 +0200
Message-ID: <20200522142846.2376224-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-firmware-v2

for you to fetch changes up to 10b2006681333a14a907a06a0e213c568fa8e7f4:

  firmware: tegra: Defer BPMP probe if shared memory not available (2020-05-22 14:57:14 +0200)

On top of the previous pull request this contains an additional fix from
Jon for an issue that our test system discovered in a recent linux-next.

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

Jon Hunter (1):
      firmware: tegra: Defer BPMP probe if shared memory not available

Thierry Reding (1):
      firmware: tegra: Make BPMP a regular driver

 drivers/firmware/tegra/bpmp-tegra186.c       |  4 ++--
 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 4 files changed, 25 insertions(+), 10 deletions(-)
