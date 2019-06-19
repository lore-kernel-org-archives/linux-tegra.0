From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/8] clocksource/drivers/tegra: Remove duplicated use
 of per_cpu_ptr
Date: Wed, 19 Jun 2019 10:18:05 +0200
Message-ID: <20190619081805.GC3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:52PM +0300, Dmitry Osipenko wrote:
> It was left unnoticed by accident, which means that the code could be
> cleaned up a tad more.
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 42 ++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 17 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J770ACgkQ3SOs138+
s6FwAg//dVTkrpxaLZ41QK0AvOfQ8qOR5oXFHUc8FPLDhaBrAYlCEqPxgKk5e3JJ
bR4EAdKMcfCdd54lrE0DS9k0aqdi6wmpwVi8WkwlUbg5Wzk5lWCCbTCsX1qBfL2H
k6twuyg6Y93OKDLpv9PBx+bW79QJGjvoVFmTI8cqm2fhWN7fv3tFg3gW1I5on7Qm
0np0BRZRok8r+CsvjBxWk6hDuyN3l9lC1OfAH6P61ODOTnEGa+8A60t6GoKozB8C
UNhUHzjIdqxoBr+0fAWX5MBuXfdLB81y4cOPtSPDUTF/x4pQpufweUvySsGhcaQ2
oON36mnFTboXLSJc3OEB1aZM6LXFeAokcjhUzJtMuBkUpUX7cj0TahYKUWfylvCT
08ta/F+2jvJ917CLwg1x8uWZaYRMfPwNhmBvyLzl4q7KJA7uGSxSk+6XP27Mfma9
YH78IRdwTN1Z6cyDJcgJGWfyoJZnKi4FLXSuTWZ/3cu9jnGx//OkuAG2ebu4iRu7
8EfbZ6ElDkNK50eANp8tUiQvGQ929wpT/Z6HA9vxmAULO24t4UOa1jkHvQ2DgN3k
HH9gfiXYDDpSPkIx6wGMCnc0+5J9sxBEEMDyEq/vS+fvI1xEEM/0SMydLD047JJL
2GxPRZCzx5tpJEZQgKGDsauFjAnhiDxUQRJRaOP3JuRYTEVFoyY=
=9tvU
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
