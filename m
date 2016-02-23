From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 00/61] gpio: Add and use devm_gpiochip_add_data()
Date: Tue, 23 Feb 2016 14:31:08 +0530
Message-ID: <56CC1FD4.1080905@nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com> <CACRpkdbt+RiWMA74e40MNZVnDM0t0futtFnbyu9sRhv7p93-Tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbt+RiWMA74e40MNZVnDM0t0futtFnbyu9sRhv7p93-Tg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Jon Corbet <corbet@lwn.net>, Alban Bedel <albeu@free.fr>, Ray Jui <rjui@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Support Opensource <support.opensource@diasemi.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?IkFuZGVyc3NvbiwgQmrDtnJuIg==?= <bjorn.andersson@sonymobile.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Greg KH <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, WOLFSON MICROELECTRONICS DRIVERS <patches@opensource.wolfsonmicro.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: linux-tegra@vger.kernel.org


On Monday 22 February 2016 08:14 PM, Linus Walleij wrote:
> On Mon, Feb 22, 2016 at 3:07 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> Add resource management APIs for gpiochip_add_data() and
>> gpiochip_remove() and use these APIs from different HW drivers.
>>
>> This is based on discussion on patch to use the new APIs.
>>          gpio: Add devm_ apis for gpio_chip_add and remove
> Awesome!
>
> Do you have a git I can just pull these off so I don't have to apply
> then all one-by-one?


Nop, I do not have the git repo for sharing as of now at this time.
Trying to learn to how to create.
