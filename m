From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: of: Allow overriding the device node
Date: Wed, 6 Jul 2016 11:07:55 +0200
Message-ID: <CACRpkdbP5jeR5-FHHjdEHYum3ECrd4OGgX43U+aGUoZi-Sc_YA@mail.gmail.com>
References: <20160705121114.10650-1-thierry.reding@gmail.com>
 <CACRpkdbAKHy8PjUr-fWToMKu3jZqfhkQHahQRfw6EFxqNYfY0w@mail.gmail.com> <CAK7LNATyxRmOQb69ZM9kHF+FibSZSmHU1bJAzSM_CGrXgfjJEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATyxRmOQb69ZM9kHF+FibSZSmHU1bJAzSM_CGrXgfjJEw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 6, 2016 at 3:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Question:
>
> When we reference the node of gpiochip,
> we should use
>   chip->gpiodev->dev->of_node
>
> instead of
>   chip->of_node
>
> because we can make chip->of_node optional
> as long as chip->parent is set in the probe method.
>
> Correct?

Yes, if you see any bug with respect to this, just fix them.

Overall my appraisal of the situation is that it's a mess.
chip->of_node should not exist, we need to investigate all
cases where this is actually used by drivers and kill them all
off, they should all be using the parent to pass the device
containing the right of node so we can get rid of this:

#ifdef CONFIG_OF_GPIO
        /* If the gpiochip has an assigned OF node this takes precedence */
        if (chip->of_node)
                gdev->dev.of_node = chip->of_node;
#endif

I don't know why this extra OF node is there in the first
place and in which circumstances it may be used, maybe
Grant knows.

I understand so much as that it would be a situation where
you have a GPIO device node but it does not have a corresponding
device of any type, but I fail to see what circumstance would
make that happen.

Yours,
Linus Walleij
