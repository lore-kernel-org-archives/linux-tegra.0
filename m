From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
Date: Mon, 30 Mar 2020 23:40:09 +0300
Message-ID: <20200330204011.18465-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

Some devices have a 4-pin jack instead of a 3-pin and currently the
WM8903 configuration is hardcoded to the case of 3-pin jack in the
Tegra's ASoC driver. A new device-tree property is required in order
to convey that hardware has a 4-pin jack, and thus, microphone's
detection needs to be done in a different way.

In particular this is needed for Acer A500 tablet device that has
a 4-pin headset jack, otherwise userspace sees headset instead of
headphones and internal microphone isn't enabled by ALSA UCM rule
when it should be. Please review and apply, thanks in advance.

Dmitry Osipenko (2):
  dt-bindings: sound: tegra-wm8903: Document new nvidia,headset property
  ASoC: tegra: tegra_wm8903: Support nvidia,headset property

 .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt | 1 +
 sound/soc/tegra/tegra_wm8903.c                              | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1
