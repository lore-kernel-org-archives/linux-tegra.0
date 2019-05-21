From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 06/15] dt-bindings: PCI: designware: Add binding for
 CDM register check
Date: Tue, 21 May 2019 12:37:29 +0200
Message-ID: <20190521103729.GF29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-7-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-7-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:37PM +0530, Vidya Sagar wrote:
> Add support to enable CDM (Configuration Dependent Module) registers check
> for any data corruption. CDM registers include standard PCIe configuration
> space registers, Port Logic registers and iATU and DMA registers.
> Refer Section S.4 of Synopsys DesignWare Cores PCI Express Controller Dat=
abook
> Version 4.90a
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v6]:
> * Changed "enable-cdm-check" to "snps,enable-cdm-check"
>=20
> Changes since [v5]:
> * None
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed flag name from 'cdm-check' to 'enable-cdm-check'
> * Added info about Port Logic and DMA registers being part of CDM
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj1OkACgkQ3SOs138+
s6G8OA//Za/2suTnOQbvbpSyc5opGe1KwSkFsUP0RGg8aT54pvHnF+SvsLGd8Omu
Pqo0DCbxzEvfYkmdfEseSR3I60FCNYlMU7L/6OYFkAvpI5fYk8TGwyCssXEXHjwz
1BG7cy4oobxCkoNVwqCSm99hxFmTDj33HOYIDyQPt3mNKT/9pWD+V3AMaMPZ0dgx
wRWX4kvxKl355XimcWwspONm9Sk3PV3LEV4Evvr7otXgaD3nNWpLHdBjqBRQtgoe
ZZh1S7mHtc/kLBaHTXy1RBjHFf2Wkw9z3wm7iV/x8xkqroTkQoNnZV4HPOzHEyq4
xYFprccqToWaaXSVz41pzCRI0SoKELJawKakQFDEZ2wZkWAzeY53ORaJNT+EPYtK
uYo8B6ZBu/ikvmzPx9aMQMCzT3WOSWUkgt9jb02BQpcwI78rRHAhYqb1dqMO1mQJ
TD3UI+GZju6Fftt5Wmp02NKlJwJTgRTZZpJpU/+zcbPyYqJrLb4jYfM491wxR3lV
CGSUHMM9rYKBkgHJ81FFOECLV5CF1lwCQfeFGKpyiqHEUerm7qLeOC4Dq099InQd
rwhv6UwVuEU4Al8w+xK7fAqwkigZwgv13hGOsXDEIGurWptMPyfN4MIR4ya+kH52
8LBpB5J+9mNo/vaCXektWciSu/iOusTkXvnzF5K0rRVtcUnNsBc=
=HI8b
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--
