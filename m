From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra+wm8903: turn of mic detect when card is
 removed
Date: Tue, 12 Jun 2012 11:42:55 +0800
Message-ID: <20120612034254.GA4258@opensource.wolfsonmicro.com>
References: <1339435640-20171-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339435640-20171-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2012 at 11:27:19AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> If mic detect is left enabled and the WM8903 detects a status change,
> the WM8903 driver will make a callback against the free()d jack, which
> will cause a crash.
>=20
> This problem can be triggered by fully initializing an audio card, then
> removing and re-inserting the machine driver module.

Applied, thanks.

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP1rp6AAoJEBus8iNuMP3ddgAP/jWkINLupOl4WFzW/kj7DnME
1vv/FGCfTp1tm7Nu/ANgSDvGNrs6HCHoGdeelGe67Ng9Eyc335ZZB9Y0XjaRPJgj
TkD74fgkBOOnLB+ZyvOM0n0p0fEdxskyGCYGYycR0NhCabGIggfOq36Mk5pQv9q8
xIPPfTc1Eeun9oCwzK+ZLj7KElKq3khEg/dg5kkTBCm/+pt2ryRsVQfGYGX78Yyt
t0lQihYvCeCpf6p+k9KLVnGRCsQr1gsGh9Z+x+d4u1xvjTSnGHxOssTjFTfZjxEO
9l/BYUgTrI082GweLlMGBH7G5AJsSC2jXcclzx+5F+uOjqJDD3wi/TMjI2u0vcYs
Zc2zmITVFEIYsAS5b6Uwb8+7lAs+fDcQXqiSd6NBsYdelRoMzZ1M9FubU0GXMu8o
MGHXoXVIljL/PQJoG6aphCruYzl6ewmMr2079hYbpht8FSkwWi52L+bjXVfRsz+q
bsITBXdGOi+rYTHSEFs9gorcOwEVR1XyUITtkY8Vy6152Ux4F7lgMQAf1WS7ZNs6
yzARd3eWDUsFNVQSd6XauszaZq9GwZBDahlRU8WjG7qjmwKzOY2BVkaBjFo6ulqp
GxPb8MOeTvIZcndHSjEBqmibwkwe2En90vw445XjYHV6XIk6NJ7+TFbfkiKV1SE8
I5Ha9G3BKLBh378xmZrj
=WrBN
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
