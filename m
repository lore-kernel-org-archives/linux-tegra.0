From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: override bits for Tegra114 PLLM
Date: Thu, 6 Jun 2013 11:15:42 +0300
Message-ID: <20130606081542.GS3847@tbergstrom-lnx.Nvidia.com>
References: <1370441329-8619-1-git-send-email-pdeschrijver@nvidia.com>
 <1370441329-8619-3-git-send-email-pdeschrijver@nvidia.com>
 <51AF5FCE.6090501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51AF5FCE.6090501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 05, 2013 at 05:57:02PM +0200, Stephen Warren wrote:
> On 06/05/2013 08:08 AM, Peter De Schrijver wrote:
>=20
> Commit description?
>=20
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/c=
lk-tegra114.c
>=20
> > +#ifdef CONFIG_PM_SLEEP
> > +static struct cpu_clk_suspend_context {
> > +	u32 clk_csite_src;
> > +} tegra114_cpu_clk_sctx;
> > +#endif
>=20
> That generates:
>=20
> drivers/clk/tegra/clk-tegra114.c:263:3: warning: =E2=80=98tegra114_cp=
u_clk_sctx=E2=80=99
> defined but not used [-Wunused-variable]

Ah. This should not be part of this patch indeed...

Cheers,

Peter.
