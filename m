From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] Fix headphone detection on Acer Chromebook 13
Date: Wed,  3 Feb 2016 22:30:58 -0700
Message-ID: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Headphone output works, but headphone detection does not. The problem
is improper inversion of the jack gpio, and improper naming of the
DAPM switch. With these changes, headphone insertion and removal is
picked up by userspace, and the switch properly toggled.

Jonathan Tinkham (4):
  soc/sound: tegra_max98090: do not invert headphone jack
  sound/soc: tegra_max98090: rename headphone jack DAPM
  sound/soc: tegra_max98090: document headphone jack rename
  soc/sound: tegra_max98090: update dts affected by rename

 .../devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt  |  6 +++---
 arch/arm/boot/dts/tegra124-nyan.dtsi                           |  4 ++--
 arch/arm/boot/dts/tegra124-venice2.dts                         |  4 ++--
 sound/soc/tegra/tegra_max98090.c                               | 10 +++++-----
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
