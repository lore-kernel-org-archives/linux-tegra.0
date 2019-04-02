From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-core: Fix probe deferral following prelink
 failure
Date: Tue, 2 Apr 2019 16:31:59 +0700
Message-ID: <20190402093159.GF2059@sirena.org.uk>
References: <1551706274-22571-1-git-send-email-jonathanh@nvidia.com>
 <4eb94b41-7e16-7b39-5c14-a7d180ce67df@nvidia.com>
 <20190402043509.GQ2059@sirena.org.uk>
 <2d8a0569-b821-c0c0-af39-d3863d17f47f@nvidia.com>
 <20190402091955.GE2059@sirena.org.uk>
 <10d454a4-e1e1-3a4b-8400-acd680d75a3d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ExIO7AL6tcaLjJBF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10d454a4-e1e1-3a4b-8400-acd680d75a3d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Curtis Malainey <cujomalainey@google.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ExIO7AL6tcaLjJBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 02, 2019 at 10:30:34AM +0100, Jon Hunter wrote:
> On 02/04/2019 10:19, Mark Brown wrote:

> > Oh, if I've applied that's why I don't have it any more.  Indeed it's
> > applied in my 5.1 branch so I don't know what you're expecting here?

> Well I still don't see it in the mainline branch and some boards are
> still failing to register soundcards with v5.1-rc3 because this is
> missing. So I am wondering what has happened to the change. It seems it
> has been dropped.

You can check to see what's in my tree by looking at it directly or at
-next.

--ExIO7AL6tcaLjJBF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyjLA4ACgkQJNaLcl1U
h9A1+wf+MuG8N763r1I+LvdFPfgQpxNEVZPSj4mjqMMge36/LhHGE5zs5TghmDjL
CCKzt46YWc9OVZzwRdWvgVZh0JB3mhJDV2+jrrJvJoS5W/NMDYNpfOZxtOiFU/6I
4KcomG7ArPB51w2YnpD2g2QebPF8AII4+hHNqwYWfL+wSohU9HGgylV5YbwZt22Y
OdtVulgLA4iMt1H/4PI6X6dNtIljV0N/ERwmKjNzc1FmK5xUS7EIvKpfMJDRN29x
jWskMzGktlug3FzQtbI7M/3mbMYJxkH+A9CyWsYRL8FR6gFYhO1vJWaAngfA3dD6
OAlNY2IdaHh6RmKYX5PJXj2/nwsIpQ==
=e5Lx
-----END PGP SIGNATURE-----

--ExIO7AL6tcaLjJBF--
