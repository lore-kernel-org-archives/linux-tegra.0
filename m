From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH v2 0/4]  Add device tree support of audio codec (ALC5632) on PAZ00 board
Date: Thu,  2 Feb 2012 22:13:34 +0200
Message-ID: <1328213618-15870-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following patchset is going to:
 * add device tree support of audio codec (ALC5632) on PAZ00 board.
 * enable headset autodetection via device tree.
 * enable headset microphone via device tree.
					 
Leon Romanovsky (4):
  ARM: dt: tegra: Enable device tree audio codec on PAZ00 board.
  ARM: dt: tegra: Enable headset autodetection on PAZ00 board.
  ASoC: Tegra+ALC5632: Enable headset autodetection on PAZ00 board.
  ASoC: tegra: Remove unused DAPM route structure.

 arch/arm/boot/dts/tegra-paz00.dts |   30 ++++++++++++++++----
 sound/soc/tegra/tegra_alc5632.c   |   55 +++++++++++++++++++++++-------------
 2 files changed, 59 insertions(+), 26 deletions(-)

---
Chages since v1:
 * Headset autodetection commit was split tp be two independant commits.
 * Main commit(enable device tree audio codec)  was forgotten in previous patchset.

-- 
1.7.3.4
