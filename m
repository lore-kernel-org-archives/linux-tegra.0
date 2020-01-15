From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v5 1/8] i2c: tegra: Fix suspending in active runtime PM
 state
Date: Wed, 15 Jan 2020 18:33:58 +0100
Message-ID: <20200115173358.GD1239@ninjato>
References: <20200114013442.28448-1-digetx@gmail.com>
 <20200114013442.28448-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200114013442.28448-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 04:34:35AM +0300, Dmitry Osipenko wrote:
> I noticed that sometime I2C clock is kept enabled during suspend-resume.
> This happens because runtime PM defers dynamic suspension and thus it may
> happen that runtime PM is in active state when system enters into suspend.
> In particular I2C controller that is used for CPU's DVFS is often kept ON
> during suspend because CPU's voltage scaling happens quite often.
>=20
> Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.4+
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to for-current, thanks!


--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTQUACgkQFA3kzBSg
KbZRQQ//X0M2uETYY4ocrCKvkYWSCrKJoUsfcN6Kfkw/EfgXBWXsL7pB0v8HZtdM
A6aLwrsMQgtmTDrEVkit9y8m4VHm6hRxgY85R/GJZO1QPWXK88M1R2QUbzNmZDcm
owqVD5oCJnWgj6fyvQcDCkt5ke+anW3GnYUnMuP7kT6OPBbKNxQ2xzaPLO962zA4
sBGsHTnyvyMDh8Y529FxwuD3txYVt17UCEjnIp2iN4YRdMR68tLZnIFaREQrSbSo
8okn2VEJ7VZl2seQHTOBmmxBUy8GXoTGCnfOJo12dFzN2pS3EvuyCeEuF3etouem
UJRZ5vYjwungQMHXsTcoN37GJwyyow4o81BgoFgRd2S69KpFPLkEQxXIQRqf+poI
DugedIUViEOS+mipoM3Xd+0qsIubFz2pYNqrW29TAHD48xvi3iCAsY2emFxsCynq
Hox3mLqyHzcsP6yWdNd6xiwoyuux7q5O0Qkm4Wvn0WF9h4LxkOVWYQr0RUjG1OnI
0I6IEdj+CtkuOK9JyFfpDk9mJHdt93CBpX1Y0dG6bRVNbLCyIUzwxXaYMOd+F7ZK
tA1B55Kdp5cPkRYA2XARyL7LaBSBucZUzBDnU64cCTio9r0AZLmb4p3yuVY5qQU5
TD2Hz6tL/YLuS44kjqkqkQnMj6iaT4JnMdUYBo9Ew4CK0CphCHo=
=bdEc
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
