From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] ASoC: WM8903: DT bindings & related
Date: Fri,  2 Dec 2011 15:08:36 -0700
Message-ID: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

v2:
* Fixed default pdata logic so that 0 in pdata fields really means
  "do nothing".
* Added a patch to fix pdata gpio_cfg value confusion.
* Moved all the pdata default & DT parsing logic to i2c_probe from
  codec probe.
* Split parsing logic out into separate functions so probe is easier
  to read.
* Rebased on top of the WM8903 cleanup patches Mark posted today.

Stephen Warren (5):
  ASoC: WM8903: Fix platform data gpio_cfg confusion
  ASoC: WM8903: Create default platform data structure
  ASoC: WM8903: Remove conditionals checking pdata != NULL
  ASoC: WM8903: Get default irq_active_low from IRQ controller
  ASoC: WM8903: Add device tree binding

 Documentation/devicetree/bindings/sound/wm8903.txt |   50 ++++++
 arch/arm/mach-tegra/board-harmony.c                |    8 +-
 arch/arm/mach-tegra/board-seaboard.c               |    8 +-
 include/sound/wm8903.h                             |    7 +-
 sound/soc/codecs/wm8903.c                          |  181 +++++++++++++++-----
 5 files changed, 205 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wm8903.txt
