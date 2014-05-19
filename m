From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix wrong value written to PLLE_AUX
Date: Mon, 19 May 2014 11:45:18 +0300
Message-ID: <20140519084518.GP15168@tbergstrom-lnx.Nvidia.com>
References: <1400248220-16025-1-git-send-email-ttynkkynen@nvidia.com>
 <20140516143110.GA28338@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140516143110.GA28338@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 16, 2014 at 04:31:11PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 16, 2014 at 04:50:20PM +0300, Tuomas Tynkkynen wrote:
> > The value written to PLLE_AUX was incorrect due to a wrong variable
> > being used.
> > 
> > Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >   This fix is required for the (upcoming) SATA support.
> >  drivers/clk/tegra/clk-pll.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Mike, Peter, it might be good to have this go into 3.16 as a
> prerequisite for the upcoming SATA driver (which presumably won't be
> ready until 3.17, but in that case it would be good to have this
> prerequisite merged already).

Yes... We should also take Andrew's fixes. I will prepare a pull request for 3.16.

Cheers,

Peter.
