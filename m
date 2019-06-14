From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1] firmware: tegra: early resume bpmp
Date: Fri, 14 Jun 2019 17:48:27 +0200
Message-ID: <20190614154827.GA26922@ulmo>
References: <1560515499-1015-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560515499-1015-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Sivaram Nair <sivaramn@nvidia.com>, Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:31:39AM -0700, Bitan Biswas wrote:
> Early resume Tegra bpmp to fix Xavier clock rate error as follows:
> [  159.017101] of_serial 3110000.serial: calling platform_pm_resume+0x0/0=
x58 @ 317, parent: cbb
> [  159.025501] of_serial 3110000.serial: platform_pm_resume+0x0/0x58 retu=
rned 0 after 14 usecs
> [  159.033694] tegra-i2c 31c0000.i2c: calling platform_pm_resume+0x0/0x58=
 @ 317, parent: cbb
> [  159.042254] tegra-i2c 31c0000.i2c: failed changing clock rate: -22
> [  159.048216] PM: dpm_run_callback(): platform_pm_resume+0x0/0x58 return=
s -22
> [  159.055553] tegra-i2c 31c0000.i2c: platform_pm_resume+0x0/0x58 returne=
d -22 after 13072 usecs
> [  159.063875] PM: Device 31c0000.i2c failed to resume: error -22
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index dd775e8..de09036 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -811,7 +811,9 @@ static int __maybe_unused tegra_bpmp_resume(struct de=
vice *dev)
>  		return 0;
>  }
> =20
> -static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
> +const struct dev_pm_ops tegra_bpmp_pm_ops =3D {
> +	.resume_early =3D tegra_bpmp_resume
> +};

I've changed this to be static while applying to for-5.3/firmware.

Thanks,
Thierry

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DwcgACgkQ3SOs138+
s6FrSA//YUjeQWiQlGeMcSwux1wp1dvL2rCYk6E9sAfygd3R6A82DGnwaus1D059
3mxsdy6EM2cevn8/nGzE9iBr3W0DuLhQq9PSKQmzhpB0vbBB95MrgJsuz610qFA2
oCErRcoIq1dSP84mjmdf+JyOoYuO3xfclatViHtpmQMFxiHivmLZOdnA4gRfZG+4
jIDAOCPwl+XHPAM3B57ziuW/vP03+FD3bf3/ZWQhoRaTSJyXAg0fbnZKM/CtE8sO
8DYSx8w2zYjC4O7UhUo/TLzF8rJVtztxN+skWfkGiSomOuCmbbk1P+WasWwnmWbK
8YxS73oiGHY5OU44UXFaB/v3G/khoAdFq1iPLRyO1ne8NGrvD85FdturGN341Uhd
1V9ptlMApXxlC4wi2ICb7MiunBb4EsNDh/Gm9TXyUgc6vwSJTkyPQDrnX1NePd/L
BOoE71cZOHMp1wKwHOwiwuXpr5py71BPB/Zcn7P1KphFUlC3IEDoXLP2NttltizB
glhG25km0jZO5EV/h3HFgYncVVf2Z1FR6i9Q7WkljtzJNvPGcZTJ37rF8A6q7avw
dHJXAPXfITIIxH063H0LbWKo8ium2TYSo3hVhxLo8YSO9SlpldPLsT8CyTufejF6
fAlL1vxehCsKl6cz5QmXnOHup9kHJFsoPo84iuV6FC9AporHFyQ=
=BROs
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
