From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Add Tegra132 support
Date: Fri, 9 Jan 2015 20:02:57 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501092002430.28771@utopia.booyaka.com>
References: <1420701657-32543-1-git-send-email-thierry.reding@gmail.com> <alpine.DEB.2.02.1501082232280.28771@utopia.booyaka.com> <20150109101252.GG27845@ulmo>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150109101252.GG27845@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 9 Jan 2015, Thierry Reding wrote:

> On Thu, Jan 08, 2015 at 10:34:35PM +0000, Paul Walmsley wrote:
> > On Thu, 8 Jan 2015, Thierry Reding wrote:
> > 
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > 
> > > Tegra132 uses the same GPU as Tegra124 and the same special-case is
> > > needed to remove clamps. However Tegra132 has a separate chip ID, so in
> > > order to avoid having to extend the list of chip IDs for the special
> > > case, add a feature flag to the SoC data.
> > > 
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Reviewed-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Nit: not sure I would call it a special-case; to me it's more of an 
> > evolutionary change due to the radically different GPU in T124 & T132.
> 
> I reworded the commit message slightly, so it says:
> 
> 	Tegra132 uses the same GPU as Tegra124 and therefore requires the same
> 	method to remove clamps. ...
> 
> I hope that's less misleading.

Looks good to me,


- Paul
