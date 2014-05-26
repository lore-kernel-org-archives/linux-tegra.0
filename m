From: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin@gmail.com>
Subject: Re: [PATCH 2/3] drm/tegra: Support setting the EMC clock
Date: Mon, 26 May 2014 02:52:06 -0700
Message-ID: <CACP_E+L1F=3WdE+Kb3yQFYomVsHTwsYVtgr-qn3QiSKydXbFNQ@mail.gmail.com>
References: <1400896714-7092-1-git-send-email-marcheu@chromium.org>
 <1400896714-7092-2-git-send-email-marcheu@chromium.org>
 <1401095262.4829.7.camel@weser.hi.pengutronix.de>
 <CACP_E+J-sCsiiSX-apX3ZqWFHVGxgN5FG9eu9-qTjLQHF22DwA@mail.gmail.com>
 <20140526093523.GA24184@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0458840110=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140526093523.GA24184@ulmo.nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <treding@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

--===============0458840110==
Content-Type: multipart/alternative; boundary=089e013cb7cc9736e104fa4a8a06

--089e013cb7cc9736e104fa4a8a06
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2014 at 2:35 AM, Thierry Reding <treding@nvidia.com> wrote:

> On Mon, May 26, 2014 at 11:28:42AM +0200, St=C3=A9phane Marchesin wrote:
> >
> >
> >
> > On Mon, May 26, 2014 at 2:07 AM, Lucas Stach <l.stach@pengutronix.de
> <mailto:l.stach@pengutronix.de>> wrote:
> > > Am Freitag, den 23.05.2014, 18:58 -0700 schrieb St=C3=A9phane Marches=
in:
> > > > The current code doesn't enable the EMC clock, without which the
> > > > display cannot function, so let's enable this clock. We also need a
> > > > bit of code to pick the right frequency for the EMC clock depending
> > > > on the current video mode settings.
> > > >
> > > That's not the right way to do it. The DRM driver has no business
> > > controlling the EMC clock directly. This should be done through a rea=
l
> > > EMC driver plus some kind of bus QoS, where DC is just one client.
> >
> > I thought about it but didn't see another consumer in upstream
> > kernels. Who are the other consumers of EMC?
>
> There are no other EMC consumers upstream at the moment. Some recent
> discussions also indicate that it's unlikely that EMC scaling will be
> implemented using shared clocks upstream.
>
> See here for the full description:
>
>         https://lkml.org/lkml/2014/5/13/469


So if keeping the EMC clock private is a no-go, and shared clocks are also
a no-go, should I just make a separate one-off driver just for EMC and call
into that?

St=C3=A9phane


>
>
> Also adding linux-tegra to Cc. I like to keep that list in the loop for
> patches that touch the Tegra DRM driver. That's especially useful if
> other APIs are involved (such as clocks here).
>
> Thierry
>
> >
> > St=C3=A9phane
> >
> >
> > Regards,
> > Lucas
> >
> > > Signed-off-by: St=C3=A9phane Marchesin <marcheu@chromium.org<mailto:
> marcheu@chromium.org>>
> > > ---
> > >  drivers/gpu/drm/tegra/dc.c  | 61
> ++++++++++++++++++++++++++++++++++++++++++++-
> > >  drivers/gpu/drm/tegra/drm.h |  1 +
> > >  2 files changed, 61 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > > index edb871d..f398dfb 100644
> > > --- a/drivers/gpu/drm/tegra/dc.c
> > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > @@ -325,6 +325,9 @@ static void tegra_crtc_disable(struct drm_crtc
> *crtc)
> > >       }
> > >
> > >       drm_vblank_off(drm, dc->pipe);
> > > +
> > > +     if (dc->emc_clk)
> > > +             clk_set_rate(dc->emc_clk, 0);
> > >  }
> > >
> > >  static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
> > > @@ -640,6 +643,50 @@ unsigned int tegra_dc_format(uint32_t format)
> > >       return WIN_COLOR_DEPTH_B8G8R8A8;
> > >  }
> > >
> > > +static unsigned long tegra_emc_bw_to_freq_req(unsigned long bw)
> > > +{
> > > +     int bytes_per_emc_clock;
> > > +
> > > +     if (of_machine_is_compatible("nvidia,tegra124"))
> > > +             bytes_per_emc_clock =3D 16;
> > > +     else
> > > +             bytes_per_emc_clock =3D 8;
> > > +
> > > +     return (bw + bytes_per_emc_clock - 1) / bytes_per_emc_clock;
> > > +}
> > > +
> > > +#define EMC_FREQ_CUTOFF_USE_130_PERCENT 100000000UL
> > > +#define EMC_FREQ_CUTOFF_USE_140_PERCENT 50000000UL
> > > +
> > > +static int tegra_dc_program_bandwidth(struct tegra_dc *dc,
> > > +                                   struct drm_display_mode *mode,
> > > +                                   struct tegra_dc_window *window)
> > > +{
> > > +     unsigned long bandwidth =3D mode->clock * window->bits_per_pixe=
l /
> 8;
> > > +     unsigned long freq;
> > > +     struct clk *emc_master;
> > > +
> > > +     if (!dc->emc_clk)
> > > +             return 0;
> > > +
> > > +     emc_master =3D clk_get_parent(dc->emc_clk);
> > > +     freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 1000;
> > > +     freq =3D clk_round_rate(emc_master, freq);
> > > +
> > > +     /* XXX: Add safety margins for DVFS */
> > > +
> > > +     if (freq < EMC_FREQ_CUTOFF_USE_140_PERCENT)
> > > +             bandwidth +=3D 4 * bandwidth / 10;
> > > +     else if (freq < EMC_FREQ_CUTOFF_USE_130_PERCENT)
> > > +             bandwidth +=3D 3 * bandwidth / 10;
> > > +     else
> > > +             bandwidth +=3D bandwidth / 10;
> > > +
> > > +     freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 1000;
> > > +
> > > +     return clk_set_rate(dc->emc_clk, freq);
> > > +}
> > > +
> > >  static int tegra_crtc_mode_set(struct drm_crtc *crtc,
> > >                              struct drm_display_mode *mode,
> > >                              struct drm_display_mode *adjusted,
> > > @@ -691,7 +738,11 @@ static int tegra_crtc_mode_set(struct drm_crtc
> *crtc,
> > >       if (err < 0)
> > >               dev_err(dc->dev, "failed to enable root plane\n");
> > >
> > > -     return 0;
> > > +     err =3D tegra_dc_program_bandwidth(dc, mode, &window);
> > > +     if (err)
> > > +             dev_err(dc->dev, "failed to program the EMC clock\n");
> > > +
> > > +     return err;
> > >  }
> > >
> > >  static int tegra_crtc_mode_set_base(struct drm_crtc *crtc, int x, in=
t
> y,
> > > @@ -1260,6 +1311,12 @@ static int tegra_dc_probe(struct
> platform_device *pdev)
> > >       if (err < 0)
> > >               return err;
> > >
> > > +     dc->emc_clk =3D devm_clk_get(&pdev->dev, "emc");
> > > +     if (IS_ERR(dc->emc_clk))
> > > +             dc->emc_clk =3D NULL;
> > > +     else
> > > +             clk_prepare_enable(dc->emc_clk);
> > > +
> > >       regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >       dc->regs =3D devm_ioremap_resource(&pdev->dev, regs);
> > >       if (IS_ERR(dc->regs))
> > > @@ -1312,6 +1369,8 @@ static int tegra_dc_remove(struct
> platform_device *pdev)
> > >       }
> > >
> > >       clk_disable_unprepare(dc->clk);
> > > +     if (dc->emc_clk)
> > > +             clk_disable_unprepare(dc->emc_clk);
> > >
> > >       return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.=
h
> > > index 6753598..30d91c0 100644
> > > --- a/drivers/gpu/drm/tegra/drm.h
> > > +++ b/drivers/gpu/drm/tegra/drm.h
> > > @@ -101,6 +101,7 @@ struct tegra_dc {
> > >
> > >       struct clk *clk;
> > >       struct reset_control *rst;
> > > +     struct clk *emc_clk;
> > >       void __iomem *regs;
> > >       int irq;
> > >
> >
> > --
> > Pengutronix e.K.             | Lucas Stach                 |
> > Industrial Linux Solutions   | http://www.pengutronix.de/  |
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>

--089e013cb7cc9736e104fa4a8a06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, May 26, 2014 at 2:35 AM, Thierry Reding <span dir=3D"ltr">&=
lt;<a href=3D"mailto:treding@nvidia.com" target=3D"_blank">treding@nvidia.c=
om</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Mon, May 26, 2014 at 11:28:42AM +0200, St=
=C3=A9phane Marchesin wrote:<br>
<div class=3D"">&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, May 26, 2014 at 2:07 AM, Lucas Stach &lt;<a href=3D"mailto:l.s=
tach@pengutronix.de">l.stach@pengutronix.de</a>&lt;mailto:<a href=3D"mailto=
:l.stach@pengutronix.de">l.stach@pengutronix.de</a>&gt;&gt; wrote:<br>
&gt; &gt; Am Freitag, den 23.05.2014, 18:58 -0700 schrieb St=C3=A9phane Mar=
chesin:<br>
&gt; &gt; &gt; The current code doesn&#39;t enable the EMC clock, without w=
hich the<br>
&gt; &gt; &gt; display cannot function, so let&#39;s enable this clock. We =
also need a<br>
&gt; &gt; &gt; bit of code to pick the right frequency for the EMC clock de=
pending<br>
&gt; &gt; &gt; on the current video mode settings.<br>
&gt; &gt; &gt;<br>
&gt; &gt; That&#39;s not the right way to do it. The DRM driver has no busi=
ness<br>
&gt; &gt; controlling the EMC clock directly. This should be done through a=
 real<br>
&gt; &gt; EMC driver plus some kind of bus QoS, where DC is just one client=
.<br>
&gt;<br>
&gt; I thought about it but didn&#39;t see another consumer in upstream<br>
&gt; kernels. Who are the other consumers of EMC?<br>
<br>
</div>There are no other EMC consumers upstream at the moment. Some recent<=
br>
discussions also indicate that it&#39;s unlikely that EMC scaling will be<b=
r>
implemented using shared clocks upstream.<br>
<br>
See here for the full description:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lkml.org/lkml/2014/5/13/469"=
 target=3D"_blank">https://lkml.org/lkml/2014/5/13/469</a></blockquote><div=
><br></div><div>So if keeping the EMC clock private is a no-go, and shared =
clocks are also a no-go, should I just make a separate one-off driver just =
for EMC and call into that?<br>

</div><div><br></div><div>St=C3=A9phane</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
<br>
Also adding linux-tegra to Cc. I like to keep that list in the loop for<br>
patches that touch the Tegra DRM driver. That&#39;s especially useful if<br=
>
other APIs are involved (such as clocks here).<br>
<br>
Thierry<br>
<br>
&gt;<br>
&gt; St=C3=A9phane<br>
&gt;<br>
&gt;<br>
&gt; Regards,<br>
&gt; Lucas<br>
&gt;<br>
&gt; &gt; Signed-off-by: St=C3=A9phane Marchesin &lt;<a href=3D"mailto:marc=
heu@chromium.org">marcheu@chromium.org</a>&lt;mailto:<a href=3D"mailto:marc=
heu@chromium.org">marcheu@chromium.org</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt; &gt; ---<br>
&gt; &gt; =C2=A0drivers/gpu/drm/tegra/dc.c =C2=A0| 61 +++++++++++++++++++++=
+++++++++++++++++++++++-<br>
&gt; &gt; =C2=A0drivers/gpu/drm/tegra/drm.h | =C2=A01 +<br>
&gt; &gt; =C2=A02 files changed, 61 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/d=
c.c<br>
&gt; &gt; index edb871d..f398dfb 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/tegra/dc.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/tegra/dc.c<br>
&gt; &gt; @@ -325,6 +325,9 @@ static void tegra_crtc_disable(struct drm_crt=
c *crtc)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 drm_vblank_off(drm, dc-&gt;pipe);<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 if (dc-&gt;emc_clk)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_set_rate(dc-&gt;e=
mc_clk, 0);<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,<br=
>
&gt; &gt; @@ -640,6 +643,50 @@ unsigned int tegra_dc_format(uint32_t format=
)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 return WIN_COLOR_DEPTH_B8G8R8A8;<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static unsigned long tegra_emc_bw_to_freq_req(unsigned long bw)<=
br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 int bytes_per_emc_clock;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 if (of_machine_is_compatible(&quot;nvidia,tegra12=
4&quot;))<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_per_emc_clock =
=3D 16;<br>
&gt; &gt; + =C2=A0 =C2=A0 else<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_per_emc_clock =
=3D 8;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 return (bw + bytes_per_emc_clock - 1) / bytes_per=
_emc_clock;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +#define EMC_FREQ_CUTOFF_USE_130_PERCENT 100000000UL<br>
&gt; &gt; +#define EMC_FREQ_CUTOFF_USE_140_PERCENT 50000000UL<br>
&gt; &gt; +<br>
&gt; &gt; +static int tegra_dc_program_bandwidth(struct tegra_dc *dc,<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_display_=
mode *mode,<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct tegra_dc_win=
dow *window)<br>
&gt; &gt; +{<br>
&gt; &gt; + =C2=A0 =C2=A0 unsigned long bandwidth =3D mode-&gt;clock * wind=
ow-&gt;bits_per_pixel / 8;<br>
&gt; &gt; + =C2=A0 =C2=A0 unsigned long freq;<br>
&gt; &gt; + =C2=A0 =C2=A0 struct clk *emc_master;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 if (!dc-&gt;emc_clk)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 emc_master =3D clk_get_parent(dc-&gt;emc_clk);<br=
>
&gt; &gt; + =C2=A0 =C2=A0 freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 10=
00;<br>
&gt; &gt; + =C2=A0 =C2=A0 freq =3D clk_round_rate(emc_master, freq);<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 /* XXX: Add safety margins for DVFS */<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 if (freq &lt; EMC_FREQ_CUTOFF_USE_140_PERCENT)<br=
>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bandwidth +=3D 4 * ba=
ndwidth / 10;<br>
&gt; &gt; + =C2=A0 =C2=A0 else if (freq &lt; EMC_FREQ_CUTOFF_USE_130_PERCEN=
T)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bandwidth +=3D 3 * ba=
ndwidth / 10;<br>
&gt; &gt; + =C2=A0 =C2=A0 else<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bandwidth +=3D bandwi=
dth / 10;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 freq =3D tegra_emc_bw_to_freq_req(bandwidth) * 10=
00;<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 return clk_set_rate(dc-&gt;emc_clk, freq);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0static int tegra_crtc_mode_set(struct drm_crtc *crtc,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *mode,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_mode *adjusted,=
<br>
&gt; &gt; @@ -691,7 +738,11 @@ static int tegra_crtc_mode_set(struct drm_cr=
tc *crtc,<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (err &lt; 0)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dc-&gt;d=
ev, &quot;failed to enable root plane\n&quot;);<br>
&gt; &gt;<br>
&gt; &gt; - =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; + =C2=A0 =C2=A0 err =3D tegra_dc_program_bandwidth(dc, mode, &amp=
;window);<br>
&gt; &gt; + =C2=A0 =C2=A0 if (err)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dc-&gt;dev, &=
quot;failed to program the EMC clock\n&quot;);<br>
&gt; &gt; +<br>
&gt; &gt; + =C2=A0 =C2=A0 return err;<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0static int tegra_crtc_mode_set_base(struct drm_crtc *crtc, =
int x, int y,<br>
&gt; &gt; @@ -1260,6 +1311,12 @@ static int tegra_dc_probe(struct platform_=
device *pdev)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (err &lt; 0)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
&gt; &gt;<br>
&gt; &gt; + =C2=A0 =C2=A0 dc-&gt;emc_clk =3D devm_clk_get(&amp;pdev-&gt;dev=
, &quot;emc&quot;);<br>
&gt; &gt; + =C2=A0 =C2=A0 if (IS_ERR(dc-&gt;emc_clk))<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dc-&gt;emc_clk =3D NU=
LL;<br>
&gt; &gt; + =C2=A0 =C2=A0 else<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_prepare_enable(dc=
-&gt;emc_clk);<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 regs =3D platform_get_resource(pdev, IORESOU=
RCE_MEM, 0);<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 dc-&gt;regs =3D devm_ioremap_resource(&amp;p=
dev-&gt;dev, regs);<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(dc-&gt;regs))<br>
&gt; &gt; @@ -1312,6 +1369,8 @@ static int tegra_dc_remove(struct platform_=
device *pdev)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(dc-&gt;clk);<br>
&gt; &gt; + =C2=A0 =C2=A0 if (dc-&gt;emc_clk)<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare=
(dc-&gt;emc_clk);<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; =C2=A0}<br>
&gt; &gt; diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/=
drm.h<br>
&gt; &gt; index 6753598..30d91c0 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/tegra/drm.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/tegra/drm.h<br>
&gt; &gt; @@ -101,6 +101,7 @@ struct tegra_dc {<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 struct clk *clk;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 struct reset_control *rst;<br>
&gt; &gt; + =C2=A0 =C2=A0 struct clk *emc_clk;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 void __iomem *regs;<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 int irq;<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Pengutronix e.K. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | Lucas Sta=
ch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; Industrial Linux Solutions =C2=A0 | <a href=3D"http://www.pengutronix.=
de/" target=3D"_blank">http://www.pengutronix.de/</a> =C2=A0|<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
</div></div>&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-dev=
el@lists.freedesktop.org</a>&lt;mailto:<a href=3D"mailto:dri-devel@lists.fr=
eedesktop.org">dri-devel@lists.freedesktop.org</a>&gt;<br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" ta=
rget=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a>=
<br>
&gt;<br>
</blockquote></div><br></div></div>

--089e013cb7cc9736e104fa4a8a06--

--===============0458840110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0458840110==--
