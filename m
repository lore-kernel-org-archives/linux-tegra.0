From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Implement reset control reset
Date: Mon, 20 Mar 2017 14:16:37 +0100
Message-ID: <20170320131637.GG22463@ulmo.ba.sec>
References: <1488464177-24174-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488464177-24174-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 04:16:16PM +0200, Peter De Schrijver wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> For completeness, also implement this reset framework API for Tegra.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Reviewed-by: Arto Merilainen <amerilainen@nvidia.com>
> ---
>  drivers/clk/tegra/clk.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

This was missing a Signed-off-by: from you because you forwarded the
patch. I've added one before applying, under the assumption that you
merely forgot to add it.

Thanks,
Thierry

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP1jUACgkQ3SOs138+
s6GuwQ//Vw7KQQUjDQs/Udg7k3KYLsil198NTyN7t1LXrVwPT1RNEt0t3O071rGg
h3Zz1819cafUzvbJGI1B21G2K884j87WFqxL8sznXarXT8qrmwcS8c14eS9xtOTm
GMTtZN/kX+R30WVPB47uaT+X4N4bHbHH47ZdRIfvGRDlMtff5v7d3k7y/nN+KjVA
LyrSh+tQMJn52ZAYo65+icSxgnpYoSmoFGyRA2cRK8I2jPruXIks84ApIcQdCzAo
NIl8sjSycJXI+BfQZQMvbBZqgT3FZZwAmoPgfIEz2+gJoPZQ4n1EmNn3y3SaMHQB
RBuvX+a5KfVcTb9yhx42ctnCKTayEeN7Q7yFv9RQfP6TNAUwxvxhVyhj4a3QfPpI
vovq2e7fZ5MnZEbNWBt3M1PuqJXVr/o6xv5Ww46x3Vp69GII2rwyRzaRhLfAEfrM
5nS16VnfESNjE9dlLoqAz2XklqlPg7mHq7IIr+cvh6oG8gafDwZHHhW6NREZFPve
QKvsN9CJM9ZP/TqIBG4j0GUsmAZSsVVDD9V8sZ4Orh17/HSx8lo2qMO8y/C80IJt
YL0B/VFfFDcZJ7TPHT7/nER2phVM+APMcLn6A9qMCR6LZJtWftHw2cwrv0Z16zM6
VGmq86W9rkgKnXEpwLCxYdrvDWxSj56w86PWNobL+eTVLHpOoe0=
=8rfe
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
