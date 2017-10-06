From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Fri, 6 Oct 2017 21:02:59 +0300
Message-ID: <b883f022-dac8-2e83-38af-b69810a4a8de@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
 <58f8c049-4408-d6a7-7452-f5be8041b7b5@nvidia.com>
 <72374a74-f6bd-256f-73c0-fa970a2e1576@gmail.com>
 <d4885545-6af1-b240-a197-1ed530cc4172@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d4885545-6af1-b240-a197-1ed530cc4172-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.10.2017 18:50, Jon Hunter wrote:
> 
> On 06/10/17 16:26, Dmitry Osipenko wrote:
>> On 06.10.2017 16:11, Jon Hunter wrote:
>>>
>>> On 04/10/17 00:58, Dmitry Osipenko wrote:
>>>> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
>>>> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
>>>> doesn't yet implement transfers larger than 64K and scatter-gather
>>>> transfers that have NENT > 1, HW doesn't have native support for these
>>>> cases, mem-to-mem isn't implemented as well.
>>>
>>> The APB DMA does not have h/w support for sg-transfers either, but
>>> transfer request are placed on a list. Can we not do the same for AHB?
>>>
>>
>> We can, but I'm not going to implement it without a use-case. It could be done
>> later if needed.
> 
> OK, that's fine, maybe state that above.
> 

It just occurred to me that you are meaning to state that there is no use-case,
I'll mention it in the commit message.
