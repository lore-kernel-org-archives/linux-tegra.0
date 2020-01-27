From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] clk: tegra: Changes for v5.6-rc1
Date: Mon, 27 Jan 2020 14:07:47 +0100
Message-ID: <20200127130747.2287794-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.6-clk

for you to fetch changes up to 41a1f096e94c9559b45ccce43fba94913ebc7313:

  clk: tegra20/30: Explicitly set parent clock for Video Decoder (2020-01-10 15:50:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.6-rc1

This contains some minor fixes and cleanups for Tegra clocks.

----------------------------------------------------------------
Dmitry Osipenko (3):
      clk: tegra: divider: Check UART's divider enable-bit state on rate's recalculation
      clk: tegra20/30: Don't pre-initialize displays parent clock
      clk: tegra20/30: Explicitly set parent clock for Video Decoder

Sowjanya Komatineni (1):
      clk: tegra: clk-dfll: Remove call to pm_runtime_irq_safe()

Stephen Warren (1):
      clk: tegra: Mark fuse clock as critical

 drivers/clk/tegra/clk-dfll.c         | 3 +--
 drivers/clk/tegra/clk-divider.c      | 9 +++++++--
 drivers/clk/tegra/clk-tegra-periph.c | 6 +++++-
 drivers/clk/tegra/clk-tegra20.c      | 4 +---
 drivers/clk/tegra/clk-tegra30.c      | 4 +---
 5 files changed, 15 insertions(+), 11 deletions(-)
