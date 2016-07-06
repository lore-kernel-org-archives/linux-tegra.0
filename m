From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: of: Allow overriding the device node
Date: Wed, 6 Jul 2016 10:05:52 +0900
Message-ID: <CAK7LNATyxRmOQb69ZM9kHF+FibSZSmHU1bJAzSM_CGrXgfjJEw@mail.gmail.com>
References: <20160705121114.10650-1-thierry.reding@gmail.com> <CACRpkdbAKHy8PjUr-fWToMKu3jZqfhkQHahQRfw6EFxqNYfY0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbAKHy8PjUr-fWToMKu3jZqfhkQHahQRfw6EFxqNYfY0w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi.

2016-07-06 0:25 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Jul 5, 2016 at 2:11 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
>
>> From: Thierry Reding <treding@nvidia.com>
>>
>> When registering a GPIO chip, drivers can override the device tree node
>> associated with the chip by setting the chip's ->of_node field. If set,
>> this field is supposed to take precedence over the ->parent->of_node
>> field, but the code doesn't actually do that.
>>
>> Commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
>> struct gg_data") exposes this because it now no longer matches on the
>> GPIO chip's ->of_node field, but the GPIO device's ->of_node field that
>> is set using the procedure described above.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Thanks for catching this, patch applied with Alexandre's ACK.
>
> Masahiro: does this look all right to you?

Yes.
Now, the code matches to the comment.  Nice!

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Question:

When we reference the node of gpiochip,
we should use
  chip->gpiodev->dev->of_node

instead of
  chip->of_node

because we can make chip->of_node optional
as long as chip->parent is set in the probe method.

Correct?






-- 
Best Regards
Masahiro Yamada
