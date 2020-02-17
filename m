From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 00/22] Move PMC clocks into Tegra PMC driver
Date: Mon, 17 Feb 2020 10:59:40 +0100
Message-ID: <20200217095940.GE1345979@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:05PM -0800, Sowjanya Komatineni wrote:
> This patch series moves Tegra PMC clocks from clock driver to pmc driver
> along with the device trees changes and audio driver which uses one of
> the pmc clock for audio mclk.
>=20
> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
> are currently registered by Tegra clock driver using clk_regiser_mux and
> clk_register_gate which performs direct Tegra PMC register access.
>=20
> When Tegra PMC is in secure mode, any access from non-secure world will
> not go through.
>=20
> This patch series adds these Tegra PMC clocks and blink controls to Tegra
> PMC driver with PMC as clock provider and removes them from Tegra clock
> driver.
>=20
> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru Tegra210
> and clock driver does inital parent configuration for it and enables them.
> But this clock should be taken care by audio driver as there is no need
> to have this clock pre enabled.
>=20
> So, this series also includes patch that updates ASoC utils to take
> care of parent configuration for mclk if device tree don't specify
> initial parent configuration using assigned-clock-parents and enable
> audio mclk during utils init.
>=20
> DTs are also updated to use clk_out_1 as audio mclk rather than extern1.
>=20
> This series also includes a patch for mclk fallback to extern1 when
> retrieving mclk fails to have this backward compatible of new DT with
> old kernels.
>=20
> [v8]:	Changes between v7 and v8 are
> 	- v7 minor feedback
>=20
> 	- Audio mclk is needed only for audio, but there is some unknown
> 	  dependency of audio mclk and suspend-resume on Tegra30 where when
> 	  mclk is disable, suspend-resume doesn't work.
> 	  So v8 undoes v7 change of mclk enable and disable during machine
> 	  startup and shutdown and keeps audio mclk enabled in ASoC driver
> 	  tegra_asoc_utils_init.
>=20
> 	- change in the patches order.
>=20
> 	  Note:
> 	  - Patches 1 thru 5 are to change CLK_M_DIV clocks to OSC_DIV clocks.
> 	    OSC_DIV clocks uses same ID as CLK_M_DIV clocks during the
> 	    transition to replace CLK_M_DIV with OSC_DIV.
> 	  - Patches 8 and 10 registers pmc clocks as pmc_clk_out_1/2/3, and
> 	    pmc_blink to avoid using same clock names as pmc clocks from
> 	    tegra_car provider to have them functionally work with all the
> 	    transition patches.
> 	  - Patch 11 adds audio mclk fallback to extern1 to have new DT work
> 	    with old kernels. This patch need to be back-ported.
> 	  - Patch 18 adds audio mclk parent configuration when DT doesn't
> 	    specify parent configs. This patch retrieves pmc_clk_out_1 as audio
> 	    mclk so added this patch after all DT updates to use pmc clocks
> 	    from tegra_pmc.
> 	  - Patch 19 does audio mclk enable during utils init to have it
> 	    enabled all the time.
> 	  - Patch 20 and 21 removes PMC clocks from clock driver and their IDs
> 	    at the end of PMC clocks transition to tegra_pmc.
> =09
>=20
> [v7]:	Changes between v6 and v7 are
> 	- v6 minor feedback
> 	- Added DT id for Tegra OSC to use in device tree for pmc clock
> 	  parent.
>=20
> [v6]:	Changes between v5 and v6 are
> 	- v5 feedback
> 	- Added ASoC machine startup and shutdown callbacks to control audio
> 	  mclk enable/disable and removed default mclk enable from clock driver.
> 	- Updated tegra_asoc_utils_set_rate to disable mclk only during PLLA
> 	  rate change and removed disabling PLLA as its already taken care by
> 	  pll clock driver.
> 	- Removed tegra_asoc_utils_set_rate call from utils_init as set_rate
> 	  is set during machine hw_params and during utils_init mclk is
> 	  already in disabled state and this causes warning during mclk disable
> 	  in utils_set_rate.
>=20
> [v5]:	Changes between v4 and v5 are
> 	- v4 feedback
> 	- updated dt-binding pmc YAML schema with more description on power
> 	  gate nodes and pad configuration state nodes.
> 	- update tegra_asoc_utils_set_rate to disable audio mclk only if
> 	  its in enable state.
>=20
> [v4]:	Changes between v3 and v4 are
> 	- v3 Feedback
> 	- Updated clocks clk_m_div2 and clk_m_div4 as osc_div2 and osc_div4.
> 	  Tegra don't have clk_m_div2, clk_m_div4 and they should actually
> 	  be osc_div2 and osc_div4 clocks from osc pads.
> 	- Fixed PMC clock parents to use osc, osc_div2, osc_div4.
> 	  This is not a functional bug fix but correction to use proper parent
> 	  name.
> 	- Register each PMC clock as single clock rather than separate
> 	  mux and gate clocks.
> 	- Update ASoC utils to use resource managed APIs rather than
> 	  using clk_get and clk_put.
> 	- Updated device tree and ASoC driver to use clk_out_1 instead of
> 	  clk_out_1_mux as PMC clocks are registered as single clock.
> 	- Update clock driver init_table to not enable audio related clocks
> 	  as ASoC utils will do audio clock enables.
>=20
> [v3]:	Changes between v2 and v3 are
> 	- Removes set parent of clk_out_1_mux to extern1 and enabling
> 	  extern1 from the clock driver.
> 	- Doesn't enable clk_out_1 and blink by default in pmc driver
> 	- Updates ASoC driver to take care of audio mclk parent
> 	  configuration incase if device tree don't specify assigned
> 	  clock parent properties and enables mclk using both clk_out_1
> 	  and extern1.
> 	- updates all device trees using extern1 as mclk in sound node
> 	  to use clk_out_1 from pmc.
> 	- patch for YAML format pmc dt-binding
> 	- Includes v2 feedback
>=20
> [v2]:	Changes between v1 and v2 are
> 	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
> 	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
> 	- feedback related to pmc clocks in Tegra PMC driver from v1
> 	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
> 	  by the clock driver using helper functions from Tegra PMC.
>=20
>  	  Note:
> 	  To use helper functions from PMC driver, PMC early init need to
> 	  happen prior to using helper functions and these helper functions are
> 	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
> 	  clock registration which happen in clock_init prior to Tegra PMC
> 	  probe.
> 	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
> 	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
> 	  tegra_mc_init.
> 	  This implementation of configuring PMC registers thru helper
> 	  functions in clock driver needs proper changes across PMC, Clock,
> 	  EMC and MC inits to have it work across all Tegra platforms.
>=20
> 	  Currently PLLM Override is not enabled in the bootloader so proper
> 	  patches for this fix will be taken care separately.
>=20
> [v1]:	v1 includes patches for below fixes.
> 	- adding clk_out_1, clk_out_2, clk_out_3, blink controls to Tegra PMC
> 	  driver and removing clk-tegra-pmc.
> 	- updated clock provider from tegra_car to pmc in the device tree
> 	  tegra210-smaug.dts that uses clk_out_2.
> 	- Added helper functions in PMC driver for WB0 PLLM overrides and PLLE
> 	  IDDQ programming to use by clock driver and updated clock driver to
> 	  use these helper functions and removed direct PMC access from clock
> 	  driver and all pmc base address references in clock driver.
>=20
> Sowjanya Komatineni (22):
>   dt-bindings: clock: tegra: Add IDs for OSC clocks
>   clk: tegra: Add support for OSC_DIV fixed clocks
>   clk: tegra: Add Tegra OSC to clock lookup
>   clk: tegra: Fix Tegra PMC clock out parents
>   clk: tegra: Remove CLK_M_DIV fixed clocks
>   dt-bindings: tegra: Convert Tegra PMC bindings to YAML
>   dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
>   soc: tegra: Add Tegra PMC clocks registration into PMC driver
>   dt-bindings: soc: tegra-pmc: Add id for Tegra PMC 32KHz blink clock
>   soc: tegra: Add support for 32KHz blink clock
>   ASoC: tegra: Add fallback implementation for audio mclk
>   ASoC: tegra: Use device managed resource APIs to get the clock
>   ARM: dts: tegra: Add clock-cells property to pmc
>   arm64: tegra: Add clock-cells property to Tegra PMC node
>   ARM: tegra: Update sound node clocks in device tree
>   arm64: tegra: smaug: Change clk_out_2 provider to pmc
>   ASoC: nau8825: change Tegra clk_out_2 provider to tegra_pmc
>   ASoC: tegra: Add audio mclk parent configuration
>   ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init
>   clk: tegra: Remove tegra_pmc_clk_init along with clk ids
>   dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
>   clk: tegra: Remove audio clocks configuration from clock driver
>=20
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ---------------=
--
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++=
++++++
>  .../devicetree/bindings/sound/nau8825.txt          |   2 +-
>  arch/arm/boot/dts/tegra114-dalmore.dts             |   8 +-
>  arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   8 +-
>  arch/arm/boot/dts/tegra124-apalis.dtsi             |   8 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi               |   8 +-
>  arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
>  arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
>  arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   8 +-
>  arch/arm/boot/dts/tegra30-apalis.dtsi              |   8 +-
>  arch/arm/boot/dts/tegra30-beaver.dts               |   8 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi              |   8 +-
>  arch/arm/boot/dts/tegra30-colibri.dtsi             |   8 +-
>  arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +-
>  drivers/clk/tegra/Makefile                         |   1 -
>  drivers/clk/tegra/clk-id.h                         |  12 +-
>  drivers/clk/tegra/clk-tegra-fixed.c                |  37 ++-
>  drivers/clk/tegra/clk-tegra-pmc.c                  | 122 -------
>  drivers/clk/tegra/clk-tegra114.c                   |  43 +--
>  drivers/clk/tegra/clk-tegra124.c                   |  48 ++-
>  drivers/clk/tegra/clk-tegra20.c                    |   9 +-
>  drivers/clk/tegra/clk-tegra210.c                   |  32 +-
>  drivers/clk/tegra/clk-tegra30.c                    |  33 +-
>  drivers/clk/tegra/clk.h                            |   1 -
>  drivers/soc/tegra/pmc.c                            | 354 +++++++++++++++=
++++++
>  include/dt-bindings/clock/tegra114-car.h           |  18 +-
>  include/dt-bindings/clock/tegra124-car-common.h    |  18 +-
>  include/dt-bindings/clock/tegra20-car.h            |   2 +-
>  include/dt-bindings/clock/tegra210-car.h           |  18 +-
>  include/dt-bindings/clock/tegra30-car.h            |  18 +-
>  include/dt-bindings/soc/tegra-pmc.h                |  16 +
>  sound/soc/tegra/tegra_alc5632.c                    |   7 +-
>  sound/soc/tegra/tegra_asoc_utils.c                 | 126 ++++----
>  sound/soc/tegra/tegra_asoc_utils.h                 |   1 -
>  sound/soc/tegra/tegra_max98090.c                   |  22 +-
>  sound/soc/tegra/tegra_rt5640.c                     |  22 +-
>  sound/soc/tegra/tegra_rt5677.c                     |   7 +-
>  sound/soc/tegra/tegra_sgtl5000.c                   |   7 +-
>  sound/soc/tegra/tegra_wm8753.c                     |  22 +-
>  sound/soc/tegra/tegra_wm8903.c                     |  22 +-
>  sound/soc/tegra/tegra_wm9712.c                     |   8 +-
>  sound/soc/tegra/trimslice.c                        |  18 +-
>  49 files changed, 1041 insertions(+), 775 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra20-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,te=
gra20-pmc.yaml
>  delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
>  create mode 100644 include/dt-bindings/soc/tegra-pmc.h

I've applied patches 1-10 and 13-16 to the Tegra tree, but I think it
should be fine for Mark to pick up the ASoC patches into his tree,
right?

As I mentioned in my reply to patch 20, I think we need to hold off on
applying patches 20-22 until all the rest have been merged, otherwise
we'll regress.

Thierry

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KZAwACgkQ3SOs138+
s6EtPA//WlKCJp6iSrpXtnq9QSZ7yU90y9yxGjpfDbkNCG0RJ53Fw3+IfpOSfjP4
X3h/u/L12SbStAWrlvwurmf9LOBTyFXz8e3+9atTuPaLTMRhFX9OE89Ljfrtrqfz
OiO0x7hny0089t+28157aB/BZbvcSEJRoC6HJiTlK5nvNXjOhPMAXGwhaWtvWxWC
4sgRJkq0emgZ5B+a/vNXBczzLB+LkMPel/YxqTPe64bfVEzIdp2zwxvvlloxGw/Z
RpUizvJJJSP/QU4aGEMwGrwkIUaOECC5XN4HqgCROI0ZGPJEiZI0WncmOcuHTatO
xbGchH1vlFWKmkiUdK6NkRCvtrVa3Rn8aop0psjYp3AnJIxbWZKu6H0uOlc5yt79
tgj6jhU1rs2ljrEL54wm80ftIVuuXMWE98CxIxikVKDgCBVQye1NvEO/3V+buv2k
tVBzbhfSppWHCEklI1ZhgeRDLTcQBs4B06FRuAhanrN18bcPdLLiJRMnWk1qH4yI
t4qQ49pVK9/s/N4bzMy8MjKDHUS4uz7+WOeqt8NQkAoHXi3YgFqZpR7UsasIaixp
5J0c2ZcxH8hBK+X0eFL/ixaixqtq1RhLzuFeQ/Uy2CBxr5MMTVW1vOLWd1WSlevu
lzs1M+RO55w8uAWxlDX7AJdiOOBwJO4p8fHeK8mcK4cw0WvOBuQ=
=1p3J
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
