From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI
 link with multiple Codecs
Date: Thu, 2 Jul 2020 13:26:05 +0100
Message-ID: <20200702122605.GE4483@sirena.org.uk>
References: <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
 <20200630153220.GL5272@sirena.org.uk>
 <fb286ab7-21f2-43ad-2751-c76b7b6e4cf2@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fb286ab7-21f2-43ad-2751-c76b7b6e4cf2-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2020 at 04:06:14PM +0530, Sameer Pujar wrote:

> For the HW I am using, there are no fixed endpoints and I am not sure if it
> is allowed to have empty endpoints in audio-graph-card. Crossbar/router
> provides the flexibility to connect the components in any required order.
> Patch [05/23] exposes required graph and MUX controls for the flexible
> configurations. Mostly, in DT, I am trying to model the component itself and
> finally router can help me specify the audio path to interconnect various
> components. Hence I was trying to understand if it is really necessary to
> represent the links using audio-graph-card. Kindly help me understand what
> more it offers. If simple-card works fine, are we allowed to use it?

The links in the graph card should be the physical links at the edge of
the devices, those must be fixed no matter what.

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl790lwACgkQJNaLcl1U
h9BPigf+JRDzmC/OXZU6GO+RPto06SdJhbNhvLjXQA6BqKzqFg9qNRwNxEK38qz/
nBq43rOuPFzPkX8j9qxChkJ7pIyhNHx+Vkqo3fRnulH3afFxAiCLKq0IkFph+A0q
vOOpNX/7HPZHTXzCWDrSF/pkQvgf+ou9X+K6johBzn/Wtd36X1okIf4LCkmrrhzs
/HXd6bGFbGzUC86c2F2Vqbq9aFWhxRMBWGnV5LTGz1I+Y1RiAqUE7yE2whTTGRhv
WdrHBrGkXU2R1mtjoecmZ5k86iY8Ho2PQ6ropR7AHRZXmlEYor7T0ViwjXETvQie
m0fVcHg7vi04mLyDdmy2dUZwC7oo/Q==
=lgFt
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
