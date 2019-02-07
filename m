From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] phy: tegra: xusb: Add support for power supplies
Date: Thu, 7 Feb 2019 12:11:46 +0100
Message-ID: <20190207111146.GB18518@ulmo>
References: <20190125112525.10697-1-thierry.reding@gmail.com>
 <20190125112525.10697-4-thierry.reding@gmail.com>
 <786247a4-81d1-9c2e-21b5-258dc818ccb9@nvidia.com>
 <20190128080054.GB18124@ulmo>
 <7838bb0d-af30-e2dc-8bfd-e1256590f9d3@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7838bb0d-af30-e2dc-8bfd-e1256590f9d3@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: jckuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 06:25:04PM +0530, Kishon Vijay Abraham I wrote:
> Hi,
>=20
> On 28/01/19 1:30 PM, Thierry Reding wrote:
> > On Mon, Jan 28, 2019 at 03:22:09PM +0800, jckuo wrote:
> >> Hi Thierry,
> >>
> >> I think any non-zero return value of
> >> regulator_bulk_enable()/devm_regulator_bulk_get() means error.
> >>
> >> Thanks,
> >>
> >> JC
> >=20
> > Theoretically I think only regulator_bulk_enable() could return a
> > positive value, but even so it never will in practice because all of the
> > regulator_enable() (see _regulator_enable()) calls will only ever return
> > negative error codes.
> >=20
> > I can change this and resend if you have strong concerns about this
> > possibly missing legitimate error cases.
>=20
> All error codes are negative, so this is fine IMO.

Hi Kishon,

did you have any other comments on this series? Anything keeping this
=66rom going into v5.1?

Thierry

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxcEnIACgkQ3SOs138+
s6EyJhAArZk4CuAOOUs6klOoxw0edASHuAVz7BQ/DMTT+AsKypia6fpXesBkI7Sb
0KtfZooBsavCb0ao7kXinnjdwRwZMM7v3WprmTGgtY6ZXABtmLK1VNMKqls2Cfa9
w49HFVWC6IpaBU5YWgTsO9LI+STQW2OnLxYPP0CKIEU586V/34qvzjbBF0BzFhwN
MwwJdEvSMwd+Gqbl3izyPSQMPOpUp0HpTcQalGbGUjAr6/S8vTQdIeSRexqhCsfz
DuatsZcn1HvPfluetUMG4SS3OIWYS+Qf01wvSLWx0fBgZUvdYjO9OIlKXNonKYLH
9VIeEZ+ceohQDaI2SXYuVMTW0ehy+s84suxDFJO0Br8+QBfeGs++USqkms8KgBnG
MA5H2pz5G8P7Eh/FeTa47tSuvoL25Pd9lShwxQjNUjtZYPqV95oaS2d+RApMBpWM
kG7Q1EidtGu4fevvb80HX0g7I856h5znh3vRi7NKZ84qEgFgik4/ro4Ut7zq04pW
1aYq4aITZ3zThkPHBPafSQfcgLgruCLLLoJ3pEuot5VNWG/YEi5+AWlS6HxAX3sS
nayytgB9wKI08VvZFVKgxOsYTFwofFcE6ukHse7re0aVf5HuLb2i087PzhGVAvsI
ZdrSn5UIsCLssXmRuLCMAfwHhQVyW9uxxcEHEhD4Hu9GbyOC0Ts=
=zMgn
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
