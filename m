From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/31] ARM: tegra: update DT files to add DMA properties
Date: Fri, 29 Nov 2013 14:08:29 +0100
Message-ID: <20131129130828.GR22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ep5m4srWGXPl6O+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-6-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Ep5m4srWGXPl6O+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:00PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This patch switches the Tegra DT files to use the standard DMA DT bindings
> rather than custom properties. Note that the legacy properties are not yet
> removed; the drivers must be updated to use the new properties first.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 45 +++++++++++++++++++++++++++++++++++=
++++++
>  arch/arm/boot/dts/tegra20.dtsi  | 35 ++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi  | 39 +++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Ep5m4srWGXPl6O+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJHLAAoJEN0jrNd/PrOh2rAP/2Gy2QHKtIpEQAizIOHWdH4j
wB6CU2lxtVOa1AAdJ/NQnfcnqbZbE4K2wLzhAW1fnPaR9XLx0/8K0ClunpC7k4OS
V/agSdJQX4gFAuGlPdDsrOoMMBMRR11YXR6OA56LziuWn4TYOH5aFIC1KrcBbRJN
SBsNm08J/4FXhvWn7DtjlvgLVS3VjTA8A13bkAn8UUJ/ynrDyvdF1W8upL72e143
0cTLHslv3g5vGW7okM52tnK2Vh/1YOjQD3cFvM5PC2eaSp+rmPtBxLIW1xkEcUCT
k+5McRJ9L8XnsYljq779+KoVcZbomRPfFMDDCen6LhJUkODuQKYvIt09y27zGL7R
64s8aufQVa0+rXr2GRpM3dcujXzyJTrgS0MIrc6sviszQyj+gz6i4QvkK4sAvgtc
2rZ5AUfJj4A2wntvTdpaYS0U/jpOhqdSO8+PdYzzR6CS24n6VLUFEqpbJEVb6cM8
ftYialty085w6koalR/W5wATRVnx+oevRjdHywx3CEWmY5T3NmsLFJhNkH5MxU1N
nrNY8YFLUsJmOlBN32lV7pj1uFb2gIdRfhdZJ5SxzxrvFbxZ1bodJtmSizyft9h/
d8noTud+p44774QqFCY0xv23gOzzBN3wyM0yvMZaXmgncR7FJ/NyLc7XYOGwHqN1
1HacWDz/30fB4d6jtLjU
=nbdB
-----END PGP SIGNATURE-----

--Ep5m4srWGXPl6O+g--
