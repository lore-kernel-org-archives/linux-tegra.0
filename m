From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: remove USB from clk init table
Date: Mon, 28 Jan 2013 19:45:56 +0100
Message-ID: <1359398756.1558.2.camel@tellur>
References: <1359325055-5160-1-git-send-email-dev@lynxeye.de>
	 <5106C583.7010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5106C583.7010204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 28.01.2013, 11:37 -0700 schrieb Stephen Warren:
> On 01/27/2013 03:17 PM, Lucas Stach wrote:
> > The USB clocks are just clock gates, so no need to set a specific clock.
> > In fact trying to set a specific clock is just a NOP if the requested
> > clockrate is the same as those of the parent (clk_m) or will trigger a
> > WARN_ON() if rates don't match up.
> > 
> > As we are not setting a specific rate, nor activating the clocks at
> > init, there is no point in keeping the the usb entries in the clock init
> > table.
> 
> I'm not convinced here; aren't the USB clocks supposed to be driven by
> PLL U?
> 
> Prashant, Peter, Venu, can you please comment here.
> 
I was a bit confused at first, too. But what I am removing here is the
clockgate init for the USB controllers. The clocks driven by PLL_U are
the USB PHY clocks, which are a separate set of clocks.

Regards,
Lucas
