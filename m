From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] soc/tegra: pmc: Add new Tegra210 IO rails
Date: Tue, 12 Apr 2016 17:28:30 +0200
Message-ID: <20160412152830.GB30211@ulmo.ba.sec>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460473007-11535-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 08:26:42PM +0530, Laxman Dewangan wrote:
> NVIDIA Tegra210 has extended the IO rails for new IO pads
> and added some new IO rails on top of its previous SoC.
>=20
> Add all supported IO rails from Tegra210 to the Tegra PMC header.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/soc/tegra/pmc.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index 07e332d..58fadc5 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -90,22 +90,36 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
>  #define TEGRA_IO_RAIL_UART	14
>  #define TEGRA_IO_RAIL_BB	15
>  #define TEGRA_IO_RAIL_AUDIO	17
> +#define TEGRA_IO_RAIL_USB3	18
>  #define TEGRA_IO_RAIL_HSIC	19
>  #define TEGRA_IO_RAIL_COMP	22
> +#define TEGRA_IO_RAIL_DBG	25
> +#define TEGRA_IO_RAIL_DBG_NONAO	26
> +#define TEGRA_IO_RAIL_GPIO	27
>  #define TEGRA_IO_RAIL_HDMI	28
>  #define TEGRA_IO_RAIL_PEX_CNTRL	32
>  #define TEGRA_IO_RAIL_SDMMC1	33
>  #define TEGRA_IO_RAIL_SDMMC3	34
>  #define TEGRA_IO_RAIL_SDMMC4	35
> +#define TEGRA_IO_RAIL_EMMC	35
>  #define TEGRA_IO_RAIL_CAM	36
>  #define TEGRA_IO_RAIL_RES	37
> +#define TEGRA_IO_RAIL_EMMC2	37

We have a duplicate entry for 37 now. The _RES might have meant
"reserved", in which case maybe just replace it with the new symbolic
name?

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDRQeAAoJEN0jrNd/PrOhPyMQAMMhp39ztWiSajjTG/Ni2ZYk
+qH3EwkqOLwttuhcRW6ZA86ph4qxgvBmFVKOSi6fw6I7/AtDJQNwqygtd1Pw9pTk
u6RWmLdfs87bEbpE/p4GAQjQpdv0Q2bnQaUfCSM6xCOSYzRpFIQ8HQL/XXzmXTkJ
uMmIFHY0xBeWJJMQ7NDj9790v8JJHEGSgsEQerSgc7GSH0u2g0CHI0E6lFA/TggF
yrR40Pg+fT28Bc4D5JCOgIJsCNw+AaOfUXA8YBWIJX2LuSj/QQSzMoRixoGr0OIl
yYphnMxK3USxQJbSzTlGfrofTqzzsWf/RHb/TCZySd/ES+1wGVmj4YlEoyPMmFEa
ZLaQIlFejGIbzQj0slfMdminPfTNxcbhaajrTfKZwXtY8w9ZP5FOd/Kko2UxSjQs
CCCJTFJKMF0wMGkUdz4Cchy2miOUrtOVj9hvnOlG35p19AtQbqEfaCZanJuoAh+l
aIy4xZ3hBjRrBusPko1nVWNd3YjHDbHe6K/3hazSIqlTi3VM+MMP1qzbIjifmOtw
eNMLJqA+FXXfeFILW/ff62l4gp4g4DlyxxkWV08ZxO6Aa9nzLjejMGS0srAzQ2d7
lWF8xPOHnG13rYqpOsUkWk0c+N+0C/37B442cjmi7lv9xuIxO+CNVAfd+AHTfBD5
v29u9fX4RGu+gPdAROsz
=2vsL
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
