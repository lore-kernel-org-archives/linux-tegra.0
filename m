From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL] reset: tegra: Changes for v4.15-rc1
Date: Fri, 20 Oct 2017 14:17:01 +0200
Message-ID: <20171020121701.10873-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Philipp,

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-reset

for you to fetch changes up to cfbf86684733d4501230ff4efdeb3225599df78b:

  reset: tegra: Check BPMP response return code (2017-10-19 16:40:54 +0200)

Note that this pulls in part of the tegra-for-4.15-firmware tag that is
going in via the ARM SoC tree. This is needed to resolve a build time
dependency as discussed earlier on the mailing list.

Thanks,
Thierry

----------------------------------------------------------------
reset: tegra: Changes for v4.15-rc1

Contains a fix to properly handle errors propagated by the BPMP.

----------------------------------------------------------------
Thierry Reding (1):
      Merge branch 'for-4.15/firmware' into for-4.15/reset

Timo Alho (2):
      firmware: tegra: Propagate error code to caller
      reset: tegra: Check BPMP response return code

 drivers/firmware/tegra/bpmp.c    | 22 ++++++++++++++++------
 drivers/reset/tegra/reset-bpmp.c |  9 ++++++++-
 include/soc/tegra/bpmp.h         |  1 +
 3 files changed, 25 insertions(+), 7 deletions(-)
