From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
Date: Tue, 21 Apr 2020 23:21:21 +0200
Message-ID: <20200421212121.3286517-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Liam, Mark,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-asoc

for you to fetch changes up to ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16:

  ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init() (2020-04-21 16:53:15 +0200)

This is a set of patches that I was supposed to send out during the
merge window[0], but I somehow messed up my scripts and then didn't
notice that this was missing. I've rebased these patches on top of
v5.7-rc1.

The lack of these are now causing some issues with unbalanced clock
reference counts.

Is there any chance you can pick these up for v5.7-rc3?

Thanks,
Thierry

[0]: https://lore.kernel.org/lkml/20200327154506.GF4437-GFdadSzt00ze9xe1eoZjHA@public.gmane.org/

----------------------------------------------------------------
ASoC: tegra: Fixes for v5.7-rc3

This contains a couple of fixes that are needed to properly reconfigure
the audio clocks on older Tegra devices.

----------------------------------------------------------------
Sowjanya Komatineni (4):
      ASoC: tegra: Use device managed resource APIs to get the clock
      ASoC: nau8825: Change Tegra clk_out_2 provider to PMC
      ASoC: tegra: Add audio mclk parent configuration
      ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()

 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 sound/soc/tegra/tegra_alc5632.c                    |   7 +-
 sound/soc/tegra/tegra_asoc_utils.c                 | 113 ++++++++++-----------
 sound/soc/tegra/tegra_asoc_utils.h                 |   1 -
 sound/soc/tegra/tegra_max98090.c                   |  22 ++--
 sound/soc/tegra/tegra_rt5640.c                     |  22 ++--
 sound/soc/tegra/tegra_rt5677.c                     |   7 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   7 +-
 sound/soc/tegra/tegra_wm8753.c                     |  22 ++--
 sound/soc/tegra/tegra_wm8903.c                     |  22 ++--
 sound/soc/tegra/tegra_wm9712.c                     |   8 +-
 sound/soc/tegra/trimslice.c                        |  18 +---
 12 files changed, 90 insertions(+), 161 deletions(-)
