From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: tegra: Add host1x on Tegra186
Date: Thu, 19 Oct 2017 12:50:05 +0200
Message-ID: <20171019105005.GM9005@ulmo>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905084306.19318-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0682312942=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170905084306.19318-3-mperttunen@nvidia.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, sgurrappadi@nvidia.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, digetx@gmail.com, amerilainen@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0682312942==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NZtAI5QFBF0GmLcW"
Content-Disposition: inline


--NZtAI5QFBF0GmLcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2017 at 11:43:02AM +0300, Mikko Perttunen wrote:
> Add the node for Host1x on the Tegra186, without any subdevices
> for now.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> - Changed address-cells and size-cells to 1 and fixed the ranges
>   property correspondingly.
>=20
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied, thanks.

Thierry

--NZtAI5QFBF0GmLcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnog10ACgkQ3SOs138+
s6EFhBAAhgBQGrAs+R/LaCrxZ9GctQ1g6Y9d/mwnlIz6y+pvfkj5EqHjiNAhjpPM
HGw9EnMuZ3oXPFIK0bt47l2H9vwF5vJJwyoyhCmXH6r+Ew2fmJBbym62vvHOijJS
bSiyXfhyosVp3ry4+EfqpeYGmKYJmWdIz63Li60x2fqP+vpmEbF5jsknDCTzedgh
a+kMSh21xY71QMuaBLpHGyCbyfTHI7a2N1xHfcdCgDzc7Y8bPlx1Pzm6QVIVp4dY
yNjB1Cbn44jkNgHvuHmOBmtl7/FbmJzc8AfZTZXi+tfzOOOooc6FyqS3I2dmtzbt
tLAmeof/EXFejis5S15bk7xPyZR74NbelKxbPudMd5P6qJ4NvVFRCUCOam5fIHYE
+rKFlBbM1fqHkZNGfUuBBj0bNmqTTPYVIlrIkUMcdfryyBbI0rTjxnJ8zEjAjC8a
IV1HKkVrCaw9dkcX42lSPlkh04sjyACt7PPxB3JnOGqNo/T4n5ByTbIp/RXNCnad
rjhnz5ZpsJmKpfeJFt+G5k2ECoKxSYyvZ21U4Li9enS3z9ngGkIFT8pVnujbJ55F
36kBTHF8HQxWfxD7+rxuI6xUVvVDyVsEn7M8vW+N7YZwg/dVKDpEuVts8XpWGYIT
b+q0/n9lk7Lc1OF4Lhiv1+qztaHj1iOeGYDa8aAGtHnAFZqH2GQ=
=39yx
-----END PGP SIGNATURE-----

--NZtAI5QFBF0GmLcW--

--===============0682312942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0682312942==--
