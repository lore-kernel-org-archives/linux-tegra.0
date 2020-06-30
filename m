From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 00/23] Add support for Tegra210 Audio
Date: Tue, 30 Jun 2020 11:51:42 +0100
Message-ID: <20200630105142.GF5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2020 at 10:23:22AM +0530, Sameer Pujar wrote:

> Following is the summary of current series.
>  * Add YAML DT binding documentation for above mentioned modules.
>  * Helper function for ACIF programming is exposed for Tegra210 and later.
>  * Add ASoC driver components for each of the above modules.
>  * Add DT entries for above components for Tegra210, Tegra186 and
>    Tegra194.
>  * Enable these components for Jetson Nano/TX1/TX2/Xavier
>  * Enhance simple-card DPCM driver to suit Tegra Audio applications with
>    few changes in core.
>  * To begin with, enable sound card support for Tegra210 based platforms
>    like Jetson Nano/TX1.

This series is too big and covers a few different topics which makes it
difficult to manage, please split it up.  The most obvious thing here is
that it contains both the drivers you're adding and a bunch of changes
to the generic audio cards (which are a single throwaway line in your
cover letter) - splitting out the generic card changes into a separate
series would result in more manageable sizes.

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77GT0ACgkQJNaLcl1U
h9Cqgwf9Fw0z1EoYl+GQBfxwHgw1q0QJ+7vFY3wAPvTzfCpGF/GN0kWMZ5JRYfqA
HxqRAft5r6DgsdOMFRTCkL7ATAnWYyRaNDLoDeMINVQ9/mmaI1FPr/pNSo81X+OX
XL7gZ2xPW9t2GDqtW+AOLGi8crZdSGfWb8HZQDAp5S0tajhTYPpgprx8mXNHsAWk
mvpNfvCT1IeWgDpINtVq/75iixg+GgmA68C/x07ycpzpH2q3x91JbBjlGjlNXpL2
JMr7KKcz993cWC8BwOXIIxbetlbxS6LOINR0sQKFobxcqE16+UUmGpl/TFNDWqos
i2SEL/aLhcksjZJCyLrgV3MfQXoavQ==
=OUo+
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
