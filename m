From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 4/4] gpio: tegra: Add support for gpio debounce
Date: Mon, 25 Apr 2016 14:10:42 +0530
Message-ID: <571DD80A.1030409@nvidia.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com> <1461319754-12040-4-git-send-email-ldewangan@nvidia.com> <CAAVeFuJykGNGj95r4P8vatxOA_yjsP1eQkDf9zS-dYV1piHTJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuJykGNGj95r4P8vatxOA_yjsP1eQkDf9zS-dYV1piHTJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Monday 25 April 2016 11:06 AM, Alexandre Courbot wrote:
> Sorry, just realized I commented on v3...
>
> On Fri, Apr 22, 2016 at 7:09 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> +       spinlock_t dbc_lock[4]; /* Lock for updating debounce count register */
> I'm nit'ing here, but maybe one spinlock shared by all ports would be
> enough? (the same would apply to lvl_lock, so feel free to do this as
> a separate patch) I don't think we expect *that* many concurrent
> accesses, do we?

Really no, but to make the stuff uniform, it should be fine here. If the 
registers are not conflicting then do not make under same lock.


>>   
>>
>>         spin_lock_irqsave(bank->dbc_lock[port], flags);
>>         if (bank->dbc_cnt[port] < debounce_ms) {
>>                 tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
>>                 bank->dbc_cnt[port] = debounce_ms;
>>         }
>>         spin_unlock_irqrestore(&bank->dbc_lock[port], flags);
>>
>> Which is nicer to the eyes.
>>


OK, this also looks fine. As I am goign to respin this for V5 (for gc as 
instance rather than pointer), I will take care of it.
