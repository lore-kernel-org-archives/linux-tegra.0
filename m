From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Tue, 6 Oct 2015 10:16:49 +0100
Message-ID: <56139181.4090706@nvidia.com>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <20151005131215.GN19064@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151005131215.GN19064@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 05/10/15 14:12, Mark Rutland wrote:
> On Mon, Oct 05, 2015 at 01:10:06PM +0100, Jon Hunter wrote:
>> Add device-tree binding documentation for the Tegra210 Audio DMA
>> controller.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  .../devicetree/bindings/dma/tegra210-adma.txt      | 63 ++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>> new file mode 100644
>> index 000000000000..df0e46868a63
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>> @@ -0,0 +1,63 @@
>> +* NVIDIA Tegra Audio DMA (ADMA) controller
>> +
>> +Required properties:
>> +- compatible: Must be "nvidia,tegra210-adma".
>> +- reg: Should contain DMA registers location and length. This should be
>> +  a single entry that includes all of the per-channel registers in one
>> +  contiguous bank.
>> +- interrupt-parent: Phandle to the interrupt parent controller.
>> +- interrupts: Should contain all of the per-channel DMA interrupts in
>> +  ascending order with respect to the DMA channel index.
>> +- clocks: Must contain one entry for the ADMA module clock, "adma_ape".
>> +- clock-names: Must contain the entry "adma_ape".
>> +- dma-channels: Must be 22. Defines the number of DMA channels supported
>> +  by the DMA controller.
> 
> If this has to be a fixed value, why is it necessary? Why does the
> driver not just know this?
> 
> Are there other instances of this IP block where this differs?

So this will change for future devices and yes it may seem silly now to
have something that fixed and appears to be constant but I was trying to
future proof the binding. May be the comment should read "For tegra210
must be 22", however, I thought the compatible string would imply this.

>> +- dma-rx-requests: Must be 10. Defines the number of receive request
>> +  signals supported by the DMA controller.
>> +- dma-tx-requests: Must be 10. Defines the number of transmit request
>> +  signals supported by the DMA controller.
> 
> Likewise for these two?

For these I am not sure if they will change in the future and so yes I
could simply place these in the driver. The register would need to
change in the future for these to change and so that would mean that the
driver would need to be updated. So may be this does not make sense.

Cheers
Jon
