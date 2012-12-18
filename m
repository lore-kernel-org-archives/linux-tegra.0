From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: check HDMI sink capability
Date: Tue, 18 Dec 2012 10:23:54 +0100
Message-ID: <1355822634.1490.58.camel@tellur>
References: <1355767163-5423-1-git-send-email-dev@lynxeye.de>
	 <20121218065056.GA4909@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121218065056.GA4909-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 18.12.2012, 07:50 +0100 schrieb Thierry Reding:
> On Mon, Dec 17, 2012 at 06:59:23PM +0100, Lucas Stach wrote:
> > Check if sink is HDMI capable when enabling an output. This disable=
s
> > HDMI audio/infoframes if we are talking to a plain DVI sink. All th=
ings
> > except this check are already in place.
> >=20
> > Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/hdmi.c | 3 +++
> >  1 Datei ge=C3=A4ndert, 3 Zeilen hinzugef=C3=BCgt(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/h=
dmi.c
> > index ab40164..32ea7d4 100644
> > --- a/drivers/gpu/drm/tegra/hdmi.c
> > +++ b/drivers/gpu/drm/tegra/hdmi.c
> > @@ -673,6 +673,9 @@ static int tegra_output_hdmi_enable(struct tegr=
a_output *output)
> >  	usleep_range(1000, 2000);
> >  	tegra_periph_reset_deassert(hdmi->clk);
> > =20
> > +	/* if the connected sink is not HDMI capable fall back to plain D=
VI */
> > +	hdmi->dvi =3D !drm_detect_hdmi_monitor((struct edid *)output->edi=
d);
>=20
> Shouldn't we update drm_detect_hdmi_monitor() to take a const struct
> edid * instead so that this cast isn't required?
>=20
Yeah. There are a lot of functions to update to make this work right,
though. But as the next merge window is a fair bit away I'll respin thi=
s
with proper constified drm edid functions.

Regards,
Lucas
