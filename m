From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: delete nvidia,tegra20-spi.txt binding
Date: Fri, 29 Nov 2013 12:16:36 +0100
Message-ID: <20131129111635.GM22771@ulmo.nvidia.com>
References: <1385419075-11414-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sWvRP97dwRHm9fX+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419075-11414-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sWvRP97dwRHm9fX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:37:55PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This binding shouldn't exist; Tegra20 has two forms of SPI controller
> that are documented separately in nvidia,tegra20-sflash.txt and
> nvidia,tegra20-slink.txt.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/spi/nvidia,tegra20-spi.txt | 5 -----
>  1 file changed, 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/nvidia,tegra20-=
spi.txt

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--sWvRP97dwRHm9fX+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmHeTAAoJEN0jrNd/PrOhCecQALVj+e8ruk+OdRAGj0iFf1qg
ahAMUJDm4JhfVCJGxo0hl/p618X5HOcrd5zrIQi+zpbp84OnumyqjhM6INdW9tj7
2G7CC8y3YgZhwZlgscnVJ2cEkzM3Twm4wLHRntwdPe6OTk6v1Jqpu3Y5hQlRo/wV
RnMDp2FmWYUW2AnmYOv21wJbBJkrAjxX4WETKCCTzCrqMvs6XrBvCNSzyrc4Vm1N
s46UL23eYzaP3450tHnaLEHzEEM6F6YI11dTGlY+jcRDVWfo/OOgFHGodSiSaG0w
3dXzqfgfBrJcC8zDsAfFheXnLui6TBHitcAfC906SW8Xqg94dj0PDA30/8HOp48Y
dbgyhSecgtHKwLNY+ska4byflcaScDTm+EJerZFsrg0/BnnCNpRDw9uVSqfK2h1g
f1A/xsDkzT7CseBAkwz7sIsGaUoonGpKjBjQ60cUfuX7vSRplWXrTWKP42gUg4vV
eGkKwhUmmdYW5+TmAjhIRkdz8OxJUMi/MjEiZ6zI0HwnXTfJKzaQS3UYNFAzONWv
z40E40BfsFOASJWxGZCHT2x+ReqhgMRoPWVm0qhLybSzjHwvyWcWfIeB0jq2VLM8
pJvq8WuxWDVWk9gX5NgjfVDJeEnTeUYgrsCYApQQghbEM4oUSz5i7SCVKA35bEtb
ouEZuJjY0BwMZw+72Mti
=91OZ
-----END PGP SIGNATURE-----

--sWvRP97dwRHm9fX+--
