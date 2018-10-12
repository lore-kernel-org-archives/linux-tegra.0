From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 18:57:51 +0200
Message-ID: <20181012165751.GI2340@sirena.org.uk>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
 <1539272073.18645.12.camel@toradex.com>
 <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
 <1539337415.30485.21.camel@toradex.com>
 <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
 <20181012104338.GS30658@n2100.armlinux.org.uk>
 <1539344591.30485.28.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539344591.30485.28.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>"linux-tegra@vger.kernel.org" <linux->
List-Id: linux-tegra@vger.kernel.org


--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 12, 2018 at 11:43:13AM +0000, Marcel Ziswiler wrote:
> On Fri, 2018-10-12 at 11:43 +0100, Russell King - ARM Linux wrote:

> > The existing DT description is reasonable, and introducing ficticious
> > regulators in DT to work around the implementation is not reasonable.

> I don't think it is that fictitious as it makes it crystal clear that
> there is something shared with all its pros and cons. E.g. what happens
> if one of them regulators wants to turn off while the other one still
> needs power? The regular regulator dependency tree would nicely make
> this all clear.

We already have code to handle that via refcounting on the GPIO once we
identify that it's the same GPIO.  If we make a shared virtual parent
regulator that'll break other things where we're tracking what the
actual physical parent for voltage reasons like adjusting parent
voltages up and down to improve efficiency or handling things that are
just dumb power switches rather than actual regulators.

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvA0o8ACgkQJNaLcl1U
h9CyGgf/fTeudX6kIfqmUFuZBMh3F6KuHTcd+G1ns+loJwMPBYjbPLCRYYizA4HK
mm2cNaF2xXV+/HAck9SXH/4X6D46hIJtbdecYPiMUfU8Crm6GhsWR2fg0JCDxvWF
gTpbE367Yn34YqxIC9zDltWMj4r1+/NkbyGHFkrUtz7P69ImGRf/2l9YIJUsoBUT
kEW3YkOHfMERDQeaXcp7NU8mHMtHFlJdQjnfX5yH3ZLkfrf0dRnJl6SJyFyyTwrc
eNM9FHJij8CuR82MX+lENcWHU+Rswez0aezN7edWvL1y+Ajmw64qYlRmWBJZAMp/
UYcKfCcYR8+qXxFF7kj97/ZLYKhWYQ==
=2TbA
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
