From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Wed, 12 Jun 2019 12:24:58 +0200
Message-ID: <20190612102458.liieiohnprfyyvs6@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t3rkxinhkpc76bjs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--t3rkxinhkpc76bjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:51:13AM -0700, Bitan Biswas wrote:
> Fix expression for residual bytes(less than word) transfer
> in I2C PIO mode RX/TX.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>

I applied patches 1-5 to my for-next tree now. No need to resend them
anymore, you can focus on the remaining patches now.

Question: The nominal maintainer for this driver is

        Laxman Dewangan <ldewangan@nvidia.com> (supporter:TEGRA I2C DRIVER)

I wonder if he is still around and interested?

That aside, thanks a lot Dmitry for the review of this series!


--t3rkxinhkpc76bjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0vkACgkQFA3kzBSg
KbZ9mw//T4O3hoJ/kzky0Dkl2XSb0PlOZ2Bw61yaBOQYAQgHggU7wP0OfFki5Gfq
4yxLGVDoKxGLNBOG6cdtkTFMMQKauZxRzoEkBjfWXYNfV37LDWoBIuS7HEPAAcgv
2Kix3fbeOaEcozQz+czeVq5MKC9C/oniYGOsLNWYLJn0PIFDmqbj9Q/cQh/1prrX
ACkMyvdrsHdm7kZLDAFY+6llztTf0CK7d1isXfnCTmlym2rj5aaU+jXfRMjdYOX9
VJlJg4HSs85Tw9SpRCjKbgGO2zzP8YaNhhoNuVycFuj43M2TPV+4fqRKDFnyKi8y
4LMotA1S2ikbptkvEhtdZ+sggAx65cwu6O4Uc+C1xnux6BWQamjnhgj7kPyauzzC
3zs6bNFedSjgGRHR3u4eH6sStcM38/p+CgrGkhBq0VOA4p5aQr+xv5OfiTS5kh1z
P9zzOI+VT0rCqRBdkZTOhSrbkr6/4GdvwvXsqHVlihrEOG0C+RvOih765Tm27DVQ
Ey0ynpMFdVdb9rlJrdDjHMdlZVdy/JyrPqcpw1HZfhN2THDRzyBBr7itV0jabcWY
XmD88PnRbE/VUk4eqxeC2FVumEYMB06k+9dQ7HwJyMumyCFIBz6rdHmWDnZxPvt0
CypA65YWeTbZ6ptOJls/EsbiMqhrMdnUUmifAoof/KAyrDLE4MY=
=Mw1x
-----END PGP SIGNATURE-----

--t3rkxinhkpc76bjs--
