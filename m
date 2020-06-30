From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
Date: Tue, 30 Jun 2020 11:55:32 +0100
Message-ID: <20200630105532.GG5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
 <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 09:53:13AM +0530, Sameer Pujar wrote:
> On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
> > External email: Use caution opening links or attachments

> > > > > +     if (cpu != codec)
> > > > > +             of_property_read_u32(codec, prop, &props->mclk_fs);

> Sorry if I was not clear before.

I agree with Moromito-san that the new code (especially the above bit)
is very confusing, I'm not sure how the reader is supposed to figure out
what the purpose of the check is or how the CPU could ever be the CODEC.

> simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and
> simple_dai_link_of(). To make the same API work for both the cases, I had to
> use (A) in DPCM function. Now (B) does not get used for
> simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().

> If it is simpler I will just avoid 'cpu != codec' check and keep the
> function simple_parse_mclk_fs() as it is.

That'd definitely be simpler, or supporting this with a CPU node as
well.

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77GiQACgkQJNaLcl1U
h9ARuwf9F6cRaR8lFHxz06jNWSZeUUWjcGZNbZVTPkDMRXKH+RKTvtX5ac3/WiX1
NjQFs+TK8LV6s36/D9pbDL+8tWytYKpmU5R4T82nWEl2QJLpcn+baR5mZ74u5ZUH
HyUKVyPr/xujUOBmFCLBZkLexA+f8pICIwqskTUefJe9yJwvTj2wTtj9zD85PaMz
2Mu+EtDEvw1/2bvn1jaHvpYHmhDqHALoExw6AIRiuWSdOBNESBMksOE0Cn/qBuwA
BsOQz+jwqyAGR0K8VpGGhFnt7xXCRK0eFWzD95FIxpQnq3CqLrphjK6wA5nL+vV1
4n4ZkVcumkebzoPUrfnpt3DSzYCwbg==
=gAuw
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
