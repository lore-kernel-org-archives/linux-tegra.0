From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3] i2c: tegra: Maintain CPU endianness
Date: Mon, 26 Jan 2015 22:00:31 +0100
Message-ID: <20150126210031.GC28095@katana>
References: <1422291305-32514-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422291305-32514-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2015 at 07:55:02PM +0300, Dmitry Osipenko wrote:
> Support CPU BE mode by adding endianness conversion for memcpy interactio=
ns.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to for-next, thanks!


--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxqrvAAoJEBQN5MwUoCm2noQP/28/dFouVahtYBw0ohg2LzFZ
WmR67ga4N7JBHYW8FrYcCv1TQO8Z8BC85G7iWGH8R5fviYvcoIW48khYO+3FxCsY
7g6x9RNhM11NE4HjZ73Zo50/WlTI47c6v6mUCZwWiuB14pILPaBSLAdwl13XX6iN
RxaJhMh3ofAHiQr3TLKFe9CRSWVNDbjOZQU+D1TLAb59bKWNsvCrb7/55MCa2F05
k6OJTDNEsljbspaE8HVqxPJs2YAiuZx+/dro/abYQTBW8YZFOkKDEyuvoek1Cc1+
bM7amYYPGFiJZqcGfhzhWoxQ+GNPYwaYHHFW/6hAQXnVaAyZBpun2FUPj07s8bNa
3o44Up/r1SVeJlqsBLuB+KFnh8VC+B34ZPLIbhb1sD4qKkCFhvFsA/aniTSo77C9
dG9X45BuXdpfZ54Gt/6PRUxztZXVrEdB4nh4flsZP9/zqX4jqfYCP9s2TRNSbxfu
hFZCmWw1mSszJY6qjIhV6d5sQNeI0XN0lr7mBHmoTbXx0WrQpnK8yWUpP94NxEsB
5ePzOCXhGzQco9InOYJEvuTBPJcEPTczQN5SG1qSc64sShcBRoD56uKEoSdCrV56
La1epUKws6Ny5AiXgfMacvE7EWvdcB0UgWJqrTaHWNaPjTzJ+/9hnErN26OvJc9b
40tEgHdUMQYNKKRJe9iG
=648h
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
