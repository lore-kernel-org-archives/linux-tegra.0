From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 18/22] ASoC: tegra: Add audio mclk parent configuration
Date: Mon, 17 Feb 2020 10:53:17 +0100
Message-ID: <20200217095317.GB1345979@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-19-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-19-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:23PM -0800, Sowjanya Komatineni wrote:
> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
> through Tegra210 and currently Tegra clock driver does the initial parent
> configuration for audio mclk and keeps it enabled by default.
>=20
> With the move of PMC clocks from clock driver into pmc driver,
> audio clocks parent configuration can be specified through the device tree
> using assigned-clock-parents property and audio mclk control should be
> taken care by the audio driver.
>=20
> This patch has implementation for parent configuration when default parent
> configuration through assigned-clock-parents property is not specified in
> the device tree.
>=20
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Sameer Pujar <spujar@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  sound/soc/tegra/tegra_asoc_utils.c | 68 ++++++++++++++++++++++----------=
------
>  1 file changed, 40 insertions(+), 28 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KYo0ACgkQ3SOs138+
s6FPPhAAi7eQ3lWrIh/IfkN95y7YA83xL0PKdbWrernTM29uQP5zvJXQGHbJBo/0
nOS5opl055+kZw++4ZblDnPLMxjXCHz8675b44cJtgB6sHVEOsBmBAc2ZOjliUPT
UpzLOCLguBGrxUSxGZ1+WmD7uzuupFPtRrtYI5VnT+iQYhDdOi9Hxd0f7O3URrgl
bA3xCc6tshoco6AzBNulREymKSzmPqd+sMXE4FMZgRrCAl7fhXwIgkNon74tZX3T
d96Oc44uvY6BUulCS/euU3gJb1GrnUfknIzf0uOwP9aODREre9bov6z65zKZR+Vk
+a4w2gcy2i92oC6ijX7hmgWXn5KmPSnloEqQcFo24yrU57X1tMTBSIcbizXYUZu+
XkKwbdPiqJKoxMSI5evZtC7jRQYpZ6MSbfT0aDNKKn5XQ1ucjXmblwRkisr9hLj3
iyrfGc6DdnIKxAnYeJg0YZUswbixhiUoQU5Rzz8HadyYYFvo5XwTCRuv62Pw5VwL
Y1E/B2kDk306VwD91zHMRkVq9Z4nSXLiDGXjJx7KQuJe011CnEUpTpE2y1BiEuND
DSgETznHyi+ngKZY8nIWNan7uBOZE0tN7wbFHXRPlIhQlIYrLHBFgqB7S1giA4lL
O6p8sdihYgMRnvtMgBSBY5G6Ov3QlGIKh41HiqnEuOsF+mBlGsY=
=5hey
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
