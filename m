From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
Date: Fri, 21 Jun 2019 23:26:40 +0200
Message-ID: <20190621212640.GF950@kunai>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Dmitry Osipenko <digetx@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 04:09:42AM -0700, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>

Applied to for-next, thanks!


--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NS5AACgkQFA3kzBSg
KbZGAQ/+POOwqL1aPhZCqfwAJ5oAN9IH0Mf/A2wreDZee1OnVZFXd51w3hlSweSD
NlqQuCl42kk06T1F1epfCCh7n1jsLliF9WbvVfY8eXsjXQ4BR0HELwMF8ZAJ321S
0qQhVG36klBTu2uj/4iR5J2i+4k0xQA/REMG8gyeY6yfaOucfx+9Mlk6oMyk82c8
QUNhuHjWEyabSmTMnMXN2UYGi38OzjydkolrDu3rFc0AtyiqF8h7bAa9Yz7p4SZi
hP+/JpZUpzoldhiCLnfPautGYB3r8lrPV9qBMDiKgsEg64RQHzRGdCMZkIT66fwa
c2fJcuMdV3JPEO1COYCOKhi8VLt3t51+U3lqZiik+OyEyTBcLQzdLdzzp87Z9nE+
M/J2QFqBeI5CpcghbluwJinfbGOG/7jc5hDnJ250G8J43HE2AKJre2cGIbNaOsNi
+UHZvP3B12nrhIwAeLCyvdwLKczHO9ZIT9GaQBPox8siWiXWVYqLa+ZD10Z8G1qx
7sIEvgYykkX2oy82LbwByA7OGivv8atiN/ReB3SHMGGeY3nWcKneDdk3zkW8KYX7
4YAI7HPFqqbcFTODJiDi3pnmJo16/a1FBKnjCM6FShMjGTObe45ysMzhBAT+aRrU
Z2/a823reAyjrSU/k3NELeyqcCbdCxMQbiLbiWFXCHmTg1Jrupo=
=abNm
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
