From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: add Tegra210 special resets
Date: Mon, 20 Mar 2017 14:26:55 +0100
Message-ID: <20170320132655.GJ22463@ulmo.ba.sec>
References: <1489582774-22217-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HcccYpVZDxQ8hzPO"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489582774-22217-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 02:59:32PM +0200, Peter De Schrijver wrote:
> Tegra210 has 2 special resets which don't follow the normal pattern:
> DVCO and ADSP. Add them in this patch.
>=20
> Changelog:
>=20
> v2: add DT bindings file
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 85 ++++++++++++++++++++++++++=
++++++
>  include/dt-bindings/reset/tegra210-car.h | 13 +++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 include/dt-bindings/reset/tegra210-car.h

Applied to for-4.12/clk, thanks.

Thierry

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP2J8ACgkQ3SOs138+
s6Fn8xAApGqKpPaZw489mermEUd84Fmb3URmQE/quHiRt+2hXB9STPgc5ePNGLYs
rF2sGz8zE9qiQSlXONf3BfUQwQMCeTTFLYdv1It9e/Z6eLIsJfiLOyORfC2sBwIN
xPTSIR7PP5sSGjm6Gzp5uwp2HHTBcqN29nJVPUIqqjqTZB9XwPmznEb22dr5pqUC
DXYeOdkMGOoM4Z8mLGjJp8lmzr5Hmo64JD4GrCvvINnPtcmuQxE6yHlEiulchwAd
tDYbJk7c1dB8JnPxSEDDKdkH9VlbhknkcoOVNXMeujRBw3+9Ea9iGV3VohFzzr/h
lyN4/4tu0DYBJgilV2dg63+e5N49wjkx8a/o0cb8P91rnF2rKzLdQowYLUdfxfax
Pd8ci0DWAQJ6CEW/v5iSvv7sewgE8M0xMw0CYa9Kt9vnqvkkg+9SHdjRRN1uhTby
1eaec6bdEKL4RsNZK4yICwlWsx/X5byoEu6mnxjCMME/G4MOGOouNQW2g7M1NQDD
ctWth9HQLGKjcNXQlWYHDmq6gKx0SVTsBGbq4RaS5oHcYeZaPNioLo7+w5esQqhX
U7z8c/8IiCI2BG9mpALBeDuTiJYee93n/5BLGllz6YijeORalq4hdhvjfuyMBzON
xIuIBBhrcGhhdvhE3pXQaZB2mMNazyeU5HzUuoc45CBZHmVUheY=
=C6bs
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
