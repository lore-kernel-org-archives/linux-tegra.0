From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] Revert "ASoC: simple-card: Fix configuration of DAI
 format"
Date: Fri, 24 May 2019 12:10:54 +0100
Message-ID: <20190524111054.GA2456@sirena.org.uk>
References: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558688044-22025-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-tegra@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 24, 2019 at 09:54:04AM +0100, Jon Hunter wrote:
> Revert commit 069d037aea98 ("ASoC: simple-card: Fix configuration of
> DAI format"). During further review, it turns out that the actual issue
> was caused by an incorrectly formatted device-tree node describing the
> soundcard.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzn0TsACgkQJNaLcl1U
h9D7hgf+KnlthPCAcNyZh9TNU0VlaxTKG3nZmDHU6QQg/BOOt48b+aWZBg7UIuHi
ii8RJQsiBLnRhDUs8COFEcoyDMwlCaFcyn31Gtfno7H2IvZgWHgN9zff1hkibOZ+
571fGi0LS3x+5htd4wNPQQdNSai7uSTVR4NYGl2jh9H3fLLRU16PatCRlT5xQoyO
lEc+c6Ag/greLJbHgoT5bJf0GSOTaGcATCI2NWmTx86dyZ568Fs7gEDKGph7Md8h
NGMHhk8Wew0avn6epDR2opQhXFP1pqD9KK/TUm0GgRX0x2gqauePZeq6W2ucgQD1
CuA1xZr3ytSJsWyVaP1GGMEPph0iRw==
=NXV0
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
