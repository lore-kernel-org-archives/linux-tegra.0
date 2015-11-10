From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 4/6] dmaengine: tegra-apb: Only save channel state for
 those in use
Date: Tue, 10 Nov 2015 09:57:35 +0000
Message-ID: <5641BF8F.1010304@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
 <1447075429-27311-5-git-send-email-jonathanh@nvidia.com>
 <CAHp75Ve77TVmc6TE-mDRvH3_jbKZvzYv0dj7WOXF0mRFa=JErg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Ve77TVmc6TE-mDRvH3_jbKZvzYv0dj7WOXF0mRFa=JErg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 09/11/15 13:58, Andy Shevchenko wrote:
> On Mon, Nov 9, 2015 at 3:23 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Currently the tegra-apb DMA driver suspend/resume helpers, save and
>> restore the registers for all channels regardless of whether they are
>> in use or not. Change this so that only channels that have been
>> allocated and configured are saved and restored.
> 
> Nitpick
> 
>> +               /*
>> +                * Only save the state of DMA channels that are in use.
>> +                */
> 
> One line?
> 
>> +               /*
>> +                * Only restore the state of DMA channels that are in use.
>> +                */
> 
> Same.

Ok.

Jon
