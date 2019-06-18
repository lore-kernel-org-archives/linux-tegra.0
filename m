From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 7/8] soc/tegra: regulators: Add regulators coupler for
 Tegra20
Date: Tue, 18 Jun 2019 18:14:53 +0100
Message-ID: <20190618171453.GO5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-8-digetx@gmail.com>
 <20190617154632.GB5316@sirena.org.uk>
 <2308e5da-a8fd-a0e6-f98c-0931a30baf14@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e890kymSckUvwzhr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2308e5da-a8fd-a0e6-f98c-0931a30baf14@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--e890kymSckUvwzhr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 07:52:06PM +0300, Dmitry Osipenko wrote:
> 17.06.2019 18:46, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * Voltage regulators coupling resolver for NVIDIA Tegra20
> >> + *
> >> + * Copyright (C) 2019 GRATE-DRIVER project

> > Please make the entire comment a C++ one so things look more
> > intentional.

> This is actually a correct SPDX comment style for the source files, accor=
dingly to
> checkpatch. While the C++ style should be used for header files only. I'm=
 not
> following the SPDX effort much, don't know from where these SPDX-style ru=
les are
> coming from.

The SPDX bit is fine, what I'm saying is make the rest of the comment
also be a C++ comment.

--e890kymSckUvwzhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0JHAwACgkQJNaLcl1U
h9Adkgf7BRUN7vDJiY8PukrNZjKDCtqOwtshsNBH1cFOzUQKpciz9amzrYfVfsc/
6ov8uf5yZSf9hI5bDdTc50dUt0/OgO9GzicotrEEFigksUYoiXRGdSxw3KdbUZt/
oUlj1kMfYyPuMJAlfjhUENenMFLjdy+cVMh3eLInBpAgb05vqVA5iVQe7TIhhEoG
SnEYnQhnoYhlfWW5QedRHVJqT2Q2plD1D1etkNDJ8mLnkthpp41qltl3CCWQB7Du
8PyUAEdj2c2ghozukM/G462I9un6VMh+umO3j49Ub9bhc/aZMI0XE1v/y+G7EI3G
R02wzbvVGiTHnJxbj4Tpf/W4wwFAdQ==
=Dc/q
-----END PGP SIGNATURE-----

--e890kymSckUvwzhr--
