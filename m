From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix comparison operator for buffer size
Date: Thu, 21 Jun 2018 15:36:02 +0200
Message-ID: <20180621133602.GA8599@ulmo>
References: <20180620130358.26247-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0598096889=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180620130358.26247-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, digetx@gmail.com, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============0598096889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 04:03:58PM +0300, Mikko Perttunen wrote:
> Here we are checking for the buffer length, not an offset for writing
> to, so using > is correct. The current code incorrectly rejects a
> command buffer ending at the memory buffer's end.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlsrqcAACgkQ3SOs138+
s6FGRw//a60PS+deKv3zD2iwPOJF+RpnVChcZi1dOy+WmmY+2tia4HPxHFMe+FVT
woSjkK4oTXm6pqYbEHhAOu2Mje6kWQAaJEAJEui0bZzUrtKLf6s4HPawI1uqcnMw
UkIJoZAmfBafGom7mRgFPfXTjXaa91mit4UxhXlm8YQ6TlOWs3xLnat3yFWmJudP
Miu5GGjRFf/IkVQS+6KjVGVHgt90wiGBqpR+uzBLKwEFRB4+flTk0xaIeMFKpf+F
Z7C63qBtQYkpQFPrRURQuJvMOb/K71NElWK4fe7ZIQYjgRtPRJI4Kw4JbvtvQzJB
ZPdobHxVTsujnMZvoWA0AJ2Bg+tXbdjkxDcsVbA7Kqei6bxYEjeprksmGP9LT799
4Nt8trFE7XjqJbZzAPGbD8ekF+WghtzwnmPY+mfheBocw363Vgn344lRfHnYq+7L
xSGn1QB/Nic967lhhARlajP5iGWT61LCi67OywI6AOuYqyTNo9U/e3zAMauV074Q
ci+ajaPHWMJj1/qEuxFLHcNbIMpNc9QQHOYj4dSSyV9/wnmmeWAfJuU2Yzt6IQdD
Bsyl92HCyWgwKApTTGnLundr5JQstA9r+0uPqhnNoxAi8bygdWf4xk5LpsBNbiNo
gXe8uQCl0lmYhpp+gQFDYK9gL59CSW6s2LqP7Ck+NdY1bDMxyoo=
=NNBT
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============0598096889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0598096889==--
