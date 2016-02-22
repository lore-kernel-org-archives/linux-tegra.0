From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/61] gpio: Add and use devm_gpiochip_add_data()
Date: Mon, 22 Feb 2016 15:44:44 +0100
Message-ID: <CACRpkdbt+RiWMA74e40MNZVnDM0t0futtFnbyu9sRhv7p93-Tg@mail.gmail.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Jon Corbet <corbet@lwn.net>, Alban Bedel <albeu@free.fr>, Ray Jui <rjui@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Support Opensource <support.opensource@diasemi.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Andersson=2C_Bj=C3=B6rn?= <bjorn.andersson@sonymobile.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Greg KH <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>linu
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 22, 2016 at 3:07 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Add resource management APIs for gpiochip_add_data() and
> gpiochip_remove() and use these APIs from different HW drivers.
>
> This is based on discussion on patch to use the new APIs.
>         gpio: Add devm_ apis for gpio_chip_add and remove

Awesome!

Do you have a git I can just pull these off so I don't have to apply
then all one-by-one?

Yours,
Linus Walleij
