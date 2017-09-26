From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Tue, 26 Sep 2017 18:16:50 +0300
Message-ID: <91112d33-2fd3-cb1c-a1db-5e5be9540d68@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
 <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26.09.2017 17:50, Jon Hunter wrote:
> 
> On 26/09/17 00:22, Dmitry Osipenko wrote:
>> Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
>> on Tegra20/30 SoC's.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>> new file mode 100644
>> index 000000000000..2af9aa76ae11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>> @@ -0,0 +1,23 @@
>> +* NVIDIA Tegra AHB DMA controller
>> +
>> +Required properties:
>> +- compatible:	Must be "nvidia,tegra20-ahbdma"
>> +- reg:		Should contain registers base address and length.
>> +- interrupts:	Should contain one entry, DMA controller interrupt.
>> +- clocks:	Should contain one entry, DMA controller clock.
>> +- resets :	Should contain one entry, DMA controller reset.
>> +- #dma-cells:	Should be <1>. The cell represents DMA request select value
>> +		for the peripheral. For more details consult the Tegra TRM's
>> +		documentation, in particular AHB DMA channel control register
>> +		REQ_SEL field.
> 
> What about the TRIG_SEL field? Do we need to handle this here as well?
> 

I've followed APB DMA here, that HW also has TRIG_SEL but ignores it for some
reason. I think technically it should be present in the binding, yeah.

-- 
Dmitry
