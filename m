From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 07/21] clk: Add API to get index of the clock parent
Date: Mon, 12 Aug 2019 11:47:32 +0200
Message-ID: <20190812094732.GF8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-8-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-8-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:46PM -0700, Sowjanya Komatineni wrote:
> This patch adds an API clk_hw_get_parent_index to get index of the
> clock parent to use during the clock restore operations on system
> resume.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/clk.c            | 17 +++++++++++++++++
>  include/linux/clk-provider.h |  1 +
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..f26252e48f73 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1643,6 +1643,23 @@ static int clk_fetch_parent_index(struct clk_core =
*core,
>  	return i;
>  }
> =20
> +/**
> + * clk_hw_get_parent_index - return the index of parent clock
> + * @hw: clk_hw associated with the clk being consumed
> + * @parent_hw: clk_hw associated with the parent of clk
> + *
> + * Fetches and returns the index of parent clock.
> + * if hw or parent_hw is NULL, returns -EINVAL.

"If" because it's at the beginning of a sentence. You may also want to
turn this into a "Return:" section as described in:

	Documentation/doc-guide/kernel-doc.rst

That said, other functions in this file don't use that construct either,
so I suppose this is fine as-is, for consistency.

So with the capitalization of "If" fixed, this is:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RNbIACgkQ3SOs138+
s6FV1A//VN8FoQqHYUZDRFeTFLp0ScDoXoSuHZPsgTeHnWdfLuI6hjX0BwnBpuou
xp0VC0KcQdVBw0mL+B/0aKRlYcTsXGB0Pk0qi786ZQ5HicqrF7ixVfWNns9TIbAC
WQbjyPR0SoG0kBTfIXn36aSRfJh9ulnaPQjJ/SpoaT+pAsc4IUjCaGFVw+Eu2LNX
Av3p5BKIcCIynHfmMFNgM4wh44PInWZ7KHqW8yVNk+yJV41rSYqzV0TO2ANg/a6b
LaWziwn3XN+aPyuo5dB++g8xIATX2dQSfG6uYjZC4HDt08f3pCBkSEAfyup2xEIF
epEcFzFYBuSqyrMZ587honAJ0a5AqzFDSGCxxZw2qd1MSiW5EaIIdQE1PEiY2zeC
ldZGCn0iMPizacDQqkRrd96KwDsZ1s8oTGHyNya7z+6PHLRF36nb4EEg0OF1AJ95
aj9EI5IfJlfKSN1RSuR1K7DaZzIunI9Ji7Ip3WlkNc4LIBL9duQ0WQ0D6ttFLpZ4
cTcrkgo/uJ2DOaK84DCEt9w21jIkOoiSFstUKBCC/0+IPURVcHC+ByhHOJbjJMge
oYq5uhB2pVscLpnzfjjy5XLBuVjYiapsuWy74tUm1YAyyRvJSLr9+6McvwLjQAHk
hpiiENkRMsXAPGywAKTdlrIUK5JYRyXTR7rVHW2xI5M47aMJOdo=
=fkP5
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
