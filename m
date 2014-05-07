From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v1 3/3] dma: tegra: avoid int overflow for transferred
 count
Date: Wed, 07 May 2014 21:15:39 +0200
Message-ID: <536A865B.1060007@metafoo.de>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com> <1399411343-12222-4-git-send-email-cfreeman@nvidia.com> <536A61A3.3050601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A61A3.3050601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/07/2014 06:38 PM, Stephen Warren wrote:
> On 05/06/2014 03:22 PM, Christopher Freeman wrote:
>> bytes_transferred will overflow during long audio playbacks.  Since
>> the driver only ever consults this value modulo bytes_requested, store the
>> value modulo bytes_requested.
>
> The audio driver may only interpret the value modulo bytes_requested,
> but what about other drivers such as the high-speed UART (and SPI?) drivers?
>
> What is the dmaengine API's design requirement here, and what do other
> dmaengine drivers do. If it's to store the modulo, then I'm fine with
> this change.

Yep, this part of the API. The residue should be between transfer length and 
0. While 0 is special and should only be returned if the transfer has 
finished. For cyclic transfers this means it should never be zero. So if 
transferred_bytes is incremented modulo length and residue is length - 
transferred_bytes you get the correct result.
