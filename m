From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH] ARM: dts: Add stmpe-adc DT node to Toradex T30
 modules
Date: Tue, 1 Oct 2019 16:35:01 +0200
Message-ID: <20191001143501.GA3566931@ulmo>
References: <20190814105318.21902-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814105318.21902-1-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 10:53:38AM +0000, Philippe Schenker wrote:
> Add the stmpe-adc DT node as found on Toradex T30 modules
>=20
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
>=20
> ---
>=20
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi | 22 ++++++++++++++--------
>  arch/arm/boot/dts/tegra30-apalis.dtsi      | 22 ++++++++++++++--------
>  arch/arm/boot/dts/tegra30-colibri.dtsi     | 22 ++++++++++++++--------
>  3 files changed, 42 insertions(+), 24 deletions(-)

Applied to for-5.5/arm/dt , thanks.

Thierry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZBIACgkQ3SOs138+
s6Hftw/9GSzpANShuy2Bl8XDU0wfm4ImQZHn+gvloV9ychIEQKAJuFYroWjvf1kc
x/NskhwR081Ap9AfiDk9KWEg2Xe4fnfQmI+zFAPDSEee+OMmvMaTEfY0xYQOAe7l
OrhXiNadMZKXohIKA2L7lKEGiUsbojTVOh7RSfxTzjCirS+3FWnHnozRVL0Cwwwx
8lkBdHnUSvJMLrjB7JmE5hFJHIdxmwtkp5YmnQCp+708xMmdy1c3G3kffiyiyrAM
//qYyzPtduSVEbrBcmQX/22+dOHi9HKPSgzmStqn40j4gioBp06TmRmLe+wdOu90
G8ZO8tdyFU7TpWwCU8BAZXkpb5C64vZNxjyKDZeLZ4hk2pgu+dQ9hTiJQywyM/oa
/1Hn/AX43COH++K5KBcVWhu5LvzYMRL7GZzlkiOOGuR9k3F/ig7Qx6DMrnjFPlqI
m7t4nqqZTlDEzDa53yoVVVdXXiDsKwi8nEOfeIiuEBlU6w6nPf+nui3DBWA3Zkn2
2XS2Lq2G1qttg5xv1naf5geG5a7Vop+3goArJKpCLNzac/2Vzrkm9kKNyVBre5pz
dobkYxt5O3x/y7+DIqnpmCV37Gx/9juYh2EH+C3lWCsWiGqzMZxELLU0E1qX9FqR
O0lbuoWfYfzEuoLEILEfjo1lxpziqUOw1condM59Se6u9R5A+uo=
=/g0r
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
