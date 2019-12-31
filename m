From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
Date: Tue, 31 Dec 2019 00:17:19 +0000
Message-ID: <20191231001719.GC3897@sirena.org.uk>
References: <20191229150454.2127-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191229150454.2127-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 06:04:54PM +0300, Dmitry Osipenko wrote:
> The rt5640->jack is NULL if jack is already disabled at the time of
> driver's module unloading.
>=20
>  Unable to handle kernel NULL pointer dereference at virtual address 0000=
0024
>  ...
>  (rt5640_set_jack [snd_soc_rt5640]) from [<bf86f7ed>] (snd_soc_component_=
set_jack+0x11/0x1c [snd_soc_core])
>  (snd_soc_component_set_jack [snd_soc_core]) from [<bf8675cf>] (soc_remov=
e_component+0x1b/0x54 [snd_soc_core])
>  (soc_remove_component [snd_soc_core]) from [<bf868859>] (soc_cleanup_car=
d_resources+0xad/0x1cc [snd_soc_core])

In addition to what Takashi said:

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative then it's
usually better to pull out the relevant sections.

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Kk44ACgkQJNaLcl1U
h9B0vAf+Jesim6R6yU2diF32zHcRsUbMmsppI6c2j5Th/D8i5h+fRxjvXEvVkuGI
XjQkntGRuppBqIv7EcVt19JhOaO2S2+dCWskZY9G1C2t0k/i4FaGv20iVr+Zd1qI
po2/Sv/mjruuFZqpx8ZVGdGVwrdCB8EnANT6k62eFFGb+bvrE9k6xh4db9CyYBKH
EO+NXjIDf/115a4XcHEfWGe3627k8rlw5llArmHyp+kTo2jq5jbCVcUxsXGTsz7W
QyGsYgljmuJ7OVMZv2lpHa4Wxl1hdCobWS8TCrjK5gMFmlWZypw1zOh5Z9lkEVcl
nm/taB4a/p7GEMWOa+AJevErYZjl2w==
=D3/K
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
