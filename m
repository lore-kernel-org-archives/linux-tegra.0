From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Rename Tegra ASoC driver
Date: Tue, 12 Apr 2011 11:28:58 -0600
Message-ID: <1302629341-2302-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin, Erik, Olof,

Could you please ack these patches once they're ready, so that Mark can place
them into his tegra-arch branch.

Colin, Erik, Olof, Mark,

Once these changes are in Mark's tegra-arch branch, could you please merge
them into your subsystem's for-2.6.40 or equivalent branches.

Thanks.


This patchset is for 2.6.40.

The Tegra ASoC driver currently supports just the Harmony board. Hence, the
driver name includes the word "harmony". I'll soon be submitting a patchset
to add support for more boards. Hence, the current name doesn't apply well
any more. Hence, I'd like to rename the driver.

To do this, the three changes below need to be applied to both the ASoC tree
and the ARM/Tegra tree:

ARM: Tegra: Rename harmony_audio.h -> tegra_wm8903_pdata.h
ARM: Tegra: Add to tegra_wm8903_platform_data

  These both change a header file that is shared between the two subsystems.
  Future changes in both subsystems depend on these changes, so the changes
  must be merged into both subsystems first.

ASoC: Tegra: Rename pdev tegra-snd-harmony to tegra-snd-wm8903

  Compile-wise, the subsets of this change that apply to each subsystem could
  be applied separately to each subsystem. However, that would break current
  Tegra audio support, since the driver name used in the board files would no
  longer match the driver name actually implemented, in either subsystem.
  Hence, this entire change should be merged into both subsystems.

Stephen Warren (3):
  ARM: Tegra: Rename harmony_audio.h -> tegra_wm8903_pdata.h
  ASoC: Tegra: Rename pdev tegra-snd-harmony to tegra-snd-wm8903
  ARM: Tegra: Add to tegra_wm8903_platform_data

 arch/arm/mach-tegra/board-harmony.c                |    7 +++--
 arch/arm/mach-tegra/include/mach/harmony_audio.h   |   22 -------------------
 .../mach-tegra/include/mach/tegra_wm8903_pdata.h   |   23 ++++++++++++++++++++
 sound/soc/tegra/harmony.c                          |   14 ++++++------
 4 files changed, 34 insertions(+), 32 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/include/mach/harmony_audio.h
 create mode 100644 arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
