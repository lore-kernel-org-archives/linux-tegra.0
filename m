From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Thu, 8 Oct 2015 08:27:25 -0600
Message-ID: <56167D4D.2020404@wwwdotorg.org>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
 <56145369.7040404@wwwdotorg.org> <5614DB41.5080907@nvidia.com>
 <561543A2.2090402@wwwdotorg.org> <56154629.8080205@nvidia.com>
 <5615744E.2060209@wwwdotorg.org> <56163E33.4080303@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56163E33.4080303@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 03:58 AM, Jon Hunter wrote:
>
> On 07/10/15 20:36, Stephen Warren wrote:
>> On 10/07/2015 10:19 AM, Jon Hunter wrote:
>>>
>>> On 07/10/15 17:09, Stephen Warren wrote:
>>>> On 10/07/2015 02:43 AM, Jon Hunter wrote:
>>>>>
>>>>> On 07/10/15 00:04, Stephen Warren wrote:
>>>>>> On 10/05/2015 06:10 AM, Jon Hunter wrote:
>>>>>>> Add device-tree binding documentation for the Tegra210 Audio DMA
>>>>>>> controller.
>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>>>>>> b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
>>>>>>
>>>>>>> +- #dma-cells : Must be <2>. The first cell denotes the transmit or
>>>>>>> +  receive request number and should be between 1 and the maximum
>>>>>>> number
>>>>>>> +  of requests supported (see properties "dma-rx-requests" and
>>>>>>> +  "dma-tx-requests"). This value corresponds to the
>>>>>>> RX/TX_REQUEST_SELECT
>>>>>>> +  fields in the ADMA_CHn_CTRL register. The second cell denotes
>>>>>>> whether
>>>>>>> +  the channel is a receive or transmit channel and must be either 2
>>>>>>> for
>>>>>>> +  a receive channel and 4 for a transmit channel. These values
>>>>>>> correspond
>>>>>>> +  to the TRANSFER_DIRECTION field of the ADMA_CHn_CTRL register.
>>>>>>
>>>>>> Is it typical to encode the direction into the dma cells? I would have
>>>>>> thought the client would provide that information at run-time when
>>>>>> requesting a DMA channel.
>>>>>
>>>>> I have seen other dma bindings that do [0]. If we don't put the
>>>>> direction in the client binding, then it would appear as ...
>>>>>
>>>>> tegra_admaif: admaif@0x702d0000 {
>>>>>        ...
>>>>>        dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>>>>>               <&adma 3>, <&adma 3>, <&adma 4>, <&adma 4>,
>>>>>               <&adma 5>, <&adma 5>, <&adma 6>, <&adma 6>,
>>>>>               <&adma 7>, <&adma 7>, <&adma 8>, <&adma 8>,
>>>>>               <&adma 9>, <&adma 9>, <&adma 10>, <&adma 10>;
>>>>>        dma-names = "rx1", "tx1", "rx2", "tx2", "rx3", "tx3",
>>>>>                    "rx4", "tx4", "rx5", "tx5", "rx6", "tx6",
>>>>>                    "rx7", "tx7", "rx8", "tx8", "rx9", "tx9",
>>>>>                    "rx10", "tx10";
>>>>>        ...
>>>>> };
>>>>>
>>>>> ... where "rxN" and "txN" appear to use the same request, but the
>>>>> reality is that "rxN" is using rx-request-N and "txN" is using
>>>>> tx-request-N. Arnd questioned this before. Obviously I can explain this
>>>>> in the binding document if the above is preferred. However, given that
>>>>> they are named "rx1", "rx2", etc, why not put the direction in the
>>>>> binding?
>>>>
>>>> Why would we need to duplicate the request IDs? I'd expect to have the
>>>> following property content:
>>>>
>>>> dmas = <&adma 1>, <&adma 2>, <&adma 3>, ...;
>>>> dma-names = "1", "2", "3"...;
>>>>
>>>> *and* not have a cell to represent the direction in DT. After all, the
>>>> direction of the channel is 100% implied by the use-case (and hence
>>>> defined by the DMA client's own DT binding); it is known by the client
>>>> driver and can be supplied at run-time.
>>>
>>> Right, but what does the 1, 2, 3, etc in the specifier represent?
>>
>> Aren't they the ADMAIF FIFO IDs?
>
> Yes.
>
>> We know the set/number of ADMAIF FIFOs, and each FIFO needs a request
>> selector ID. The list of those can be indexed by the identity of the
>> FIFO that is accessed via DMA.
>
> Right, but you have 10 RX FIFOs and 10 TX FIFOs. The FIFOs are
> unidirectional. This means that instead of having 20 FIFOs from 1-20
> (yes the FIFOs start from 1 and not 0), you have RX FIFOs from 1-10 and
> TX FIFOs from 1-10.
>
>> Thinking about this more, I think actually that the dmas/dma-names
>> property example that you posted above is exactly what is required here.
>
> Ok, good.
>
>> The counter-example I wrote makes this assumption and hence is invalid.
>> The ADMAIF binding should not assume that the RX and TX request selector
>> IDs are identical. As such, dmas/dma-names should have both an RX and TX
>> entry for each ADMAIF FIFO.
>
> Yes.
>
>> Still, there's no need to encode the DMA direction into the #dma-cells.
>> The client code will know that if it wants to configure DMA into (TX to)
>> FIFO ID 5, it must query dma-names entry "tx5", and simply use whatever
>> is in the DT. When it passes that DMA specifier to the DMA API, the
>> ADMAIF driver knows that it will be for TX, and can pass that
>> information to the DMA code.
>
> That's fine. From my perspective I don't have a strong objection either
> way, however, I can see that given that the name indicates rx or tx,
> then the direction in the binding could be seen as redundant.
>
> So to confirm you are happy with the client bindings being as follows?
>
> tegra_admaif: admaif@0x702d0000 {
>        ...
>       dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
>              <&adma 3>, <&adma 3>, <&adma 4>, <&adma 4>,
>              <&adma 5>, <&adma 5>, <&adma 6>, <&adma 6>,
>              <&adma 7>, <&adma 7>, <&adma 8>, <&adma 8>,
>              <&adma 9>, <&adma 9>, <&adma 10>, <&adma 10>;
>       dma-names = "rx1", "tx1", "rx2", "tx2", "rx3", "tx3",
>                   "rx4", "tx4", "rx5", "tx5", "rx6", "tx6",
>                   "rx7", "tx7", "rx8", "tx8", "rx9", "tx9",
>                   "rx10", "tx10";
>       ...
> };

Yes, that looks good for the client binding.
