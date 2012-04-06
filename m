From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix i2s compilation when !CONFIG_DEBUG_FS
Date: Fri, 6 Apr 2012 12:30:02 +0100
Message-ID: <20120406113002.GB19424@opensource.wolfsonmicro.com>
References: <1333689076-24454-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333689076-24454-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2012 at 11:11:16PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Commit d4a2eca "ASoC: Tegra I2S: Remove dependency on pdev->id" changed
> the prototype of tegra_i2s_debug_add, but didn't update the dummy inline
> used when !CONFIG_DEBUG_FS. Fix that.

Applied, thanks.

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPftN/AAoJEBus8iNuMP3ddkAP/iIXPFIG0B/ihrpU5xQUxBug
ActY22FbzS9nrIJhf0RjNmOf/rt0/6vQqeR72JypBrXId8So5TU5gNAvSs2Y7e5P
f97794ykZFvslyCsiUjFohYaIh2Uul/MMhD0RuGboASpDzx6rsWOWLuistUJFYiY
ZDvthsSngCJISqE4Qjh8oMLbBTN/EX63MClLPmv0+yEtUJIEL9tpmcfvL0FlSmi5
4bqZIpj3v90novOMImTiUityD4GjqMeZMoKjtZFGGwaXIxc5QgsR3kP64yNTR81j
Tvo2NuZWOdH1RVJ4BfFBcnrf5pcjWScQNGQFn9PwJnRztZ7rTj2sIlpI3ktuurjb
MwQwo6sDTJTgCoMxAmeT+iwkl8uAbGrr/WUQiifmFS1tKwn9REFF11WJVOdBOA6U
uunAOZQugjfAn8Tm4aGTJq4RYEtvO5+AfGU7FxIqRv5bk/JAOc6qKtmiQcqF9lyj
NZ/dYQK7TIxytgW8FnbCt3BpK3GBl24Ti7Qf1gdQtHihbEMpwWPgIEk1tQfr54+X
xcjB+ozY1YuhIl/ujLJwUK0oeaKE/RHuxP1Zlfz4FH3WeuIkwNl9sJPsyxDSqMPJ
xfZSL46JKeKwQG4pEg8po34mTJwB73tK7P2zT36505om+0rgx5LzwuTob1u8Mb31
P9S8VsQJHn5wRWPq7kiO
=b4UB
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
