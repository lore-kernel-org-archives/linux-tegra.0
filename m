From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Replace drm_dev_unref with drm_dev_put
Date: Wed, 26 Sep 2018 17:04:18 +0200
Message-ID: <20180926150418.GH12980@ulmo>
References: <20180926115640.24755-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0710549661=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180926115640.24755-1-tzimmermann@suse.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0710549661==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0OWHXb1mYLuhj1Ox"
Content-Disposition: inline


--0OWHXb1mYLuhj1Ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2018 at 01:56:40PM +0200, Thomas Zimmermann wrote:
> This patch unifies the naming of DRM functions for reference counting
> of struct drm_device. The resulting code is more aligned with the rest
> of the Linux kernel interfaces.
>=20
> v2:
> 	* rebased onto 'drm/tegra: kick out simplefb'
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tegra/drm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--0OWHXb1mYLuhj1Ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurn/IACgkQ3SOs138+
s6FcXQ/8DdssyDvlp7PzTaWnZwK1PiF7+xfeiPJpD6xY5KdZyq0GoDM1D2eaV77y
v9tYBimDp3ckKdCpxl44AeUH+KTpxi9EcApiADSnK2DDnXWvZcMo1WdTcZa3m6oS
EgixMusFLyfjkBK/BOMizQZr9DaFq7Z7Wn7x0MHEd2N36Sp0/Sive1kUZs+PnbTQ
gbMSTolU9krOViPIKBMwhDH3B1aA6X7Vw2yCeF9n1DcVFr7BiyatRUEh41HZwQ+F
+6tRDVieXYTbjZ5NoxSSKsF7TIQzKaaq3vCdcVCo5uo6FAvoN61cptlLic75SXAz
CtCnb/Y3GsUo3dQKidEcSQu5X5jdINXUaKyb9svnZITDxSevsgog5NX8F/NWjnTj
j7BUznILij3FufIOVNiibG7Hl5WbYUfm9RmCKJ6+Gk4rRGCHvc7g0AtafDx2sY37
BVOiVafJOr8TNLXRStscS6X4RLwrPK4DielnZffpr9foCe3TIK1CsVoZS3XgL1XH
aEGOf+TPBg/E0Ecsh2Nq7u5ahOcCUI+QTLgfz5v4tMqPMjp/h3YogjKCV+v0twCv
JB2MTa42QUqK06Oc8wsGJSSGVBXVvMQmFL/2WMRaeKIYAP6Bgi1v06YhbQBEZBAC
La/+4yiOkON7jslgd+L6zASeVtIq2xv7Eo1RAEybi8HMYdhz9RA=
=/nCQ
-----END PGP SIGNATURE-----

--0OWHXb1mYLuhj1Ox--

--===============0710549661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0710549661==--
