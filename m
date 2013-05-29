From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/12] tegra20-apb-dma: remove useless use of lock
Date: Wed, 29 May 2013 16:42:56 +0300
Message-ID: <CAHp75Vfib7ogMcPp83u3=EfuzzSzZyRGGw8W1=m5qeWtcYp3Hw@mail.gmail.com>
References: <1369656882-25241-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1369656882-25241-10-git-send-email-andriy.shevchenko@linux.intel.com>
	<51A5DEDC.4040606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51A5DEDC.4040606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 29, 2013 at 1:56 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Monday 27 May 2013 05:44 PM, Andy Shevchenko wrote:
>>
>> Accordingly to dma_cookie_status() description locking is not required.
>>
> I think we need lock here:
> From isr handler, we call dma_cookie_complete() which is in spin-locked.
> This function updates  tx->chan->completed_cookie = tx->cookie;
> In tegra_dma_tx_status(), we check for dma_cookie_status() which access the
> chan->completed_cookie; and it decides status based on this
>
> As the access of  chan->completed_cookie  are from different context, we
> need this locking.

You need to have a consistent data in the cookies. This is guaranteed
by memory barrier if I got it correctly.

-- 
With Best Regards,
Andy Shevchenko
