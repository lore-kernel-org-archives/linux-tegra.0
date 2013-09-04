From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/3] drm/panel: Add simple panel support
Date: Wed, 4 Sep 2013 16:38:30 +0200
Message-ID: <20130904143829.GA11833@ulmo>
References: <1377876321-26835-1-git-send-email-treding@nvidia.com>
 <1377876321-26835-3-git-send-email-treding@nvidia.com>
 <52262FF4.6050605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52262FF4.6050605-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2013 at 12:52:36PM -0600, Stephen Warren wrote:
> On 08/30/2013 09:25 AM, Thierry Reding wrote:
> > Add a driver for simple panels. Such panels can have a regulator that
> > provides the supply voltage and a separate GPIO to enable the panel.
> > Optionally the panels can have a backlight associated with them so it
> > can be enabled or disabled according to the panel's power management
> > mode.
>=20
> > diff --git a/Documentation/devicetree/bindings/panel/panel-simple.txt b=
/Documentation/devicetree/bindings/panel/panel-simple.txt
>=20
> > +Simple display panel
> > +
> > +Required properties:
> > +- compatible: should be one of:
> > +  - "auo,b101aw03": AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> > +  - "cptt,claa101wb03": Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD=
 panel
> > +  - "pc,vvx10f004b00": Panasonic Corporation 10.1" WUXGA TFT LCD panel
> > +
> > +Optional properties:
> > +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> > +- power-supply: regulator to provide the supply voltage
> > +- enable-gpios: GPIO pin to enable or disable the panel
> > +- backlight: phandle of the backlight device attached to the panel
>=20
> Do we need to represent the timing requirements e.g. between panel
> enable and backlight enable, or do you expect the driver to hard-code
> this based on the compatible value?

Yes, I'd expect the driver to hard-code that, similar to how the video
mode is hardcoded. ddc-i2c-bus support hasn't even been implemented yet.
I was planning to do that because one of the panels (the Chunghwa I
think) actually is connected via DDC. What I was going to do was prefer
a hardcoded mode over EDID to allow a driver to override a faulty EDID.

> Looking at the driver code, it seems that it has direct knowledge of the
> video mode that each panel supports, so DDC is actually optional unlike
> what I asserted/assumed in my previous response. As such, I guess we
> should have a separate DT binding document for each of the three panels
> (compatible values) listed above that pretty much just says "go look at
> simple-panel.txt".

Okay, I suppose that makes sense.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJ0XlAAoJEN0jrNd/PrOh7iMP/AxEnK6mo55lUYijqFYMyiau
frO1LmkHTqmEC11dECmjVWto8D0BPnHr0yZ+Cy8bygDpE06aqforAm2GXDW2o6bb
/YbC5FTDf/SvwEZT7oGwI2H5NlR1BKscTTJM4t0uCgvjdNHOnHuhRdN873fwJkAU
Y0yjJVrD+qpFP+cCUm/ZRv/0EO5SLxQJPLEJnFBcHzOnYF8pFcApc5RO8FNB2Fto
a3UEyUJ7HP81JAAfcMVsWA8OcCQ/DpKbCwXjWu12wMvWRClBjTOwVG+Llx/lL+4F
qn1uO5ADlJ/3WQSAv2Sz5fEgz6R6+9coKnI+innUDoP8yO16VQLvZMVOnIH3cpYN
M3dpav4jNvLjEqUB5pPaSdHTJ95yp9TGr0ncPdpUbNaLbOLhLcDvJyqX6Exy2D7g
lQ4/YPPqcJy5yk4TZgXOiDUAGrmcKlitCa3SPzNvslwVsOiLrrCBTb61wF16uJw7
Pk+2pWRljPN8COCyOQ//kwUI7tIEcUEIMk1ocWfiNHAAh7cyJ7ItWnuZKO3+SJ+S
QdKokTfuXafhKqkjc22rQ3JAb/vHrXHc7k5nQ2lr9ZXrxjSgnjG8rsJuf4gedK3B
IRqakWF4BiXTx/RuWHRdh2koIlrU7Hb11y9460w9/YXRVtkdI1akpxSy37iG1Ksd
rJ52tTWH2Y1g0lkFEVKJ
=nC/j
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
