From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 22/27] drm/panel: Add simple panel support
Date: Mon, 14 Oct 2013 16:10:57 +0200
Message-ID: <20131014141056.GD16302@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-23-git-send-email-treding@nvidia.com>
 <52587CBD.8010304@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52587CBD.8010304-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2013 at 04:33:33PM -0600, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
> > Add a driver for simple panels. Such panels can have a regulator that
> > provides the supply voltage and a separate GPIO to enable the panel.
> > Optionally the panels can have a backlight associated with them so it
> > can be enabled or disabled according to the panel's power management
> > mode.
> >=20
> > Support is added for three panels: An AU Optronics 10.1" WSVGA, a
> > Chunghwa Picture Tubes 10.1" WXGA and a Panasonic 10.1 WUXGA TFT LCD
> > panel.
>=20
> >  .../devicetree/bindings/panel/auo,b101aw03.txt     |   7 +
> >  .../bindings/panel/chunghwa,claa101wb03.txt        |   7 +
> >  .../bindings/panel/panasonic,vvx10f004b00.txt      |   7 +
> >  .../devicetree/bindings/panel/simple-panel.txt     |  21 ++
>=20
> Since this patch defines new DT bindings, it should also be sent to the
> DT binding maintainers and DT mailing list.

I Cc'ed at least the DT mailing list. The get_maintainer.pl generated
list was pretty large, and I keep getting different feedback about
whether it's a good idea to Cc individual people or just the relevant
mailing lists. In this case I assumed that all DT binding maintainers
would be reading the DT mailing list and therefore see the patches. I
can change my habit though if you prefer to get an extra copy.

One slight inconvenience with large series like this is that a lot of
work is required to handcraft an appropriate list of people and lists
to send the patches to. Furthermore I personally like receiving whole
patch series because it gives me full context, but other people seem
to want only the patches that they need to worry about. So what I
usually do is handcraft a list of people I want to send patches to
and use it for the whole series. If that list grows too large, I'll
usually trim it down to include only lists. Having to handcraft lists
for each individual patch doesn't sound that useful to me.

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
>=20
> > +static int panel_simple_remove(struct platform_device *pdev)
> > +{
> > +	struct panel_simple *panel =3D platform_get_drvdata(pdev);
> > +
> > +	if (gpio_is_valid(panel->enable_gpio)) {
> > +		if (panel->enable_gpio_flags & GPIO_ACTIVE_LOW)
> > +			gpio_set_value(panel->enable_gpio, 1);
> > +		else
> > +			gpio_set_value(panel->enable_gpio, 0);
> > +
> > +		gpio_free(panel->enable_gpio);
> > +	}
> > +
> > +	regulator_disable(panel->supply);
>=20
> Can you just call panel_simple_disable() to do the HW cleanup, and just
> do resource cleanup here?

Yes, I can.

Thanks,
Thierry

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW/twAAoJEN0jrNd/PrOhnF0P/1oaYmdo7rc/1s8un3ohkJnC
TPeQNEjXPnq8sSGodtqsmX3FMboEw1novcRI0gCmoCKkssA8MoX706jKwXxie87o
NPkfyQyb6mWAXrSPYzjXm3ZgoRcp+nkYtn2713P37v+NNVOrRC7Wpm5VI1cKNwIh
1wBx2tWptPVCvZPUMUukajV9wRwaneYi+UGe4Oc0FY5IL508xX9akZn/HcolZNFQ
dVocakzrdats4VElEcmTB/chUacV7guR3KYFYKZJ5WyeXhBfdMSHCsKUp1R8rrcQ
1n2usA3mKzwjCldFtcb4SqIxRmm4aoLIOHsMNYrOL4/vg/jKJEKR2zvhoNxKiIC2
9QtB//UGSrUVXhCXtxqqJfmyPyxw7R6P1K0buC7PK4LywQdxtdK7lpDvDUMYo10g
OZOow3x30Gx9EZied7BVKzzamw3r+lh7rOO2sRtG7bzV2hd5Q4BYZHv2Ej+olPrS
FSFxZ51xV5mSBGe5Viq5LENVjzlXRQyBrMXzYyhzrcwVyLQh0aF63Lky9cMEpYCp
CWDD7cKECc290MC2yM0t+fG+DzXgnmu6fuSZ81kOgOUbh7NwWnBX0WHi2ZHCqcP7
wfa6QMzEatAxoemedAI7lRQac6LbAdU/OxkebtCNxJL0/yhgYNce2WbwsRBTmjgN
at5cNVdbt2aKJmeMBUzb
=WO7N
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
