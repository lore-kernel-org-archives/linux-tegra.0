From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 21 Feb 2020 16:55:35 +0000
Message-ID: <20200221165535.GG5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <316ce0d5-318d-0533-ef06-bd7e8672f893-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 21, 2020 at 02:31:05PM +0000, Jon Hunter wrote:
> On 21/02/2020 13:00, Mark Brown wrote:

> >> +	srate = params_rate(params);
> >> +	if (dmic->srate_override)
> >> +		srate = dmic->srate_override;

> > How does this work for userspace?  If we just ignore the sample rate we
> > were asked for I'd expect that the application would get upset.

> Tegra has a hardware sample rate converter (though driver not yet
> upstream or part of this initial series) and if using the sample-rate
> converter, then the actual rate captured by the DMIC interface could be
> different from the resulting sample-rate.

The ideal thing in a component model would be to represent those sample
rate convertors directly to usrspace so the routing and rewriting is
explicit.

> So we want a way to indicate to the DMIC it is capturing at rate X,
> while the resulting sample-rate is Y.

> I am not sure if there is a better way to do this? Ideally, the DMIC
> would query the rate from the upstream MUX it is connected to, but I am
> not sure if there is a way to do that. So right now it is a manual
> process and the user has to configure these which are not ideal.

Is there any *need* for these to be user configurable?  What's normally
happening at the minute is that either the external DAIs are fixed
configuration and the DSP just converts everything or there's no format
conversion done and things get passed through.

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5QC4YACgkQJNaLcl1U
h9BuAQf9FRu14PuOOZ+O9sauEIcPzDlfRncn0yonqpoiOL8kSVmvII1P6SzUxVjG
KFT1ryG8Jk6CHEYPsfj5meLFRtbk+gB/l/j4+UoVvLdEy6SGGuadmkktdEJucjRG
FOHdt2hfaLzIAZKebaESc7yfGhrQ+2B6W1+FW+SxxpZrN4J8FeugjB31LOhCaKZo
ZGxy4cHJYjQRWAPKz5fHsjOkHU7Es0ZpqZ+jKq3j/IGQtaNy/T+j+x2kQohcWN7f
Bt3DpnlXTOy+iKdk2+7kvWZdo7Cqwydu8IuzvE9cyJc6xsLecENvaOdcbAPwtwvy
AScUw0aer+7MukF/p0KS8880tO3ilw==
=lUQu
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
