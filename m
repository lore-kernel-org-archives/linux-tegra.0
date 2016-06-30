From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable cros-ec and battery
 driver
Date: Thu, 30 Jun 2016 15:23:47 +0200
Message-ID: <20160630132347.GB26758@ulmo.ba.sec>
References: <1467220913-15006-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467220913-15006-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 01:21:53PM -0400, Rhyland Klein wrote:
> Enable the ChromeOS Embedded Controller, its I2C tunnel driver, and
> the BA27XXX battery driver. These are all used on the Tegra210 Smaug
> platform.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Resending as the issue with power_supply_core/bq27xxx_battery has been
> resolved.
>=20
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdR1jAAoJEN0jrNd/PrOhZAcP/21J2Jexbgr22P9BGd7dv08c
x7+6OrhPcNQYMDoMaBaJKrpXaJrgazPyFZEMY5qFcDlW2/2BM51Njt1oA53VTbo3
xcRoVDj5fGN/aqhIE9BRdQvYRNDzhT5u9VjjxJwEownv0uSvVsl1GUyK2NQJNqH7
Pi5ERB+5fBViTNs6STj5lNWDvlWjpUBvnHVPNABqLsQR3L/UdEVJN63Vjfl13IUz
/Y60FBVCq/ODPlorxcXQeFOttlguFMa1DFHff9A2Sz+caBZ5Jkdpsxjdg5mFYaWE
5/nrA5GQ9W5qyuuK0U99s6ycsEtaW0W4fWzEkCA+pq+nDuInlxHmOlr2wsDuRtwK
/xgJuS91wwV2kmyrhpe/six13wA9/fWT4ixGRqNtzoR6Bg+/qFC91pPS1RbWZrsk
mpScdOnk/hTA7oC3VHsLsZPGsAIV8MCOi8ZgVEkWFff5H2YDEDlF3W0Wn1Y0hsHv
QpIzh2KVsMuTHVw+TBb7hmdNcUJoG0U3mZFDVp8wwM/BGUHw2bWAgL4b7V6yEMwH
zhwPNszqXvUJja7gD+5oL6knPEX1AaNk4Kh4F6fLk76o1vTC0jrgzErXxItUXcI1
1I427+CIoBR4BsT/Hs2azW5tSYL7W2cASb0vUpcQTlhygfOBVzrndX6nrlo1ArOL
5AXFdLZTmvZRE6qPbBne
=Dgx+
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
