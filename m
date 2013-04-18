From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH resend 1/2] clk: tegra: remove USB from clk init table
Date: Wed, 17 Apr 2013 23:46:44 -0700
Message-ID: <20130418064644.GG12816@quad.lixom.net>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de>
 <516EDC0B.1060105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <516EDC0B.1060105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 17, 2013 at 11:29:47AM -0600, Stephen Warren wrote:
> On 04/15/2013 01:31 AM, Lucas Stach wrote:
> > The USB clocks are just clock gates, so no need to set a specific clock.
> > In fact trying to set a specific clock is just a NOP if the requested
> > clockrate is the same as those of the parent (clk_m) or will trigger a
> > WARN_ON() if rates don't match up.
> > 
> > As we are not setting a specific rate, nor activating the clocks at
> > init, there is no point in keeping the the usb entries in the clock init
> > table.
> 
> Lucas, these two patches look good for me. I'm just waiting on Mike's
> ack to forward them to arm-soc. If that doesn't happen today, feel free
> to forward them to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org when it does, with a note requesting
> they be applied since I'm away on vacation. It might be useful for them
> to know that they're best applied wherever Tegra's for-3.10/clk branch
> was merged.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (Tested for regressions; I didn't actually test using the AC'97 clock,
> since I don't have the HW)

Ok, I take back my earlier agreement to apply patches that I just get
a fresh acked-by cc for. This doesn't seem to scale very well since I
have to go from mutt in a terminal back to gmail, find the patch, make
sure I have the right version of that patch, add the thread to my inbox,
run offlineimap, wait for it to show up in mutt and _then_ "git am" it,
adding any acked-by or other tags.

So, if you want me to apply patches from email, please do so by
(re)sending me the patch directly instead.


-Olof
