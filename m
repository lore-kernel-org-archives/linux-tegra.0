From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Fri, 6 Oct 2017 13:07:49 +0200
Message-ID: <20171006110749.GB22706@ulmo>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 09:22:17AM -0500, Grygorii Strashko wrote:
>=20
>=20
> On 09/28/2017 04:56 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi Linus,
> >=20
> > here's the latest series of patches that implement the tighter IRQ chip
> > integration as well as the banked GPIO infrastructure that we had
> > discussed a couple of weeks/months back.
> >=20
> > The first couple of patches are mostly preparatory work in order to
> > consolidate all IRQ chip related fields in a new structure and create
> > the base functionality for adding IRQ chips.
> >=20
> > After that, I've added the Tegra186 GPIO support patch that makes use of
> > the new tight integration.
> >=20
> > To round things off the new banked GPIO infrastructure is added (along
> > with some more preparatory work), followed by the conversion of the two
> > Tegra GPIO drivers to the new infrastructure.
>=20
> Hm. So you've ignored my comments [1].
>=20
> Sry, but I do not agree with this series.
> - no prof that it can be re-used by other drivers than tegra
>  (at least I do not see reasons to re-use it for any TI drivers)

I had done some research based on Linus' feedback from an earlier series
and identified the following potential candidates[0] that could move to
this new infrastructure:

	- gpio-intel-mid.c
	- gpio-merrifield.c
	- gpio-pca953x.c
	- gpio-stmpe.c
	- gpio-tc3589x.c
	- gpio-ws16c48.c

Note that this is based on code inspection rather than DT inspection,
because that's fundamentally flawed. If you look at this from a DT
perspective you're going to be tempted to change the DT bindings, but
you can't do that because of backwards compatiblity. This new framework
also doesn't address the issues at that level, but rather tries to be
some common code that is otherwise duplicated in one way or another in
various drivers and therefore hard to maintain. This is what Linus had
originally requested, and that's what the series does.

> - no split

What does this mean? The series is nicely split into separate patches,
so each one individually is easy to review. I've also gone through quite
some trouble to make sure everything builds fine after each patch, so
it's possible to apply individual bits of the series. For example we
could opt to apply everything up to the banked GPIO support if that's
still contentious.

> - all GPIO IRQs mapped statically

This series predates your work on the dynamic IRQ mapping, so I hadn't
picked up those changes. This should be easily solved by the attached
patch, though.

> - irq->map[offset + j] =3D irq->parents[parent]; holds IRQs for all pins
>   which is waste of memory

It's the only way to generically do this. Also I don't think this wastes
that much memory. We have one unsigned int per pin, which even for very
large GPIO controllers is unlikely to exceed one 4 KiB page.

> - DT binding changes not documented and no DT examples

That's because this is completely orthogonal to DT bindings. We can't
make any changes to the bindings because of ABI stability.

> - below is ugly ;)
> +	bank =3D (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
> +	pin =3D (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;

If by ugly you mean wrong, then yes, it's actually the wrong way around.
It should be:

	bank =3D (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
	line =3D (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnXZAMACgkQ3SOs138+
s6GO+BAAhbgNM4qW74OHehaHu8MZlZRnv818xpC4NWKNe/0Z+R89YP8p0RfKz8mS
5ZFP0s4qoy69C5MPDFrn09+i6YaTtu4ExTMu+BARLyWYd/t9dyzLY63e3ZBluwAi
LMtmNmmJVrsbAmjdfzwXZbCWf2xAAG3pi0V5+jO18/5PQ0IwHGwInS+rdzmT5RBH
yseyV1fC32/1eO1Pf0zDwNKaQLZ5Ej9ebe17+mU8hTsGh0zrDm7mrUd5Zbz0yeU4
7gB3ZIpJhU9IN43v77+EVJQ+DNQXNT7IOyyB8acuxPFjTLz3BiFmdlSmvpVTsrkV
bmf7QTYhq+NmL2x+EICE0/nKIJ+M0nLnbPsQYPouTm5w1+3s5rNTOoZtH9Z1DsRS
5CZznu57r6TwBLrV1Atj7de133puoh63J/B4yhDrhmEeWkYR6erctHZB9K9vHuLu
RPU1OkmmMOcByc7dJgFxRpJ8CZtL37EcVYwdHUHITT+N2lKUK+7d2l+/yWDeJXkM
1xKZoma+Tv+8BfOYx/Co1b1V9WS/ib7b42p9oH9/IghNYbVS3MZZHz093AT68ND6
+XftThQ1/ner6Fuk6rxDKnyalO2mdv4spZAs4F52TtMnxCd2rG2Zxu78tYgdhS2K
NYaGkkx8YrxonXJSolu880u2hROBK4emJjP/gGTqDdxIt7dPAjU=
=tId/
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
