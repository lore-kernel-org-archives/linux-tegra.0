From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 11/22] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Mon, 17 Feb 2020 10:40:20 +0100
Message-ID: <20200217094020.GM1339021@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-12-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="egxrhndXibJAPJ54"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-12-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--egxrhndXibJAPJ54
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:16PM -0800, Sowjanya Komatineni wrote:
> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
> are moved to Tegra PMC driver with pmc as clock provider and using pmc
> clock ids.
>=20
> New device tree uses clk_out_1 from pmc clock provider as audio mclk.
>=20
> So, this patch adds implementation for mclk fallback to extern1 when
> retrieving mclk returns -ENOENT to be backward compatible of new device
> tree with older kernels.
>=20
> Fixes: 110147c8c513 ("ASoC: tegra: always use clk_get() in utility code")
>=20
> Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  sound/soc/tegra/tegra_asoc_utils.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

There's some inconsistent spelling of PMC in the above, but other than
that:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--egxrhndXibJAPJ54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KX4EACgkQ3SOs138+
s6Fv6RAAuWcedNtxcpf1Te+X5nra3uQEEKd0TuNszot0ysatU9RzdUyV2WgKYaNM
waUPM+ScmUboRJSGBgFEuXcIFs3eYo9JV0ODdkkONJfJqWAVR05lcn/CzpWyLYBt
9KbqTnNPDMGZ/55wkn6+7VWl0skvgUrNtYsIFIXxAbPFQJle0X2Fv57a/b9XWTc4
oJw4eEM16pHXkrl60WtbvMvt3Fwjj7juBa8bS707DnVOeMufR/SCJ5R9D2R0kJeI
YIDbYuyLKzAjdrWc1cnWwYmfJmyAV2TNAH6QFxDPY6gxXErjvuY7xNSxxwlq/QDX
8HW8FDKJQ7GREF5rAO+AbKfE1iF9jrmkGCKZwDdms3BvVEm2nYx+ZG9L86+kk6NN
nn03DpAmNXNC3eiNNVgtTpDGokbKvDgjr/84dMdha1MHjqlaE9sovhfQpCpbcIEl
gvHMRDmdIHhxF8zYn8wmqPSGI2xpvqLWt4gzkQNv79Bq+Q9qhGRRTbVJBg0SawRb
TooYWT4EpiKvA8RV4rsM3gvCCtqQAD0ekFRSEb39r3Sn65zUmvCttPKyzAZ0ePk9
/2TjbCQEtPPPjXV3DZYtmCGAODV+kEI/TPiz7t66TCV16oVSWmTFBSvIsrV3FmX1
+/pfxQbsWJlWHjjsCDQ634jKLFUtefD6kaSrTMq+CbAnfspQTdw=
=/mBF
-----END PGP SIGNATURE-----

--egxrhndXibJAPJ54--
