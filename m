From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement flags parameters for cyclic transfer
Date: Thu, 20 Dec 2012 09:46:25 -0700
Message-ID: <50D340E1.7040600@wwwdotorg.org>
References: <1355924434-7930-1-git-send-email-ldewangan@nvidia.com> <50D1F33D.1050709@wwwdotorg.org> <50D2ABF7.8090308@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D2ABF7.8090308-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 11:11 PM, Laxman Dewangan wrote:
> On Wednesday 19 December 2012 10:32 PM, Stephen Warren wrote:
>> On 12/19/2012 06:40 AM, Laxman Dewangan wrote:
>>> The flag parameter is added in the cyclic transfer request.
>>> Use the flag option of:
>>> - DMA_PREP_INTERRUPT for enabling interrupt.
>>> - DMA_CTRL_ACK for deciding whether ack is requred or not for
>>>    descriptor.
>> Do the relevant drivers that use Tegra's DMA engine already set flags
>> correctly, so that this change won't cause any regressions?
>>
> 
> Currently, the sound soc driver uses the cyclic mode of dma transfer and
> it has already enable the proper flags. This was done recently after
> adding flags in cyclic api.
> Also, there was bug in our dma driver for not setting DMA_CTRL_ACK by
> default for cyclic case.
> This will fix the issue.

OK. I assume "This was done recently after adding flags in cyclic api."
was a patch that went into 3.8?  So, this patch is a bug-fix that should
be included in 3.8 then?
