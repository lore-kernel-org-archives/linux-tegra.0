From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Sun, 22 Jan 2012 10:03:29 -0800
Message-ID: <CAPnjgZ2t9FnEubWmLyNMGGhr=jEmfb1qzK=SAzRopjbCbHKdrA@mail.gmail.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326932212-30346-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Jan 18, 2012 at 4:16 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Document a binding for the Tegra20 CAR (Clock And Reset) Controller,
> add it to tegra20.dtsi, and configure it for the board in tegra-
> seaboard.dts.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> All, Simon Glass is attempting to upstream Tegra USB support in U-Boot.
> The driver is only instantiated from device tree, and needs to configure
> clocks for the USB module. Hence, he proposed a clock binding for Tegra.
> I've read through Grant's proposed common clock bindings and reworked
> Simon's proposal a little, ending up with the patch below for the kernel.
> I'd appreciate any comments you have.
>
> Grant, can you confirm that it's reasonable to start making use of your
> proposed common clock bindings in U-Boot, even though they're only an RFC?
>
> Grant, there are a couple of FIXMEs in the binding documentation below.
> Can you give any insight on these?
>
> A comment on the shared enable issue:
>
> When enabling/disabling clocks, Tegra requires you to reset the HW module
> that the clock is routed to. Both reset and clock enable registers are
> part of the CAR. U-Boot currently has an API to do the reset based on a
> "peripheral ID", which simply means a bit number in a set of 3 "reset"
> registers. The bits in those registers share the same numbering as the
> "clock enable" registers. Hence, to make life easy for U-Boot, I've
> defined the clock IDs in this binding to be equal to these bit numbers.
> However, this breaks down where there isn't a 1:1 mapping between reset
> and clock enable bits, and clocks. For example, there's a single reset
> and clock enable bit for the SPDIF controller, yet this applies to two
> clocks; spdif_in and spdif_out. Hence, this simplification for U-Boot
> breaks down. I think the correct solution is to fix U-Boot not to
> require this simplification, renumber the clocks in the CAR binding in
> a completely arbitrary fashion, and require U-Boot to contain a mapping
> table between CAR's DT clock IDs and any other information related to
> those clocks. Do you see any alternative? We really need the two SPDIF
> clocks to be different clock IDs in the binding, since each has a
> completely independant mux for the clock source/parent, and the two
> clocks obviously can't share the same clock ID (well, hmm, perhaps they
> could if we used 2 cells for the specifier, 1 for the bit number, and
> one more to differentiate clocks that use the same bit...). I'm still
> inclined to simply push back on U-Boot to do it right.

Are SPDIF and VI the only examples of this? If so, perhaps just having
a special extra clock ID for those two and mapping in a special way
would be more efficient. So two IDs would map to one clock/reset bit
but different clocks.

Also I note that one is an input and one is an output clock. So we
could name them this way, and use the separate ID for the input clocks
perhaps.

If you do add an arbitrary mapping, what would it be? It might as well
follow along with the registers so far as it can, since the device
tree should describe the hardware. Then the mapping becomes a few
lines of code in the driver instead of YAT (yet another table).

Poor U-Boot doesn't even use the SPDIF or vi controllers.

>
> =A0.../bindings/clock/nvidia,tegra20-car.txt =A0 =A0 =A0 =A0 =A0| =A0156 =
++++++++++++++++++++
> =A0arch/arm/boot/dts/tegra-seaboard.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 18 +++
> =A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A07 +
> =A03 files changed, 181 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegr=
a20-car.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.t=
xt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> new file mode 100644
> index 0000000..71cfdd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> @@ -0,0 +1,156 @@
> +* NVIDIA Tegra20 Clock And Reset Controller
> +
> +This binding uses the common clock binding:
> +Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +The CAR (Clock And Reset) Controller on Tegra is the HW module responsib=
le
> +for muxing and gating Tegra's clocks, and setting their rates.
> +
> +Required properties :
> +- compatible : Should be "nvidia,<chip>-car"
> +- reg : Should contain CAR registers location and length
> +- clocks : Should contain phandle and clock specifiers for two clocks:
> + =A0the 32 KHz "32k_in", and the board-specific oscillator "osc".
> +- clock-names : Should contain a list of strings, with values "32k_in",
> + =A0and "osc".
> +- #clock-cells : Should be 1.
> + =A0In clock consumers, this cell represents the clock ID exposed by the=
 CAR.
> + =A0For a list of valid values, see the clock-output-names property.
> +
> +Optional properties :
> +- clock-output-names : Should contain a list of strings defining the clo=
cks
> + =A0that the CAR provides. The list of names and clock IDs is below. The=
 IDs
> + =A0may be used in clock specifiers. The names should be listed in this =
clock-
> + =A0output-names property, sorted in ID order, if this property is prese=
nt.
> +
> + =A0The first 96 clocks are numbered to match the bits in the CAR's CLK_=
OUT_ENB
> + =A0registers. Later, subsequent IDs will be assigned to all other clock=
s the
> + =A0CAR controls.

I hope that at some point these would have symbolic names so that we
don't need to use open-coded integers in the device tree cells.

> +
> + =A0 =A00 =A0 "cpu"
> + =A0 =A01 =A0 "unassigned"
> + =A0 =A02 =A0 "unassigned" =A0 =A0FIXME: Is it OK to have 2 identical (u=
nused) names?

Or in fact just empty so save space?

> + =A0 =A03 =A0 "ac97"
> + =A0 =A04 =A0 "rtc"
> + =A0 =A05 =A0 "tmr"
> + =A0 =A06 =A0 "uart1"
> + =A0 =A07 =A0 "uart2"
> + =A0 =A08 =A0 "gpio"
> + =A0 =A09 =A0 "sdmmc2"
> + =A0 =A010 =A0"spdif" =A0 =A0 =A0 =A0 FIXME: One enable bit controls two=
 clocks!!!
> + =A0 =A011 =A0"i2s1"
> + =A0 =A012 =A0"i2c1"
> + =A0 =A013 =A0"ndflash"
> + =A0 =A014 =A0"sdmmc1"
> + =A0 =A015 =A0"sdmmc4"
> + =A0 =A016 =A0"twc"
> + =A0 =A017 =A0"pwm"
> + =A0 =A018 =A0"i2s2"
> + =A0 =A019 =A0"epp"
> + =A0 =A020 =A0"vi" =A0 =A0 =A0 =A0 =A0 =A0FIXME: One enable bit controls=
 two clocks!!!
> + =A0 =A021 =A0"2d"
> + =A0 =A022 =A0"usbd"
> + =A0 =A023 =A0"isp"
> + =A0 =A024 =A0"3d"
> + =A0 =A025 =A0"ide"
> + =A0 =A026 =A0"disp2"
> + =A0 =A027 =A0"disp1"
> + =A0 =A028 =A0"host1x"
> + =A0 =A029 =A0"vcp"
> + =A0 =A030 =A0"unassigned"
> + =A0 =A031 =A0"cache2"
> +
> + =A0 =A032 =A0"mem"
> + =A0 =A033 =A0"ahbdma"
> + =A0 =A034 =A0"apbdma"
> + =A0 =A035 =A0"unassigned"
> + =A0 =A036 =A0"kbc"
> + =A0 =A037 =A0"stat_mon"
> + =A0 =A038 =A0"pmc"
> + =A0 =A039 =A0"fuse"
> + =A0 =A040 =A0"kfuse"
> + =A0 =A041 =A0"sbc1"
> + =A0 =A042 =A0"snor"
> + =A0 =A043 =A0"spi"
> + =A0 =A044 =A0"sbc2"
> + =A0 =A045 =A0"xio"
> + =A0 =A046 =A0"sbc3"
> + =A0 =A047 =A0"dvc_i2c"
> + =A0 =A048 =A0"dsi"
> + =A0 =A049 =A0"tvo"
> + =A0 =A050 =A0"mipi"
> + =A0 =A051 =A0"hdmi"
> + =A0 =A052 =A0"csi"
> + =A0 =A053 =A0"tvdac"
> + =A0 =A054 =A0"i2c2"
> + =A0 =A055 =A0"uart3"
> + =A0 =A056 =A0"unassigned"
> + =A0 =A057 =A0"emc"
> + =A0 =A058 =A0"usb2"
> + =A0 =A059 =A0"usb3"
> + =A0 =A060 =A0"mpe"
> + =A0 =A061 =A0"vde"
> + =A0 =A062 =A0"bsea"
> + =A0 =A063 =A0"bsev"
> +
> + =A0 =A064 =A0"speedo"
> + =A0 =A065 =A0"uart4"
> + =A0 =A066 =A0"uart5"
> + =A0 =A067 =A0"i2c3"
> + =A0 =A068 =A0"sbc4"
> + =A0 =A069 =A0"sdmmc3"
> + =A0 =A070 =A0"pcie"
> + =A0 =A071 =A0"owr"
> + =A0 =A072 =A0"afi"
> + =A0 =A073 =A0"csite"
> + =A0 =A074 =A0"unassigned"
> + =A0 =A075 =A0"avpucq"
> + =A0 =A076 =A0"unassigned"
> + =A0 =A077 =A0"unassigned"
> + =A0 =A078 =A0"unassigned"
> + =A0 =A079 =A0"unassigned"
> + =A0 =A080 =A0"unassigned"
> + =A0 =A081 =A0"unassigned"
> + =A0 =A082 =A0"unassigned"
> + =A0 =A083 =A0"unassigned"
> + =A0 =A084 =A0"irama"
> + =A0 =A085 =A0"iramb"
> + =A0 =A086 =A0"iramc"
> + =A0 =A087 =A0"iramd"
> + =A0 =A088 =A0"cram2"
> + =A0 =A089 =A0"audio_2x"
> + =A0 =A090 =A0"clk_d"
> + =A0 =A091 =A0"unassigned"
> + =A0 =A092 =A0"sus"
> + =A0 =A093 =A0"cdev1"
> + =A0 =A094 =A0"cdev2"
> + =A0 =A095 =A0"unassigned"
> +
> +Example:
> +
> +clocks {
> + =A0 =A0 =A0 clk_32k: oscillator@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <32768>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 osc: oscillator@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <12000000>;
> + =A0 =A0 =A0 };
> +};
> +
> +tegar_car: clock@60006000 {
> + =A0 =A0 =A0 compatible =3D "tegra,periphclk";
> + =A0 =A0 =A0 reg =3D <0x60006000 1000>;

0x1000 ?

> + =A0 =A0 =A0 clocks =3D <&clk_32k> <&osc>;
> + =A0 =A0 =A0 clock-names =3D "32k_in", "osc";
> + =A0 =A0 =A0 #clock-cells =3D <1>;
> +};
> +
> +usb@c5004000 {
> + =A0 =A0 =A0 ...
> + =A0 =A0 =A0 clocks =3D <&tegra_car 58>; /* usb2 */
> +};
> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/teg=
ra-seaboard.dts
> index b55a02e..f9347fe 100644
> --- a/arch/arm/boot/dts/tegra-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
> @@ -11,6 +11,24 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0x00000000 0x40000000 >;
> =A0 =A0 =A0 =A0};
>
> + =A0 =A0 =A0 clocks {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_32k: oscillator@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <32768>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 osc: oscillator@1 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fixed-clock=
";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D <0>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D <120000=
00>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };

Is there a reason why these two nodes are in the tegra20.dtsi include
file? Is it because some boards don't have one of these clocks? Or
because the frequency is not know? If the former, perhaps used status
=3D "disabled" and if the latter perhaps define only the frequency in
this file? Just trying to reduce boilerplate and complexity for board
bring-up engineers.

Also the oscillator frequency seems to be detected at run-time. What
happens if it doesn't match the fdt? Should be not detect it at
run-time?

> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 clock@60006000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&clk_32k> <&osc>;

Why is the clocks property here, but the clock-names property in the
include file?

> + =A0 =A0 =A0 };
> +
> =A0 =A0 =A0 =A0i2c@7000c000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D <400000>;
> =A0 =A0 =A0 =A0};
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.d=
tsi
> index 3da7afd..be4abd2 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -4,6 +4,13 @@
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20";
> =A0 =A0 =A0 =A0interrupt-parent =3D <&intc>;
>
> + =A0 =A0 =A0 tegar_car: clock@60006000 {

Is car a standard name? If not tegra_clk_rst would be an alternative.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "tegra,periphclk";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x60006000 1000>;

0x1000 ?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-names =3D "32k_in", "osc";
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
