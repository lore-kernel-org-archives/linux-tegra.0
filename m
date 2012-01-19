From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 18 Jan 2012 21:31:43 -0800
Message-ID: <20120119053143.GA27447@quad.lixom.net>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326932212-30346-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Jan 18, 2012 at 05:16:52PM -0700, Stephen Warren wrote:

>  .../bindings/clock/nvidia,tegra20-car.txt          |  156 ++++++++++++++++++++
>  arch/arm/boot/dts/tegra-seaboard.dts               |   18 +++
>  arch/arm/boot/dts/tegra20.dtsi                     |    7 +
>  3 files changed, 181 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
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
> +The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
> +for muxing and gating Tegra's clocks, and setting their rates.
> +
> +Required properties :
> +- compatible : Should be "nvidia,<chip>-car"
> +- reg : Should contain CAR registers location and length
> +- clocks : Should contain phandle and clock specifiers for two clocks:
> +  the 32 KHz "32k_in", and the board-specific oscillator "osc".
> +- clock-names : Should contain a list of strings, with values "32k_in",
> +  and "osc".

Hmm. I'd prefer to just ditch the notion of "clock-names" in the cases
where it isn't strictly necessary. Just because some vendors don't want
to define an order between their clocks doesn't mean it's a good idea
for everybody to use that model. In this case, just declaring that the
two clocks refs have to be to those two clocks in that order should
be sufficient.

> +- #clock-cells : Should be 1.
> +  In clock consumers, this cell represents the clock ID exposed by the CAR.
> +  For a list of valid values, see the clock-output-names property.
> +
> +Optional properties :
> +- clock-output-names : Should contain a list of strings defining the clocks
> +  that the CAR provides. The list of names and clock IDs is below. The IDs
> +  may be used in clock specifiers. The names should be listed in this clock-
> +  output-names property, sorted in ID order, if this property is present.
> +
> +  The first 96 clocks are numbered to match the bits in the CAR's CLK_OUT_ENB
> +  registers. Later, subsequent IDs will be assigned to all other clocks the
> +  CAR controls.

Aren't these names hardcoded per SoC? If so, they can be derived from the
compatible field + output number without having a table in the device tree.

If anything, you might want to enumerate the allowed/expected values, but
actually putting them in a property seems overkill.

[...]

> +Example:
> +
> +clocks {
> +	clk_32k: oscillator@0 {

If it has a unit addres (@<x>) it needs a reg property with the same base
address.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +
> +	osc: oscillator@1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12000000>;
> +	};
> +};
> +
> +tegar_car: clock@60006000 {

typo? tegra_car?

> +	compatible = "tegra,periphclk";
> +	reg = <0x60006000 1000>;
> +	clocks = <&clk_32k> <&osc>;
> +	clock-names = "32k_in", "osc";
> +	#clock-cells = <1>;
> +};
> +
> +usb@c5004000 {
> +	...
> +	clocks = <&tegra_car 58>; /* usb2 */
> +};
