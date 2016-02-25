From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/61] gpio: Add and use devm_gpiochip_add_data()
Date: Thu, 25 Feb 2016 14:24:48 +0100
Message-ID: <CACRpkdYsG8X5XiV2+Ss2GLJkFnLFzLi0uy0yy8R5sdi0b_Y+qA@mail.gmail.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
	<CACRpkdbt+RiWMA74e40MNZVnDM0t0futtFnbyu9sRhv7p93-Tg@mail.gmail.com>
	<56CC1FD4.1080905@nvidia.com>
	<56CC7791.2000607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56CC7791.2000607@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Jon Corbet <corbet@lwn.net>, Alban Bedel <albeu@free.fr>, Ray Jui <rjui@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Support Opensource <support.opensource@diasemi.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Andersson=2C_Bj=C3=B6rn?= <bjorn.andersson@sonymobile.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Greg KH <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, WOLFSON MICROELECTRONICS DRIVERS <patches@opensource.wolfsonmicro.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-kernel
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 23, 2016 at 4:15 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> I have made the repo in git hub as
>     https://github.com/ldewangan/linux-upstream.git

Awesome.

> branch name is devm_gpiochip.
>     https://github.com/ldewangan/linux-upstream/tree/devm_gpiochip

I've pulled this branch into my tree on a separate branch for
testing. I pushed the tree to kernel.org so that the zeroday
autobuilders can have a go at it.

If everything goes well I plan to merge this for v4.6, then we
can merge the changes in pin control and other subsystems
for v4.7.

Yours,
Linus Walleij
