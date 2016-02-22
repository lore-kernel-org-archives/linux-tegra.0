From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Fix headphone detection on Acer Chromebook 13
Date: Sun, 21 Feb 2016 23:24:10 -0700
Message-ID: <1456122253-3039-1-git-send-email-sctincman@gmail.com>
References: <56C3977E.8050001@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C3977E.8050001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new DT property to disable inversion of headphone detect GPIO.
This fixes the headphone detection on the CB5-311.

Jonathan Tinkham (3):
  dt/bindings: Add 'nvidia,hd-no-invert' option
  sound/soc/tegra: tegra_max98090: add 'nvidia,hd-no-invert' option
  ARM: tegra: Do not invert nyan headphone detection signal

 .../devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt        | 1 +
 arch/arm/boot/dts/tegra124-nyan.dtsi                                 | 1 +
 sound/soc/tegra/tegra_max98090.c                                     | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.7.1
