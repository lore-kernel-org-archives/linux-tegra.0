From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/5] gpio: max77620: Replace interrupt-enable array
 with bitmap
Date: Wed, 8 Jul 2020 12:08:02 +0300
Message-ID: <c201575a-ab2a-d74d-9791-3fde7844eb01@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-4-digetx@gmail.com>
 <CAHp75Vc56D5QeL2WArUj4OGGk4XgkiK37FnFr=5+XsisLpng1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc56D5QeL2WArUj4OGGk4XgkiK37FnFr=5+XsisLpng1A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 11:44, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:30 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> There is no need to dedicate an array where a bitmap could be used.
>> Let's replace the interrupt's enable-array with the enable-mask in order
>> to improve the code a tad.
> 
> ...
> 
>> +#include <linux/bitops.h>
> 
>>         unsigned int            irq_type[MAX77620_GPIO_NR];
>> -       bool                    irq_enabled[MAX77620_GPIO_NR];
>> +       unsigned long           irq_enb_mask;
> 
> I would rather to move to DECLARE_BITMAP()
> (the macro is defined in types.h IIRC)
> 

Hello, Andy! I know about DECLARE_BITMAP(), it is a very useful macro
for bitmaps that are over 32 bits, which is absolutely not the case
here. This macro will make code more difficult to read and then we will
have to use the bitmap API, which is unnecessary overhead for this case,
and thus, it won't be an improvement anymore, IMO.

I'd either keep this patch as-is or drop it.
