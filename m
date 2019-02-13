From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V19 1/7] i2c: tegra: sort all the include headers
 alphabetically
Date: Wed, 13 Feb 2019 09:35:20 +0100
Message-ID: <20190213083519.tynjs3ef6tnvvsms@ninjato>
References: <1549998408-9137-1-git-send-email-skomatineni@nvidia.com>
 <de27b8f8-ba8e-fca7-6bdc-cdd580d959e6@axentia.se>
 <cdb66da2-4886-e3ba-e78e-264bd4b5b73c@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mq2ttdhzzwepa5vi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cdb66da2-4886-e3ba-e78e-264bd4b5b73c@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter Rosin <peda@axentia.se>, Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mkarthik@nvidia.com" <mkarthik@nvidia.com>, "smohammed@nvidia.com" <smohammed@nvidia.com>, "talho@nvidia.com" <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--mq2ttdhzzwepa5vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > "^ Header removal should be mentioned in the commit message, I think."
> > - Wolfram Sang [0]
> >=20
> > Cheers,
> > Peter
> >=20
> > [0] https://lkml.org/lkml/2019/2/11/375
> >=20
>=20
> It could make sense to adjust the comment only if there will be
> anything else worthwhile a new revision, otherwise it is
> not-so-important.=20

Not quite. Addressing review comments and proper commit messages are
both important. So, it needs to be fixed. Yes, I can fix this small
issue locally here (and I will do this, so no need to resend), but this
is ultimately my decision (which you can surely ask for but not
rely on).

I'll apply this series later today.


--mq2ttdhzzwepa5vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxj1sQACgkQFA3kzBSg
KbaxNA//ahfn70SFTuWNC06WH3CmxOELccKUpXziV4mM1i38ljYSbzMGNPKWEtUA
OhJ+2ZgIVcavuinuw6TlXswfcWe081BZywhSJYylKWID5pIPJf1DuGVSEWdmvlui
f7TMZzpSLjUztq9y/inRHzPTF8vfiPJPfhGNZSbXNyoXLelQY7kp/ffF5GLqpd8b
EtTi065Dhb76vsdOJXFgqH96w2os+6mVpeKLpnmvJqTZ7Xu+3qzT5ICehYGdQE3C
jaux7tbWzy4JJntRN3bNorBvE0vYgO9EVOQ/7Jot0q+qbf+UI8iv48Lg3XUT9w/t
g/2DwKmL9Hy2hdsfo3yhVc0dUqm218SqQC1JZgsgujjX4XtSBlUa4txjqu6se7qn
lieRegzRSTGueuJad3dlP1ZyNtGNQxCV7ySjWEXBDHJtW/VF1cKrac8bI6WmPHCC
q6nniai9Woz65+VMiycZzshVwYB6Rf3HoC9jADhyv2EvjnKZnGePNPw4Lo3GJ2E2
S14axbfr2i19jXSGoBl/ZAy6pkvr5T8L9fRMELmja+cbKzqxQVLlppsXh9BJ3+HZ
BHkORi8yry9Vrcbz0seGXtGM0DjymKPAKZZHvZs7o6ZJxOb1IrOEHkfG89nd8awo
jgyb7fTcTsyJySDAjYyfd1h90Qaf+BtjAmUY3eOWQ+B+tinzcm4=
=u57D
-----END PGP SIGNATURE-----

--mq2ttdhzzwepa5vi--
