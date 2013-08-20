From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] clk: tegra: Correct sbc mux width & parent
Date: Tue, 20 Aug 2013 11:56:05 +0300
Message-ID: <20130820085605.GS18810@tbergstrom-lnx.Nvidia.com>
References: <1375941327-4231-1-git-send-email-markz@nvidia.com>
 <5203BB79.1000704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5203BB79.1000704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 08, 2013 at 05:38:33PM +0200, Stephen Warren wrote:
> On 08/07/2013 11:55 PM, Mark Zhang wrote:
> > Tegra114 sbc1-sbc6 have more possible parent clocks than Tegra30.
> > So correct the parents and mux width for them.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Note that in downstream we intentionally leave out pllc2 and pllc3 as possible
parents for clocks which are not controlled using the cbus/shared clock
mechanism.

Cheers,

Peter.
