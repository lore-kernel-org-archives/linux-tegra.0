From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V3] dma: tegra: register as an OF DMA controller
Date: Thu, 5 Dec 2013 03:46:08 +0100
Message-ID: <201312050346.09225.arnd@arndb.de>
References: <1386102787-21839-1-git-send-email-swarren@wwwdotorg.org> <201312040234.09708.arnd@arndb.de> <529F65E6.9050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <529F65E6.9050606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 04 December 2013, Stephen Warren wrote:
> > 
> > We really need to be better at having a common set of rules regarding what
> > it actually means to set the slave_id through dma_slave_config(). IMHO
> > we should just treat it as a bug for any dmaengine driver that is configured
> > through DT, or we should get rid of this entirely.
> 
> By the end of this series (for the Tegra driver) I can remove those "+"
> lines you quoted above; the slave ID will only come from DT through
> of_xlate, and any slave ID in the slave_config will simply be ignored.

Ok, that's certainly a step in the right direction. However, as I said
my comment wasn't really directed at you and I think it's more important
to have a clear policy that we can enforce across all dmaengine drivers.

It's really up to Vinod and Dan to decide how it should be handled
in general.

	Arnd
