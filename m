From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: set up audio clocks on Tegra114
Date: Mon, 25 Mar 2013 12:04:44 +0200
Message-ID: <20130325100444.GA18519@tbergstrom-lnx.Nvidia.com>
References: <1363895115-14129-1-git-send-email-swarren@wwwdotorg.org>
 <514CA793.4040105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <514CA793.4040105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 22, 2013 at 07:48:51PM +0100, Stephen Warren wrote:
> On 03/21/2013 01:45 PM, Stephen Warren wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > This sets up all the audio-related clocks on Tegra114 in the same way
> > as they are set up on previous chips.
> 
> > Peter, do you want to roll this into your CCF series V8, or should I apply
> > it seperately?
> 
> I see that part of this is included in your CCF series v8, except that:
> 
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> 
> > +	{pll_a, clk_max, 564480000, 1},
> > +	{pll_a_out0, clk_max, 11289600, 1},
> > +	{extern1, pll_a_out0, 0, 1},
> 
> > +	{clk_out_1, clk_max, 0, 1},
> 
> The "enable" bits are set to 0 there. As I mentioned in the other email,
> the audio driver assumes these clocks are enabled, unless we want to
> enhance the driver to change that, but that would create a dependency
> between the ASoC and Tegra trees, which I'd really rather not do, since
> other changes to the relevant ASoC files are already going through ASoC
> tree for 3.10.
> 

Ok. In that cse we have to think about using a different way of doing udelay()
in clk-pll.c or move the initialization after the loop has been calibrated.

> > +	{i2s0, pll_a_out0, 11289600, 0},
> > +	{i2s1, pll_a_out0, 11289600, 0},
> > +	{i2s2, pll_a_out0, 11289600, 0},
> > +	{i2s3, pll_a_out0, 11289600, 0},
> > +	{i2s4, pll_a_out0, 11289600, 0},
> 
> Those entries are missing. At least the parenting relationship needs to
> be set up I believe.

That's ok.

> 
> I assume you want me to send an incremental patch to fix that up?

That would be great.

cheers,

Peter.
