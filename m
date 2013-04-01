From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: move <mach/powergate.h> to <linux/tegra-powergate.h>
Date: Mon, 1 Apr 2013 17:14:50 +0000
Message-ID: <201304011714.50703.arnd@arndb.de>
References: <1364602790-10759-1-git-send-email-swarren@wwwdotorg.org> <201303301413.26549.arnd@arndb.de> <5159B0FF.2010408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5159B0FF.2010408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 01 April 2013, Stephen Warren wrote:
> On 03/30/2013 08:13 AM, Arnd Bergmann wrote:
> > On Saturday 30 March 2013, Stephen Warren wrote:

> > If not, we can probably take your patch for now, if you remove it
> > again for 3.11.
> 
> There are at least a couple of different things in this file:
> 
> a) The reset API, which definitely should be converted to the new reset
> API. I can't make any promises about which kernel release that will
> happen in, but it's definitely something we know we have to do.
> 
> b) Power-gating. This should probably be converted to use the
> powerdomains code. I believe Joseph Lo is aware of this, but again I
> can't promise any specific time-scale at this time.
> 
> So is this still OK, without any promises of timescale?
> 

Yes, sounds good.

	Arnd
