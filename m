From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Thu, 31 Oct 2013 17:39:23 +0200
Message-ID: <20131031153923.GW22111@tbergstrom-lnx.Nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
 <1383061872-27899-3-git-send-email-treding@nvidia.com>
 <52701062.30405@wwwdotorg.org> <20131030210023.GB7686@mithrandir>
 <52717C4F.6000202@wwwdotorg.org> <20131030225443.GB6939@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131030225443.GB6939@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 30, 2013 at 11:54:44PM +0100, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Oct 30, 2013 at 03:38:23PM -0600, Stephen Warren wrote:
> > On 10/30/2013 03:00 PM, Thierry Reding wrote:
> > > On Tue, Oct 29, 2013 at 01:45:38PM -0600, Stephen Warren wrote:
> > >> On 10/29/2013 09:51 AM, Thierry Reding wrote:
> > >>> The clock for the PWM controller is slightly different from
> > >>> other peripheral clocks on Tegra30. The clock source mux field
> > >>> start at bit position 28 rather than 30.
> > 
> > >>> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > >>> b/drivers/clk/tegra/clk-tegra30.c
> > >> 
> > >>> @@ -836,7 +837,6 @@ static struct tegra_clk
> > >>> tegra30_clks[tegra_clk_max] __initdata = { [tegra_clk_extern1]
> > >>> = { .dt_id = TEGRA30_CLK_EXTERN1, .present = true }, 
> > >>> [tegra_clk_extern2] = { .dt_id = TEGRA30_CLK_EXTERN2, .present
> > >>> = true }, [tegra_clk_extern3] = { .dt_id = TEGRA30_CLK_EXTERN3,
> > >>> .present = true }, -	[tegra_clk_pwm] = { .dt_id =
> > >>> TEGRA30_CLK_PWM, .present = true },
> > >> 
> > >> I think you still need an entry in this table; isn't it used by
> > >> the DT->internal clock ID translation function?
> > > 
> > > As far as I can tell, this is used by the generic code to
> > > determine which of the generic clocks to register. If
> > > TEGRA30_CLK_PWM is kept within this list, tegra_periph_clk_init()
> > > will register the clock a second time.
> > > 
> > >> Either way, it seems like this patch might want to add a 
> > >> tegra_clk_pwm_tegra30 so that the common C files can still
> > >> implement this clock, just with different parameters?
> > > 
> > > That's pretty much what this patch does, isn't it? It adds a
> > > custom entry for the PWM clock to the Tegra30-specific
> > > tegra_periph_clk_list and keeps the common one from being
> > > registered by dropping the entry from tegra30_clks.
> > 
> > I was hoping for the new clock that gets added to be added to the
> > common file that defines the common clocks rather than to be added to
> > the Tegra30-specific files. However, I suppose if it really is a
> > Tegra30-specific clock, then keeping it isolated to the
> > Tegra30-specific file might make sense.
> > 
> > That said, I wonder if we can't keep the PWM clock definition in the
> > common file, and just make it a bit parameterized? Perhaps that
> > defeats the purpose of a common definition though.
> > 
> > > The same is already done on Tegra20, where the PWM clock is
> > > similarly weird.
> > 
> > OK, perhaps that's reasonable precedent for this then.
> > 
> > > On Tegra114 and Tegra124 the clock is still weird, but it can be 
> > > tweaked into behaving more commonly by lying about the actual
> > > position and size of the mux field.
> > 
> > That doesn't sound good... What if someone actually wants to use the
> > correct position/size (e.g. use mux options that presumably can't be
> > selected now we've lied)? We really shouldn't lie about things.
> 
> Perhaps I've misinterpreted the code. At least comparing to the register
> definitions the field should still be 3 bits wide, but the code clamps
> it to the upper 2, which makes it compatible with the regular peripheral
> clocks. The mux options that are left out are apparently very uncommonly
> used (PLLC2 and PLLC3).
> 

And also not validated. Also by policy PLLC2 and PLLC3 are used for scaling
IP blocks. So I don't think it makes sense to use them for PWM?

Cheers,

Peter.
