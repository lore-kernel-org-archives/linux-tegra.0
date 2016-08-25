From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
 config_load reg programmed
Date: Thu, 25 Aug 2016 21:39:53 +0200
Message-ID: <20160825193952.GC1614@katana>
References: <1464356224-10339-1-git-send-email-smohammed@nvidia.com>
 <20160619172136.GE2933@tetsubishi>
 <6d21b4bd199844e3a359cc52823045db@bgmail102.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6d21b4bd199844e3a359cc52823045db-7W72rfoJkVlxWE4FnwvcdlaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +		err =3D readx_poll_timeout(readl, i2c_dev->base + reg_offset,
> > > +					 val, val =3D=3D 0, 1000,
> > > +					 I2C_CONFIG_LOAD_TIMEOUT);
> >=20
> > Any reason we can't use readl_poll_timeout() here?
> [Shardar] Can be used, will change and push the new patchset.

Still interested? Should be an easy change, but I am reluctant to fix it
here with no testing.


--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv0mIAAoJEBQN5MwUoCm2HUAP/j0tNGDpEUD6yWcVIKR520Xd
9+73JrDInfS1eoBHEydw7vxyu3lMnRrK7rLmC2YaG7z2r9h0ojtYCeNqrBkvUVgs
LjPZ64Erl2YMoXmrZgzdWJE7O/mLmK7cmeC68NdUNsopjLOz/Jd/x482zc0lYXn7
Fl16p/eEV3fDpXRmmytMJolLDcTuZPNco6iT6RFFrc4w+6gRkzf8j8jF/xzPTkCR
ALtixNJtVmDIGpDfc57gcgyJxHuQLN1X1Ok5ElQOuO+xE5UDdbznfB4lTANRralJ
nxOApS/p5Vz9EDRnTjlVGrUbrSOM7aB7u0qfjG5KEFocf/udIJqXDOVtA5RksiGN
5G8GkgrnO51P5ah0AA2KQfr6yadBVH7t6czWwWBrkalRZFjGiQAgEBdeIL6s2I1e
TlR6vqEL7Uk/QK+w3L2Hw4GUOB5wivsobYorUJy7dOfTNy2KNAO2L1hbOZuGYKK/
WeLpzAPxmt60ljSlbxhXz07eC9MFmedhyOyQvlyNDy2pafWqr92L5punhGAeuXKe
UXvd+8JFKZ3Ciib13AxDLGkMSoJ0EDUxf0lvjsZI+Fknvh8kN/RIPfmjPFIwYAiH
Y+PaTnDLFCiRBwkLEJKTm2RXILsK5fajbQF79czRl3gZ2G5SNHIapdUgVSD/DsIx
WDAUvmtdCHXzc3jeiszm
=WCfr
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
