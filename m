From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Sun, 21 Oct 2018 12:23:01 +0100
Message-ID: <20181021112301.GC8554@sirena.org.uk>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4203210680648665745=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============4203210680648665745==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2018 at 11:22:46AM +0100, Jon Hunter wrote:

> Looking at snd_soc_init_platform(), it seems that the platform pointer
> can be allocated by the machine driver and so if it is not allocated by
> the core, then I don't think we should clear it here. Seems we need a
> way to determine if this was allocated by the core.

Indeed, this is a bit of a mess.  We probably shouldn't be modifying the
data that the drivers passed in, otherwise we get into trouble like
this.   That suggests that we should copy the data, probably all of it.
I will try to have a proper look at this next week.

> Furthermore, it seems that it is possible that there is more than one
> link that might be to be cleared.

Yes, that's an issue as well.

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvMYZQACgkQJNaLcl1U
h9Btfwf/dFxAtQI/Mhc7ISVGXuzVPNSrMX9GIpvPLgmAYOMav0sAv/Hwuc5l8yQn
lezhE0TDqs7mjjnBcjSkNlMX+8DRzlr/ROGKmnew4bQUwww+rEex1damDp6JS3b2
fdYqhq42yAVjh09z3ofdX8oa3Y3glbNAp3zR527TajqzSZHOpUOMAFJBxCByDQGH
+8JNd5A7LsccEA29oKULq6OnlsthVbLNEhirU8SE1qaUSadHAZLB8o5IQRmIGnIH
2SmmerTwmMCQE5AHwo0H5HY5M/h6wGYlDNJK2n2mSKohDvN4hKiFBb8lhFb+K15Y
V1l48FNy1pCQpsD7aeTSHFBmh3XhRg==
=q3BQ
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--

--===============4203210680648665745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4203210680648665745==--
