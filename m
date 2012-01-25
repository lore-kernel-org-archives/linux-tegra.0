From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 25 Jan 2012 12:14:13 -0800
Message-ID: <CAPnjgZ0u-s4B19EOcNTWGFu4duHqOs+cnccFczpfPJn9Aiq0iw@mail.gmail.com>
References: <1327521469-28863-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327521469-28863-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Jan 25, 2012 at 11:57 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Document a binding for the Tegra20 CAR (Clock And Reset) Controller,
> add it to tegra20.dtsi, and configure it for the board in tegra-
> seaboard.dts.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Remove clock-names, clock-output-names properties; Tegra will solel=
y
> =A0use integer IDs for clocks in DT.
> * Fixed typo in compatible flag
> * Resolve FIXME re: multiple clocks with the same "reset ID"; give ea=
ch
> =A0unique clock an ID, and ignore the reset bits, since this is purel=
y a
> =A0clock binding. Code (e.g. U-Boot) that wants to use this to determ=
ine
> =A0CAR reset bit numbers would need a table to convert from the clock=
 IDs
> =A0in this binding to the related reset bit number, if any. In genera=
l, I
> =A0think that's true, and the U-Boot code that handles "peripheral ID=
s"
> =A0should be reworked to handle "clocks", the peripheral clocks being=
 a
> =A0subset of all clocks.

The clock enable and reset enable bits use the same numbering. I think
you have invented a third which is an arbitrary number which doesn't
correspond to anything in hardware. That makes sense for pin mux
function perhaps, since the indirection provides a useful concept of
function number, but here I can't see the benefit.

> * Define clock IDs for all the non-peripheral clocks too; inputs, PLL=
s,
> =A0etc.
> * Separate tegra-seaboard.dts usage example into a separate patch.
>
> This patch semantically relies on Grant Likely's common clock binding=
 patch
> series. Once that's finalized, this patch could be checked into the k=
ernel
> provided there are no relevant changes to Grant's patches. I believe =
that
> Simon Glass wants to start using this within U-Boot ASAP though.

As I may have said I am really not keen on the idea of having a table
just to use it in U-Boot.

> ---
> =A0.../bindings/clock/nvidia,tegra20-car.txt =A0 =A0 =A0 =A0 =A0| =A0=
164 ++++++++++++++++++++
> =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A06 +
> =A02 files changed, 170 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/clock/nvidia,=
tegra20-car.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-c=
ar.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> new file mode 100644
> index 0000000..acce2d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> @@ -0,0 +1,164 @@
> +NVIDIA Tegra20 Clock And Reset Controller
> +
> +This binding uses the common clock binding:
> +Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +The CAR (Clock And Reset) Controller on Tegra is the HW module respo=
nsible
> +for muxing and gating Tegra's clocks, and setting their rates.
> +
> +Required properties :
> +- compatible : Should be "nvidia,<chip>-car"
> +- reg : Should contain CAR registers location and length
> +- clocks : Should contain phandle and clock specifiers for two clock=
s:
> + =A0the 32 KHz "32k_in", and the board-specific oscillator "osc".
> +- #clock-cells : Should be 1.
> + =A0In clock consumers, this cell represents the clock ID exposed by=
 the CAR.
> +
> + =A0The first 96 clocks are numbered to match the bits in the CAR's =
CLK_OUT_ENB
> + =A0registers. Later, subsequent IDs will be assigned to all other c=
locks the
> + =A0CAR controls; mainly the PLLs.

Are you sure? The ordering doesn't seem to fit with U-Boot's enum
periph_id in arch/arm/include/asm/arch-tegra2/clock.h. That file
follows along with the hardware.

> +
> + =A0 =A00 =A0osc
> + =A0 =A01 =A0clk_32k =A0 =A0 =A0 =A0 a/k/a clk_s
> + =A0 =A02 =A0clk_m
> + =A0 =A03 =A0sclk
> + =A0 =A04 =A0cclk
> + =A0 =A05 =A0hclk
> + =A0 =A06 =A0pclk
> + =A0 =A07 =A0blink
> + =A0 =A08 =A0pll_a
> + =A0 =A09 =A0pll_a_out0
> + =A0 =A010 pll_c
> + =A0 =A011 pll_c_out1
> + =A0 =A012 pll_d
> + =A0 =A013 pll_e
> + =A0 =A014 pll_m
> + =A0 =A015 pll_m_out1
> + =A0 =A016 pll_p
> + =A0 =A017 pll_p_out1
> + =A0 =A018 pll_p_out2
> + =A0 =A019 pll_p_out3
> + =A0 =A020 pll_p_out4
> + =A0 =A021 pll_s
> + =A0 =A022 pll_u
> + =A0 =A023 pll_x
> + =A0 =A024 audio =A0 =A0 =A0 =A0 =A0 a/k/a audio_sync_clk
> + =A0 =A025 audio_2x =A0 =A0 =A0 =A0a/k/a audio_2x_sync_clk
> + =A0 =A026 cpu
> + =A0 =A027 cop =A0 =A0 =A0 =A0 =A0 =A0 a/k/a avp
> + =A0 =A028 ac97
> + =A0 =A029 rtc
> + =A0 =A030 tmr
> + =A0 =A031 uart1
> + =A0 =A032 uart2
> + =A0 =A033 gpio
> + =A0 =A034 sdmmc2
> + =A0 =A035 spdif_out
> + =A0 =A036 spdif_in
> + =A0 =A037 i2s1
> + =A0 =A038 i2c1
> + =A0 =A039 ndflash
> + =A0 =A040 sdmmc1
> + =A0 =A041 sdmmc4
> + =A0 =A042 twc
> + =A0 =A043 pwm
> + =A0 =A044 i2s2
> + =A0 =A045 epp
> + =A0 =A046 vi
> + =A0 =A047 vi_sensor
> + =A0 =A048 2d
> + =A0 =A049 usbd
> + =A0 =A050 isp
> + =A0 =A051 3d
> + =A0 =A052 ide
> + =A0 =A053 disp2
> + =A0 =A054 disp1
> + =A0 =A055 host1x
> + =A0 =A056 vcp
> + =A0 =A057 cache2
> + =A0 =A058 mem
> + =A0 =A059 ahbdma
> + =A0 =A060 apbdma
> + =A0 =A061 kbc
> + =A0 =A062 stat_mon
> + =A0 =A063 pmc
> + =A0 =A064 fuse
> + =A0 =A065 kfuse
> + =A0 =A066 sbc1
> + =A0 =A067 snor
> + =A0 =A068 spi
> + =A0 =A069 sbc2
> + =A0 =A070 xio
> + =A0 =A071 sbc3
> + =A0 =A072 dvc
> + =A0 =A073 dsi
> + =A0 =A074 cve
> + =A0 =A075 tvo
> + =A0 =A076 mipi
> + =A0 =A077 hdmi
> + =A0 =A078 csi
> + =A0 =A079 tvdac
> + =A0 =A080 i2c2
> + =A0 =A081 uart3
> + =A0 =A082 emc
> + =A0 =A083 usb2
> + =A0 =A084 usb3
> + =A0 =A085 mpe
> + =A0 =A086 vde
> + =A0 =A087 bsea
> + =A0 =A088 bsev
> + =A0 =A089 speedo
> + =A0 =A090 uart4
> + =A0 =A091 uart5
> + =A0 =A092 i2c3
> + =A0 =A093 sbc4
> + =A0 =A094 sdmmc3
> + =A0 =A095 pcie
> + =A0 =A096 owr
> + =A0 =A097 afi
> + =A0 =A098 csite
> + =A0 =A099 avpucq
> + =A0 =A0100 =A0 =A0 =A0 =A0la
> + =A0 =A0101 =A0 =A0 =A0 =A0irama
> + =A0 =A0102 =A0 =A0 =A0 =A0iramb
> + =A0 =A0103 =A0 =A0 =A0 =A0iramc
> + =A0 =A0104 =A0 =A0 =A0 =A0iramd
> + =A0 =A0105 =A0 =A0 =A0 =A0cram2
> + =A0 =A0106 =A0 =A0 =A0 =A0clk_d
> + =A0 =A0107 =A0 =A0 =A0 =A0sus
> + =A0 =A0108 =A0 =A0 =A0 =A0cdev1
> + =A0 =A0109 =A0 =A0 =A0 =A0cdev2
> +
> +Example:
> +
> +clocks {
> + =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 #size-cells =3D <0>;
> +
> + =A0 =A0 =A0 clk_32k: clock@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <32768>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 osc: clock@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <12000000>;
> + =A0 =A0 =A0 };
> +};
> +
> +tegra_car: clock@60006000 {
> + =A0 =A0 =A0 compatible =3D "nvidia,tegra20-car";
> + =A0 =A0 =A0 reg =3D <0x60006000 1000>;
> + =A0 =A0 =A0 clocks =3D <&clk_32k> <&osc>;
> + =A0 =A0 =A0 clock-names =3D "32k_in", "osc";
> + =A0 =A0 =A0 #clock-cells =3D <1>;
> +};
> +
> +usb@c5004000 {
> + =A0 =A0 =A0 ...
> + =A0 =A0 =A0 clocks =3D <&tegra_car 58>; /* usb2 */
> +};
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> index 3da7afd..8208660 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -4,6 +4,12 @@
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20";
> =A0 =A0 =A0 =A0interrupt-parent =3D <&intc>;
>
> + =A0 =A0 =A0 tegra_car: clock@60006000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra20-car";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x60006000 1000>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <1>;
> + =A0 =A0 =A0 };
> +
> =A0 =A0 =A0 =A0intc: interrupt-controller@50041000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "arm,cortex-a9-gic";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-controller;
> --
> 1.7.0.4
>

Regards,
Simon
