From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v3] ASOC: tegra: move AC97 clock handling to the machine
 driver
Date: Wed, 19 Mar 2014 20:53:16 +0100
Message-ID: <1395258796.2084.4.camel@tellur>
References: <1395174649-1493-1-git-send-email-dev@lynxeye.de>
	 <5329F161.5080801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5329F161.5080801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 19.03.2014, 13:34 -0600 schrieb Stephen Warren:
> On 03/18/2014 02:30 PM, Lucas Stach wrote:
> > On Tegra the convention is to have a single machine driver
> > that's controlling the whole audio subsystem. This was
> > introduced after the AC97 driver was merged and ever since
> > AC97 has been broken.
> 
> FWIW, that last sentence isn't actually true at all. This structure has
> been in place since the very first addition of sound/soc/tegra/harmony.c
> (now sound/soc/tegra/tegra_wm8903.c).

I can really remember the details, but the clock handling as present has
actually worked. So something has changed. It may not have to do with
the sound machine driver but the conversion of the clock driver to CCF.

I agree that this isn't the best way to say this.

Regards,
Lucas
