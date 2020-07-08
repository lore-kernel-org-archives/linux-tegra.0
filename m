From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
Date: Wed, 8 Jul 2020 20:35:54 +0300
Message-ID: <2f61f759-81fc-c429-8181-508368c4f091@gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com>
 <20200708155834.19762-2-digetx@gmail.com>
 <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcFG3oK7C8Y7RZKoEvwPo9+hKMMucnDhtpqLDmLGoPmJw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 19:58, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 6:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> I noticed on Nexus 7 that after rebooting from downstream kernel to
>> upstream, the GPIO interrupt is triggering non-stop despite of interrupts
> 
> despite interrupts
> 
>> being disabled for all of GPIOs. This happens because Nexus 7 uses a
>> soft-reboot, meaning that bootloader should take care of resetting
>> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
> 
> but the bootloader
> 
> As a result

Thanks!

>> may be left ON at a boot time. Let's mask all GPIO interrupts at the
>> driver's initialization time in order to resolve the issue.
> 
> ...
> 
>>         mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
>>         mgpio->gpio_chip.can_sleep = 1;
>>         mgpio->gpio_chip.base = -1;
>> +       mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
> 
> Now this seems a bit awkward. Perhaps you need first to switch to use
> GPIO IRQ chip structure?
> It's also in the TODO of the GPIO subsystem ;-)

Alright, I'll try to switch it to use the GPIO IRQ chip struct in v3!

> ...
> 
>>  #ifdef CONFIG_OF_GPIO
>>         mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
>>  #endif
> 
> This seems to be done by GPIO library.

Indeed!

> Also point to improve: don't shadow error from platform_get_irq().
> 

Good catch!
