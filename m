From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: tegra20: Add video decoder node
Date: Thu, 12 Oct 2017 13:51:00 +0300
Message-ID: <6fe375ea-4d8d-5dc2-2d17-c13aa1f46d71@gmail.com>
References: <cover.1507752381.git.digetx@gmail.com>
 <f58be69f6004393711c9ff3cb4b52aed33e2611a.1507752381.git.digetx@gmail.com>
 <f18b6a72-e255-9aa4-6ebd-852ce1a27a4e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f18b6a72-e255-9aa4-6ebd-852ce1a27a4e-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12.10.2017 11:49, Jon Hunter wrote:
> 
> On 11/10/17 21:08, Dmitry Osipenko wrote:
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
>> +		reg-names = "regs", "iram";
>> +		interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>, /* UCQ error interrupt */
>> +			     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
>> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
>> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>, /* BSE-A interrupt */
>> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
>> +		interrupt-names = "ucq-error", "sync-token", "bsev", "bsea", "sxe";
>> +		clocks = <&tegra_car TEGRA20_CLK_VDE>;
>> +		clock-names = "vde";
>> +		resets = <&tegra_car 61>;
>> +		reset-names = "vde";
>> +	};
>> +
> 
> I don't see any binding documentation for this node. We need to make
> sure we add this.
> 

It's in the first patch.

+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
