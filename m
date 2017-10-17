From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] clk: tegra: check BPMP response return code
Date: Tue, 17 Oct 2017 12:37:36 +0200
Message-ID: <20171017103736.GA30589@ulmo>
References: <cover.1504776489.git.talho@nvidia.com>
 <6a69e270519fd1c7a12a335053bf59671abc3c4b.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a69e270519fd1c7a12a335053bf59671abc3c4b.1504776489.git.talho@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Timo Alho <talho@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2017 at 12:31:02PM +0300, Timo Alho wrote:
> Check return code in BPMP response message(s). The typical error case
> is when clock operation is attempted with invalid clock identifier.
>=20
> Also remove error print from call to clk_get_info() as the
> implementation loops through range of all possible identifier, but the
> operation is expected error out when the clock id is unused.
>=20
> Signed-off-by: Timo Alho <talho@nvidia.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Hi Mike, Stephen,

do you mind if I pick this up into the Tegra tree? It has a build
dependency on patch 1/4.

I only now realized that you guys weren't on Cc, hence quoting in
full.

Thierry

> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index 638ace6..a896692 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -55,6 +55,7 @@ struct tegra_bpmp_clk_message {
>  	struct {
>  		void *data;
>  		size_t size;
> +		int ret;
>  	} rx;
>  };
> =20
> @@ -64,6 +65,7 @@ static int tegra_bpmp_clk_transfer(struct tegra_bpmp *b=
pmp,
>  	struct mrq_clk_request request;
>  	struct tegra_bpmp_message msg;
>  	void *req =3D &request;
> +	int err;
> =20
>  	memset(&request, 0, sizeof(request));
>  	request.cmd_and_id =3D (clk->cmd << 24) | clk->id;
> @@ -84,7 +86,13 @@ static int tegra_bpmp_clk_transfer(struct tegra_bpmp *=
bpmp,
>  	msg.rx.data =3D clk->rx.data;
>  	msg.rx.size =3D clk->rx.size;
> =20
> -	return tegra_bpmp_transfer(bpmp, &msg);
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +	else if (msg.rx.ret < 0)
> +		return -EINVAL;
> +
> +	return 0;
>  }
> =20
>  static int tegra_bpmp_clk_prepare(struct clk_hw *hw)
> @@ -414,11 +422,8 @@ static int tegra_bpmp_probe_clocks(struct tegra_bpmp=
 *bpmp,
>  		struct tegra_bpmp_clk_info *info =3D &clocks[count];
> =20
>  		err =3D tegra_bpmp_clk_get_info(bpmp, id, info);
> -		if (err < 0) {
> -			dev_err(bpmp->dev, "failed to query clock %u: %d\n",
> -				id, err);
> +		if (err < 0)
>  			continue;
> -		}
> =20
>  		if (info->num_parents >=3D U8_MAX) {
>  			dev_err(bpmp->dev,
> --=20
> 2.7.4
>=20

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl3W0ACgkQ3SOs138+
s6FHQhAAqx1ar9rM4U5PPIrF5x8HH1qeJr/sL0oYZtKCczrhd71EFdJc42Vr1fj1
IgUyqOhPOK9isikYVxNzRdq3FPeRP0sg8M2uivUWm2KXMx6LifnpuUe8fwYT4Jl/
k5BmY7iWxHRmDwkxcQHZHDY/PoAh63N0499lsD71oEOf0Tt1i397GAEvvriSsuIS
3fUqX6lN7MXHwQCmBhnZM7gkxkavzi1b9OkfocmCtVNKPBGA1nuU5QI8CiXfVYrT
KqubMLUhFuFa7o7KczQYwHGZtMHzzvksNE9VCfAinADJbFNHwS6E9Ng8+rHXF8bZ
YfA0AcUu5CpefVtqcFOCmHReSnij4OPNNQcJMxhW0YBNYu44q9hU7JG53Ot/Fjvd
ll7EecbPVE9PCbGqZ+PYJE87FN7XhPXJ6SFvLgpcckF3mVajEMPEqBOVmLFNabH3
ZLWsVawB5ZQD8t0jHyQG8nkYkQnitTPRF0FG2iGJYMGST78y/3MPM4WsB94yERzE
KhTtFpBcfenqEjbfTdBV2KDYFQ2uvK2LAas6HCkwaQraYFxyz6XKx60mA2BoKQuq
Pt4OURfRKI41UCXsz33MVdQ9lBI4pWRNoYa41wJl8X3g2XXnYGT/7KOtaz1Voy03
Hsuq7KFVMaqoRAi03Ot0kMrwoYC9XYE+JLLRoPd3tFh/XwRoVck=
=a3dm
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
