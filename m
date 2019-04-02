From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Tue, 2 Apr 2019 11:35:09 +0700
Message-ID: <20190402043509.GQ2059@sirena.org.uk>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 01, 2019 at 01:22:09PM +0100, Jon Hunter wrote:

> FYI, I am seeing that the deferral of soundcards failing with v5.1-rc3
> because the above has not been merged yet. Just wanted to let you know
> in case this one was not marked for v5.1.

I don't have this patch at all AFAICT.

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyi5noACgkQJNaLcl1U
h9CexAf/eATHuzU+lN7Fozhx+OPt6qbOXgrnTNzEDfg/ztwUxwpP+qjxGaHamdc8
/p9OWg+WxH5Fv0SxBqyR6dNQOwcGf1nf9Ps4MhxWIJxbQvZqRziuQ6yyowC/X8yj
7eAPfUB/yOQ1BpYCQe7eVB+BuJsjq2do6I8DgRuWN3gXm9QUqS2fHipkH13sVNPN
TnRXQRKGN++BwG6GKUOAG+Z11dmyEHK7WXiLyMVoL4CQ9x5kENZsbVDmMsrSgtOp
HgMkDFbzopCSWPhoUpvLbBONbKzJGgw2XtThg7xWEkz3rUz0Jtwrb8afGbvusf2g
uBIYtkXI1nVf/gX/dpoixJjq3Ub56w==
=xAaC
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--
