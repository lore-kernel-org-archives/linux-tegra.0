From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: use dmaengine based dma driver
Date: Mon, 02 Jul 2012 10:45:01 -0600
Message-ID: <4FF1D00D.6040402@wwwdotorg.org>
References: <1340969673-7776-1-git-send-email-ldewangan@nvidia.com> <1340969673-7776-2-git-send-email-ldewangan@nvidia.com> <4FEDDF89.1050907@wwwdotorg.org> <4FEF166D.2010705@nvidia.com> <4FF15B16.9020903@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF15B16.9020903-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "tiwai-l3A5Bk7waGM@public.gmane.org" <tiwai-l3A5Bk7waGM@public.gmane.org>, "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2012 02:25 AM, Laxman Dewangan wrote:
> On Saturday 30 June 2012 08:38 PM, Laxman Dewangan wrote:
>> On Friday 29 June 2012 10:32 PM, Stephen Warren wrote:
>>> On 06/29/2012 05:34 AM, Laxman Dewangan wrote:
>>>> Use the dmaengine based Tegra APB DMA driver for
>>>> data transfer between SPI fifo and memory in
>>>> place of legacy Tegra APB DMA.
>>>>
>>>> Because generic soc-dmaengine-pcm uses the DMAs API
>>>> based on dmaengine, using the exported APIs provided
>>>> by this generic driver.
>>>>
>>>> The new driver is selected if legacy driver is not
>>>> selected and new dma driver is enabled through config
>>>> file.
>>>
>>> This works just fine with the existing non-dmaengine DMA driver enabled.
>>>
>>> However, I can't get it to work with dmaengine:
...
>> I think I should send that patches so that you can test it by:
>> - Taking already applied dma driver change in linux-next.
>> - Apply my new patches which I am going to send.
>>
>> And do local change in the tegra_defconfig to disable SYSTEM_DMA and
>> enable dmaengine based dma driver.
>
> The new dma patches are:
> 
>  dma: tegra: fix residual calculation for cyclic case
>  dma: tegra: rename driver and compatible to match with dts
> ...

OK, with those two patches plus this one, everything works on
Cardhu/Tegra30 using dmaengine. However, on Tegra20 DMA doesn't appear
to work. No audio is heard, and aplay eventually exits with the
following error message:

aplay: pcm_write:1603: write error: Input/output error

I believe this means that the DMA simply isn't operating.

I'll assume this is a Tegra20-specific issue in the dmaengine driver
itself, and hence not a problem with this patch, so I'll ack this patch.
