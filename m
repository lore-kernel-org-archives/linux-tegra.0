From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/5] media: dt: bindings: Add binding for NVIDIA Tegra
 Video Decoder Engine
Date: Sun, 12 Nov 2017 19:19:15 +0300
Message-ID: <619c789c-decc-ae80-aed6-c93c594847a3@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
 <bf5b91666229f9e46ed8c73d6ca2e4b65f86b5ab.1508448293.git.digetx@gmail.com>
 <6492d1af-19fa-253f-2b75-2c37ccd44cbe@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6492d1af-19fa-253f-2b75-2c37ccd44cbe-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.11.2017 17:21, Vladimir Zapolskiy wrote:
> Hi Dmitry,
> 
> On 10/20/2017 12:34 AM, Dmitry Osipenko wrote:
>> Add binding documentation for the Video Decoder Engine which is found
>> on NVIDIA Tegra20/30/114/124/132 SoC's.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/nvidia,tegra-vde.txt | 55 ++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>> new file mode 100644
>> index 000000000000..470237ed6fe5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>> @@ -0,0 +1,55 @@
>> +NVIDIA Tegra Video Decoder Engine
>> +
>> +Required properties:
>> +- compatible : Must contain one of the following values:
>> +   - "nvidia,tegra20-vde"
>> +   - "nvidia,tegra30-vde"
>> +   - "nvidia,tegra114-vde"
>> +   - "nvidia,tegra124-vde"
>> +   - "nvidia,tegra132-vde"
>> +- reg : Must contain an entry for each entry in reg-names.
>> +- reg-names : Must include the following entries:
>> +  - sxe
>> +  - bsev
>> +  - mbe
>> +  - ppe
>> +  - mce
>> +  - tfe
>> +  - ppb
>> +  - vdma
>> +  - frameid
> 
> I've already mentioned it in my review of the driver code, but the
> version from v3 with a single region is more preferable.
> 
> Also it implies that "reg-names" property will be removed.
> 

Please see my reply to the drivers code review.

>> +- iram : Must contain phandle to the mmio-sram device node that represents
>> +         IRAM region used by VDE.
>> +- interrupts : Must contain an entry for each entry in interrupt-names.
>> +- interrupt-names : Must include the following entries:
>> +  - sync-token
>> +  - bsev
>> +  - sxe
>> +- clocks : Must include the following entries:
>> +  - vde
>> +- resets : Must include the following entries:
>> +  - vde
>> +
>> +Example:
>> +
>> +video-codec@6001a000 {
>> +	compatible = "nvidia,tegra20-vde";
>> +	reg = <0x6001a000 0x1000 /* Syntax Engine */
>> +	       0x6001b000 0x1000 /* Video Bitstream Engine */
>> +	       0x6001c000  0x100 /* Macroblock Engine */
>> +	       0x6001c200  0x100 /* Post-processing Engine */
>> +	       0x6001c400  0x100 /* Motion Compensation Engine */
>> +	       0x6001c600  0x100 /* Transform Engine */
>> +	       0x6001c800  0x100 /* Pixel prediction block */
>> +	       0x6001ca00  0x100 /* Video DMA */
>> +	       0x6001d800  0x300 /* Video frame controls */>;
>> +	reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
>> +		    "tfe", "ppb", "vdma", "frameid";
>> +	iram = <&vde_pool>; /* IRAM region */
>> +	interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
>> +		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
>> +		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
>> +	interrupt-names = "sync-token", "bsev", "sxe";
>> +	clocks = <&tegra_car TEGRA20_CLK_VDE>;
>> +	resets = <&tegra_car 61>;
>> +};
>>
