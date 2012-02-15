From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 15 Feb 2012 10:44:38 -0800
Message-ID: <CAPnjgZ32TD_P4Pa650Y1MpxryxSOMtJHdJB28ZNFxv4hxqGMRA@mail.gmail.com>
References: <1329329667-26725-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4153072717612667808=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1329329667-26725-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============4153072717612667808==
Content-Type: multipart/alternative; boundary=e89a8ff2500e8bce3104b9051aeb

--e89a8ff2500e8bce3104b9051aeb
Content-Type: text/plain; charset=ISO-8859-1

Hi Stephen,

On Wed, Feb 15, 2012 at 10:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> The Tegra20 CAR (Clock And Reset) Controller controls most aspects of
> most clocks within Tegra20. The device tree binding models this as a
> single monolithic clock provider, which exports ~130 clocks. This reduces
> the number of nodes needed in device tree to represent these clocks.
>
> This binding is only useful for Tegra20; the set of clocks that exists on
> Tegra30 is sufficiently different to merit its own binding.
>

It seems there is a large common element - they are almost backwards
compatible. Should we not at least look at this now?


>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v3:
> * Re-order clock ID list so that IDs 0..95 match the CLK_OUT_ENB register
>  layout where possible. For register bits that affect multiple clocks,
>  assign those clocks IDs outside the range to make this clear.
>

Great!


> * Double-checked the documentation, and added a couple more cases where
>  a single CLK_OUT_ENB bit affects multiple clocks.
> * Split the binding example into separate SoC and board file sections.
> v2:
> * Remove clock-names, clock-output-names properties; Tegra will solely
>  use integer IDs for clocks in DT.
> * Fixed typo in compatible flag
> * Resolve FIXME re: multiple clocks with the same "reset ID"; give each
>  unique clock an ID, and ignore the reset bits, since this is purely a
>  clock binding. Code (e.g. U-Boot) that wants to use this to determine
>  CAR reset bit numbers would need a table to convert from the clock IDs
>  in this binding to the related reset bit number, if any. In general, I
>  think that's true, and the U-Boot code that handles "peripheral IDs"
>  should be reworked to handle "clocks", the peripheral clocks being a
>  subset of all clocks.
> * Define clock IDs for all the non-peripheral clocks too; inputs, PLLs,
>  etc.
> * Separate tegra-seaboard.dts usage example into a separate patch.
>
> This patch conceptually relies on Grant Likely's common clock binding patch
> series. However, since that seems pretty stable and people agree with it, I
> think we can check in this patch without waiting for Grant's.
> ---
>  .../bindings/clock/nvidia,tegra20-car.txt          |  207
> ++++++++++++++++++++
>  arch/arm/boot/dts/tegra20.dtsi                     |    6 +
>  2 files changed, 213 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
>
> diff --git
> a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> new file mode 100644
> index 0000000..5c07fca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> @@ -0,0 +1,207 @@
> +NVIDIA Tegra20 Clock And Reset Controller
> +
> +This binding uses the common clock binding:
> +Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
> +for muxing and gating Tegra's clocks, and setting their rates.
> +
> +Required properties :
> +- compatible : Should be "nvidia,tegra20-car"
> +- reg : Should contain CAR registers location and length
> +- clocks : Should contain phandle and clock specifiers for two clocks:
> +  the 32 KHz "32k_in", and the board-specific oscillator "osc".
> +- #clock-cells : Should be 1.
> +  In clock consumers, this cell represents the clock ID exposed by the
> CAR.
> +
> +  The first 96 clocks are numbered to match the bits in the CAR's
> CLK_OUT_ENB
> +  registers. These IDs often match those in the CAR's RST_DEVICES
> registers,
> +  but not in all cases. Some bits in CLK_OUT_ENB affect multiple clocks.
> In
> +  this case, those clocks are assigned IDs above 95 in order to highlight
> +  this issue. Implementations that interpret these clock IDs as bit values
> +  within the CLK_OUT_ENB or RST_DEVICES registers should be careful to
> +  explicitly handle these special cases.
> +
> +  The balance of the clocks controlled by the CAR are assigned IDs of 96
> and
> +  above.
> +
> +  0    cpu
> +  1    unassigned
> +  2    unassigned
> +  3    ac97
> +  4    rtc
> +  5    tmr
> +  6    uart1
> +  7    unassigned      (register bit affects uart2 and vfir)
> +  8    gpio
> +  9    sdmmc2
> +  10   unassigned      (register bit affects spdif_in and spdif_out)
> +  11   i2s1
> +  12   i2c1
> +  13   ndflash
> +  14   sdmmc1
> +  15   sdmmc4
> +  16   twc
> +  17   pwm
> +  18   i2s2
> +  19   epp
> +  20   unassigned      (register bit affects vi and vi_sensor)
> +  21   2d
> +  22   usbd
> +  23   isp
> +  24   3d
> +  25   ide
> +  26   disp2
> +  27   disp1
> +  28   host1x
> +  29   vcp
> +  30   unassigned
> +  31   cache2
> +
> +  32   mem
> +  33   ahbdma
> +  34   apbdma
> +  35   unassigned
> +  36   kbc
> +  37   stat_mon
> +  38   pmc
> +  39   fuse
> +  40   kfuse
> +  41   sbc1
> +  42   snor
> +  43   spi1
> +  44   sbc2
> +  45   xio
> +  46   sbc3
> +  47   dvc
> +  48   dsi
> +  49   unassigned      (register bit affects tvo and cve)
> +  50   mipi
> +  51   hdmi
> +  52   csi
> +  53   tvdac
> +  54   i2c2
> +  55   uart3
> +  56   unassigned
> +  57   emc
> +  58   usb2
> +  59   usb3
> +  60   mpe
> +  61   vde
> +  62   bsea
> +  63   bsev
> +
> +  64   speedo
> +  65   uart4
> +  66   uart5
> +  67   i2c3
> +  68   sbc4
> +  69   sdmmc3
> +  70   pcie
> +  71   owr
> +  72   afi
> +  73   csite
>

Would 'coresight' be better given that you have csi also?


> +  74   unassigned
> +  75   avpucq
> +  76   la
>

What is this one?


> +  77   unassigned
> +  78   unassigned
> +  79   unassigned
> +  80   unassigned
> +  81   unassigned
> +  82   unassigned
> +  83   unassigned
> +  84   irama
> +  85   iramb
> +  86   iramc
> +  87   iramd
> +  88   cram2
> +  89   audio_2x        a/k/a audio_2x_sync_clk
> +  90   clk_d
> +  91   unassigned
> +  92   sus
> +  93   cdev1
> +  94   cdev2
> +  95   unassigned
> +
> +  96   uart2
> +  97   vfir
> +  98   spdif_in
> +  99   spdif_out
> +  100  vi
> +  101  vi_sensor
> +  102  tvo
> +  103  cve
>

These clocks follow on directly from the above numbers. What is your plan
for T30? I think this has another 64 clocks. Should we reserve those spaces
now so that the binding are compatible between the two?


> +  104  osc

+  105  clk_32k         a/k/a clk_s
> +  106  clk_m
> +  107  sclk
> +  108  cclk
> +  109  hclk
> +  110  pclk
> +  111  blink
> +  112  pll_a
> +  113  pll_a_out0
> +  114  pll_c
> +  115  pll_c_out1
> +  116  pll_d
> +  117  pll_d_out0
> +  118  pll_e
> +  119  pll_m
> +  120  pll_m_out1
> +  121  pll_p
> +  122  pll_p_out1
> +  123  pll_p_out2
> +  124  pll_p_out3
> +  125  pll_p_out4
> +  126  pll_s
> +  127  pll_u
> +  128  pll_x
> +  129  cop             a/k/a avp
> +  130  audio           a/k/a audio_sync_clk
> +
> +Example SoC include file:
> +
> +/ {
> +       tegra_car: clock@60006000 {
> +               compatible = "nvidia,tegra20-car";
> +               reg = <0x60006000 0x1000>;
> +               #clock-cells = <1>;
> +       };
> +
> +       usb@c5004000 {
> +               clocks = <&tegra_car 58>; /* usb2 */
> +       };
> +};
> +
> +Example board file:
> +
> +/ {
> +       clocks {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               osc: clock {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <12000000>;
> +               };
> +       };
> +
> +       i2c@7000d000 {
> +               pmic@34 {
> +                       compatible = "ti,tps6586x";
> +                       reg = <0x34>;
> +
> +                       clk_32k: clock {
> +                               compatible = "fixed-clock";
> +                               #clock-cells = <0>;
> +                               clock-frequency = <32768>;
> +                       };
> +               };
> +       };
> +
> +       &tegra_car {
> +               clocks = <&clk_32k> <&osc>;
> +       };
> +};
> diff --git a/arch/arm/boot/dts/tegra20.dtsi
> b/arch/arm/boot/dts/tegra20.dtsi
> index ec1f010..550da98 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -4,6 +4,12 @@
>        compatible = "nvidia,tegra20";
>        interrupt-parent = <&intc>;
>
> +       tegra_car: clock@60006000 {
> +               compatible = "nvidia,tegra20-car";
> +               reg = <0x60006000 1000>;
> +               #clock-cells = <1>;
> +       };
> +
>        pmc@7000f400 {
>                compatible = "nvidia,tegra20-pmc";
>                reg = <0x7000e400 0x400>;
> --
> 1.7.0.4
>

Regards,
Simon


>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--e89a8ff2500e8bce3104b9051aeb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Stephen,<br><br><div class=3D"gmail_quote">On Wed, Feb 15, 2012 at 10:14=
 AM, Stephen Warren <span dir=3D"ltr">&lt;<a href=3D"mailto:swarren@nvidia.=
com">swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
The Tegra20 CAR (Clock And Reset) Controller controls most aspects of<br>
most clocks within Tegra20. The device tree binding models this as a<br>
single monolithic clock provider, which exports ~130 clocks. This reduces<b=
r>
the number of nodes needed in device tree to represent these clocks.<br>
<br>
This binding is only useful for Tegra20; the set of clocks that exists on<b=
r>
Tegra30 is sufficiently different to merit its own binding.<br></blockquote=
><div><br></div><div>It seems there is a large common element - they are al=
most backwards compatible. Should we not at least look at this now?</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Stephen Warren &lt;<a href=3D"mailto:swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">swa=
rren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
v3:<br>
* Re-order clock ID list so that IDs 0..95 match the CLK_OUT_ENB register<b=
r>
 =A0layout where possible. For register bits that affect multiple clocks,<b=
r>
 =A0assign those clocks IDs outside the range to make this clear.<br></bloc=
kquote><div><br></div><div>Great!</div><div>=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

* Double-checked the documentation, and added a couple more cases where<br>
 =A0a single CLK_OUT_ENB bit affects multiple clocks.<br>
* Split the binding example into separate SoC and board file sections.<br>
v2:<br>
* Remove clock-names, clock-output-names properties; Tegra will solely<br>
 =A0use integer IDs for clocks in DT.<br>
* Fixed typo in compatible flag<br>
* Resolve FIXME re: multiple clocks with the same &quot;reset ID&quot;; giv=
e each<br>
 =A0unique clock an ID, and ignore the reset bits, since this is purely a<b=
r>
 =A0clock binding. Code (e.g. U-Boot) that wants to use this to determine<b=
r>
 =A0CAR reset bit numbers would need a table to convert from the clock IDs<=
br>
 =A0in this binding to the related reset bit number, if any. In general, I<=
br>
 =A0think that&#39;s true, and the U-Boot code that handles &quot;periphera=
l IDs&quot;<br>
 =A0should be reworked to handle &quot;clocks&quot;, the peripheral clocks =
being a<br>
 =A0subset of all clocks.<br>
* Define clock IDs for all the non-peripheral clocks too; inputs, PLLs,<br>
 =A0etc.<br>
* Separate tegra-seaboard.dts usage example into a separate patch.<br>
<br>
This patch conceptually relies on Grant Likely&#39;s common clock binding p=
atch<br>
series. However, since that seems pretty stable and people agree with it, I=
<br>
think we can check in this patch without waiting for Grant&#39;s.<br>
---<br>
=A0.../bindings/clock/nvidia,tegra20-car.txt =A0 =A0 =A0 =A0 =A0| =A0207 ++=
++++++++++++++++++<br>
=A0arch/arm/boot/dts/tegra20.dtsi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A06 +<br>
=A02 files changed, 213 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra2=
0-car.txt<br>
<br>
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt=
 b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt<br>
new file mode 100644<br>
index 0000000..5c07fca<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt<br>
@@ -0,0 +1,207 @@<br>
+NVIDIA Tegra20 Clock And Reset Controller<br>
+<br>
+This binding uses the common clock binding:<br>
+Documentation/devicetree/bindings/clock/clock-bindings.txt<br>
+<br>
+The CAR (Clock And Reset) Controller on Tegra is the HW module responsible=
<br>
+for muxing and gating Tegra&#39;s clocks, and setting their rates.<br>
+<br>
+Required properties :<br>
+- compatible : Should be &quot;nvidia,tegra20-car&quot;<br>
+- reg : Should contain CAR registers location and length<br>
+- clocks : Should contain phandle and clock specifiers for two clocks:<br>
+ =A0the 32 KHz &quot;32k_in&quot;, and the board-specific oscillator &quot=
;osc&quot;.<br>
+- #clock-cells : Should be 1.<br>
+ =A0In clock consumers, this cell represents the clock ID exposed by the C=
AR.<br>
+<br>
+ =A0The first 96 clocks are numbered to match the bits in the CAR&#39;s CL=
K_OUT_ENB<br>
+ =A0registers. These IDs often match those in the CAR&#39;s RST_DEVICES re=
gisters,<br>
+ =A0but not in all cases. Some bits in CLK_OUT_ENB affect multiple clocks.=
 In<br>
+ =A0this case, those clocks are assigned IDs above 95 in order to highligh=
t<br>
+ =A0this issue. Implementations that interpret these clock IDs as bit valu=
es<br>
+ =A0within the CLK_OUT_ENB or RST_DEVICES registers should be careful to<b=
r>
+ =A0explicitly handle these special cases.<br>
+<br>
+ =A0The balance of the clocks controlled by the CAR are assigned IDs of 96=
 and<br>
+ =A0above.<br>
+<br>
+ =A00 =A0 =A0cpu<br>
+ =A01 =A0 =A0unassigned<br>
+ =A02 =A0 =A0unassigned<br>
+ =A03 =A0 =A0ac97<br>
+ =A04 =A0 =A0rtc<br>
+ =A05 =A0 =A0tmr<br>
+ =A06 =A0 =A0uart1<br>
+ =A07 =A0 =A0unassigned =A0 =A0 =A0(register bit affects uart2 and vfir)<b=
r>
+ =A08 =A0 =A0gpio<br>
+ =A09 =A0 =A0sdmmc2<br>
+ =A010 =A0 unassigned =A0 =A0 =A0(register bit affects spdif_in and spdif_=
out)<br>
+ =A011 =A0 i2s1<br>
+ =A012 =A0 i2c1<br>
+ =A013 =A0 ndflash<br>
+ =A014 =A0 sdmmc1<br>
+ =A015 =A0 sdmmc4<br>
+ =A016 =A0 twc<br>
+ =A017 =A0 pwm<br>
+ =A018 =A0 i2s2<br>
+ =A019 =A0 epp<br>
+ =A020 =A0 unassigned =A0 =A0 =A0(register bit affects vi and vi_sensor)<b=
r>
+ =A021 =A0 2d<br>
+ =A022 =A0 usbd<br>
+ =A023 =A0 isp<br>
+ =A024 =A0 3d<br>
+ =A025 =A0 ide<br>
+ =A026 =A0 disp2<br>
+ =A027 =A0 disp1<br>
+ =A028 =A0 host1x<br>
+ =A029 =A0 vcp<br>
+ =A030 =A0 unassigned<br>
+ =A031 =A0 cache2<br>
+<br>
+ =A032 =A0 mem<br>
+ =A033 =A0 ahbdma<br>
+ =A034 =A0 apbdma<br>
+ =A035 =A0 unassigned<br>
+ =A036 =A0 kbc<br>
+ =A037 =A0 stat_mon<br>
+ =A038 =A0 pmc<br>
+ =A039 =A0 fuse<br>
+ =A040 =A0 kfuse<br>
+ =A041 =A0 sbc1<br>
+ =A042 =A0 snor<br>
+ =A043 =A0 spi1<br>
+ =A044 =A0 sbc2<br>
+ =A045 =A0 xio<br>
+ =A046 =A0 sbc3<br>
+ =A047 =A0 dvc<br>
+ =A048 =A0 dsi<br>
+ =A049 =A0 unassigned =A0 =A0 =A0(register bit affects tvo and cve)<br>
+ =A050 =A0 mipi<br>
+ =A051 =A0 hdmi<br>
+ =A052 =A0 csi<br>
+ =A053 =A0 tvdac<br>
+ =A054 =A0 i2c2<br>
+ =A055 =A0 uart3<br>
+ =A056 =A0 unassigned<br>
+ =A057 =A0 emc<br>
+ =A058 =A0 usb2<br>
+ =A059 =A0 usb3<br>
+ =A060 =A0 mpe<br>
+ =A061 =A0 vde<br>
+ =A062 =A0 bsea<br>
+ =A063 =A0 bsev<br>
+<br>
+ =A064 =A0 speedo<br>
+ =A065 =A0 uart4<br>
+ =A066 =A0 uart5<br>
+ =A067 =A0 i2c3<br>
+ =A068 =A0 sbc4<br>
+ =A069 =A0 sdmmc3<br>
+ =A070 =A0 pcie<br>
+ =A071 =A0 owr<br>
+ =A072 =A0 afi<br>
+ =A073 =A0 csite<br></blockquote><div><br></div><div>Would &#39;coresight&=
#39; be better given that you have csi also?</div><div>=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">

+ =A074 =A0 unassigned<br>
+ =A075 =A0 avpucq<br>
+ =A076 =A0 la<br></blockquote><div><br></div><div>What is this one?</div><=
div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
+ =A077 =A0 unassigned<br>
+ =A078 =A0 unassigned<br>
+ =A079 =A0 unassigned<br>
+ =A080 =A0 unassigned<br>
+ =A081 =A0 unassigned<br>
+ =A082 =A0 unassigned<br>
+ =A083 =A0 unassigned<br>
+ =A084 =A0 irama<br>
+ =A085 =A0 iramb<br>
+ =A086 =A0 iramc<br>
+ =A087 =A0 iramd<br>
+ =A088 =A0 cram2<br>
+ =A089 =A0 audio_2x =A0 =A0 =A0 =A0a/k/a audio_2x_sync_clk<br>
+ =A090 =A0 clk_d<br>
+ =A091 =A0 unassigned<br>
+ =A092 =A0 sus<br>
+ =A093 =A0 cdev1<br>
+ =A094 =A0 cdev2<br>
+ =A095 =A0 unassigned<br>
+<br>
+ =A096 =A0 uart2<br>
+ =A097 =A0 vfir<br>
+ =A098 =A0 spdif_in<br>
+ =A099 =A0 spdif_out<br>
+ =A0100 =A0vi<br>
+ =A0101 =A0vi_sensor<br>
+ =A0102 =A0tvo<br>
+ =A0103 =A0cve<br></blockquote><div><br></div><div>These clocks follow on =
directly from the above numbers. What is your plan for T30? I think this ha=
s another 64 clocks. Should we reserve those spaces now so that the binding=
 are compatible between the two?</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
+ =A0104 =A0osc=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+ =A0105 =A0clk_32k =A0 =A0 =A0 =A0 a/k/a clk_s<br>
+ =A0106 =A0clk_m<br>
+ =A0107 =A0sclk<br>
+ =A0108 =A0cclk<br>
+ =A0109 =A0hclk<br>
+ =A0110 =A0pclk<br>
+ =A0111 =A0blink<br>
+ =A0112 =A0pll_a<br>
+ =A0113 =A0pll_a_out0<br>
+ =A0114 =A0pll_c<br>
+ =A0115 =A0pll_c_out1<br>
+ =A0116 =A0pll_d<br>
+ =A0117 =A0pll_d_out0<br>
+ =A0118 =A0pll_e<br>
+ =A0119 =A0pll_m<br>
+ =A0120 =A0pll_m_out1<br>
+ =A0121 =A0pll_p<br>
+ =A0122 =A0pll_p_out1<br>
+ =A0123 =A0pll_p_out2<br>
+ =A0124 =A0pll_p_out3<br>
+ =A0125 =A0pll_p_out4<br>
+ =A0126 =A0pll_s<br>
+ =A0127 =A0pll_u<br>
+ =A0128 =A0pll_x<br>
+ =A0129 =A0cop =A0 =A0 =A0 =A0 =A0 =A0 a/k/a avp<br>
+ =A0130 =A0audio =A0 =A0 =A0 =A0 =A0 a/k/a audio_sync_clk<br>
+<br>
+Example SoC include file:<br>
+<br>
+/ {<br>
+ =A0 =A0 =A0 tegra_car: clock@60006000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;nvidia,tegra20-car&quot;=
;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x60006000 0x1000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 usb@c5004000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D &lt;&amp;tegra_car 58&gt;; /* usb2=
 */<br>
+ =A0 =A0 =A0 };<br>
+};<br>
+<br>
+Example board file:<br>
+<br>
+/ {<br>
+ =A0 =A0 =A0 clocks {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 osc: clock {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;fixed-cl=
ock&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D &lt;0&gt;;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D &lt;12000=
000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 i2c@7000d000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 pmic@34 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;ti,tps65=
86x&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x34&gt;;<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_32k: clock {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =
=3D &quot;fixed-clock&quot;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =
=3D &lt;0&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequen=
cy =3D &lt;32768&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 };<br>
+<br>
+ =A0 =A0 =A0 &amp;tegra_car {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D &lt;&amp;clk_32k&gt; &lt;&amp;osc&=
gt;;<br>
+ =A0 =A0 =A0 };<br>
+};<br>
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dts=
i<br>
index ec1f010..550da98 100644<br>
--- a/arch/arm/boot/dts/tegra20.dtsi<br>
+++ b/arch/arm/boot/dts/tegra20.dtsi<br>
@@ -4,6 +4,12 @@<br>
 =A0 =A0 =A0 =A0compatible =3D &quot;nvidia,tegra20&quot;;<br>
 =A0 =A0 =A0 =A0interrupt-parent =3D &lt;&amp;intc&gt;;<br>
<br>
+ =A0 =A0 =A0 tegra_car: clock@60006000 {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;nvidia,tegra20-car&quot;=
;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x60006000 1000&gt;;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 #clock-cells =3D &lt;1&gt;;<br>
+ =A0 =A0 =A0 };<br>
+<br>
 =A0 =A0 =A0 =A0pmc@7000f400 {<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D &quot;nvidia,tegra20-pmc&quo=
t;;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D &lt;0x7000e400 0x400&gt;;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.0.4<br></font></span></blockquote><div><br></div><div>Regards,</div><di=
v>Simon</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HO=
EnZb"><font color=3D"#888888">
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-tegra&=
quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></span></blockquote></div><br>

--e89a8ff2500e8bce3104b9051aeb--

--===============4153072717612667808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4153072717612667808==--
