From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/tegra: Support setting the EMC clock
Date: Mon, 26 May 2014 11:35:23 +0200
Message-ID: <20140526093523.GA24184@ulmo.nvidia.com>
References: <1400896714-7092-1-git-send-email-marcheu@chromium.org>
 <1400896714-7092-2-git-send-email-marcheu@chromium.org>
 <1401095262.4829.7.camel@weser.hi.pengutronix.de>
 <CACP_E+J-sCsiiSX-apX3ZqWFHVGxgN5FG9eu9-qTjLQHF22DwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACP_E+J-sCsiiSX-apX3ZqWFHVGxgN5FG9eu9-qTjLQHF22DwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?U3TDqXBoYW5l?= Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 11:28:42AM +0200, St=C3=A9phane Marchesin wrote:
>=20
>=20
>=20
> On Mon, May 26, 2014 at 2:07 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org<mail=
to:l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>> wrote:
> > Am Freitag, den 23.05.2014, 18:58 -0700 schrieb St=C3=A9phane Marchesin:
> > > The current code doesn't enable the EMC clock, without which the
> > > display cannot function, so let's enable this clock. We also need a
> > > bit of code to pick the right frequency for the EMC clock depending
> > > on the current video mode settings.
> > >
> > That's not the right way to do it. The DRM driver has no business
> > controlling the EMC clock directly. This should be done through a real
> > EMC driver plus some kind of bus QoS, where DC is just one client.
>=20
> I thought about it but didn't see another consumer in upstream
> kernels. Who are the other consumers of EMC?

There are no other EMC consumers upstream at the moment. Some recent
discussions also indicate that it's unlikely that EMC scaling will be
implemented using shared clocks upstream.

See here for the full description:

	https://lkml.org/lkml/2014/5/13/469

Also adding linux-tegra to Cc. I like to keep that list in the loop for
patches that touch the Tegra DRM driver. That's especially useful if
other APIs are involved (such as clocks here).

Thierry

>=20
> St=C3=A9phane
>=20
>=20
> Regards,
> Lucas
>=20
> > Signed-off-by: St=C3=A9phane Marchesin <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org<mailto:mar=
cheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>>
> > ---
> >  drivers/gpu/drm/tegra/dc.c  | 61 +++++++++++++++++++++++++++++++++++++=
+++++++-
> >  drivers/gpu/drm/tegra/drm.h |  1 +
> >  2 files changed, 61 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index edb871d..f398dfb 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -325,6 +325,9 @@ static void tegra_crtc_disable(struct drm_crtc *crt=
c)
> >       }
> >
> >       drm_vblank_off(drm, dc->pipe);
> > +
> > +     if (dc->emc_clk)
> > +             clk_set_rate(dc->emc_clk, 0);
> >  }
> >
> >  static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
> > @@ -640,6 +643,50 @@ unsigned int tegra_dc_format(uint32_t format)
> >       return WIN_COLOR_DEPTH_B8G8R8A8;
> >  }
> >
> > +static unsigned long tegra_emc_bw_to_freq_req(unsigned long bw)
> > +{
> > +     int bytes_per_emc_clock;
> > +
> > +     if (of_machine_is_compatible("nvidia,tegra124"))
> > +             bytes_per_emc_clock =3D 16;
> > +     else
> > +             bytes_per_emc_clock =3D 8;
> > +
> > +     return (bw + bytes_per_emc_clock - 1) / bytes_per_emc_clock;
> > +}
> > +
> > +#define EMC_FREQ_CUTOFF_USE_130_PERCENT 100000000UL
> > +#define EMC_FREQ_CUTOFF_USE_140_PERCENT 50000000UL
> > +
> > +static int tegra_dc_program_bandwidth(struct tegra_dc *dc,
> > +                                   struct drm_display_mode *mode,
> > +                                   struct tegra_dc_window *window)
> > +{
> > +     unsigned long bandwidth =3D mode->clock * window->bits_per_pixel =
/ 8;
> > +     unsigned long freq;
> > +     struct clk *emc_master;
> > +
> > +     if (!dc->emc_clk)
> > +             return 0;
> > +
> > +     emc_master =3D clk_get_parent(dc->emc_clk);
> > +     freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 1000;
> > +     freq =3D clk_round_rate(emc_master, freq);
> > +
> > +     /* XXX: Add safety margins for DVFS */
> > +
> > +     if (freq < EMC_FREQ_CUTOFF_USE_140_PERCENT)
> > +             bandwidth +=3D 4 * bandwidth / 10;
> > +     else if (freq < EMC_FREQ_CUTOFF_USE_130_PERCENT)
> > +             bandwidth +=3D 3 * bandwidth / 10;
> > +     else
> > +             bandwidth +=3D bandwidth / 10;
> > +
> > +     freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 1000;
> > +
> > +     return clk_set_rate(dc->emc_clk, freq);
> > +}
> > +
> >  static int tegra_crtc_mode_set(struct drm_crtc *crtc,
> >                              struct drm_display_mode *mode,
> >                              struct drm_display_mode *adjusted,
> > @@ -691,7 +738,11 @@ static int tegra_crtc_mode_set(struct drm_crtc *cr=
tc,
> >       if (err < 0)
> >               dev_err(dc->dev, "failed to enable root plane\n");
> >
> > -     return 0;
> > +     err =3D tegra_dc_program_bandwidth(dc, mode, &window);
> > +     if (err)
> > +             dev_err(dc->dev, "failed to program the EMC clock\n");
> > +
> > +     return err;
> >  }
> >
> >  static int tegra_crtc_mode_set_base(struct drm_crtc *crtc, int x, int =
y,
> > @@ -1260,6 +1311,12 @@ static int tegra_dc_probe(struct platform_device=
 *pdev)
> >       if (err < 0)
> >               return err;
> >
> > +     dc->emc_clk =3D devm_clk_get(&pdev->dev, "emc");
> > +     if (IS_ERR(dc->emc_clk))
> > +             dc->emc_clk =3D NULL;
> > +     else
> > +             clk_prepare_enable(dc->emc_clk);
> > +
> >       regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >       dc->regs =3D devm_ioremap_resource(&pdev->dev, regs);
> >       if (IS_ERR(dc->regs))
> > @@ -1312,6 +1369,8 @@ static int tegra_dc_remove(struct platform_device=
 *pdev)
> >       }
> >
> >       clk_disable_unprepare(dc->clk);
> > +     if (dc->emc_clk)
> > +             clk_disable_unprepare(dc->emc_clk);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > index 6753598..30d91c0 100644
> > --- a/drivers/gpu/drm/tegra/drm.h
> > +++ b/drivers/gpu/drm/tegra/drm.h
> > @@ -101,6 +101,7 @@ struct tegra_dc {
> >
> >       struct clk *clk;
> >       struct reset_control *rst;
> > +     struct clk *emc_clk;
> >       void __iomem *regs;
> >       int irq;
> >
>=20
> --
> Pengutronix e.K.             | Lucas Stach                 |
> Industrial Linux Solutions   | http://www.pengutronix.de/  |
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTgwrbAAoJEN0jrNd/PrOhIRMP/jlc01xgFqlQ7WjleruDqaxd
3mv4EdIabqLv7N8RrsMhMbHGiSgJ28SzHXUNN5HmPW+rTDpvnA6hfhox/W/2FDmW
tc3UPGZZUaZbnSi3vwnQDhYsN11ZSBICsplfg1yAhLzQIuQNPkMjDalQ9PBWl6kV
2FMHwaOJOdtuFFS6ZD6PhTlTWdAWsce50x150/chvAGRAejNLefQCGU30OVZ5QnN
AuYnCxiXZ/xWhWY9kcGxrA+79Uh5FZlk1qYa3QVxoy3i0zfZrZ/ouBy2Y/gVMhni
IfBxhBUj3FyRRoy789ffCDWcEyc8SdXtdibQShcgRhAD7g2v55sbe6u1hIYugmSz
0wSSLZJnQuaJYPdIXRQV08Iryx9ZeztONc41/O5f6C8V3TuDJ7kc4UXupzTxOvL+
xuLv/phkXiMOIjsdYV7Kq3qbDZIAHxJ/TVlWqRtjCTOi8jRDkHFg03E6o2SMn88X
LfL/xxPp1o4Y4P7XKXIIVu09WNaVvY2sTAx6d05lBqowWasNVzMjSTh3T/YgYBuI
EB5EQZ8511py/W6WXtPMhiESb+35xVcxHCJ1ziuWCTjNKPWM1AgFSsin/impuE0L
JB3uLjSn2dmzZqk37nsADKSxLKNp56vSRjAW5p0xKXz84uKf8Q+ypb/mIqu+969A
9t8wquOXrZ69xvzlGLaf
=3DVo
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
