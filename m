From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 5/6] i2c: tegra: Add runtime power-management support
Date: Fri, 26 Aug 2016 00:31:31 +0200
Message-ID: <20160825223130.GA1621@katana>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
 <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
 <20160825192631.GA1614@katana>
 <c546ae53-005e-83d7-136d-d12a83b58549@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c546ae53-005e-83d7-136d-d12a83b58549-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You could have left the original 'return' instead of the 2 new ones, but
> > you decide.
>=20
> Yes I know, but I wanted to ensure for runtime-pm we only return 0 on
> success. Yes clk_enable should only return 0 on success and a negative
> error code otherwise, but I prefer this. So will leave as-is.

OK.

>=20
> >> -	if (tegra_i2c_flush_fifos(i2c_dev))
> >> -		err =3D -ETIMEDOUT;
> >> +	err =3D tegra_i2c_flush_fifos(i2c_dev);
> >=20
> > 'err' is assigned but where is it checked?
>=20
> It will be returned by the function. This is no different to how it
> works today if you look at the code. I did think about checking it right

I agree. I missed it before, thanks for the heads up.


--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv3HCAAoJEBQN5MwUoCm2Cx4QAI4XcIJA+YV8nzY/mjvuierC
aOmdb73rJdBtYGv+f8cvWPsBtSyyFrO0lzLYqJKcdhPypB7P2EuLNxP1orFmhKDU
m2ZNqQ2i54mUUMMrXBSXtc8RWDri3aRsi8syb67VFEzkcTLwFO9NI8U9sNeKvn/r
7c/ewD0vwEDyqwag0FYA2W5U6jIVtoQvO6nW20tnpXxbG/9DMz4pIYbPVxLfNI3p
uMup5Tk3gnqycET+g+FfYvHxd2SABqdD2nj5aBejLckF5yLrBPoG1LebTuYgjSEx
ZXieMjSyz1CjGOAwsRx0f+sXsZXxwt02bhF0Ieg+e5sySRqWuR4u/WCiUeEo6oQg
qtXo5TQEgsNYAaU3XIT3YbLTa3HIIl+xTQcKKzLweRkIpyGC8nWYFQVYtrG652eJ
dQDn3HhxQynUih+CDcKJUasLYVtgPKhOT7SHAYqmlyLuBglwT8xFM+Jh+bcR5zsC
J2rzo+6NX9hM/Yu125a2bhy3OhPMMA3tYWNSQOj+D6pZ+OVcBnQ4oYk+qoMXBKKg
lzWJ5a/FSr+gp9K88orzJvQFY0ap2y+788BbkjgVfs7jmvDQ1DlievAa77BU4AoK
tPvpk+IX7KadRkPAynbcxIoXl58vTxTDxBJlsFWBelmc/3bJRpQW5W4ZDW/YNQQ5
SwWrhiUgVt4pDoOU1ENk
=2a7d
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
