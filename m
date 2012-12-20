From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement flags parameters for cyclic transfer
Date: Thu, 20 Dec 2012 11:41:03 +0530
Message-ID: <50D2ABF7.8090308@nvidia.com>
References: <1355924434-7930-1-git-send-email-ldewangan@nvidia.com> <50D1F33D.1050709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D1F33D.1050709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 19 December 2012 10:32 PM, Stephen Warren wrote:
> On 12/19/2012 06:40 AM, Laxman Dewangan wrote:
>> The flag parameter is added in the cyclic transfer request.
>> Use the flag option of:
>> - DMA_PREP_INTERRUPT for enabling interrupt.
>> - DMA_CTRL_ACK for deciding whether ack is requred or not for
>>    descriptor.
> Do the relevant drivers that use Tegra's DMA engine already set flags
> correctly, so that this change won't cause any regressions?
>

Currently, the sound soc driver uses the cyclic mode of dma transfer and 
it has already enable the proper flags. This was done recently after 
adding flags in cyclic api.
Also, there was bug in our dma driver for not setting DMA_CTRL_ACK by 
default for cyclic case.
This will fix the issue.

> Why would you not want to enable interrupts; how does a client know when
> to refill the buffer?

This came recently from the cyclic api after adding flags that client 
can pass proper flag to enable inetrrupt or not.
Changes from Peter:
/*
commit ec8b5e48c03790a68cb875fe5064007a9cbdfdd0
Author: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Date:   Fri Sep 14 15:05:47 2012 +0300

     dmaengine: Pass flags via device_prep_dma_cyclic() callback

     Change the parameter list of device_prep_dma_cyclic() so the DMA 
drivers
     can receive the flags coming from clients.
     This feature can be used during audio operation to disable all audio
     related interrupts when the DMA_PREP_INTERRUPT is cleared from the 
flags.
*/
