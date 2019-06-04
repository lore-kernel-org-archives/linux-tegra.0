From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 05/16] PM / devfreq: tegra: Don't set EMC clock rate
 to maximum on probe
Date: Tue, 4 Jun 2019 13:00:42 +0200
Message-ID: <20190604110042.GE16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:04AM +0300, Dmitry Osipenko wrote:
> There is no real benefit from doing so, hence let's drop that rate setting
> for consistency.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra-devfreq.c | 2 --
>  1 file changed, 2 deletions(-)

Do you have any numbers to tell how long it would take for the EMC rate
to get incremented? My understanding is that ACTMON basically reacts to
system load, so I could imagine that not setting to the maximum
frequency after this is loaded might make the system slow in the short
term. Only after ACTMON has collected enough data to determine that it
needs to clock the EMC higher would system speed resume normal.

I guess technically this patch doesn't change anything if the system
already boots at the highest EMC frequency anyway, which I think it does
on many (although not all) devices.

Anyway, you said you've tested this and are satisfied with the
performance, so it can't be that bad:

Acked-by: Thierry Reding <treding@nvidia.com>

>=20
> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra-devf=
req.c
> index c7428c5eee23..24ec65556c39 100644
> --- a/drivers/devfreq/tegra-devfreq.c
> +++ b/drivers/devfreq/tegra-devfreq.c
> @@ -653,8 +653,6 @@ static int tegra_devfreq_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(tegra->emc_clock);
>  	}
> =20
> -	clk_set_rate(tegra->emc_clock, ULONG_MAX);
> -
>  	tegra->rate_change_nb.notifier_call =3D tegra_actmon_rate_notify_cb;
>  	err =3D clk_notifier_register(tegra->emc_clock, &tegra->rate_change_nb);
>  	if (err) {
> --=20
> 2.21.0
>=20

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2T1oACgkQ3SOs138+
s6FJlw//S3HMd6zjiAiIh7sOMGPBFiOdIAVCsSgPmNITPRNUOkFt7n3cwIF39HRA
LEuKQhYt8l/N1kYwjbRT0bATl35PcVUITRGPcJh9Tg1SMJuO+hJ2jTRHQKpVJSQC
8qeGgOmhScOTSgqbFDR+a75q9HbQzSZXVY3WSnjXOMfzHQim4AqUg7EJp/X3Qma+
o7fUuJmHBQHmgc8LHoOATonOt6Qo6RF7xvJt0UEFzOpwzl8JwWKYw+XsqgdzXQKJ
u97CcKcgIhVOyQKdWMX7nOwHaLvZvLRjoshz6TgjnRjxo/KWklooLWVya3A/FfRd
uf5RG14aTC0rOqpyc92xvrTGcjjVEHYjR+xaAUYYFHTdXKE8iG2sX5G0uQttQwTi
kO2QRDqTmzhvHCjB1QFoa1WsKahUAuuL3Sz1QbujROBKhvLe3nSDAie19wS8vzOd
02D93BBMeTMaYZBJeX6+4cHStKUXChqmsGUuVEijo0ShDtm7Bu1yardeQjAGg0Fr
iVnltSo3nt/g72+ptJJz3zqOAU2OBRjEZPfakMXBFrAs8B8P7Ks/Gqw5uDGHlYBf
ydpVF78FHW7Ok2+KkqbtVwe06XM6/IY/m3MxfF7oEbIdMswtyBS9q6dHNrL+qSjy
6YaRiHpDrDkKHkvCaJ2MTuHy4oPJE3aEaHt9r89mfU57qJdHSYA=
=MC5w
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
