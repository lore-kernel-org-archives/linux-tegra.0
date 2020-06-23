From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] [v4] dmaengine: tegra210-adma: Fix runtime PM imbalance
 on error
Date: Tue, 23 Jun 2020 13:25:20 +0100
Message-ID: <a1357f1f-63d9-93e9-ea7d-e594ba9fc219@nvidia.com>
References: <20200621054710.9915-1-dinghao.liu@zju.edu.cn>
 <44d7771e-5600-19c2-888a-dd226cbc4b50@nvidia.com>
 <CAMuHMdVu=Tm4UTN1GAc3_uy00UhYYJ7ZPyq1qPCXQ+iP3hksfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVu=Tm4UTN1GAc3_uy00UhYYJ7ZPyq1qPCXQ+iP3hksfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>, Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Geert,

On 23/06/2020 13:08, Geert Uytterhoeven wrote:
> Hi Jon,
> 
> More stirring in the cesspool ;-)

Ha! Indeed.

> On Tue, Jun 23, 2020 at 12:13 PM Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 21/06/2020 06:47, Dinghao Liu wrote:
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> when it returns an error code. Thus a pairing decrement is needed on
>>> the error handling path to keep the counter balanced.
>>
>> So you have not mentioned here why you are using _noidle and not _put.
>> Furthermore, in this patch [0] you are not using _noidle to fix the same
>> problem in another driver. We should fix this in a consistent manner
>> across all drivers, otherwise it leads to more confusion.
>>
>> Finally, Rafael mentions we should just use _put [0] and so I think we
>> should follow his recommendation.
>>
>> Jon
>>
>> [0] https://lkml.org/lkml/2020/5/21/601
> 
> "_noidle() is the simplest one and it is sufficient."
> https://lore.kernel.org/linux-i2c/CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org/

Good to know. This detail should be spelled out in the changelog so that
it is clear why we are using _noidle and not _put. I did take a look and
it did seem to handle the usage_count OK, but I was concerned if there
could be something else in the _put path that may get missed.

Anyway, I am fine with the change, but with an updated changelog on why
_noidle is being used.

> You never know what additional things the other put* variants
> will start doing in the future...

Hopefully not, as that would be a breakage of the API itself. From what
Rafael said that all _put calls should work and if at some point in the
future they don't, then that seems like a regression.

Jon

-- 
nvpublic
