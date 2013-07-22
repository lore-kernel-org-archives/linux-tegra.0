From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/4] ASOC: tegra: move AC97 clock defines to the
 controller node
Date: Mon, 22 Jul 2013 09:08:47 +0200
Message-ID: <1374476927.1644.4.camel@tellur>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
	 <1374442132-24040-2-git-send-email-dev@lynxeye.de>
	 <20130721233651.GZ9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130721233651.GZ9858-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 22.07.2013, 00:36 +0100 schrieb Mark Brown:
> On Sun, Jul 21, 2013 at 11:28:49PM +0200, Lucas Stach wrote:
> > Different from other Tegra sound controllers drivers, the AC97
> > controller driver uses the tegra asoc utils directly to request the
> > needed clocks, as they are needed at AC97 init time. Move the DT clock
> > defines to the right place.
> 
> I'm sorry but I just don't understand what this change is supposed to do
> - what is the current place, what is wrong with it and what is the
> correct place?

The clocks used by the Tegra ASoC utils were defined in the machine
driver DT node for all boards, as this is were they get requested by the
I2C and SPDIF Tegra audio drivers. Differently from those two the AC97
driver has to request those clocks in the controller drivers, as they
are needed at this point for proper initialisation.
So the patch moves the clocks from the machine driver node to the AC97
controller DT node, so they can be requested in the right driver.

Regards,
Lucas
