From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Mon, 23 Jul 2018 11:25:55 +0100
Message-ID: <20180723102555.GB13981@sirena.org.uk>
References: <17c10727-cab3-4736-281a-d4ace1cdbb82@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <17c10727-cab3-4736-281a-d4ace1cdbb82@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 21, 2018 at 07:23:31AM -0400, Peter Geis wrote:
> Re-sending due to email address typo.
>=20
> SW2 and SW4 use a shared table to provide voltage to the cpu core and
> devices on Tegra hardware.
> Added this table to the cpcap regulator driver as the first step to
> supporting this device on Tegra.

I'm missing patch 2 here, what's going on?

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltVrTIACgkQJNaLcl1U
h9DhkQf/alsJh+YMHB+9qoz+MsbIQ+p8iq2xCD8FGkvxPA9Mu3B9QjaWJxflqDq5
EJPP+WN1nwIpnso6A1hWe4q2wuj3tPwiE7WOQEHowwYX3xAXQ17/P+kKUTA/9iy/
FLhalC0SqOtAw7qjt8syt9kOMqZeZ9LggAI2VX5T8VQVDzUcBTpn82W0eqlcDO6T
MpH0U4PKqsdjV6tOmrv9XZjDC4oRueJMQqdjueaDfrqjdqbIzfkP93p58kMqWCz/
FF/ZostvRGDZ5bpUUOhP4akmn6HDPbA0VJM2M9bw9sZRVSGGkCNlV5bdwsKEaGAJ
JEH+20nCypHzvvuQMma7mTwOMr89Ig==
=47xC
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
