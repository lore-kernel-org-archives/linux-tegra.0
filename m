From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix maxburst settings in dmaengine code
Date: Tue, 11 Sep 2012 08:05:46 +0800
Message-ID: <20120911000539.GB30699@opensource.wolfsonmicro.com>
References: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org>
 <20120907010050.GE4400@opensource.wolfsonmicro.com>
 <50494F8C.3030906@wwwdotorg.org>
 <504E2B73.2020006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <504E2B73.2020006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 10, 2012 at 12:03:31PM -0600, Stephen Warren wrote:

> Anyway, since this patch didn't make 3.6-rc5, it is difficult for me to
> use as a baseline for any branches destined for 3.7, since I'm supposed
> to send my pull requests to arm-soc before 3.6-rc6 is released, yet if
> this patch goes into 3.6, it won't be there until 3.6-rc6 at the earliest.

> I'm not sure how best to resolve this; is it possible for me to take the
> patch through the Tegra tree instead, as I originally intended?

Just merge the pull request in.  I should send something out
on Thursday I expect, though no guarantees about -rc6.  It doesn't seem
sensible to not merge the fix.

Or bend the rules for arm-soc by putting it in your own -next branch and
then rebasing before it gets pulled into arm-soc.  This would seem a
sensible thing in general given arm-soc has this sort of model, it'd
avoid what is essentially an extended merge window for arm-soc but still
give things exposure in -next before they hit arm-soc itself.
