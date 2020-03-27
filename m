From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 00/22] Move PMC clocks into Tegra PMC driver
Date: Fri, 27 Mar 2020 15:45:06 +0000
Message-ID: <20200327154506.GF4437@sirena.org.uk>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <20200325212708.GA836215@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200325212708.GA836215@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 25, 2020 at 10:27:08PM +0100, Thierry Reding wrote:

> there's a few runtime dependencies between the various patches in this
> series, so I think it'd probably be best if I picked up the ASoC patches
> into the Tegra tree and let them soak for a day or two in linux-next to
> make sure everything is there and in the right order.

> Do you mind if I pick them up and send to you as a pull request in the
> next few days?

I guess, I think I lost track of what was going on with this as it
seemed to continually be getting lots of discussions:

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5+H4IACgkQJNaLcl1U
h9CSOAf/QSUkbVkzKfzHrLVi8t1LfFrrL8b00ZDF6zpPcKZ7xMhrTbzFDBQfh1/N
OMocm4O6vBAKX9nnnW5nQrm0DwtDgBaCdw2LZ2vMHmjj+djIxeLUblO495rjKoSy
eTMOEpejXV4hKE/XEiTeFyF/3xAzWaTwGFU5lnbm6gBGGo7FWHTjAikYvMCxfm85
BFFGdkWccrl+RhvRPqlLqHLh4eLBXkHh6O88XXSkAd1uA74Ajm6KgnngXkowX40d
NkkBVV9/AsRGicERL8Fl35btPAXe07mQNRC7cPcTlqbXOKr+ACnqdmAvPrj67gSd
HfNd9wiUiT5pRu1Vm2vM93ZG0P3vzA==
=JK9F
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
