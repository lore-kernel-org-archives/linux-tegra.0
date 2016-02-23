From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sound/soc/tegra: tegra_max98090: fix hp detect on Chromebook 13
Date: Tue, 23 Feb 2016 10:19:44 -0700
Message-ID: <1456247985-5563-1-git-send-email-sctincman@gmail.com>
References: <56CB6624.6030600@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CB6624.6030600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It appears the driver ignores the GPIO flag for the headphone detect pin. By
using this, in a manner similar to tegra_rt5640, the invert flag can be set
appropriately without changing the DTs.

Jonathan Tinkham (1):
  sound/soc/tegra: tegra_max98090: Invert headphone by GPIO flag

 sound/soc/tegra/tegra_max98090.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.7.1
