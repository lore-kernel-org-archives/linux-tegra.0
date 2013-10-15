From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 17/27] drm/tegra: Add Tegra114 HDMI support
Date: Tue, 15 Oct 2013 10:13:39 +0200
Message-ID: <20131015081318.GG7856@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-18-git-send-email-treding@nvidia.com>
 <52587967.6050806@wwwdotorg.org>
 <20131012114122.GF22284@mithrandir>
 <525C338D.50801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525C338D.50801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 12:10:21PM -0600, Stephen Warren wrote:
> On 10/12/2013 05:41 AM, Thierry Reding wrote:
> > On Fri, Oct 11, 2013 at 04:19:19PM -0600, Stephen Warren wrote:
> >> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> >>> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>=20
> >>> Tegra114 TMDS configuration requires a new peak_current field
> >>> and the driver current override bit has changed position.
> >>=20
> >>> diff --git a/drivers/gpu/drm/tegra/hdmi.c
> >>> b/drivers/gpu/drm/tegra/hdmi.c
> >>=20
> >>> static const struct tmds_config tegra2_tmds_config[] =3D { @@
> >>> -223,6 +224,85 @@ static const struct tmds_config
> >>> tegra3_tmds_config[] =3D {
> >>=20
> >> Not related to this patch, but those should have been named=20
> >> tegra20_tmds_config[] and tegra30_tmds_config[].
> >>=20
> >>> static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
> >>=20
> >>> -	value =3D tmds->drive_current | DRIVE_CURRENT_FUSE_OVERRIDE; -
> >>> tegra_hdmi_writel(hdmi, value,
> >>> HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT); +	if
> >>> (of_device_is_compatible(np, "nvidia,tegra114-hdmi")) {
> >>=20
> >> Let's not check this at run-time. Instead, host1x_drm_subdevs[]'s
> >> .data field should be used to contain either flags or a pointer
> >> to a configuration structure, either of which can be directly
> >> consulted to determine the properties of the HW in a
> >> feature-oriented/semantic way.
> >>=20
> >> drivers/gpio/gpio-tegra.c's=20
> >> tegra20_gpio_config/tegra30_gpio_config/tegra_gpio_of_match
> >> provide a good example of this.
> >>=20
> >> This means that if Tegra124 is identical to Tegra114, yet a
> >> hypothetical Tegra999 is different, you don't have to keep
> >> adjusting these if conditions throughout the code; they can
> >> simply refer to the same feature bit forever.
> >=20
> > Okay, I'll see what I can come up with. It's unfortunately not as
> > simple as the GPIO driver's parameterization, and who knows what
> > other differences will be introduced in some later versions of this
> > block.
> >=20
> > What I mean is that at some point it becomes questionable whether
> > it makes sense to parameterize at all if you have to encode the
> > register offset and bit position within that register for a large
> > number of bits.
>=20
> Well, I wasn't advocating that we shouldn't have an if statement at
> all. Simply that the if statement shouldn't be doing string compares
> of specific HW. Either of the following would be fine:
>=20
> if (hdmi->soc_data->some_feature_flag)
>    // just represents some code; doesn't have to be a function call
>    do_something();
> else;
>   do_something_else();
>=20
> or:
>=20
> do_something(hdmi->soc_data->some_feature_value);

But the fact that a bit has moved from one register to another can
hardly be defined as feature. At least I couldn't come up with any
sensible name for one.

We could of course just add a version number into a per-SoC descriptor
and use that, but that's not any better than checking for the compatible
value, really.

Ideally of course the hardware wouldn't change in these ways from one
generation to the next...

That said, I've opted to go with putting the register and bit position
into a per-SoC descriptor and parameterize on that, along with a boolean
flag for the existence of the IO peak current register.

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSXPkeAAoJEN0jrNd/PrOhY4YP/2+H/ILyiiGTeq9yG03manHz
Oagjxr0AzC3U+WV5uVCf/wdqF6a5/AB9IIDKiHXXd+6vtvyvMGkhA2RyhlXjuyz1
SnIho0B7T0tMs8xiBGuFlllgwJF4Nmi5VA2SVaGUl03NG53UHyHYn6rwUSsb+iaJ
bB+peXUbuXCXkTj5zceu9XwTd1EGNpYeCHwEd9GhJzQHYEE5N+dgTs4VT7CNrGLw
84we37LC6SPYoP+UigQGYH/fva0JwOjqTP6ACkgOzRUBtqQXXIwcAkP9kFeDWyIL
u+1AYhluLgOvZU9oq0Xnm3PK3CZIwuU+0Ne30bMMm82aIF+IIdJ2jAw+ruKX8t8h
GNqvau20TwyID/PnPa8dLYZZznWfl3E8f4BKlEZ0B2F4lNGctCCR/a12dNnZw2MG
9oe4uc66qXzoYbvcOSeS7J6EAi1SSzMgYor7wDlnFJqU5J15JosmeAoOmNQDoO9C
dLTYg9fLrirxcos5hrAJMCqKTBJuevtTL/BQK4yNk+D5MSe25QvHy/Litn/bSvix
pa51k1t3nHMfmuheFX3E2+bDJd57umfV8RKfXjxMKnEPsCwzgE6pnYvt+ATRSIUc
FVlooARAAOcAIoV1J9gmNNf6S65clz264Zy5mwl+JHB97UnO27LS6dw6jFtMLrty
XfeKywrRVSKZqk4+a4ni
=MSvy
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
