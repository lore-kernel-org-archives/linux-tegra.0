From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: correct playback_dma_data
	setup
Date: Mon, 22 Jul 2013 00:57:08 +0100
Message-ID: <20130721235708.GF9858@sirena.org.uk>
References: <1374374049-30732-1-git-send-email-rizhao@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8342678663186895762=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1374374049-30732-1-git-send-email-rizhao@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Richard Zhao <rizhao@nvidia.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, swarren@wwwdotorg.org, tiwai@suse.de, lgirdwood@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8342678663186895762==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jk/5KjyVsvxWSMIA"
Content-Disposition: inline


--jk/5KjyVsvxWSMIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 21, 2013 at 10:34:09AM +0800, Richard Zhao wrote:
> The errors were caused by copy/paste mistake in below commit
> since v3.10:
> 3489d50 ASoC: tegra: Use common DAI DMA data struct

Applied, thanks.

--jk/5KjyVsvxWSMIA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7HVRAAoJELSic+t+oim9nBUP/1I/JJRLwLPRn9m31DUBPUIz
97m7wJcd6PwdeWBVPejfB3z0k2muFY+n7fuzac2T4Rxj+j4ukpl4GBPzZ23Jm+2n
aa8OC4ZI+uJY7Z3rnLcFHJ6a0sU3emzlXPVKpGBtlz45ofduE1kR2EjAea+hbB+o
JmUDSycl8Q+wvps+C8zCCzbsLCywzXtpuOIOb/c04nYZEklRpdBlsqhxYr5vyKgK
UrxmMfcgWIHRopvUZiHUZmUNQ8PR51jM/LPBHUxgFnYq5iCPa1g/ysv92WAY0/Fh
eNfT4Is7HJRjsdRYeEYTwOnK89tSMG/Qq1nFsoXItJUX5mq+R9NINBo4a7Wm8+ao
Lv5JHVtPrfcFCei2fwkwIj+3m9M1EovP12MYNBzAMvNVurioYhAnd9w0IITeaE3F
04OVPvafdvLBKCuPACp898TGrWX4u6NGfIC7AC20sK4yMCc6cu0wCVFyOjJ7ugWO
vpFq7gv0LwwM0a/Uhtn9EcMBvcx5KmKhT6w6xsLaVpOcQXVdrsf6aw2SFNJm5iI4
7776QcWUgWWY+xA4BpXXFqbrstgLrnGSe7j9amLRuIKn0txVGtm9NCNr6mobpa5q
dTH73xTATpRHftyvz4U7pFtGAjYqF4i84vVJ5rbD+eRP/2PVF6VVXE1e29e3HanY
a827qClwXqfsSqQ1Fjk5
=mvcU
-----END PGP SIGNATURE-----

--jk/5KjyVsvxWSMIA--

--===============8342678663186895762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============8342678663186895762==--
