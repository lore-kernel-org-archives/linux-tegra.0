From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3] ASOC: tegra: move AC97 clock handling to the machine
 driver
Date: Wed, 19 Mar 2014 13:34:57 -0600
Message-ID: <5329F161.5080801@wwwdotorg.org>
References: <1395174649-1493-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395174649-1493-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2014 02:30 PM, Lucas Stach wrote:
> On Tegra the convention is to have a single machine driver
> that's controlling the whole audio subsystem. This was
> introduced after the AC97 driver was merged and ever since
> AC97 has been broken.

FWIW, that last sentence isn't actually true at all. This structure has
been in place since the very first addition of sound/soc/tegra/harmony.c
(now sound/soc/tegra/tegra_wm8903.c).

> Move the clock handling to the machine driver, to be in line
> with the other Tegra drivers and give the machine driver
> full control over the single Tegra audio PLL.
