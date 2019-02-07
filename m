From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Thu, 7 Feb 2019 09:27:51 +0100
Message-ID: <20190207082751.GA29438@ulmo>
References: <20190128145836.GA31317@ulmo>
 <1548849808.3939.7.camel@pengutronix.de>
 <20190201140025.GB12829@ulmo>
 <1549389941.3929.14.camel@pengutronix.de>
 <20190205221300.GA1372@mithrandir>
 <1549448885.3338.4.camel@pengutronix.de>
 <20190206113849.GA21676@ulmo>
 <1549464390.3338.8.camel@pengutronix.de>
 <20190206160023.GA23805@ulmo>
 <1549476724.3338.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549476724.3338.10.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 07:12:04PM +0100, Philipp Zabel wrote:
> On Wed, 2019-02-06 at 17:00 +0100, Thierry Reding wrote:
[...]
> > That way we operate on the same reset control, but we wouldn't need to
> > iterate over all existing reset controls in order to determine whether
> > we can acquire or not.
>=20
> How could we decide in reset_control_assert whether the provided rstc is
> allowed to change the reset line if both rstc handles point to the same
> struct reset_control?

The idea was that acquire/release would basically act as lock/unlock for
the reset control. So consumers would always have to call acquire()
before assert()/deassert()/reset() and they would be allowed to continue
only if acquire() returns success. Of course that's something you can
only enforce during code review, but that's pretty much the same as with
any type of locking.

So basically the idea is that if a consumers acquire() call succeeds,
the acquired flag gets set on the reset control and that consumer
becomes the only user allowed to modify the reset control. Any other
consumers would call acquire() and fail because the acquired is already
true.

But what you proposed works for me. We can always find constructive ways
to optimize this later if we need or want to.

Another possibility would be to keep an additional, separate list of the
temporarily exclusive resets so that only that list would have to be
iterated to find the ones that are relevant.

> > >  			if (WARN_ON(!rstc->shared || !shared))
> > >  				return ERR_PTR(-EBUSY);
> >=20
> > With the above I think we could just extend this list of conditions with
> >=20
> > 	|| acquired
> >=20
> > and things should work the same. Or perhaps I'm missing something.
> >
> > Other than that this really looks like a very nice solution.
>=20
> Well, apart from the API function names...
> devm_reset_control_get_optional_exclusive_released(dev, "id");
> would be a mouthful.

Yeah, the combinations are somewhat awkward. However, I would expect the
temporarily exclusive resets to be required in most cases, so that would
at least make the name a little shorter.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxb7AAACgkQ3SOs138+
s6E3ig//cmL5YmMqBFP5WPvj0gClgraWwofV1YrWgfDeos46JaOBlh8dcm0x2cvB
OEYwn4MQ4P0kHgGis7UNmN7h85/TPHp1zEdDDp1xJPg0gJSZcoIDbQkXaVUWmH/o
wkkDhNTZhv9idxCaq3IHZVPoAHkoK6O3NRM4Ji6zBX+izJkjtGNHJ0PzvAW3LqyY
Hr9PMmfgolhlxYbIG2E0ubysOYrDdAMLhqSOj1YocMJtxtFOCyDEMHwlIiQZKhXC
2CAz14MYnh6pv4sMuR1xhDIRXFQXMiBSBzeS2gEaUv7jsUl6X8EpBNpeEA8k0FvN
lHujeGZp18q56sIgpdqdr947XZOJ5XYKoNgXN9fqhsUC9NjXPAt5sE7/xuEr+A2n
fmXyDTRKf1wx4qBLr5YWWXf/+FpOom06UMFZlPXAbQdCEY2IWFOTGw/aoELHChbT
y7I8thCuSSAu6qEPXgMR5EyCodTNeTarfvsQz0PVLKmBOWLRuYV6d8LBr9SvqvHV
QOV2bVmT43qhKL0SZnqLhoucE3OPNTSYy2W9jWxf3cYHUzcpRnDNbzKM1NDrPuZN
PZTgsOu/g1EICOyYX/gI9rdv32wukc+/rIX9rXuWxuYdr0yvwP246QHxFS3Mk3UI
acxfpugZRzooaU/PkGfVOlpOFPehINMzk0LDcsOw2LU8IEBF98A=
=62pi
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
