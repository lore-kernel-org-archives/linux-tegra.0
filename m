From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Tue, 3 Oct 2017 02:02:56 +0300
Message-ID: <795e4b19-b747-74c1-6f92-b961ab4bf822@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
 <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
 <96bfdacb-3d2d-66b6-70f7-a87664b1afc7@gmail.com>
 <0fd316e9-3584-e9bd-2a8b-e73eaa6a9a48@nvidia.com>
 <9e4e3dc1-85cd-2096-118c-7d0c929b9246@wwwdotorg.org>
 <5a5ce745-750f-9c8f-5129-c9b0f7aee614@gmail.com>
 <788f73dc-e011-aa9d-8850-f01ab9459c91@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <788f73dc-e011-aa9d-8850-f01ab9459c91@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02.10.2017 20:05, Stephen Warren wrote:
> On 09/29/2017 09:11 PM, Dmitry Osipenko wrote:
>> On 29.09.2017 22:30, Stephen Warren wrote:
>>> On 09/27/2017 02:34 AM, Jon Hunter wrote:
>>>>
>>>> On 27/09/17 02:57, Dmitry Osipenko wrote:
>>>>> On 26.09.2017 17:50, Jon Hunter wrote:
>>>>>>
>>>>>> On 26/09/17 00:22, Dmitry Osipenko wrote:
>>>>>>> Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
>>>>>>> on Tegra20/30 SoC's.
>>>>>>>
>>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>> ---
>>>>>>>    .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23
>>>>>>> ++++++++++++++++++++++
>>>>>>>    1 file changed, 23 insertions(+)
>>>>>>>    create mode 100644
>>>>>>> Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>>>> b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..2af9aa76ae11
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>>>> @@ -0,0 +1,23 @@
>>>>>>> +* NVIDIA Tegra AHB DMA controller
>>>>>>> +
>>>>>>> +Required properties:
>>>>>>> +- compatible:    Must be "nvidia,tegra20-ahbdma"
>>>>>>> +- reg:        Should contain registers base address and length.
>>>>>>> +- interrupts:    Should contain one entry, DMA controller interrupt.
>>>>>>> +- clocks:    Should contain one entry, DMA controller clock.
>>>>>>> +- resets :    Should contain one entry, DMA controller reset.
>>>>>>> +- #dma-cells:    Should be <1>. The cell represents DMA request select
>>>>>>> value
>>>>>>> +        for the peripheral. For more details consult the Tegra TRM's
>>>>>>> +        documentation, in particular AHB DMA channel control register
>>>>>>> +        REQ_SEL field.
>>>>>>
>>>>>> What about the TRIG_SEL field? Do we need to handle this here as well?
>>>>>>
>>>>>
>>>>> Actually, DMA transfer trigger isn't related a hardware description. It's
>>>>> up to
>>>>> software to decide what trigger to select. So it shouldn't be in the binding.
>>>>
>>>> I think it could be, if say a board wanted a GPIO to trigger a transfer.
>>>>
>>>>> And I think the same applies to requester... any objections?
>>>>
>>>> Well, the REQ_SEL should definitely be in the binding.
>>>>
>>>> Laxman, Stephen, what are your thoughts on the TRIG_SEL field? Looks
>>>> like we never bothered with it for the APB DMA and so maybe no ones uses
>>>> this.
>>>
>>> I don't think TRIG_SEL should be in the binding, at least at present. While
>>> TRIG_SEL certainly is something used to configure the transfer, I believe the
>>> semantics of the current DMA binding only cover DMA transfers that are initiated
>>> when SW desires, rather than being a combination of after SW programs the
>>> transfer plus some other HW event. So, we always use a default/hard-coded
>>> TRIG_SEL value. As such, there's no need for a TRIG_SEL value in DT. There's
>>> certainly no known use-case that requires a non-default TRIG_SEL value at
>>> present. We could add an extra #dma-cells value later if we find a use for it,
>>> and the semantics of that use-case make sense to add it to the DMA specifier,
>>> rather than some other separate higher-level property/driver/...
>>
>> Thank you for the comment. If we'd want to extend the binding further with the
>> trigger, how to differentiate trigger from the requester in a case of a single
>> #data-cell?
>>
>> Of course realistically a chance that the further extension would be needed is
>> very-very low, so we may defer the efforts to solve that question and for now
>> make driver aware of the potential #dma-cells extension.
> 
> The request selector cell isn't optional, so is always present. If we later add
> an optional trig_sel cell, we'll either have:
> 
> #dma-cells=<1>: req_sel
> 
> or:
> 
> #dma-cells=<2>: req_sel, trig_sel

Why request sel. couldn't be optional? Could you please elaborate a bit more?

I think possible options are:

#dma-cells=<1>: req_sel
#dma-cells=<1>: trig_sel
#dma-cells=<2>: req_sel, trig_sel

The only difference between request and trigger is that trigger issues the whole
transfer, while request only a single burst. Isn't it possible to have a case in
HW for the "trigger-only" option? If not or it's a rareness, then I agree that
REQ_SEL must be mandatory.
