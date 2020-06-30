From: Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link
 with multiple Codecs
Date: Tue, 30 Jun 2020 16:32:20 +0100
Message-ID: <20200630153220.GL5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9/GiYV45wF7IL3Iq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
List-Id: linux-tegra@vger.kernel.org


--9/GiYV45wF7IL3Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 06:23:49PM +0530, Sameer Pujar wrote:
> On 6/30/2020 4:31 PM, Mark Brown wrote:

> > Why simple-card and not audio-graph-card?

> Frankly speaking I have not used audio-graph-card before. I had a brief look
> at the related binding. It seems it can use similar DT properties that
> simple-card uses, although the binding style appears to be different.
> However I am not sure if it offers better solutions to the problems I am
> facing. For example, the ability to connect or form a chain of components to
> realize more complicated use cases with DPCM, some of which were discussed
> in [0]. Can you please help me understand why it could be preferred?

> [0] https://lkml.org/lkml/2020/4/30/519

It's the more modern thing which covers everything simple-card does and
more, I'd expect new development to go into that rather than
simple-card.

--9/GiYV45wF7IL3Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77WwMACgkQJNaLcl1U
h9BoOgf8CqlyK9s07Hb+/KSOYbf63ZpZ3dwuHoWv8+gtnKh+DZIH3KN07uHzVHXw
q3NUE8wJkGfYijU49aUjB5lRw4KNjXtAUMUHNAKlzmjQM+cxlEj6nZOGWAFrHyYo
0rzPMLRbmsHTp9dcKdr7c/AXqYB8vgW+aYo6j76+W7fNvgW3thQllyW9ZKkvzQmz
7TePVknBmz5ov6rTQSau7p314ZBcJEYL74ANMr0LxKKe5TSv/xHLQM9WeEDdkMUE
kELoYHwZrWvOFUfy1nCl+uPqvUr+ciJD5gW5+PQvKnV0nAaVA2jW0RE3KMWKRu/S
PZJLfFNr7vFTIsIU0YMidjDYelIA0A==
=8bSR
-----END PGP SIGNATURE-----

--9/GiYV45wF7IL3Iq--
