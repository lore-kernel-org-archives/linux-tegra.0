From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 14:28:37 +0100
Message-ID: <20151112132837.GF31671@ulmo>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151112125422.GA3758@Red>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LABBE Corentin <montjoie.mailing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 01:54:22PM +0100, LABBE Corentin wrote:
> On Thu, Nov 12, 2015 at 01:29:23PM +0100, Thierry Reding wrote:
> > On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> > > of_match_device could return NULL, and so cause a NULL pointer
> >=20
> > No. There is no way that of_match_device() can ever fail. The driver
> > core uses the same table to match the OF device to the driver, so the
> > only case where of_match_device() would return NULL is if no match was
> > found, in which case the tegra_i2c_probe() function would never have
> > been called in the first place.
> >=20
> > Thierry
> >=20
>=20
> In a parallel thread for i2c-rcar, the conclusion was different.
> https://lkml.org/lkml/2015/11/12/83

The conclusion was the same: there should be no case where this happens.
The example that Uwe gave is hypothetical and not valid DT in the first
place. So instead of chickening out I think it'd be better to just crash
to make sure people fix the DT.

On a side-note I think that platform_match() should be stricter and do
something like this instead:

	if (dev->of_node) {
		if (of_driver_match_device(dev, drv))
			return 1;

		return 0;
	}

Thierry

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRJQBAAoJEN0jrNd/PrOhynwQALybP4253cJoVmaezpJdFxQx
uC/o2ZbISzEtWcRONTtFXJ0QN8kT4tXq1Q5Evy6oDR7CMjn5cnABTDngUwUvjZ4B
mCz1Eng5i/BNVJi22JkKM78kENaQyj12zKPsIQ6TfV1PXk3qLTw1qqrm5elnnIft
OVOmicyUBLRaAuEGFFptJ9l+xBHFKqkDymQ7St5hId5sBt6wbdv5lRuZr7TH1TO1
/Kv5fxaGi137rQaJGxz/3pVQV+uGykCMmAkVs9xKxvQlHDEGF7Si+3ybFZTILrUd
3ft794OtGzpDHA/+SRD4uxwwmhSEv2BwSVm4zaDLTxrXb5DVX3mMh3DWkZ7VSeEJ
XkCkJQh8QwZeZiGQI4MlrwoRuuueSdi3uRnQcWEPtsgUxe8eJKgT9EqOI0+rkwZ/
pGnu+dKqDa6NUgVdk/e9iALkCnZpBVzw++Xqt3vgU4zKHjcBMBEbj3PLLA7yBliv
2n/KtoEx/v9jirBdc58iio3q32D3s38Vd3xr0zOYHJBpoZasSdZmEZGPVwckhKhj
VN335f520nFiKS4R3Lq2tP7BPDhHC4Vz7cHn+k7MbCQsEjJI6EGGPTL6AZpxICRV
ChkI7bQDLC5nXHF4tLx16rmvYnO8+1cpmNFaKpqNSz2fOmnTHkc6ueaGxc0eecpS
VOF8vaIIDAjaUbtIrqiU
=ayUb
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
