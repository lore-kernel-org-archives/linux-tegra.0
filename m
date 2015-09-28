From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Mon, 28 Sep 2015 10:36:46 -0600
Message-ID: <56096C9E.7070608@wwwdotorg.org>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <56056589.9010704@nvidia.com> <56056A8F.5010103@nvidia.com>
 <1783348.ocWL5DWVKG@wuerfel> <5609556A.8060908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5609556A.8060908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/28/2015 08:57 AM, Jon Hunter wrote:
>
> On 25/09/15 16:47, Arnd Bergmann wrote:
>> On Friday 25 September 2015 16:38:55 Jon Hunter wrote:
>>> On 25/09/15 16:17, Jon Hunter wrote:
>>>>
>>>> On 25/09/15 16:03, Arnd Bergmann wrote:
>>>>> On Friday 25 September 2015 15:56:40 Jon Hunter wrote:
>>>>>> +       case DMA_MEM_TO_DEV:
>>>>>> +               burst_size = fls(tdc->config.dst_maxburst);
>>>>>> +               ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_bufs - 1);
>>>>>> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_MEM_TO_AHUB) |
>>>>>> +                               ADMA_CH_CTRL_TX_REQ(tdc->config.slave_id);
>>>>>> +               ch_regs->src_addr = buf_addr;
>>>>>> +               break;
>>>>>> +
>>>>>> +       case DMA_DEV_TO_MEM:
>>>>>> +               burst_size = fls(tdc->config.src_maxburst);
>>>>>> +               ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_bufs - 1);
>>>>>> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_AHUB_TO_MEM) |
>>>>>> +                               ADMA_CH_CTRL_RX_REQ(tdc->config.slave_id);
>>>>>> +               ch_regs->trg_addr = buf_addr;
>>>>>> +               break;
>>>>>
>>>>> Do not use the 'slave_id' field here to identify the slave device, that
>>>>> concept is broken. Instead, put the slave identification into the
>>>>> dma specifier in DT and read it out in your xlate function.
>>>>
>>>> Why is it broken?
>>>>
>>>> What happens if I don't know the slave-id? In other words, the slave-id
>>>> can be dynamically allocated and associated with a given slave.
>>>
>>> I guess thinking about it some more, the driver could assign an id
>>> itself to a given channel and I could avoid using slave_id here. There
>>> are 22 channels and 10 tx and 10 rx requests.
>>
>> This sounds roughly right. So you could pick the ch_regs->ctrl value
>> when you allocate the tegra_adma_chan structure, and then map it to
>> the slave in the xlate() function.
>
> Actually, what I mentioned about would not work as it is not the DMA
> that should assign the requests to the channel.
>
> I think that I have poorly described the hardware and how it works, so
> let me try and explain a bit more.
>
>  From a hardware perspective it looks like the following ...
>
> memory <-> adma <-> adma-if <-> xbar <-> clients
>
> where:
> - memory is the system memory
> - adma is the dma controller
> - adma-if is the dma interface to a crossbar
> - xbar is the crossbar
> - clients are various audio interfaces, such as i2s, etc
>
> The adma-if is essentially a mux with 10 tx and 10 rx ports. Any of the
> 22 adma channels can be mapped to any of the 10 tx or rx ports. The
> request signal used by the adma is determined by which port it is
> configured to use. However, what makes this even more configurable is
> the xbar is also a mux that can route adma-if ports to the various clients.
>
> So potentially, you could use any adma channel and any port to route
> audio to any of the clients. However, the adma-if needs to know which
> adma channel is mapped to which port

It does? I'm pretty sure it didn't in earlier chips; what changed?

For earlier chips, I believe all that's required is:

When programming the DMA engine, you need to know which ADMA-IF is in 
use, so the correct DMA request selector can be programmed into the DMA 
engine for flow-control.

ADMA-IF simply receives the data from DMA, and forwards it to the XBAR 
tagged with the ADMA-IF's own ID.

The XBAR programming selects which data source (ADMA-IF TX, I2S RX, ...) 
each sink (ADMARX, I2S TX, ...) receives.

Ideally, when an I2S controller needs to start transmitting data, it 
should dynamically allocate an ADMA-IF, query it for its DMA slave 
request ID, and then forward this information to the ASoC code that sets 
up the DMA transfer.

In practice, this means that since any I2S module could use any ADMA-IF, 
you probably need to list all DMA request selectors possible in the 
I2S's DMA-related properties, so it can choose which one to use.

Or perhaps the XBAR binding should list all the DMA requestors so that 
each I2S node doesn't have to.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
