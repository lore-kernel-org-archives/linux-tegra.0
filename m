From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regmap: add bulk_write() for non-volatile register set
Date: Thu, 9 Feb 2012 12:17:05 +0000
Message-ID: <20120209121704.GF3058@opensource.wolfsonmicro.com>
References: <1328789531-10067-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328789531-10067-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2012 at 05:42:11PM +0530, Laxman Dewangan wrote:

> +	if (vol || map->cache_type == REGCACHE_NONE) {
> +		ret = _regmap_raw_write(map, reg, val, val_bytes * val_count);

You still need to do the byte swap here.

> +	} else {
> +		for (i = 0; i < val_count; i++) {
> +			memcpy(map->work_buf, val + (i * val_bytes), val_bytes);
> +			ival = map->format.parse_val(map->work_buf);

They're currently symmetric but really this should use format_val().

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPM7k6AAoJEBus8iNuMP3dgPsP/3jT/jrYFN/09eJeErBEwOiY
c/s70UB13MpFk/l6gNe6o0gVLhDZNEYIVSVc8lHXowhGQ6yzroLK4fGJ6bEqMx+p
Pu5OT77Os4oGxuAdFcBJf5YHDZ1zgNV1xv8gyHotI0Xc2CqNoI6iyg4/svoleyy7
EJajaN/wa2Jmb4UprBR8/ic/GVOx60JQQc+kmIjF2R8gd2Rnc6FvApoFtBYeIpna
jhCikWyfzm3t7Me5g0HSz+v5hNHrpf5UTjmiUoOEUXcoCkFPP3XaNNBsnQ/uRSWl
hU5igkGMM34oZlNKBwmwXgNBrj4YCHeBVGcLqb+iEwfepj50nUKVtseK4RnW/W+Y
JwOu8qhPzPHqgL0/rPM2qIdk6IJzCzXMlYC4P6mitMVP8OCB3xtDdjgsxhTVkV94
P7sHN2QWTv0Zcfhc8Vqq8rezXYytcLMrwYFAJQUwcGnIr0TKkQBZjuJHNiNLALW7
YSp9zZioYeb01UH9I3pGgPFTiIz9Gb9ut7kDmORA9sPDINRHzHd7qdePTq2D+pwa
Gp6RbEQhZTeFrOr4mpk3sbuS7wZhC/w9w63d0NehCeAbl17bMqopQo+l/XtgfO+3
IairWyd/c7clU78hmrgGYOs4OXGastu7AVPWRgoGeBXVb7hQVBYgI2JBqM+QJ+po
CaCsPlsX1qPtD7EC1uN5
=OqDE
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--
