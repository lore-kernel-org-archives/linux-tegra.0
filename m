From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 03/15] dt-bindings: arm: tegra: Document #reset-cells
 property of the Tegra20 MC
Date: Fri, 27 Apr 2018 11:35:51 +0200
Message-ID: <20180427093551.GE30388@ulmo>
References: <cover.1523301400.git.digetx@gmail.com>
 <57c08ef0d2e3dbc6ad0e91f426c5db5b181b0ab9.1523301400.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57c08ef0d2e3dbc6ad0e91f426c5db5b181b0ab9.1523301400.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 09, 2018 at 10:28:25PM +0300, Dmitry Osipenko wrote:
> Memory Controller has a memory client "hot reset" functionality, which
> resets the DMA interface of a memory client, so MC is a reset controller.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt      | 12 ++++++=
+++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlri7vcACgkQ3SOs138+
s6FFzg//VbGfA34eRjRnxNLCNMPq1olcNcM3iZP1AYukwz44LAQammCrriTVw36C
xRBLWkj52snduN+HJzTNnIdXp8ioW5SZhraBrJQ3SZLJ2tW2R2Cx1LAvkZsxTDQ/
7yj4uKZG1mi/7R1JDH//Gdgkd6WSTe8A1EdBqXksUs52EHpkggcBSnL5rrCqW+Bf
v6GDDCpiMFkmwxzk85eBTP/m3MtSGl6vdfe/IP+9maC/7THP4ITx8Oy40BIIFpGk
7saofaivkxegp/k5wfWcHUNwwajRM+6GKhuv8JbHVw9KDKmulNRmc72U0wqmQGM2
GpKOlTONCtySmEEut0biYBWwwnC5LEEHhOG5kkuuiNNXgm4tHARa97kyvDIP15cg
2BBqapv+EfxvBZc4yC2iWME0MR6en5Ujlxl3FOyGwgni54mC3Ys9FVWO5pjd41Vq
QZZQHHWS3iJOM2rXQ1hbzmWjsxiDtni5TnzR/ravAJaRKiiwMFh8ZlxKgUTx3GVr
3KBTc6KIoJh+ITP0TFvVPg7NdDN2CnIOt/RleTuVB1aE//g/wuAnmXWo9lNhgwE+
evj0yEDlNjBbtYOz9WsUbRUYnRfONM/rZ575+UFLD+oz3gv7MKu+ypD9DTuEBU1P
7e+Z83hcNPKbHpMzvGdUKejhF1rWIaD5LBad2iscAANsameiZAk=
=3lhz
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
