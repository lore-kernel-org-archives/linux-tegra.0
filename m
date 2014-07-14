From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Mon, 14 Jul 2014 10:06:35 +0200
Message-ID: <20140714080633.GH2081@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <1405080971-7609-13-git-send-email-thierry.reding@gmail.com>
 <20140711135800.GD23218@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140711135800.GD23218-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2014 at 04:58:00PM +0300, Peter De Schrijver wrote:
> On Fri, Jul 11, 2014 at 02:16:11PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This commit converts the PMC support code to a platform driver. Because
> > the boot process needs to cal into this driver very early, also set up a
>=20
> Small typo: 'call' :)

Fixed, thanks.

Thierry

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw4+JAAoJEN0jrNd/PrOhGvIP/RZ5EjpRfBsBIaClmZIeYEAf
m0kek5pLou4ap5pNHSSZ+lYyDQCPEixpnrXkl2uXcDy9TF/KvpOq+IPx3OU3ZAOp
DZFZc4YWqXBPsaV4uyUeVoYt9Lp7bE4Qg3h/MBgFF+GtU9t/9TLzfoJUIz+vXhTf
0p30hnE+CIKIEG45BzWzdjUc8gtzhPrsp3h7R2wKvVz8Czmsaf3GzJqn3Ozrxe7n
bpJI/JQfpKZ/dWvQlj/kqTVCS4kb3LaxfUbQejKtrMKctHFKGXF7rZFyWJXSGptp
VGAlnuGEgZLjzH5V1ZeLpNkbfu7SRTwIl54xFLZvmlaOJiSDLUlhgZG5Zf22eyrr
WB7PzQlHACg/z71kAnQgyjWuD/n1prRvYkRKdBgmxFZQh9H2LAHm8W4R4QwXqfhx
YnWpvkrwJb1xLc5TNjeP+uHcSGaocgvPl5OYZyMkxQ2K+oWP2XEj/xzQcE6RsgDB
Vx9AlwXPjzkJR9iYcj6V8+o8/dKpCO+E+86oDIMbSb7LOUs9jz8sDPmvugQrQavY
doHhZMnkgZfj/zfTQ/chCdQoWNL8MeVQbYoGhDBlLjFVM9RpjIVrjYB8RWS7oNJF
TccOfwL2aRc1TtoDKHmgeg5KFFoL+QJO6I7p4urLpxz5CCL2WqkEeJarFAlaLHCr
7qQr+dNTMAP+nJF5ZVTx
=LMDO
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
