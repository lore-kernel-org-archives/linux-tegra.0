From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 00/20] Tegra210 DFLL support
Date: Fri, 25 Jan 2019 14:46:17 +0100
Message-ID: <20190125134617.GE22565@ulmo>
References: <20190104030702.8684-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2998387882393220254=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104030702.8684-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============2998387882393220254==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2019 at 11:06:42AM +0800, Joseph Lo wrote:
> This series introduces support for the DFLL as a CPU clock source
> on Tegra210. As Jetson TX1 uses a PWM controlled regulator IC which
> is driven directly by the DFLLs PWM output, we also introduce support
> for PWM regulators next to I2C controlled regulators. The DFLL output
> frequency is directly controlled by the regulator voltage. The registers
> for controlling the PWM are part of the DFLL IP block, so there's no
> separate linux regulator object involved because the regulator IC only
> supplies the rail powering the CPUs. It doesn't have any other controls.
>=20
> The patch 1~4 are the patches of DT bindings update for DFLL clock and
> Tegra124 cpufreq, which add PWM and Tegra210 support for DFLL clock and
> remove deprecate properties for Tegra124 cpufreq bindings.
>=20
> The patch 5~10 are the patches for DFLL clock driver update for PWM-mode
> DFLL support.
>=20
> The patch 11~13 are the Tegra124 cpufreq driver update to make it
> work with Tegra210.
>=20
> The patch 14~19 are the devicetree files update for Tegra210 SoC and
> platforms. Two platforms are updated here for different DFLL mode usage.
> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
> are verified with this series.
>=20
> The patch 20 is the patch for enabling the CPU regulator for Smaug
> board.
>=20
> * Update in V4:
>  - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/ in patch 1 for
>  DFLL DT bindings update.
>  - remove parenthesis in Kconfig of DFLL driver
>  - add more ack and RB tags
>=20
> * Update in V3:
>  - Squash patch 9 in previous series into patch 7 (ref. [0])
>  - minor fixes in patch 6 for geting alignment data
>  - more variable type fixes in patch 7
>  - fix the error handling in patch 8
>  - collect more ack tags
>=20
> * Update in V2:
>  - Add two patches that suggested from comments in V1. See patch 9 and
>  14.
>  - Update DT binding for DFLL-PWM mode in patch 1.
>  - Update the code for how to get regulator data from DT or regulator
>  API in patch 6.
>  - Update to use lut_uv table for LUT lookup in patch 7. That makes the
>  generic lut table to work with both I2C and PWM mode.
>  - not allow Tegra124 cpufreq driver to be built as a module and remove
>  the removal function in patch 12.
>=20
> [0]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D81595
>=20
> Joseph Lo (17):
>   dt-bindings: clock: tegra124-dfll: add Tegra210 support
>   dt-bindings: cpufreq: tegra124: remove vdd-cpu-supply from required
>     properties
>   dt-bindings: cpufreq: tegra124: remove cpu_lp clock from required
>     properties
>   clk: tegra: dfll: CVB calculation alignment with the regulator
>   clk: tegra: dfll: support PWM regulator control
>   clk: tegra: dfll: round down voltages based on alignment
>   clk: tegra: dfll: add CVB tables for Tegra210
>   cpufreq: tegra124: do not handle the CPU rail
>   cpufreq: tegra124: extend to support Tegra210
>   cpufreq: dt-platdev: add Tegra210 to blacklist
>   arm64: dts: tegra210: add DFLL clock
>   arm64: dts: tegra210: add CPU clocks
>   arm64: dts: tegra210-p2597: add pinmux for PWM-based DFLL support
>   arm64: dts: tegra210-p2371-2180: enable DFLL clock
>   arm64: dts: tegra210-smaug: add CPU power rail regulator
>   arm64: dts: tegra210-smaug: enable DFLL clock
>   arm64: defconfig: Enable MAX8973 regulator
>=20
> Peter De Schrijver (3):
>   dt-bindings: clock: tegra124-dfll: Update DFLL binding for PWM
>     regulator
>   clk: tegra: dfll: registration for multiple SoCs
>   clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210

Joseph,

can you detail the dependencies between the various patches. From a
brief look the CPU frequency driver changes are completely separate
bits and it should be possible to apply them to the cpufreq tree.

The clock changes also seem independent of the rest.

Are there any dependencies at all that we need to be mindful about?
Or can individual maintainers just pick up the subseries directly?

Thierry

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLEyYACgkQ3SOs138+
s6HBIg/8DTm4DsCp+vntQYd8NXlB0cqjVentmwKMUHCGFHaUW8FllyOSZdtaoV9E
hxpAjUv5J28PRGGuUbL31eeXfvdyhTDh2+bkH7ND7IV43sLnGM5LPwTHZks+Sp8p
5mh/OjNDFZ2FOykcILtKJJiEHU6Fi9pDrw4xIMU3juZJgP1+csDoQm6Ae9Fy4Yb4
2fDwZ6QtSadf1ddvvdXcBcNpIdnTD2tfSFLg8m7yiDsAY3oc9g4NH+3Jbp0SsRjo
MBIGLNijy+hcgJL2gjmIMFubVGfT5CkJocs63bUv/dGjM9mbpBt28tCQhoRq/C6d
YPzF2Awz7FgJdw83ifumuPusTaXRF5z/p8FJKitDqUpxvZ049l8z9U3SMsptoHq3
4HF0F59EPEqX3GNUZZGke4I9Dmtc4mZOL8rSIJd2QGFVaTaPBS/Bgz4wQQ9vsDEB
AlvwbIK66oiklX6JjM3DtgVsZRLLEClQAImkI9RjXG/bS9RtJWP8Ywl4thrbYPbq
JQ9e3pe/KsGf0fsXCFxAeQ7cmBO2ktHn957iebw/pcF9KaJ3QFsEAEful6yLN8Om
TImsJKOyFPVtG0bNKwVuOCazIRN0KQem8RGbS5qB70kWfwsB2rb/gb4BTEi+VHsK
oAlS34t1G/mprmR0cXYH2iLuF63//M8yNwygQYXlUGXGqcmLFsY=
=6hYF
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--


--===============2998387882393220254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2998387882393220254==--
