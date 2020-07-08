From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed, 8 Jul 2020 12:19:55 +0300
Message-ID: <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 11:46, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Check whether GPIO IRQ is enabled before proceeding with handling the
>> interrupt request. The interrupt handler now returns IRQ_NONE if none
>> of interrupts were handled, which is usually a sign of a problem.
> 
> ...
> 
>> -       pending = value;
>> +       pending = value & gpio->irq_enb_mask;
> 
>> +       if (!pending)
>> +               return IRQ_NONE;
> 
> for_each_set_bit() should take care of it, no?

Do you mean that the handle_nested_irq() takes care of handling
unrequested interrupts? Actually, looks like it cares. Alright, I'll
drop this patch since it should be unnecessary. Thank you for the comment!

> (and probably return with IRQ_RETVAL() macro)
> 
>>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
>>                 unsigned int virq;
> 
