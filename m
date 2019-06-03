From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Mon, 3 Jun 2019 17:28:48 +0200
Message-ID: <20190603152848.GA23747@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
 <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
 <20190603121227.GB30132@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603121227.GB30132@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 02:12:27PM +0200, Thierry Reding wrote:
> On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> > On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > > Me
> >=20
> > > > Please drop this. The default .to_irq() should be good for everyone.
> > > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > > .to_irq() which I suspect you indended to drop, actually.
> > >
> > > It's not actually identical to the gpiolib implementation. There's st=
ill
> > > the conversion to the non-linear DT representation for GPIO specifiers
> > > from the linear GPIO number space, which is not taken care of by the
> > > gpiolib variant. That's precisely the point why this patch makes it
> > > possible to let the driver override things.
> >=20
> > OK something is off here, because the purpose of the irqdomain
> > is exactly to translate between different number spaces, so it should
> > not happen in the .to_irq() function at all.
> >=20
> > Irqdomain uses .map() in the old variant and .translate() in the
> > hierarchical variant to do this, so something is skewed.
> >=20
> > All .to_irq() should ever do is just call the irqdomain to do the
> > translation, no other logic (unless I am mistaken) so we should
> > be able to keep the simple .to_irq() logic inside gpiolib.
>=20
> Well, that's exactly the problem that I'm trying to solve. The problem
> is that .translate() translates from the DT number space to the GPIO or
> IRQ number space. However, since gpiochip_to_irq() now wants to call the
> irq_create_fwspec_mapping() interface, it must convert from the offset
> (in GPIO space) into the DT number space, which is what that function
> expects.

Hm... I wonder if we even need this irq_create_fwspec_mapping() there.
Couldn't we just do an irq_create_mapping() since we already know which
one of the GPIO IRQ controller's interrupts we want to create a mapping
for? If we already convert to the GPIO number space in the .translate()
then the offset already corresponds to the one that we need to map, no?

I'll make a note to try that tomorrow.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1PKwACgkQ3SOs138+
s6EvrxAAhvVOkUGVn6WQQ2jnZM1b0tya6pzAhUw11OYc7Ub6nc6yFaiQ8wE0pbcG
cAApoHS1T00Yj8qHqUQHieIVRAEE0dpWheKOs4hNsWHu/SlYW0l19EbfYOFBqo+n
iQje2Vtmc2/eYSwHmE1ggqbX2OO9MtvxQ7oyKCPxXzDlXOO0c7zEMKvHmZpEp4zy
RBNCQAcqUR3JbUgMVd4qvxytWjxhJo/AscOJ2754Wvd7Ut6FpO0qIJsTCcOCMaua
6le5HOOYVEgj0Wd/3CFJUrpQWlikVPRUHVCZECieBoruv2IcffHC/zxDlYpMTRdV
+9OLds+6TRf1R6AiIPiAm/tcRpG+D30RoR8AsruR+9GuVZoRQf21Pr+pTT4WhWRT
NPYRVSxe+mAMXgCjoWcu5qWYkweMsCxUVFhGWyoe0tRlxV3t0BJf6Rd+69SgbMmd
RTJtLY/3vGkNkI7iXFEJgH8iBr0mPLCBMG6SwcA7E3xopVqhzHU2lsSNUEG5x6nz
z09tzO1Bsr2RNAz5j5mPxJPUdbcUwE3dHnRB4XG99vCBxsPoPNShHir/9ygUg2tM
sFLPLcMvHJfNe/jukF+3C0jLVVs8ZYY4yDfJtltKDwhoBeiS1+T7hocMlsohM8VG
Mmsv1050gE6pzqQKF4sxEhqNO8vuh4gbOyX8cYThMdtkBic2aFQ=
=IpuP
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
