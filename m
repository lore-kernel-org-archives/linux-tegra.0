From: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/2] ARM: Tegra: Device Tree Support: Update how sdhci
	devices are initialized
Date: Tue, 10 May 2011 15:06:31 -0700
Message-ID: <BANLkTingm7PCJPC-xCremYg_Ab7qFvPSag@mail.gmail.com>
References: <20110510201108.22693.50319.stgit@riker>
	<20110510201414.22693.7427.stgit@riker>
	<74CDBE0F657A3D45AFBB94109FB122FF04986AA06A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647890836883849818=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA06A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org" <linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============0647890836883849818==
Content-Type: multipart/alternative; boundary=0015174c3cf822805004a2f32b2e

--0015174c3cf822805004a2f32b2e
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 10, 2011 at 3:03 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> John Bonesio wrote at Tuesday, May 10, 2011 2:14 PM:
> > This patch changes how sdhci devices are initialized so that a later
> patch can
> > easily add support for i2c devies.
> >
> > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> > @@ -134,6 +57,25 @@ static __initdata struct tegra_clk_init_table
> > tegra_dt_clk_init_table[] = {
> >       { NULL,         NULL,           0,              0},
> >  };
> >
> > +static struct tegra_sdhci_platform_data sdhci_pdata1 = {
> > +     .cd_gpio        = -1,
> > +     .wp_gpio        = -1,
> > +     .power_gpio     = -1,
> > +};
> > +
> > +static struct tegra_sdhci_platform_data sdhci_pdata2 = {
> > +     .cd_gpio        = TEGRA_GPIO_SD2_CD,
> > +     .wp_gpio        = TEGRA_GPIO_SD2_WP,
> > +     .power_gpio     = TEGRA_GPIO_SD2_POWER,
> > +};
> > +
> > +static struct tegra_sdhci_platform_data sdhci_pdata4 = {
> > +     .cd_gpio        = TEGRA_GPIO_SD4_CD,
> > +     .wp_gpio        = TEGRA_GPIO_SD4_WP,
> > +     .power_gpio     = TEGRA_GPIO_SD4_POWER,
> > +     .is_8bit        = 1,
> > +};
> > +
>
> So I understand why board-dt is itself registering the SDHCI platform
> devices itself; so that the pdev initialization path is identical
> between fully hard-coded boards and board-dt.c.
>
> However, I'm surprised that we would include the platform data for
> those devices within that argument; if we do that, we'll end up needing
> different platform data for every board, and devicetree won't have
> bought us anything.
>
> In other words, I understood that board-dt would register all the
> platform devices within Tegra, but not set up any of the plataform
> data, and the device drivers for those devices would be updated to
> get their platform data from devicetree if available, then fall back
> to old-style platform data. In other words, the way the SDHCI drivers
> work today in the devicetree/test branch.
>
> If my understanding is correct, shouldn't the chunk above and the
> one below be removed?
>

That's if we cut everything over, I think. until then, this code should fill
in the platform_device and register it. But the values should come from the
device tree, and it should only register the controllers that are in the
tree (and not marked as disabled).


-Olof

--0015174c3cf822805004a2f32b2e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, May 10, 2011 at 3:03 PM, Stephen Warren =
<span dir=3D"ltr">&lt;<a href=3D"mailto:swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">swarren@nvidia.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
John Bonesio wrote at Tuesday, May 10, 2011 2:14 PM:<br>
<div class=3D"im">&gt; This patch changes how sdhci devices are initialized=
 so that a later patch can<br>
&gt; easily add support for i2c devies.<br>
&gt;<br>
&gt; Signed-off-by: John Bonesio &lt;<a href=3D"mailto:bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">=
bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;<br>
<br>
</div><div class=3D"im">&gt; @@ -134,6 +57,25 @@ static __initdata struct t=
egra_clk_init_table<br>
&gt; tegra_dt_clk_init_table[] =3D {<br>
&gt; =A0 =A0 =A0 { NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0 =
=A0 =A0 =A0 =A0 =A0 =A00},<br>
&gt; =A0};<br>
&gt;<br>
&gt; +static struct tegra_sdhci_platform_data sdhci_pdata1 =3D {<br>
&gt; + =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D -1,<br>
&gt; + =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D -1,<br>
&gt; + =A0 =A0 .power_gpio =A0 =A0 =3D -1,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct tegra_sdhci_platform_data sdhci_pdata2 =3D {<br>
&gt; + =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_SD2_CD,<br>
&gt; + =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_SD2_WP,<br>
&gt; + =A0 =A0 .power_gpio =A0 =A0 =3D TEGRA_GPIO_SD2_POWER,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct tegra_sdhci_platform_data sdhci_pdata4 =3D {<br>
&gt; + =A0 =A0 .cd_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_SD4_CD,<br>
&gt; + =A0 =A0 .wp_gpio =A0 =A0 =A0 =A0=3D TEGRA_GPIO_SD4_WP,<br>
&gt; + =A0 =A0 .power_gpio =A0 =A0 =3D TEGRA_GPIO_SD4_POWER,<br>
&gt; + =A0 =A0 .is_8bit =A0 =A0 =A0 =A0=3D 1,<br>
&gt; +};<br>
&gt; +<br>
<br>
</div>So I understand why board-dt is itself registering the SDHCI platform=
<br>
devices itself; so that the pdev initialization path is identical<br>
between fully hard-coded boards and board-dt.c.<br>
<br>
However, I&#39;m surprised that we would include the platform data for<br>
those devices within that argument; if we do that, we&#39;ll end up needing=
<br>
different platform data for every board, and devicetree won&#39;t have<br>
bought us anything.<br>
<br>
In other words, I understood that board-dt would register all the<br>
platform devices within Tegra, but not set up any of the plataform<br>
data, and the device drivers for those devices would be updated to<br>
get their platform data from devicetree if available, then fall back<br>
to old-style platform data. In other words, the way the SDHCI drivers<br>
work today in the devicetree/test branch.<br>
<br>
If my understanding is correct, shouldn&#39;t the chunk above and the<br>
one below be removed?<br></blockquote><div><br></div><div>That&#39;s if we =
cut everything over, I think. until then, this code should fill in the plat=
form_device and register it. But the values should come from the device tre=
e, and it should only register the controllers that are in the tree (and no=
t marked as disabled).</div>
<div><br></div><div><br></div><div>-Olof</div><div><br></div></div>

--0015174c3cf822805004a2f32b2e--

--===============0647890836883849818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0647890836883849818==--
