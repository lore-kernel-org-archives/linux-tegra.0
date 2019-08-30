From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/4] regulator: add and use a helper for setting supply
 names
Date: Fri, 30 Aug 2019 10:15:50 +0200
Message-ID: <20190830081550.GA25502@ulmo>
References: <20190830071740.4267-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190830071740.4267-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 09:17:36AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> There are ~80 users of regulator bulk APIs that set the supply names
> in a for loop before using the bulk helpers.
>=20
> This series proposes to add a helper function for setting supply names
> and uses it in a couple tegra drivers. If accepted: a coccinelle script
> should be easy to develop that would address this in other drivers.
>=20
> Bartosz Golaszewski (4):
>   regulator: provide regulator_bulk_set_supply_names()
>   ahci: tegra: use regulator_bulk_set_supply_names()
>   phy: tegra: use regulator_bulk_set_supply_names()
>   usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
>=20
>  drivers/ata/ahci_tegra.c           |  6 +++---
>  drivers/phy/tegra/xusb.c           |  6 +++---
>  drivers/regulator/helpers.c        | 21 +++++++++++++++++++++
>  drivers/usb/host/xhci-tegra.c      |  5 +++--
>  include/linux/regulator/consumer.h | 12 ++++++++++++
>  5 files changed, 42 insertions(+), 8 deletions(-)

The diffstat here suggests that this isn't really helpful. Even if you
subtract the regulator code that adds the new helper, you actually have
a zero diffstat (and a positive one in one case).

Instead, why don't we take this one step further and roll a bit more of
the boilerplate into the new helper, something along these lines:

	struct regulator_bulk_data *
	devm_regulator_bulk_get_from_names(struct device *dev,
					   const char * const *supply_names,
					   unsigned int num_supplies)
	{
		struct regulator_bulk_data *data;
		unsigned int i;
		int err;

		data =3D devm_kcalloc(dev, num_supplies, sizeof(*data));
		if (!data)
			return ERR_PTR(-ENOMEM);

		for (i =3D 0; i < num_supplies; i++)
			data[i].supply =3D supply_names[i];

		err =3D devm_regulator_bulk_get(dev, num_supplies, data);
		if (err < 0)
			return ERR_PTR(err);

		return data;
	}

That seems to be still a very common pattern and gets rid of a lot more
boilerplate, so your diffstat will actually start to be negative at some
point.

I suppose one could add a non-managed variant for this as well, but I'm
counting 6 uses of regulator_bulk_get() vs. ~140 uses of the managed
variant, so I'm not sure it's worth it.

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1o2zQACgkQ3SOs138+
s6E4FQ//bIrTrh6mYLEypci9Lz5fy/h9qh0mbcgfmUz43e3u1ktpwr3hcfLjOZPv
9kJgsZQr7bqtL4BnAsVDfij55LZhxIkjLi2asNMZVvnjA4yZUzr/TaEJm/OX0G2T
1uTSRQtSfKAriNsIgpuvHbZYHWjeGj9I7VeQfN44PiJbpSYdm18PPIj3MpNNYTua
RW0I4rohY/LuKzZDrbAJm2fT2/QnOpawezs15J1HNOchXtXx3wP+jEis464B67ty
TH0I257uMsCaSjDaBj7mgty7bCXxsnNwdCiCSpzZszbdiKizKgYdvO3unjo6M3k6
ym85mff7D/5OWUzS9va821TOyzhAawYdZdkV0dmzizB+fi94B3/07aP3qbZ1IJNW
2qTADamv94WL/hx8UfCuXAq4Jk7Vh95q5aNH+JCuN58C0L5gl67Ne42xGL2S0spG
iTqE2Nf0Goa7wstt45oktH3Min8aHWeC/7jfVQUlvHpnaI5DawISv4T3pmqDNVOm
78ItwJ3QyHzqan2eFsqS56aRaWdI6N8YfZ4iZWFjYDQGoxTEy5gBwSjK09DZeqR8
ApOGkJHj56MkHI1Mv04dsxsswTCIHpP9N6dGf8gwi8D/GdtURtsmT0yf/c1nV7E3
I7+779qe0fvv9DMHIGIUp/OgumL70GLq+LeJ6HH3N6YHaSwWJRs=
=Cngb
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
