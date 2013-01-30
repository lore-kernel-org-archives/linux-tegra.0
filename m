From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: remove USB from clk init table
Date: Wed, 30 Jan 2013 11:32:42 +0200
Message-ID: <20130130093241.GB2364@tbergstrom-lnx.Nvidia.com>
References: <1359325055-5160-1-git-send-email-dev@lynxeye.de>
 <5106C583.7010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5106C583.7010204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 28, 2013 at 07:37:55PM +0100, Stephen Warren wrote:
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

According to our downstream code, they are indeed just clockgates with clk_m
as the parent. I couldn't find any confirmation in the TRM though.

Cheers,

Peter.
