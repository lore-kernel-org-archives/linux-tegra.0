From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 01/10] dt-bindings: sound: tegra: add DT binding for
 AHUB
Date: Fri, 21 Feb 2020 12:39:02 +0000
Message-ID: <20200221123902.GC5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-2-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1582180492-25297-2-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 12:04:43PM +0530, Sameer Pujar wrote:
> Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
> pre-processing and post-processing and a programmable full crossbar for
> audio routing across these accelerators. This patch adds YAML schema for DT

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Pz2UACgkQJNaLcl1U
h9AHeQf+Piae6cY2B5ePno99lDsl5PHxfR24xDy2XG2/hPqCtEqWXT3EcJlRacLQ
a6tlKMXvOgdQ4wYzctGGH1SBj00qM6k/Wl4hYaCqxyNdk/6L9VlDM/3S2Aab8Src
CQ9RHkGUgsWqeAH5KsZ/nFWy9jJ43f+s6hhuJXizxMhAylNlMMvFF7cbahu0nqnu
K/sB0GN3f+TYIkqCjbuSRdIobC54aMU2mubTk7a0dgEKHfl69Zb8HBVHgjhkSBGf
r8av9AKtl0yOFQIqVA9PhlOkgwsYdCa5mJKULWK728W/pbPGr+c96RqEgo8vijQg
bKLrSY6B+ljUVJnpaT5KvMMEYSPevQ==
=SKbZ
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
