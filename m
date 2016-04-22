From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: core: Add early supply resolution for a
 bypassed regulator
Date: Fri, 22 Apr 2016 14:53:39 +0100
Message-ID: <20160422135339.GD3217@sirena.org.uk>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
 <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
 <20160422104837.GC3217@sirena.org.uk>
 <571A0A81.4010009@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yqoYZO0eSM9FLp66"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571A0A81.4010009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yqoYZO0eSM9FLp66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2016 at 12:26:57PM +0100, Jon Hunter wrote:

> OK. Sorry if I have misunderstood you here, but this sounds more like
> Thierry's initial proposal [0] but ignoring the any errors returned (and
> we need to fix-up the locking in this patch). In the discussion that

Yes!

> followed I thought we agreed to only do this for the bypass case [1]. As
> far as I am concerned either will work, but to confirm we should just
> always try to resolve the supply early during regulator_register(), correct?

We need to only *fail* in the bypass case.

--yqoYZO0eSM9FLp66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGiziAAoJECTWi3JdVIfQbrsH/2EuI5jdXL0dJeJjOncahUZ+
AIjgY2kulfOH6oRXFrksWa3l0Xs9ZTvlyb+pve8T84QCFo05ywhdG89Ia/IBWgU3
bRI1lphrTk5ZRZXiQkyBvWFgM56bIi6Ha5Zjp+qBiMgrzDQjf44pNP01dH+5T+ai
wmoLLvC7j8J4zdglAIfYo4ts5kt3wlMiGo7OdGYzXpo2Lkq4loECdDzk5z5MynZG
WX4/F2n2KEh50oJEsTfag1NX7kkaQuudGLXUtzaRrEG1ORaTzcnnRv58hUKuAhmA
2p9L9JLI00ZTNzSahlVizcS5JglPJxYKKm8+JbDzrPLQJ3mBEpuRWw2aNar86KA=
=/n4j
-----END PGP SIGNATURE-----

--yqoYZO0eSM9FLp66--
