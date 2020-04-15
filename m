From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
Date: Wed, 15 Apr 2020 18:23:45 +0200
Message-ID: <20200415162344.GB2830@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200415114536.GB910@ninjato>
 <87f18a67-5aec-b5df-9d8f-341f03ff3a72@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87f18a67-5aec-b5df-9d8f-341f03ff3a72-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Patches look good to me. I tend to apply them to for-current instead of
> > for-next because they are fixing issues. Even a stable tag?
> >=20
>=20
> Thank you, yes it should be good to apply this series to 5.7 because the
> Tegra APBDMA driver dependency-patches are already in 5.7.
>=20
> The stable tag shouldn't be needed since this is not a critical bug fix
> and the DMA driver patches are not going into stable. This series should
> be more actual for the upcoming devices, which should be upstreamed in 5.=
8+.

Understood. Thanks for the heads up!


--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6XNRAACgkQFA3kzBSg
KbYelg/+JJQUn9SPGjOZhZGQySY5aLk5fsftZTGeXoFtq6B8HNTDzMlwhubFTvHR
D682nxBo65nuktk5sw3X/rpHYMT9H1mRdkBgurNWHH9ZIEUpq+qSr0/ZMNmVs0i2
t8YXR15fi0gw0Es74oGUpo3zhrHY73gBLXOog8M/EBiLEBrsYCW/gtyu99swD2nG
80MVj5FTGJ0Y+qAHbpo14CX6ofQgDjj8nSbdrYFvzF9QupsyNOZMuTzvoL1AQ2CI
Ky22W5M/YK1+MWdlIyEPoPmYL7q/PW2yRPbVmDeatx7uIZBvbQvw68mFdH12BQT5
JdDb3b1UQvf5646S7J8li78hVGyyA86Am5UfDSZLgBopF6xbBUdhEM5nd6mBmjbJ
OHTd0sZSHbr3PG9VGvL15qnyJiFhzBmjigMLs8dYFHOCMQwRYvgnBoow14BdsToM
Z49HsvXoFiVQTURQSPGAKqwrwbp1LvGcQ5FYhrhBbIJD9lJZU+lIzViW1Thl5WGt
7Ax7KX6BF4fBGzexPfOm8ldnv+kIBTeW8cauWLDs6H+6CMISbnHPcioVySFcJu/L
806eM3+OO4aiiIp1hp0hyFTbvYBJMrvuQkCxpkZz5nF5t/E4w3dYyYuZlou4Gb+F
L36qGctOsCHcIo/Ia7wPVscBkshBxVSiC3sWrTh8TBbAoVzPKZ4=
=84CU
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
