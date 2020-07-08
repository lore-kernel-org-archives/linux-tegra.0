From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed, 8 Jul 2020 13:54:47 +0300
Message-ID: <d39caa8f-816c-5d4d-6f54-99baea3e0d5a@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
 <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
 <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 13:11, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 12:19 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 08.07.2020 11:46, Andy Shevchenko пишет:
>>> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> Check whether GPIO IRQ is enabled before proceeding with handling the
>>>> interrupt request. The interrupt handler now returns IRQ_NONE if none
>>>> of interrupts were handled, which is usually a sign of a problem.
>>>
>>> ...
>>>
>>>> -       pending = value;
>>>> +       pending = value & gpio->irq_enb_mask;
>>>
>>>> +       if (!pending)
>>>> +               return IRQ_NONE;
>>>
>>> for_each_set_bit() should take care of it, no?
>>
>> Do you mean that the handle_nested_irq() takes care of handling
>> unrequested interrupts? Actually, looks like it cares. Alright, I'll
>> drop this patch since it should be unnecessary. Thank you for the comment!
> 
> I think it's still good to have reduced IRQs to handle by dropping not
> enabled ones, my comment was about the case when pending == 0. Sorry
> if it was unclear.

It should be unnecessary since we now see that the handle_nested_irq()
checks whether interrupt was requested and if it wasn't, then particular
GPIO interrupt will be treated as spurious [1]. The pending == 0
condition is an extreme case, I don't think that there is a need to
optimize it without any good reason.

[1] https://elixir.bootlin.com/linux/v5.8-rc3/source/kernel/irq/chip.c#L485

Hence it should be better to drop this patch.
