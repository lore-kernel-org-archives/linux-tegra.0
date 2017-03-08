From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 07/11] arm64: tegra: Enable SDHCI controllers on P3110
Date: Wed, 8 Mar 2017 14:18:06 +0100
Message-ID: <20170308131806.GF29118@ulmo.ba.sec>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-7-thierry.reding@gmail.com>
 <38bcdf00-d85a-07fc-d557-bdca581eb333@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1492991921433940696=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <38bcdf00-d85a-07fc-d557-bdca581eb333@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1492991921433940696==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline


--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 11:46:10AM +0000, Jon Hunter wrote:
>=20
> On 23/02/17 17:30, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The P3110 processor module wires one of the SDHCI controllers to an on-
> > board eMMC and exposes another set of SD/MMC signals on the connector to
> > support an external SD/MMC card. A third controller is connected to the
> > SDIO pins of an M.2 KEY E connector.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 42 ++++++++++++++++++=
++++++++
> >  1 file changed, 42 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra186-p3310.dtsi
> > index 1a9ac73b4ecb..b18e166527d8 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> > @@ -7,6 +7,8 @@
> >  	compatible =3D "nvidia,p3310", "nvidia,tegra186";
> > =20
> >  	aliases {
> > +		sdhci0 =3D "/sdhci@3460000";
> > +		sdhci1 =3D "/sdhci@3400000";
>=20
> Any reason why you don't include all 3 sdhci controllers here?

It turns out this is completely useless. The intention had been to make
sdhci@3460000 appear as mmc0 and sdhci@3400000 as mmc1 in order to give
a more natural ordering (built-in eMMC first, then external SD/MMC) but
there's no code in the kernel that will enforce this.

This is also the reason why sdhci@3440000 is not included in this list
because it connects to a WIFI/Bluetooth module.

I'm slightly leaning towards leaving this in and possibly write a patch
to enforce ordering as given by the aliases. Of course nobody in their
right mind should be depending on the device names remaining the same
and use partition UUIDs or labels instead. But having enforcing the
order would still provide the least surprise.

>=20
> >  		serial0 =3D &uarta;
> >  		i2c0 =3D "/bpmp/i2c";
> >  		i2c1 =3D "/i2c@3160000";
> > @@ -72,6 +74,32 @@
> >  		status =3D "okay";
> >  	};
> > =20
> > +	/* SDMMC1 (SD/MMC) */
> > +	sdhci@3400000 {
> > +		status =3D "okay";
> > +
> > +		cd-gpios =3D <&gpio TEGRA_MAIN_GPIO(P, 6) GPIO_ACTIVE_LOW>;
>=20
> I see the CD as P-5 and not P-6 on the schematic.

Urgh... I probably mixed these up by looking at the Parker datasheet
(not sure if that's publicly available yet) and that says PP.05 actually
has the SDMMC3_CD special function. But since these are used as plain
GPIOs that's not where the function is defined. And indeed I see that
the schematics has PP.05 as the CD for SDMMC1.

Strangely I remember card-detect working with the above...

> > +		wp-gpios =3D <&gpio TEGRA_MAIN_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> > +
> > +		vqmmc-supply =3D <&vddio_sdmmc1>;
> > +		vmmc-supply =3D <&vdd_sd>;
>=20
> The card slot is on the carrier board and although the cd and wp pins
> are allocated on the cvm, I did not see a reference to the vmmc-supply
> on the cvm. So should the 'vmmc-supply' be in the carrier board file?

Yes, I think it's best to move vmmc-supply to the P2771 board file...

>=20
> > +	};
> > +
> > +	/* SDMMC3 (SDIO) */
> > +	sdhci@3440000 {
> > +		status =3D "okay";
> > +	};
> > +
> > +	/* SDMMC4 (eMMC) */
> > +	sdhci@3460000 {
> > +		status =3D "okay";
> > +		bus-width =3D <8>;
> > +		non-removable;
> > +
> > +		vqmmc-supply =3D <&vdd_1v8_ap>;
> > +		vmmc-supply =3D <&vdd_3v3_sys>;
> > +	};
> > +
> >  	hsp@3c00000 {
> >  		status =3D "okay";
> >  	};
> > @@ -333,5 +361,19 @@
> > =20
> >  			vin-supply =3D <&vdd_1v8>;
> >  		};
> > +
> > +		vdd_sd: regulator@2 {
> > +			compatible =3D "regulator-fixed";
> > +			reg =3D <2>;
> > +
> > +			regulator-name =3D "SD_CARD_SW_PWR";
> > +			regulator-min-microvolt =3D <3300000>;
> > +			regulator-max-microvolt =3D <3300000>;
> > +
> > +			gpio =3D <&gpio TEGRA_MAIN_GPIO(P, 5) GPIO_ACTIVE_HIGH>;
>=20
> Here I see the gpio as P-6 and not P-5.

Yes, that also matches the schematics that I have. Strange how this
would still all work given the mixup...

> > +			enable-active-high;
> > +
> > +			vin-supply =3D <&vdd_3v3_sys>;
> > +		};
> >  	};
> >  };
>=20
> I also see the above regulator on the carrier board and not on the cvm.

=2E.. and move this to the P2771 board file as well.

Thanks,
Thierry

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljABIwACgkQ3SOs138+
s6Fzpg//bnBvs5JkQnsrQoKSz7gcAqDyW8rW0nuNAGRaNWFI5vfo/PHl2wUjRU6p
eJoRk7OYYTNJCbDM0mBawykB06KJflzTnisUwmICVj+ByYg0h7gp3IVwCqIp8XnB
qXcLy1TkXmZhIWgFwiB8BuYdhDF+nVal4UNDZlNm4XPcZ+DXvVRVhmKq7ElCz8qz
Dw/26V8FoFpfAJElwRzNMb5G1Ei7TTOKCiwcjRvIf66vFmC8DoDVzUXK8OSB+4mB
3luqemi19MRDY504lfnW6cNbJolYsHUwGBUqv3f28lytj/206Qtb5sfBjCeR8lua
2uNoG/N7darxu+bANGwv20JOdNPurYmnOqs74yOJ46PXE2NKOBZcmgCLChgjzsoW
3K1T/s0sjmmvmzGKnoy/c+7oRV1A6CfJfc+DiLIarVLFR1K2pO1k+tXdSW8mByHM
vJBoa4zwDFK8V66PGbE9IEo2HmAuaHs3+qwRFtV+gaaYkqr28kGs+iA4l1YudIC8
fxLC7c1S3t8QnG2oVvpnAP3PaYuTRNuV+2J3E+1r9iYk6rTJCcmzfBCwfcGuowVI
nLQbagz4m9xGdhWxGEvmQBTiKXSVmLJ/5ek632OM7Oizs4Q8A6Fzm9qVB/DXmoHt
ZHI4ub1HOSqVq9uDcB8toxXxl0UUGD8/mpyVWpiBCC363Pq1JWc=
=4yxc
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--


--===============1492991921433940696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1492991921433940696==--
