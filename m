From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v7 1/4] i2c: tegra: disable clock before returning error
Date: Mon, 25 Apr 2016 15:54:48 +0200
Message-ID: <20160425135448.GA5897@katana>
References: <1461591519-24602-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461591519-24602-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 07:08:36PM +0530, Shardar Shariff Md wrote:
> Disable clock before returning error in tegra_i2c_init() as its leaves
> i2c clock ON in case of error and never turns off again as it will have
> unbalanced clock enable/disable
>=20
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
> Changes in v5:
> - Move current patch as separate patch
>=20
> Changes in v6:
> - Remove unnecessary line
>=20
> Changes in v7
> - Updated commit message with description of issue

I know 'release often' but maybe you could wait like a day and collect
review responses before submitting a new version? That would make my
life as a maintainer easier...


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHiGoAAoJEBQN5MwUoCm2N0EP/AhMcc8Bubv0v68Toejljjlv
sfg3S5eOLZDaDXycNNISFagHZpWQLgKSDwsfU8pvJP0wmkaw6sbRX3AQP7xbMTf4
EbZCpb8DdCI2JoeyxufJDyCHXKkgjfeZ9V+miNRUCpnPMDk5fF167g3fcSMa7+rR
M46v+SrHHfY4rsgXJKwxlbAF7T3QMLicdcI4aX6LGc9GlTGJs5Tl/aB8EOdFUqJC
Qsn39ycEG0r17kSsgmkJ1eBnbhJPIXj1usFPGkAod4fpwIF8ZRO3eiss0HKtqMu4
w496Iamwaf2fup1SGo5TPohJXtNM8Yl2ZaGJ9HcrNJl9vbKYfA2a8A9W6DIi4AUE
zgo4zOXKpF/gSnCs25djL3tDVsOn3AxfXrW3qt1L51PE5pF5maHQrBekxFa3//Ue
f9/SmCTjJgBFrLNPi9+JYCYusQmzQ0pRtubTu40S6w3W3dCCk5G9kVN8NAUDmXTy
S6q88ILTmCS9/Gf6WYU6GOvGrFMvK8tbJ2BABZMPIL1Y3CfKwjvqA6xwxCDNqts+
E/Wt8Yl7ZRdzEG3SCnwc1tMUZDrvyt6uXqTtH51xEkZw1hWNSG5Xl06ZTiz1OxNp
Fw3PVtMGLpmXY/HCMQYCPtkL20F6sweSDlstaZI/Ub9ggESJcANsSnsFognsjts5
tX6EXzAAcTKkp5IdM+2l
=Qf+i
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
