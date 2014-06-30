From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/4] soc/tegra: Initialize interrupt controller from DT
Date: Mon, 30 Jun 2014 21:51:09 +0200
Message-ID: <20140630195108.GA1351@mithrandir>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com>
 <1403888329-24755-3-git-send-email-thierry.reding@gmail.com>
 <20140630113013.GS3679@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140630113013.GS3679-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 02:30:13PM +0300, Peter De Schrijver wrote:
> On Fri, Jun 27, 2014 at 06:58:48PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Obtains the register ranges for the legacy interrupt controller from DT
> > and provide hard-coded values as fallback.
> >=20
>=20
> Any reason this file cannot be in drivers/irqchip/ ?

I seem to remember that I tried that at one point and it didn't work,
but I can't recall the exact reason. I'll give it another try.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTsb+sAAoJEN0jrNd/PrOhgSoQAJCHmYP/KrAk52CUwou4crvs
ZeRDj/FdZIte1NfkStkux9C1na/y4RKDXGgQBju87W7DzkzD4w1SRNvVsDfkbsR7
2Ah+NdFM0fvy8OXqAzFMQdHBh5PVJItTvzUca8s3opWJHquTaiIkO7ZNMsGETiei
jrmenJdaiWjZZSzzjCiqJrO+8NKzBRosOx1n5mPKyGl9spDbztnxKWHwkqzHco1q
tGNWL03yb4OBrW4027foTPkUlslTb05oGXlpFN3ON3zXYnoNeJUKZXfMCx+AjQzd
G7Sie/L6zoMDngNVSevGGy6d2MZGX1C3TeRUd3i4CPMwQfyV848IxjwchjNiOpy+
42iFEcpRRjl/uVid/Gbc0MCXOgY5TqChzjHMD5Ol2FU+NzqRHZ0MeBx958I4k/5f
o2ZUDEsRnEqi+blP2D1GuEdw3lwUIheh+iuyqjcnsKkOD7Wa0HhLH5KltLOJ99kM
oJRjhKSCEKxM2Sjx21Ko8bAc392kpekw/RUDswyAGTr9S5hSMWdjqqAtI5aPLzGD
GFVkSlXku5eMSm3DidWwbyyl/xCLs96ssptrVh19gX2dpQSxQEe+4hEXO97W1REF
7Rc/PKdqnR10wlh+ytJ0/NTZxqh52F6Y2mR0axdhzFkc1f/00MgI5RDnEjlIrFiz
T8fR7vQrHivXieBN2TkP
=fxb5
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
