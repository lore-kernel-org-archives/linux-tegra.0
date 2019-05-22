From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 01/12] irqchip: tegra: do not disable COP IRQ during
 suspend
Date: Wed, 22 May 2019 14:12:43 +0200
Message-ID: <20190522121243.GG30938@ulmo>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
 <1558481483-22254-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558481483-22254-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 04:31:12PM -0700, Sowjanya Komatineni wrote:
> BPMP-lite still need IRQ function to finish SC7 suspend sequence for
> Tegra210.
>=20
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> index 0abc0cd1c32e..1882373fa1fd 100644
> --- a/drivers/irqchip/irq-tegra.c
> +++ b/drivers/irqchip/irq-tegra.c
> @@ -53,18 +53,24 @@ static unsigned int num_ictlrs;
> =20
>  struct tegra_ictlr_soc {
>  	unsigned int num_ictlrs;
> +	bool has_bpmpl;

Maybe spell out "has_bpmp_lite" to avoid potential confusion.

>  };
> =20
> +static const struct tegra_ictlr_soc *soc;
> +

Can you make this a field in struct tegra_ictlr_info to avoid having too
many global variables?

>  static const struct tegra_ictlr_soc tegra20_ictlr_soc =3D {
>  	.num_ictlrs =3D 4,
> +	.has_bpmpl =3D false,
>  };
> =20
>  static const struct tegra_ictlr_soc tegra30_ictlr_soc =3D {
>  	.num_ictlrs =3D 5,
> +	.has_bpmpl =3D false,
>  };
> =20
>  static const struct tegra_ictlr_soc tegra210_ictlr_soc =3D {
>  	.num_ictlrs =3D 6,
> +	.has_bpmpl =3D true,
>  };
> =20
>  static const struct of_device_id ictlr_matches[] =3D {
> @@ -157,7 +163,8 @@ static int tegra_ictlr_suspend(void)
>  		lic->cop_iep[i] =3D readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
> =20
>  		/* Disable COP interrupts */
> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> +		if (!soc->has_bpmpl)
> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);

Maybe adjust the comment to explain. It may not immediately be obvious
to anyone how BPMP-lite is related to COP.

> =20
>  		/* Disable CPU interrupts */
>  		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
> @@ -286,7 +293,6 @@ static int __init tegra_ictlr_init(struct device_node=
 *node,
>  {
>  	struct irq_domain *parent_domain, *domain;
>  	const struct of_device_id *match;
> -	const struct tegra_ictlr_soc *soc;

As mentioned above, perhaps keep this here and assign this to lic->soc
later on so that we have only a single global variable.

Thierry

>  	unsigned int i;
>  	int err;
> =20
> --=20
> 2.7.4
>=20

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlPLgACgkQ3SOs138+
s6FoVxAAookjMpqnfDG8CiztrIQhY+NnonposNlGzUzMMfITDrIXCPxZikwnX0R5
Fk+HZ0QBMLlstRckRGmlZVy30odomy2zJjs4jtpfzSRWT21CRQsS/QaJCtQEXcVk
DQAz7llb8GneFENSJouMasmRvcwxPw0Myxe2em/pPV9T7LF7J2tHKtaLZgooukgs
+hy0W7J4iRadjrOdB3iB6kiTvjzUO/KYrhmKWJardD+DFkB/BY/qXHhzcuQU5U//
oFRF4d+b1sso/vbQMrKQistPSUuFH0NPgVy5izBMII+raawK9nXQT1kJRQsivzuB
i6X2nk5csj+QLleuUEtWA5RQ/Z5O5xT/vzorns17oYpx7lBYHQzLJZDhKHi1a7w4
BqaUwfA2Uj0Gq1V5gQx52jW/4wQLHtLInE/QPd2dODMO0nYVKcU5aGc4w5a+i9n2
UMABedHzNDUH7u5MiIY8TgXCV5hePHrNJJvdv25uh0eXjBt680IKWtM1QcTTRifK
7FoVaJA8sukrlw7iufYlK4hNhteFPT5MIMyKo4SK45BIjT+ElKMxNBLDQr29lFD/
jN8yFV5MEk5bJMk6skAyAs1ja00OnhSs5aT9HNXftjUlq/k0B4kCXWDgKx5T+4+D
l+oecslt/E41gZdJ5X1A6F1adulcHzlzHWLMSZrqvG8uEd+4NYE=
=kbZY
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--
