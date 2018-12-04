From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/19] Tegra210 DFLL support
Date: Tue, 4 Dec 2018 16:10:59 +0100
Message-ID: <20181204151059.GA23827@ulmo>
References: <20181204092548.3038-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0432848204952352486=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204092548.3038-1-josephl@nvidia.com>
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


--===============0432848204952352486==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 05:25:29PM +0800, Joseph Lo wrote:
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
> The patch 11 and 12 are the Tegra124 cpufreq driver update to make it
> work with Tegra210.
>=20
> The patch 13~18 are the devicetree files update for Tegra210 SoC and
> platforms. Two platforms are updated here for different DFLL mode usage.
> The Tegra210-p2371-2180 (a.k.a. Jetson Tx1) uses DFLL-PWM and the
> Tegra210-smaug (a.k.a. Pixel C) uses DFLL-I2C. So two different modes
> are verified with this series.
>=20
> The patch 19 is the patch for enabling the CPU regulator for Smaug
> board.
>=20
> Joseph Lo (16):
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
>=20
>  .../bindings/clock/nvidia,tegra124-dfll.txt   |  77 ++-
>  .../cpufreq/nvidia,tegra124-cpufreq.txt       |   6 +-
>  .../boot/dts/nvidia/tegra210-p2371-2180.dts   |  20 +
>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  14 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  31 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  25 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/clk/tegra/Kconfig                     |   5 +
>  drivers/clk/tegra/Makefile                    |   2 +-
>  drivers/clk/tegra/clk-dfll.c                  | 455 ++++++++++++---
>  drivers/clk/tegra/clk-dfll.h                  |   6 +-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 536 +++++++++++++++++-
>  drivers/clk/tegra/cvb.c                       |  12 +-
>  drivers/clk/tegra/cvb.h                       |   7 +-
>  drivers/cpufreq/Kconfig.arm                   |   2 +-
>  drivers/cpufreq/tegra124-cpufreq.c            |  29 +-
>  16 files changed, 1095 insertions(+), 133 deletions(-)

Hi Joseph,

can you highlight the build and runtime dependencies between the various
patches? For example, can I pick up all the arch/arm64 patches into the
Tegra tree without breaking anything?

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwGmQEACgkQ3SOs138+
s6HGIA//QprwVZ1gLLeej9HHBlkKBlBSrNsrvmcVHsnuRvHPFEcKNgCQ60ubl7cL
KQAYcTjV8n1wZXpMo6oCRdEuk9/I9ZnOixaLp2b0XoQYetFwC3h0oHTKTyAR7Qol
KVOyeHFpleCEHhuFcePJqdg0a2SSVD+FHFc2DWut2IPS7UhLnUYB7BnimwCOmpEO
lQ+0+wj+w4P922YcZgc66VUgyi+pbeokAwu1h890sUA+VdeimKXQZ4Cd8zz/kJ79
3QO8z5Lcp4iK0Pswjv/hoW/z+VA2ZpXK4BRKwq00e/xhVVb4LBgJZAxpkm1uki7d
HcacuVPAEWygMmwRPbIviHeuNreMVbgt9pC8qOrzjcYu6vbW10drxSfUtiXFclYh
kw8yjuUlw1kdMWCfHUvcF3YKjQZYvrvTZ2b5GpG/7/N+hEGWj0mWVct5kDCO/tZP
jNGGsqBmdepHH6fVrhFE9rdIsrN/nhCFsgWAVJKh0wj/CT/GbemjrHgX/4lC5T+k
tOsiv/xtAxy2F9aVpNar6EBlo0ZAhRdFa7vcQFjfrloPSTkxg/6Zri3cykuIx7N9
R8Zy/oxOsAWObP+geZmMH/FP4/MCUH/lM7buoOj4OtKY1KYHavjcU9OBdmG/a+m6
6Cup6sxChs84o43SpiFf+93A6KHFv3Fq28lAnJ9rWAxIvJRs8M4=
=PgS1
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--


--===============0432848204952352486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0432848204952352486==--
