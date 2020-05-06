From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] DPCM for Tegra
Date: Wed, 6 May 2020 16:53:11 +0100
Message-ID: <20200506155311.GG5299@sirena.org.uk>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
 <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
 <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
 <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1jwo5pf7de.fsf-de0UBZ+tuabJPAktV+lpxxGQ6p3D1CpGZeezCHUQhQ4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 04:47:09PM +0200, Jerome Brunet wrote:
> On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> > XBAR currently exports all routing widgets which can be used to
> > interconnect multiple components and thus implements Mux widgets. Fixing
> > the routing paths in driver would limit anyone to try a different
> > combination as per the need, unless driver is modified.

> I did not mean that you should restrict the routing ability of your SoC,
> quite the opposite actually.

> You should just expose it correctly

Yes, it's going to be less effort in the long run if nothing else.

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y3WcACgkQJNaLcl1U
h9C+9wf9FhV0+uWoqDcuQBDbDmaqyavUV8uakHgopXF3Q9Ny3WMoj1EBaIpxOOM1
nFLZGkaXGkbOEDxuixc2ptvMvML5c8WccOrS3J9Ux6K16BbXpwjFsqClUrzpix0O
r40xsg0q81/pSxIFOWU0BKmFebz8wLG3NGGV2d7ZMW//kIG7LVAb8oB6epKkeKYY
sACMClQ7QsGOeWqteFWq91phXk4OL9KJ4SileYVgTcMBoeN8xgIytv+v7unCTKhk
aJALdHiBajto60CLYG6UPUoIZ3FRLWEoybSOdI7uQz2MmWctYmzn5OQu3lGGlM4l
XM3B0/3XWGsyGhK+XM1JqWoi9cz1tw==
=tJVE
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
