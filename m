From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 09/11] arm64: tegra: Add GPIO keys on P2771
Date: Wed, 8 Mar 2017 14:47:28 +0100
Message-ID: <20170308134728.GG29118@ulmo.ba.sec>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
 <20170223173053.19701-9-thierry.reding@gmail.com>
 <6e9043ac-0e3c-6b17-fd76-5792820d55b1@nvidia.com>
 <ae214cf3-df2d-1036-b702-c8436471bfe8@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5550971447305455146=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ae214cf3-df2d-1036-b702-c8436471bfe8@nvidia.com>
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


--===============5550971447305455146==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tvOENZuN7d6HfOWU"
Content-Disposition: inline


--tvOENZuN7d6HfOWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 12:15:53PM +0000, Jon Hunter wrote:
>=20
> On 08/03/17 12:03, Jon Hunter wrote:
> >=20
> >=20
> > On 23/02/17 17:30, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The P2771 has three keys (power, volume up and volume down) that are
> >> connected to pins on the AON GPIO controller.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 34 +++++++++++++=
+++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch=
/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> >> index 0d3c0996d832..1c195d71806d 100644
> >> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> >> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> >> @@ -1,8 +1,42 @@
> >>  /dts-v1/;
> >> =20
> >> +#include <dt-bindings/input/linux-event-codes.h>
> >> +
> >>  #include "tegra186-p3310.dtsi"
> >> =20
> >>  / {
> >>  	model =3D "NVIDIA Tegra186 P2771-0000 Development Board";
> >>  	compatible =3D "nvidia,p2771-0000", "nvidia,tegra186";
> >> +
> >> +	gpio-keys {
> >> +		compatible =3D "gpio-keys";
> >> +
> >> +		power {
> >> +			label =3D "Power";
> >> +			gpios =3D <&gpio_aon TEGRA_AON_GPIO(FF, 0)
> >> +					   GPIO_ACTIVE_LOW>;
> >> +			linux,input-type =3D <EV_KEY>;
> >> +			linux,code =3D <KEY_POWER>;
> >> +			debounce-interval =3D <10>;
> >> +			wakeup-source;
> >> +		};
> >> +
> >> +		volume-up {
> >> +			label =3D "Volume Up";
> >> +			gpios =3D <&gpio_aon TEGRA_AON_GPIO(FF, 1)
> >> +					   GPIO_ACTIVE_LOW>;
> >> +			linux,input-type =3D <EV_KEY>;
> >> +			linux,code =3D <KEY_VOLUMEUP>;
> >> +			debounce-interval =3D <10>;
> >> +		};
> >=20
> > My schematic shows this pin as 'force-recovery'.
> >=20
> >> +
> >> +		volume-down {
> >> +			label =3D "Volume Down";
> >> +			gpios =3D <&gpio_aon TEGRA_AON_GPIO(FF, 2)
> >> +					   GPIO_ACTIVE_LOW>;
> >> +			linux,input-type =3D <EV_KEY>;
> >> +			linux,code =3D <KEY_VOLUMEDOWN>;
> >> +			debounce-interval =3D <10>;
> >> +		};
> >> +	};
> >>  };
> >=20
> > And this one as 'sleep_l'.
>=20
> Actually, I do see this as "VOL Down". So ignore that and I assume we
> re-use recovery so ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Yes, the board marks FF.02 as "VOL D" and I figured that recovery isn't
useful during normal system operation and "VOL U" would be the natural
choice. Often these keys end up being used for menu navigation in some
Android bootloader. That's not relevant to Linux, but it gives us some
consistency across the board.

Thierry

--tvOENZuN7d6HfOWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljAC2sACgkQ3SOs138+
s6GRvg//dwwYoaKhu/ScQ3tFt9R7d8u7XOnEMkq+7wrortoo6St71pic8ydiXuTe
A6MS+KGaj2W9d9fWf/RYZDVnyKbknLjeDjRRd2U4fmDDpr4hVFV1PaoGi52IJza9
sdQZ2l8dg2rxiK8Tqcy15/8JHJeD4/P7mdnA/1M+vTcbTQOL2AecIdJTbL5Ns498
4IZXEqwi3UXUi7IadpjefNtH82tlkVaqdc2Dpk2+84Jto2Mpg2c5GjQYH1m5JKuf
5R2+duaCQyXgHSPiCEQT6VhBytvq4f7gtLZ3RDIid2Efa4IGpAaB/xgpALwXEx6p
1TvnKu9SGpYw8Fvwd+ewEibsEg5fbKXicpdvujDGh6KyfsWn81OBHJHZ7vg4MDt7
PnWeyrJifKMKOcJmhTKvFXRwMK1A4q3sNqzrvQFuML5wb6+eQQ1ThfbISNLizjmm
iGOut3rRarAQTdof++MOZV+0vBBzqdQYZmHULZs1lTliJRvZDhSycBm0bZvKhKA2
ol/RWz1nHPALc3lyHISGsvm2tIHaSeeWENdwEY3kg1FFKjXSMXIrGpd1ZQP3nwrv
aJDfwHOVDgC8JySxd9/gj/Hd6odSE2x7qLIxEVZvFG2fghXDXv/cAECcNMBh1GPv
zw+nGB1m4jHmT1AP8I2ARTUN+NyJn/2rBtI1PhzghU8jOc0+YZM=
=56BZ
-----END PGP SIGNATURE-----

--tvOENZuN7d6HfOWU--


--===============5550971447305455146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5550971447305455146==--
