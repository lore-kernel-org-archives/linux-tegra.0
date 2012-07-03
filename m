From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: use dmaengine based dma driver
Date: Tue, 3 Jul 2012 11:59:31 +0530
Message-ID: <4FF2914B.1000601@nvidia.com>
References: <1340969673-7776-1-git-send-email-ldewangan@nvidia.com> <1340969673-7776-2-git-send-email-ldewangan@nvidia.com> <4FF1D083.7060207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF1D083.7060207-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "tiwai-l3A5Bk7waGM@public.gmane.org" <tiwai-l3A5Bk7waGM@public.gmane.org>, "perex-/Fr2/VpizcU@public.gmane.org" <perex-/Fr2/VpizcU@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark,
On Monday 02 July 2012 10:16 PM, Stephen Warren wrote:
> On 06/29/2012 05:34 AM, Laxman Dewangan wrote:
>> Use the dmaengine based Tegra APB DMA driver for
>> data transfer between SPI fifo and memory in
>> place of legacy Tegra APB DMA.
>>
>> Because generic soc-dmaengine-pcm uses the DMAs API
>> based on dmaengine, using the exported APIs provided
>> by this generic driver.
>>
>> The new driver is selected if legacy driver is not
>> selected and new dma driver is enabled through config
>> file.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Tested-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> (Tested on Cardhu/Tegra30. It fails on Whistler/Tegra20, but I assume
> that's due to a bug in the dmaengine driver not this patch. There won't
> be a regression when applying this patch since we haven't switched to
> dmaengine as the default yet).

Are you taking this patch?
I have other independent patch for the writecombine dma support in pcm 
memory library and wanted to avoid any merge conflicts.
So if it goes in your tree then the other patch also need to go in your 
tree.
