From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND V2] ARM64: config: Enable MAX77620
 pinctrl/gpio/rtc for Tegra210 P2180
Date: Thu, 23 Jun 2016 14:28:01 +0200
Message-ID: <20160623122801.GA30196@ulmo.ba.sec>
References: <1466143556-31849-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466143556-31849-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 11:35:56AM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra210 Jetson platform (P2180) uses the MAX77620 as PMIC.
> Enable GPIO, Pincontrol and RTC driver for this device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - MFD and regulator is already enabled, enabling remaining driver.
>=20
> Resending to linux-tegra group also.
>=20
>=20
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Squashed this into the defconfig update patch for v4.8.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXa9XNAAoJEN0jrNd/PrOhyQoQALpL04Hu9hfyCdGmdyckrmMO
NUgAGAwpBnGX/MZ1y6Fdoqhxxn+zMnDkFkMRniW1u+qplAJAxcSFGLZIAnT6ROY/
8VZUuSZ11b8c2BjA742HReo/cHTljR9iv4IGj6ZHQmyc/8k1ttS81NmDoy7a3wUQ
5VaT/az7tHm3WODCedlR45ryERnTF1et85lWn4VoZNKunP5WwG0ZhOTKAqDxuXcE
/+ozv6x5WMgAMqbYyOkL4nyKX/pSCpXH7/79XB46kEH2ePQ/SzrqgtaenBxU/e+q
RoSpjiGr1SRQ9nscToonBIZpP5SLWIj/L2GOPUyGDyglcc5h3TuP4w83huP/SAVj
JMmXK6V0zxGLXhDd+A4Nz5n2FzTRMXn+Q6JP/1e5jD2YHfcyAyQjuYVltjhmLn4X
NWsaV5jmLwbQDZjq8SUZ+ndflq2v8MBd1G5lKleypIBS8apCpVqwYOqtbUBZCWcQ
G3a6QE+i+F9MDVWemjgP3r1BBFvGKRl0k4CNea8oDcuARcX+PqK5PDwSxe63Apda
R/Ol9Rq99xDYAiiA03JHevlXZvWIT8ql+oZOxMLEIkU1FoYOS1/Er5sTLPvtK79O
RAcjEW/mWYm+W5fEThGYZmt0psRghA7GXJLh9nsDqUFkv8TBik3GztELCUow34lr
pVVJiK7zQto0Gz/wK7rq
=0cpG
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
