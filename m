From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 3/5] drm/tegra: gr3d: Add IOMMU support
Date: Fri, 4 May 2018 14:20:36 +0200
Message-ID: <20180504122036.GW13459@ulmo>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0088620835=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503234723.4368-4-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0088620835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vIq7vvlOcsOjFaxi"
Content-Disposition: inline


--vIq7vvlOcsOjFaxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:47:21AM +0300, Dmitry Osipenko wrote:
> Attach GR3D to the displays IOMMU group in order to provide GR3D access
> to BO's IOVA.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr3d.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Applied, thanks.

Thierry

--vIq7vvlOcsOjFaxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsUBQACgkQ3SOs138+
s6FDNg//aK7MWch5SyuR4cSpvCoFlSd8rNGskglHRvaLtUDDCZW160dTmu8jnLK/
vuqJqjAcs6QFxJy7eoufdDQfCGI6h866kpcmEpbY8QYkSne7SS8Wh7oT4C/i8WyG
h2RxNzWgzyrpWWEHU34G2A+jorC+zfcOmdhhZuV0xyNCUsEm8Yu4nlWnfZswTKsH
+qEA5Vfk9/UlHeYGMlHx0RosL7iFhrQibxwTLqLy5vq+IiI1MfXLirkgx9aEzRGU
HhLJqniz33lFJRRrCAIYHKJRQRQGHrtGMBCwSpluic8MGlVsegyd5CoXJVqOWPh1
3lUNJnE3UhdUe7zGFZWOjofVmtfHQxvB7IPkoAhIgvOl+e18YtE8zE/YDjW2uo2A
NXiJ7mlN3821MV3WJlnACPfHWmcgs1y0t00ztFR6sIzJV4yI7Mr3mRC3xAZVOunl
3oMGvdVsRa1MKZy09QlAnt/ri67JV7VIY+EABUPn1/qvQfVQPAHjD1S+qPKygdxn
Tdxvf2GyfM+1aQtuXuklY0+/SIIdEXyoN3ape7cjnZvNfQq1uYSdi8O3R4m/dCPA
phEwhxmKsFMV+qZRuU3cj60Tvhr4r6qtNzyZC1r4BZpjo6m+rNaaa0NnyQGECCM7
jqkcRHGi4OyFn6awLCLEpEABsyCeU/r4LcwJuUct9e2lCDC1Ib8=
=zpHm
-----END PGP SIGNATURE-----

--vIq7vvlOcsOjFaxi--

--===============0088620835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0088620835==--
