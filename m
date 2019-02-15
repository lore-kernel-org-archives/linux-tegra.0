From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH][next] i2c: tegra: change phrasing, "fallbacking" to
 "falling back"
Date: Fri, 15 Feb 2019 16:32:45 +0100
Message-ID: <20190215153245.GA7374@ulmo>
References: <20190215153126.18575-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190215153126.18575-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 03:31:26PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The phrasing in two dev_err messages is using fallbacking which
> os less understandable than "falling back", so fix this up.

os -> is, otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxm25oACgkQ3SOs138+
s6GO7A/8C0HmG6XENjhczhq9kSHKo0dZ2OKPaUCcxYfzhwnKUzTgYszpwAMP8ghO
4l/CVYw6H9RP5js1tAzn5kq/+JQXs/RELSIlJO9/Q2keTObJ/UbUu9YbE7E98Gsi
xQJiRSM1IqbJfjIAzLrsiUrSHN0ULNNLOZ9mE+rAGQJRDQx9Pk1WaE7BK/Xn2r3t
GcSqwVyphEqkcxs8jVdJy53nALkWHZ5eGzlcoYrMeJNNNoDFvN+83wMxvAz76SI7
aqRSDxPVbeCThkEmJsgJ6mnEGODnleGmP+sBeWB3ELAWjeX2kJNtjeBzPQC8P6S5
K+PrFHqj+EnOIeH0SBq3G4U9TPVJtylJwlBOBxrUBQiZ+qswksWQSFfIHvqjTmBb
75Mr8iID5PqLtlgNlQIRKef6TWENQIS/WxjAe0Yqn/t/6Lul0NoLpYL8qWywMXen
3LFVYw5eekqrUPRmCOFi3t2keaPie7k65A/UzR+y4fK1SLYQCYHXvj/vBcG2UUHR
qWMtw8pIFkiQilVIJU6qLgRXRWyd0qhv3g9oUWzEuDT4HmA81EweRgy3Itd4j8Sb
H0QpT8kTMibqPG1WfkAg457zMYPqDlG4RKMCfQiqPGrBQzU478Sqo+zU8ulUzwEe
nu44EJz3KAO/NaF7CUpzJ4ddL1sRQCB0TG2LuHKnMsev39wjWFU=
=0IOU
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
