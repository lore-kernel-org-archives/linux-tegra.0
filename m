From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/3] ASoC: tegra: use DAI's not card's dev for dev_err
Date: Fri, 8 Jun 2012 07:03:39 +0800
Message-ID: <20120607230338.GJ14525@opensource.wolfsonmicro.com>
References: <1339024507-5096-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ed/6oDxOLijJh8b0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339024507-5096-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ed/6oDxOLijJh8b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2012 at 05:15:05PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This is the actual device of the I2S or SPDIF controller reporting the
> problem. If a future change converts these controllers to be CODECs, then
> there may be no pcm associated with the substream, so this change avoids
> a crash.

Applied, thanks.

--ed/6oDxOLijJh8b0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP0TNDAAoJEBus8iNuMP3dWR4QAJtJN9290ut/ReGnz8/ooOko
AgA2Q0MwmX8PeuqVprJ3XYl3bVTGtutWsIBDPsTqoAoZ+Wy3tgT0YD+vQiQ/RfxR
E5JnC3fMGmxYBVJo33cCdVcx1KWL5qLUDdNMwyIDVVCJQNslSOj8OunRN4qTwBiu
maTfBGu4kJmDNnpeRVEgL2jQfAtJ2Gu5klGjbmR0Lwp47qZULoUJ5Nu8H/DeBsIJ
jEARzGVCX0V8PCE15RuwiIfFivyOYaPaDY206WpkM2YsRS69PSFD0IZl8nWHCkM9
bH0/tIYlQgf5gHsXwhOvONZktCYpc1SF6576RC+JMxQFJVB8/FWOXzeFQJLUuwzK
8XvI6Xs85qhEUZ3tGsVZrqKshwmJxlPDpARh+biatZGGaq5HqtzTcEJ3aQ6NJInV
4mnVQ03zHBGu7Qye43dPDnFXGAoZayyrxgKhfIJecxhJlY+Gk/FXIb2N3fA9fAIo
beKFC5ZUdNQ6KhYXUTToEDGDw08WHfo5T+5u9WRqzH/gekruq4Y6mnaN48fIT5tJ
sK2pTQ1O0WKh+ZP4wruNj30x9xg6zRbgmyyBvTAgehCL67gvRf2/aFRsV+SGtjp7
WQQpG81JjXsjN2fBwHnMWgUnfBal5mUngHYieyUPRRwh8MgyELgYNOEGgzFGuTQR
MDffD/IZ7UQVAPm1Savv
=1vtr
-----END PGP SIGNATURE-----

--ed/6oDxOLijJh8b0--
