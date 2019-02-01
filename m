From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: tegra: Support SOR crossbar
 configuration
Date: Fri, 1 Feb 2019 15:10:50 +0100
Message-ID: <20190201141050.GD12829@ulmo>
References: <20190125100058.20203-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1095273325=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190125100058.20203-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1095273325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 11:00:57AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The SOR has a crossbar that can map each lane of the SOR to each of the
> SOR pads. The mapping is usually the same across designs for a specific
> SoC generation, but every now and then there's a design that doesn't.
>=20
> Allow the crossbar configuration to be specified in device tree to make
> it possible to support these designs.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt           | 3 +++
>  1 file changed, 3 insertions(+)

Hi Rob,

any comments on this?

Thanks,
Thierry

> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-host1x.txt
> index 593be44a53c9..9999255ac5b6 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.txt
> @@ -238,6 +238,9 @@ of the following host1x client modules:
>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>    - nvidia,edid: supplies a binary EDID blob
>    - nvidia,panel: phandle of a display panel
> +  - nvidia,xbar-cfg: 5 cells containing the crossbar configuration. Each=
 lane
> +    of the SOR, identified by the cell's index, is mapped via the crossb=
ar to
> +    the pad specified by the cell's value.
> =20
>    Optional properties when driving an eDP output:
>    - nvidia,dpaux: phandle to a DispayPort AUX interface
> --=20
> 2.19.1
>=20

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxUU2oACgkQ3SOs138+
s6F6+xAAnW4Vc1hKfvyDEtd+F16wBJVp1EwUyQatcKRsvm7CTx/UGE5SvIej4WGS
gxHXBU2I0NDKNLRah60IoJpm3hYjHu6QUPAaxjq17Yn9kzz8xnqDLUj/v9wLC2Bi
+CO/w2uBpwX7KdasfIaCMGqz+PQQSE7BQ4+ol+1zs32LvBeneMFPSzAtxAeVDb8a
wukkwVyat/V3lCi50x8Rv4vZqscfIRLiYrHiyVm0ePNwGLEYuBhvkZLyOzBJA68M
tBAABw0c9vVeKOcHPo4u8AvuqOPIajXhGx8piKA5N3WTUKnVx9HR73tnNx64Yw2N
hfgl9xdpuRAn2/b0dyBTBD7g0N2ah54W+fXPioaANlsZeZ7eg8sET2EHe24Er0AJ
bL/Cjk+Px22rfsVsKjByFY35y/uqrqyovV5wSSAX6FTeFZ1xknuK9ZKrjxw0+dtF
4aEEJLK2zwUBGFPm3R0htLV65f8RPfnu5IwBZZflLgClBpBgmwK2dAZiPMOw+nb+
IYlSuR1LeDeZtHfE2rnmuQYcxFvcDBYSluEpGYhzKJcJcDDnBnsDxeTXoF1eTi7/
tk4hobvRxX/Nbl+y4UdlDcsAaPy0Zn8aOYRQAzEf4PfPanBHX/QM/kmQKiHOQ8UF
CM7ytiLwMplT1/mziC/Zaos5EQ6WFlQMlMeNn52xCyWpBd/FRF4=
=YH49
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--

--===============1095273325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1095273325==--
