From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
Date: Thu, 30 Jan 2020 13:10:39 +0000
Message-ID: <20200130131039.GC6682@sirena.org.uk>
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fe002ec7-ae6e-f770-b82a-49237e0b29c6-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 08:17:37AM +0000, Ben Dooks wrote:
> On 29/01/2020 14:33, Jon Hunter wrote:

> > controller. Applying these patches it is not distorted but now I am
> > observing the clocking issue Ben reported and so the tone is not quite
> > right.

> I thought they had been applied? I probably dragged them back in when
> putting in the support for the test channel on the colibri.

There were review comments from Jon on patch 6 that you never responded
to.

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y1c8ACgkQJNaLcl1U
h9An+gf/cZ7dob6cuhVCdFlZUIMNYEci1qgBuRj3VS/Ofty278mI1D2x7w09IZwh
NZJE66Dw7Y3oCLNutN0zHQ+ODU5GQERW8fXImtH4MVzk4OVkHoMtXpjehbap1e0N
e47IJSIFpcM3VC8WpB1isSTzgxTD3weHTl2uGJK8AqicSOdD4fIPj7nh+8pOVAhU
C5pvIO028Qj8pkyKIR3r2Y9Pw3hbWuHyo6Luur5wm5EX0SGDvx2YQwltfoWstMP6
Uw6CA9O+u3AzfgqEc8+Wp09Xa9Byg9SaoY+0pOaX+A4LlREbO8G5pL/rkiPM5bjN
Z+CXymSuA5tizCUQgckTE3zE9gy0sA==
=EazR
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
