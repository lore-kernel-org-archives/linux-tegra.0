From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Wed, 27 Sep 2017 14:44:38 +0100
Message-ID: <96f28cc6-7cbf-308f-bc87-d96d3e7fe045@nvidia.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
 <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
 <96bfdacb-3d2d-66b6-70f7-a87664b1afc7@gmail.com>
 <0fd316e9-3584-e9bd-2a8b-e73eaa6a9a48@nvidia.com>
 <69ea8dec-db7a-fcfa-6fa7-ea70de4c9ef4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69ea8dec-db7a-fcfa-6fa7-ea70de4c9ef4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 27/09/17 13:12, Dmitry Osipenko wrote:
> On 27.09.2017 11:34, Jon Hunter wrote:
>>
>> On 27/09/17 02:57, Dmitry Osipenko wrote:
>>> On 26.09.2017 17:50, Jon Hunter wrote:
>>>>
>>>> On 26/09/17 00:22, Dmitry Osipenko wrote:
>>>>> Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
>>>>> on Tegra20/30 SoC's.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>>  .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 ++++++++++++++++++++++
>>>>>  1 file changed, 23 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>> new file mode 100644
>>>>> index 000000000000..2af9aa76ae11
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>>>>> @@ -0,0 +1,23 @@
>>>>> +* NVIDIA Tegra AHB DMA controller
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible:	Must be "nvidia,tegra20-ahbdma"
>>>>> +- reg:		Should contain registers base address and length.
>>>>> +- interrupts:	Should contain one entry, DMA controller interrupt.
>>>>> +- clocks:	Should contain one entry, DMA controller clock.
>>>>> +- resets :	Should contain one entry, DMA controller reset.
>>>>> +- #dma-cells:	Should be <1>. The cell represents DMA request select value
>>>>> +		for the peripheral. For more details consult the Tegra TRM's
>>>>> +		documentation, in particular AHB DMA channel control register
>>>>> +		REQ_SEL field.
>>>>
>>>> What about the TRIG_SEL field? Do we need to handle this here as well?
>>>>
>>>
>>> Actually, DMA transfer trigger isn't related a hardware description. It's up to
>>> software to decide what trigger to select. So it shouldn't be in the binding.
>>
>> I think it could be, if say a board wanted a GPIO to trigger a transfer.
>>
> 
> GPIO isn't a very good example, there is no "GPIO" trigger. To me all triggers
> are software-defined, so that software could create transfer chains.

TRM shows the following in the APBDMA_TRIG_REG_0 ...

"XRQ_A: XRQ.A (GPIOA) (Hardware initiated DMA request)"

Jon

-- 
nvpublic
