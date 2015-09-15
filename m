From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: dtsi whitespace clean-up for tegra20,
 tegra30 and tegra124
Date: Tue, 15 Sep 2015 10:14:26 +0200
Message-ID: <20150915081425.GB25970@ulmo.nvidia.com>
References: <1440668688-17288-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440668688-17288-1-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 11:44:48AM +0200, Marcel Ziswiler wrote:
> There were a few cases of eight spaces being used instead of a tab
> character plus one case of using two spaces after an equal sign instead
> of just one which this patch fixes.
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>=20
>  arch/arm/boot/dts/tegra124.dtsi |  2 +-
>  arch/arm/boot/dts/tegra20.dtsi  |  4 ++--
>  arch/arm/boot/dts/tegra30.dtsi  | 10 +++++-----
>  3 files changed, 8 insertions(+), 8 deletions(-)

Applied with tiny fixups of the commit message.

Thanks,
Thierry

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV99NhAAoJEN0jrNd/PrOh8xEP/09KMW8gUDYD3D0sEp7ORmES
/y5sU5/hLXOgKts1IZnC3ZRTg83QtWAPnCRjlpo6b8pyoydVmB0CgHlS7JobAeGj
+8vzjb1IawBXzOrA99Q+rlZiz2ldygC+bhXqsCGjQKpN2LLN2VI0WV9ZHpR9SrU1
dGY/gX0Jpg92btz0tG0ZjI9lU3Bs29dnBLJaETVaNYluOf6+oEgXenXzNBZYIKrz
Dv0Zh7VJpK7G33JGYH9JwOcy2AErvQDf4H133s2tYxHBlakb6PDF/HhNd1pkWNCv
Kuq8RSQN/6zbTPHrUOGaOKPdfrV8qaU/0v+P3sT5SDUmLy5NxRmb/iEo01pJdu4j
52WE5V20mu44cY5xUzOvUdK5ZXDu0SIa2NnNmRQ06hQk6/iBUQXKlrc5rL8zLmEg
cw21tqSJXZY2tG6PoHs+BRNBVRuYtbyDW8l1Oy0fz4gv5BOitHMsj1MGGdCRj5sE
LHaSuEv5LeoGwDlusB9pougkyxsx1Lu9eXUzs0V0QCVb1YNGemv8RjKboBxzYzig
HcTeBzD+DsonO3yS4crTDW5R314JVja2/V4kC0Yay5QZxwFAzTKb+qFEz1u33Mlq
8TeFZZb6/kNp7ObmfCG7Zn+CeQ8pbSiyQJSRhKWiyoWlSELNaNvXIdonxYmPWYyw
0dpNQb/zCLKJi35zmFlb
=0YCF
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
