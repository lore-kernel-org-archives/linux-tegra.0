From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Tue, 8 Jan 2019 16:09:00 +0000
Message-ID: <20190108160900.GF6590@sirena.org.uk>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
 <20181218174040.k7u26vnnoplllnwb@camel2.lan>
 <952471da-b355-6471-6c19-5120d6704f81@nvidia.com>
 <87lg3vuc7p.wl-kuninori.morimoto.gx@renesas.com>
 <b5164c93-8be8-1c3d-9415-c895da6ad622@nvidia.com>
 <d1e41ed2-da7c-b46c-bc6d-64cf3e536771@nvidia.com>
 <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5466940898646147181=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <865d2a3e-bf6b-1f30-1179-7e922c0d0641@nvidia.com>
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
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============5466940898646147181==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 08, 2019 at 03:48:27PM +0000, Jon Hunter wrote:

> > Yes so this does workaround the problem. However, per my previous
> > comments, I would like to explore whether it is necessary to allocate
> > the platform link component or if it can be static.

> To be specific, the following also works ...

Thanks for working on this, that looks nice and simple - can you send
it as a real patch please (not reviewed properly yet but...)?

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw0yxsACgkQJNaLcl1U
h9Cnzgf+KQMt92KspZtvuefSfnyBMKF98VT6HZE9W2VwQ1GxX1vn4JA8SW5fGEJM
2Z4eIuTofVD8SPjTYCCZhTwJOVQBfykNA/6uvEsV22OxFJb7PGmq3wMj0yKA/NvC
64WqlQYtK+iOVPrQK8S2zfEse9pJT7FSciV+ayBDE3AxmwdgYe41C5bPbnkxul6k
/T83CiCkDwesrT+qG9wPFHvEDDEdF45qMuOP6pQc/mDg8kw9SKWGNaaIWfu7a8vD
CfpB5bBKfUVX/yqHVMaa5xrJu8zzH9NKCrWqRAORH55n7lb8x9GkXbzJrunV0Qrc
5MWp1KbEaMIDtFvGuohuUTVXOz8VFA==
=HgqX
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--

--===============5466940898646147181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5466940898646147181==--
