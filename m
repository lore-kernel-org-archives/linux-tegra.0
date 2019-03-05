From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ALSA: hda/tegra: avoid build error without CONFIG_PM
Date: Tue, 5 Mar 2019 13:20:52 +0100
Message-ID: <20190305122052.GG26369@ulmo>
References: <20190304203337.1968705-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bO4vSxwwZtUjUWHo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304203337.1968705-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, Mohan Kumar D <mkumard@nvidia.com>, Ravindra Lokhande <rlokhande@nvidia.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bO4vSxwwZtUjUWHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 09:33:25PM +0100, Arnd Bergmann wrote:
> The #ifdef protection around the PM functions is wrong, leading to
> a failed reference in some configurations:
>=20
> sound/pci/hda/hda_tegra.c: In function 'hda_tegra_runtime_suspend':
> sound/pci/hda/hda_tegra.c:273:2: error: implicit declaration of function =
'hda_tegra_disable_clocks'; did you mean 'hda_tegra_enable_clocks'? [-Werro=
r=3Dimplicit-function-declaration]
>=20
> Better remove the #ifdefs entirely and rely on the compiler silently
> dropping unused functions marked __maybe_unused.
>=20
> Fixes: 707e0759f2f4 ("ALSA: hda/tegra: implement runtime suspend/resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/pci/hda/hda_tegra.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bO4vSxwwZtUjUWHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+aaMACgkQ3SOs138+
s6H6WA//WB4N33fMs8yvZ6WJzt5fQx13eFdt+uBUbxiSVQ7R9DlGEpBImbJN1O56
ypMbJuL4K6EsgkaiYCtbJz8PKEdW3ccMFzw00LZG1F2EDCs8NwBGTKNgEPrmcip6
7rZO+wL9lmJbjQrZwGkEOi1UlZww/Xx0puMqr/fveIzjGpwFLYuG3HY/TIqmfbNP
sosgOQvvAwMoXFBXR/du8+cFkLXJTP9oDhTqJhS5wpwfkqdR4So4Rh3fcwmvLfHq
ZWm4zSDzNbmebCamq5Zx9wFUnWl2jYF1pvTTFauPJrWS4PGaO2Mvz8AtIvVK8cXU
9ziFNJTq8Fsf7t7twd/O4u+bGyVnDgYK+jFWhml/WG30VIfDCi1mrdZ32ThsTssA
5WBPTOlnzMpK8/37LMyZPkh6Zx0U7d0xlrr0BrAAs4xEueVfOKhjs90V8Y0HqAot
5wTkwhkp3bhNhgNUFtADKVleyRQYDMPj0V2J1fJnlYwtxDWLxX2gMTke+AEdng+A
5z8tubJhu3sBtlLShdB1m3SxeKyr/nBqqF3Qw7Tnc3HOGTmzE1ZJvw4u5IlauwOb
R7rJDMNF3pjP5rxMnIkNsCjq12VgOFAxigrpRKpILzem3Ay6nrW/wJSix+HABfmv
kO9fbYEhIUvwWoBCU90ot30cUF6nUbHaE1DqO6i8LOEVn6RoJrw=
=jU4C
-----END PGP SIGNATURE-----

--bO4vSxwwZtUjUWHo--
