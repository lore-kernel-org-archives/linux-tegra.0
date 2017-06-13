From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: remove Whistler support
Date: Tue, 13 Jun 2017 15:36:33 +0200
Message-ID: <20170613133633.GE16758@ulmo.fritz.box>
References: <20170413185559.1939-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413185559.1939-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 12:55:58PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Whistler is an ancient Tegra 2 reference board. I may have been the only
> person who ever used it with upstream software, and I've just recycled
> the board hardware. Hence, it makes sense to remove support from software.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/tegra.txt |   1 -
>  arch/arm/boot/dts/Makefile                      |   3 +-
>  arch/arm/boot/dts/tegra20-whistler.dts          | 636 ------------------=
------
>  3 files changed, 1 insertion(+), 639 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/tegra20-whistler.dts

Applied, thanks.

Thierry

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/6l8ACgkQ3SOs138+
s6EH6g/+Pn79LcyuVuIU5v89vSNOpPS4Ieu8Mwfcwyyh3bdq/SmjCycaJNXChO+w
slu2znfxutIXmXnicKubCXvPrqnOa/TT19/nrq+c2eMYbbP2vBSyCXGi+Rspttcm
qW98qVtPLYne/JESgCxPjQAuksum3E+iObm43J+GaKzb9RDhaKGndGPxtHt0mbVq
NIXapFAyS5khGCg3sOIFmhTyzL0oqLETlHYq2lBidDZ9Bvw3vbk7XzP6HNU6fjNs
zhW9Gyo61nOSaQNAO+zXpuyJktoPZPFEer6LybOO1isqTop5vP3L9U0Y7IZa5oZ6
E/eBNYBNu0bfzr6NQV9YlfrvRsS171TcpKfNRxRWt0cNbGLJY9pCDgMRFY6I0wo/
I5uoQ91ghQ7o0ch+sV5ohPfQyMVA0RgUE+J1NOZ+Bl2m8hkuToxP12CVNHKcjaf8
NorkbisjLWMOx64Bkb5XCdPja4BPeWma28AJox9RnCXIbXdE+6evSVts1C6m/Cqz
UE2LnaR/ggc3cBsl++DfbPYXkoo/e8AjdYm3MJrFLVtENlzrgimn9sAeqIE3DNjh
XAyk1/fXvbVAptCjJ00pa2Kr5Ml0STIDDMNRMPqRup54bMzULKBkuPnjc1X3QWWN
SBm0yCuBCxCOTb2qrTGqLrZ2v0euwCoFB8mREZJdCeUEcsAKV+M=
=Za/a
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
