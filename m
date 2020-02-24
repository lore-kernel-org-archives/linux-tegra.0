From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Mon, 24 Feb 2020 11:44:06 +0000
Message-ID: <20200224114406.GB6215@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
 <20200221165535.GG5546@sirena.org.uk>
 <47f94534-e997-d56c-5793-ae832fb2add4@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <47f94534-e997-d56c-5793-ae832fb2add4-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2020 at 11:28:57AM +0000, Jon Hunter wrote:
> On 21/02/2020 16:55, Mark Brown wrote:

> > The ideal thing in a component model would be to represent those sample
> > rate convertors directly to usrspace so the routing and rewriting is
> > explicit.

> I assume that it would be OK for the sample rate converter itself to
> expose mixer controls to configure its input and output rates so the
> user could configure as needed?

I don't think so, I'd not expect the individual drivers to be doing
anything user visible here - if we know what a digital transformation
looks like the framework should be offering anything that's needed to
users (and hiding controls that don't have any practical control in a
given system).

> > Is there any *need* for these to be user configurable?  What's normally
> > happening at the minute is that either the external DAIs are fixed
> > configuration and the DSP just converts everything or there's no format
> > conversion done and things get passed through.

> I can see that in most cases there are a finite set of configurations
> that the end user may use. However, we would like to make the
> configuration flexible as possible and this also allow us to test lots
> of different configurations for verification purposes as well.

Internal testing often requires things that can't be exposed to users,
the extreme examples are things like battery chargers with health and
safety issues if the full range of control is available.

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5TtwUACgkQJNaLcl1U
h9Crqgf/ZrHdav/H3sg+ks8XPns3tfhmaN7zdKxLkEl7rclyGrxXkz0hGGNflA0b
ZmCq+byMf1McM1Ay4GqHsIP6kYxwqqZzKPpoV1tOZRHrH85RoI3qrofsZAuEYGMP
KZ36BR55I1oIZXa6NxuOM/Fdrg4hcNanuK43zaXWS9mM3UweiIlXCmvBiWZR4koK
dArroM9BXo7ZXuWWVbhmAfnu6Mi/ZUk3uGauKjlP1Odo7N9B4aRvhV686h3Baaq1
zeLawuT/y9N6G623+AkUKTuuEUfLfk/fhE16y2SsrCxgxrRvBqKDNZLjO9YkiiD9
vcfUOJKsjpBy/LOF4JV2iwHc5xC+wA==
=rFOB
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
