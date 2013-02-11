From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: No 7.1 super clk dividers on Tegra20
Date: Mon, 11 Feb 2013 11:52:02 +0200
Message-ID: <20130211095202.GY3073@tbergstrom-lnx.Nvidia.com>
References: <1360327453-29242-1-git-send-email-pdeschrijver@nvidia.com>
 <5115381F.9000308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5115381F.9000308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 08, 2013 at 06:38:39PM +0100, Stephen Warren wrote:
> On 02/08/2013 05:44 AM, Peter De Schrijver wrote:
> > Unlike Tegra30, Tegra20 does not have a 7.1 divider for the CPU superclk.
> > Remove the clocks related to the divider.
> 
> I assume there's no particular need to take this for 3.9; it can wait
> until 3.10?

No. There isn't. These clocks aren't used yet because we don't have CPU DVFS.

Cheers,

Peter.
