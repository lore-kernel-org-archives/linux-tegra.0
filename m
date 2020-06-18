From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Date: Thu, 18 Jun 2020 12:00:23 +0100
Message-ID: <20200618110023.GB5789@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200618010805.600873-4-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
>=20
> The microphone-jack state needs to be masked in a case of a 4-pin jack
> when microphone and ground pins are shorted. Presence of nvidia,headset
> tells that WM8903 CODEC driver should mask microphone's status if short
> circuit is detected, i.e headphones are inserted.

This is a new feature not a bugfix.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rSUYACgkQJNaLcl1U
h9A3vQf/WXhR7I7AHZ2vrSHUiTEBwIC375nL3wtLMM3A9X0B0jomIhmyFDZxYaNS
dw633sHw9HlgWyTTyx07S1iNlk2hHjOGMi/HzrTbSyK9zivf9QN6K8CIfNFzQn52
ynhCFORe0eQEP5gGqZF3bghKDzGSLwzYDq12GzJJPgibuoUk/nEq3hQblqQZj5ZZ
abqeBpm2aI5QAesPDCqYIFfqxo2pdhc39lSgHAw23df1mtuaKGn5MDPU6B/VDCiG
oHrUfwTkTc4HM06aKEUYnkkoY/y/2fxbI/wRmpHauweXn0PiWmUYeDtr8DrNJINh
uTQy4zb22IVORBEEJd7xHQg7TsL+Ug==
=2QST
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
