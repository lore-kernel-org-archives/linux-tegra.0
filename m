From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: add ac97 controller clock
Date: Mon, 28 Jan 2013 20:25:44 +0100
Message-ID: <1359401144.1558.11.camel@tellur>
References: <1359325055-5160-1-git-send-email-dev@lynxeye.de>
	 <1359325055-5160-2-git-send-email-dev@lynxeye.de>
	 <5106CE6D.9030008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5106CE6D.9030008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 28.01.2013, 12:15 -0700 schrieb Stephen Warren:
> On 01/27/2013 03:17 PM, Lucas Stach wrote:
> > AC97 controller clock is hardwired to pll_a_out0.
> 
> One more comment here; don't you need to add this clock into
> audio_parents[]?
> 
Yeah it's documented that AC97 can be used as audio_sync_clock, but for
one I haven't tested this and also ac97 clock == pll_a_out0, so you can
just as well use the pll out in that case.

Regards,
Lucas
