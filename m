From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Mon, 3 Jun 2019 14:12:27 +0200
Message-ID: <20190603121227.GB30132@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
 <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> > Me
>=20
> > > Please drop this. The default .to_irq() should be good for everyone.
> > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > .to_irq() which I suspect you indended to drop, actually.
> >
> > It's not actually identical to the gpiolib implementation. There's still
> > the conversion to the non-linear DT representation for GPIO specifiers
> > from the linear GPIO number space, which is not taken care of by the
> > gpiolib variant. That's precisely the point why this patch makes it
> > possible to let the driver override things.
>=20
> OK something is off here, because the purpose of the irqdomain
> is exactly to translate between different number spaces, so it should
> not happen in the .to_irq() function at all.
>=20
> Irqdomain uses .map() in the old variant and .translate() in the
> hierarchical variant to do this, so something is skewed.
>=20
> All .to_irq() should ever do is just call the irqdomain to do the
> translation, no other logic (unless I am mistaken) so we should
> be able to keep the simple .to_irq() logic inside gpiolib.

Well, that's exactly the problem that I'm trying to solve. The problem
is that .translate() translates from the DT number space to the GPIO or
IRQ number space. However, since gpiochip_to_irq() now wants to call the
irq_create_fwspec_mapping() interface, it must convert from the offset
(in GPIO space) into the DT number space, which is what that function
expects.

Thierry

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1DqUACgkQ3SOs138+
s6FVhA/+Ntg+Cx3rozwF01ZERFalnR9/BSEZVnaumyiI7sPBN7oUjVKDz2STSBx9
afn5lhn/4zkPKoQSJxSOI/r2O7rTURcgI5oxk7tF2yqGeczzAK5vwIcT5G0nSJuT
TkXRlJ9zfqtPyeB2Yx4GfCWSEH/Vr41qyvSkguXh/i9W6BvLa2P6bswPnlyAxfNT
Koqvr3s1n8XTAe0I9LgMfOysi4z11rkFzFa+mlYUKZ3AEcugwmaq7YB+Vh/h/3tB
kGujCh54G7A+pS4btTFMh838a87X1BsK1wmGYEl6IMGtvIgFgjLXH5OsqY6v7w27
xsy9mSsJvjqkgs3g0ket7A98fJj2cCyPwizWcw7E928I2gsycFTme1eD15Lqc67g
9bs5u4qYz3XmlQKwpfcJrclWOuf2t4oLz1oOmGSN23BgCaeN0LeC8bNwz3qRQike
PF3OjFVuT2akYLqdwWulq7QuChpF+MM08gxyGrDzi5r6LeseHW1pCxkkx1232UdW
zCkLy0sB2REYnGtehK1tPxQsFlgdvpcGkFT/OO8GUs8SlFTi6KMV05obpLyKM5Kr
M2zy80BLHRqTt92WkFbDpDjJDjPSI5/TDIoLeyfygwHnyHYRQgcFK3Amd3ymEkO+
I41b2VVXfoJKe+5jvXJaCOe5k4BfwEzhX9se78FozBsPLC7VnIw=
=9g0c
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
