From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Fri, 22 May 2015 12:25:29 +0200
Message-ID: <20150522102528.GD16507@ulmo>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com>
 <1432214425-27137-4-git-send-email-amerilainen@nvidia.com>
 <555DEE5F.2060100@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1630165878=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <555DEE5F.2060100@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: achew@nvidia.com, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, srasal@nvidia.com, linux-tegra@vger.kernel.org, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1630165878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 05:40:31PM +0300, Mikko Perttunen wrote:
> On 05/21/2015 04:20 PM, Arto Merilainen wrote:
[...]
> > +static int vic_is_addr_reg(struct device *dev, u32 class, u32 offset, =
u32 val)
> > +{
> > +	struct vic *vic =3D dev_get_drvdata(dev);
> > +
> > +	/* handle host class */
> > +	if (class =3D=3D HOST1X_CLASS_HOST1X) {
> > +		if (offset =3D=3D 0x2b)
> > +			return true;
> > +		return false;
>=20
> "return (offset =3D=3D 0x2b);" perhaps?

I think this should really be extracted into a separate helper. If we
ever need to take into account additional offsets we would otherwise
have to extend every driver rather than just the helper.

Also I think the 0x2b should be replaced by some symbolic name.
According to the TRM 0x2b is the host1x class method named
NV_CLASS_HOST_INDCTRL_0. Oddly enough that doesn't seem to be an address
register. Instead the address seems to be in the INDOFF2 and INDOFF
methods (0x2c and 0x2d). I also can't tell from the TRM what exactly
these are supposed to do.

Arto, can you clarify?

> > +	if (IS_ERR(vic->rst)) {
> > +		dev_err(&pdev->dev, "cannot get reset\n");
> > +		return PTR_ERR(vic->rst);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, vic);
> > +
> > +	INIT_LIST_HEAD(&vic->client.base.list);
> > +	vic->client.base.ops =3D &vic_client_ops;
> > +	vic->client.base.dev =3D dev;
> > +	vic->client.base.class =3D vic_config->class_id;
> > +	vic->client.base.syncpts =3D syncpts;
> > +	vic->client.base.num_syncpts =3D 1;
> > +	vic->dev =3D dev;
> > +	vic->config =3D vic_config;
> > +
> > +	INIT_LIST_HEAD(&vic->client.list);
> > +	vic->client.ops =3D &vic_ops;
> > +
> > +	err =3D tegra_powergate_sequence_power_up(vic->config->powergate_id,
> > +						vic->clk, vic->rst);
> > +	if (err) {
> > +		dev_err(dev, "cannot turn on the device\n");
> > +		return err;
> > +	}
> > +
> > +	err =3D host1x_client_register(&vic->client.base);
> > +	if (err < 0) {
>=20
> You used 'if (err) {' previously, so maybe also here.

For consistency with other Tegra DRM code these checks should use (at
least where possible) the (err < 0) notation.

Thierry

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXwQWAAoJEN0jrNd/PrOhVdcP/ife4zw35QAE4OTcBbS3Sl3p
tkYtavpZgc8wFYKacbKBAlwTXWzsb0Vqa8yhMqtcY0T2pwVc5CODd8JnS4ah/D+c
Jt2hhOrdCjAhQuWUJtcq8NZdIX3kmRMxNtmW6sDOR1AJki+Q/kiogDVevwZvmcub
KuOejH+xJL9Ww98xwNVKnnrLGo+zQeistQU6efmU3LEkb1M1ws4LYma8oOpCE5wY
sJGoTW8VtQNLwsxXzlefILDA7Tuxa3e8H0sus4pFJMvJPe4ASpZ94jb/sY6cz89F
WUmuTjE0jJkaGLxr1wR03MZ8WA4sDo9SjxLuzDH7YMZ0tNi0FnspwQj2NSs6ja+1
JvAgeO5zpF/PYy3LJPB14DU2wdFGxIThHpT/dF6oXReEuk3+v2kzCuBTL55f99CE
C1Lzm/g3yylNjHvpvKDkYe+enJoLvGOkrOs7VclVgSWl0HN0wgA5cHVURlFN+EsO
FeP1GCBkp7mGxyhRxFCK49MpUKEcREI9C++yD/LxUBq6odHk/GTP82TFOuQ2iYf2
SaXDGmhOYHwhDe/UsoAX6EsfWTuPw61p7U8rKZFP+3Whc6xZKE8YrtnAoaC1f84p
rv+MVZAZrp+8dKVyZ5ouU5QXqDgHpRIlsRj3LFZiXR8WpEdJ9j8SG5Rvveyg0PIM
RmkEXUrr7hXxLwmKjEhm
=+NGZ
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--

--===============1630165878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1630165878==--
