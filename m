From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 18:17:05 +0200
Message-ID: <20181012161705.GC2340@sirena.org.uk>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
 <1539272073.18645.12.camel@toradex.com>
 <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
 <1539337415.30485.21.camel@toradex.com>
 <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
 <20181012104338.GS30658@n2100.armlinux.org.uk>
 <CAHp75VecxqphJBZ2xUTku-WhyjkDRKQPbxvuGFAZ+-1voZRW9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VecxqphJBZ2xUTku-WhyjkDRKQPbxvuGFAZ+-1voZRW9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, jmondi <jacopo@jmondi.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, philipp.zabel@gmail.com, linux-tegra@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 12, 2018 at 04:58:38PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 12, 2018 at 1:45 PM Russell King - ARM Linux

> > Given that DT describes the hardware, not the software implementation,
> > it must not change just because we move from GPIO numbers to GPIO
> > descriptors.

> > The existing DT description is reasonable, and introducing ficticious
> > regulators in DT to work around the implementation is not reasonable.

> If there is no way to detect shared use of GPIO line for regulators
> (*) from current DT description, DT description should be updated to
> reflect, yes, hardware.

> (*) Not familiar with the guts of DT descriptive language, don't know
> if there are some ways to do a such without additional flags or so.

You can detect this via resolving the GPIOs and seeing if it points back
to something that's already in use for an enable.  This isn't ideal
especially if you want to do it up front but it is doable.  You could
also just assume anything might end up being shared and rather than
doing it up front which is easier and probably about as good.

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvAyQAACgkQJNaLcl1U
h9AxNAf/dagFIggZW486itfhQDBJTefSA7vwmkxbzYKHZwodlcpEpGhwWUGxveyO
8kGuCjpCHU1knlsCL1q+8A9HwWnbCRp/aDYLXHpvSS/vghpCaKTdwo2ZBLg7PSjy
AVd9f/+d4pxoL2eUNgyl6D+EjymXk/v0sgu+uXF6wnHyrAhvD7UAhzAs3EAB00UW
0pkTrYLtpfSJjM+BKurnp+uQ9H3W7GKp86NOE5coFK8rvGQ4J0Mx2VutuMC4VYeR
6RBFMAuXFhnd/bhR/is0giBumfxaHD3vX4QVfxk8vhXhJ5OsO+nzSeMBrG7mS8kO
YXzCtuLAJGuQgrOkXMKYs2UJcZBBZQ==
=7HRA
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
