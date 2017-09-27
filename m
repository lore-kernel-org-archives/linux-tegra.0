From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Wed, 27 Sep 2017 09:34:37 +0100
Message-ID: <0fd316e9-3584-e9bd-2a8b-e73eaa6a9a48@nvidia.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
 <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
 <96bfdacb-3d2d-66b6-70f7-a87664b1afc7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96bfdacb-3d2d-66b6-70f7-a87664b1afc7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 27/09/17 02:57, Dmitry Osipenko wrote:
> On 26.09.2017 17:50, Jon Hunter wrote:
>>
>> On 26/09/17 00:22, Dmitry Osipenko wrote:
>>> Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
>>> on Tegra20/30 SoC's.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 ++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>> new file mode 100644
>>> index 000000000000..2af9aa76ae11
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>> @@ -0,0 +1,23 @@
>>> +* NVIDIA Tegra AHB DMA controller
>>> +
>>> +Required properties:
>>> +- compatible:	Must be "nvidia,tegra20-ahbdma"
>>> +- reg:		Should contain registers base address and length.
>>> +- interrupts:	Should contain one entry, DMA controller interrupt.
>>> +- clocks:	Should contain one entry, DMA controller clock.
>>> +- resets :	Should contain one entry, DMA controller reset.
>>> +- #dma-cells:	Should be <1>. The cell represents DMA request select value
>>> +		for the peripheral. For more details consult the Tegra TRM's
>>> +		documentation, in particular AHB DMA channel control register
>>> +		REQ_SEL field.
>>
>> What about the TRIG_SEL field? Do we need to handle this here as well?
>>
> 
> Actually, DMA transfer trigger isn't related a hardware description. It's up to
> software to decide what trigger to select. So it shouldn't be in the binding.

I think it could be, if say a board wanted a GPIO to trigger a transfer.

> And I think the same applies to requester... any objections?

Well, the REQ_SEL should definitely be in the binding.

Laxman, Stephen, what are your thoughts on the TRIG_SEL field? Looks
like we never bothered with it for the APB DMA and so maybe no ones uses
this.

Cheers
Jon

-- 
nvpublic
