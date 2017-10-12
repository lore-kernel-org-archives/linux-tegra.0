From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: tegra20: Add video decoder node
Date: Thu, 12 Oct 2017 15:06:17 +0300
Message-ID: <81f39096-dc66-c98b-50f6-fc81ee1804ec@gmail.com>
References: <cover.1507752381.git.digetx@gmail.com>
 <f58be69f6004393711c9ff3cb4b52aed33e2611a.1507752381.git.digetx@gmail.com>
 <0b6150a7-5b2b-ca4d-eb34-b6614e4833df@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0b6150a7-5b2b-ca4d-eb34-b6614e4833df-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Vladimir,

On 12.10.2017 10:43, Vladimir Zapolskiy wrote:
> Hello Dmitry,
> 
> On 10/11/2017 11:08 PM, Dmitry Osipenko wrote:
>> Add a device node for the video decoder engine found on Tegra20.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra20.dtsi | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>> index 7c85f97f72ea..1b5d54b6c0cb 100644
>> --- a/arch/arm/boot/dts/tegra20.dtsi
>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>> @@ -249,6 +249,23 @@
>>  		*/
>>  	};
>>  
>> +	vde@6001a000 {
>> +		compatible = "nvidia,tegra20-vde";
>> +		reg = <0x6001a000 0x3D00    /* VDE registers */
>> +		       0x40000400 0x3FC00>; /* IRAM region */
> 
> this notation of a used region in IRAM is non-standard and potentially it
> may lead to conflicts for IRAM resource between users.
> 
> My proposal is to add a valid device tree node to describe an IRAM region
> firstly, then reserve a subregion in it by using a new "iram" property.
> 

The defined in DT IRAM region used by VDE isn't exactly correct, actually it
should be much smaller. I don't know exactly what parts of IRAM VDE uses, for
now it is just safer to assign the rest of the IRAM region to VDE.

I'm not sure whether it really worthy to use a dynamic allocator for a single
static allocation, but maybe it would come handy later.. Stephen / Jon /
Thierry, what do you think?

> ----8<----
> From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> Date: Thu, 12 Oct 2017 10:25:45 +0300
> Subject: [PATCH] ARM: tegra: add device tree node to describe IRAM on Tegra20
> 
> All Tegra20 SoCs contain 256KiB IRAM, which is used to store
> resume code and by a video decoder engine.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 7c85f97f72ea..fd2843c90920 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -9,6 +9,14 @@
>  	compatible = "nvidia,tegra20";
>  	interrupt-parent = <&lic>;
>  
> +	iram@40000000 {
> +		compatible = "mmio-sram";
> +		reg = <0x40000000 0x40000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x40000000 0x40000>;
> +	};
> +
>  	host1x@50000000 {
>  		compatible = "nvidia,tegra20-host1x", "simple-bus";
>  		reg = <0x50000000 0x00024000>;
> ----8<----
> 
> Please add the change above to your next version of the series, or
> if you wish I can send it separately for review by Thierry.
> 
> After applying that change you do define a region in IRAM for the exclusive
> usage by a video decoder engine and add an 'iram' property:
> 

Newer Tegra generations also have the IRAM, so I think Tegra30/114/124 DT's
should also include the same IRAM node for consistency. I'll extend your patch
to cover other Tegra's and include it in v4 if you don't mind and if Stephen /
Jon / Thierry would approve your proposal.

> ----8<----
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index fd2843c90920..5133fbac2185 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -15,6 +15,11 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x40000000 0x40000>;
> +
> +		vde_pool: vde {
> +			reg = <0x400 0x3fc00>;
> +			pool;
> +		};
>  	};
>  
>  	host1x@50000000 {
> [snip]
> 
> +	vde@6001a000 {
> +		compatible = "nvidia,tegra20-vde";
> +		reg = <0x6001a000 0x3d00>;	/* VDE registers */
> +		iram = <&vde_pool>;		/* IRAM region */
> [snip]
> ----8<----
> 
> And finally in the driver you'll use genalloc API to access the IRAM
> region, for that you can find ready examples in the kernel source code.
> 

Thank you very much for taking a look at the patch!
