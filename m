From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: palmas: add support for LDO8 tracking mode
Date: Wed, 17 Apr 2013 15:06:33 +0100
Message-ID: <20130417140633.GP13687@opensource.wolfsonmicro.com>
References: <1366191793-13934-1-git-send-email-ldewangan@nvidia.com>
 <1366191793-13934-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1BKOZKwX7DAU5odC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366191793-13934-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1BKOZKwX7DAU5odC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 17, 2013 at 03:13:13PM +0530, Laxman Dewangan wrote:
> LDO8 of Palma device like tps65913 support the tracking mode
> on which LDO8 track the SMPS45 voltage when SMPS45 is ON
> and use the LDO8.VOLTAGE_SEL register when SMPS45 is OFF.

Applied, thanks.

--1BKOZKwX7DAU5odC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbqxfAAoJELSic+t+oim9PM4P/RdEPZE07MPQ86QEVkaJ5Fd1
NpTFY1kycCI7ksIh7B+/OaS4iw4r8mFimkRqnrzl7v4TXN+CU4VeewT7viIhqxlS
8gZjH+sL8uAzAv7isCXRd8UsrkC+J5o4/t/7LtiupyNLQEQfEeibC8vonU/sYhIx
fICOYxy2RLuTz+mph2Givo4BQAXCd+dOcU/iAYPO3IicK1b/Ec0qcEftNiWPK2W4
3C461e9Qaq23Ixmyv33OhBNZUzOEXKqDA+gv7aqj4ZKYw7JMVO0N8euAxJfss4tk
L0GSVoqkIjUt7NpCxuxqWgd2ovVtEszRTfWF32XRDO6f9bzmy7I+D0nPmxSCicrZ
OjEI04ilcubPJlu9bBr7PleHkGaMKbDhRTUs61zfoym6Ew0chsSQU7qOrEFdwDHR
SyGx7pJTBAMR5ewZF2TFEHFkXmTAyw5nJ6lC5G3nwH1plCShiV4dwHeW40+hvYsA
OcbR6rWz23Jj+Zsszzy0ew0xNmAQkCscqYRIN9LzdRx/0upfYDmDH2aw/duTGmRv
vgFWTKG+iBlM4ysfJGvOWH9mfWxoCAu/v1ovv83mZ1LjggM9RBCg6MzukLW/DrFz
XLJO1U6z9QHOv8jsfmyENG94gr1e6jz2QQsxobNHRWHYUF7lNfDmmdgt6pJNGyj3
MLpKamA8SXOqWo3kOhMW
=gTVp
-----END PGP SIGNATURE-----

--1BKOZKwX7DAU5odC--
