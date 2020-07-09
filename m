From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v3 6/6] gpio: max77620: Initialize hardware state of
 interrupts
Date: Thu, 9 Jul 2020 20:33:49 +0530
Message-ID: <2a3295f9-7473-9251-b416-ef51ec85503a@nvidia.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708202355.28507-7-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> I noticed on Nexus 7 that after rebooting from downstream kernel to
> upstream, the GPIO interrupt is triggering non-stop despite interrupts
> being disabled for all of GPIOs. This happens because Nexus 7 uses a
> soft-reboot, meaning that bootloader should take care of resetting
> hardware, but the bootloader doesn't do it well. As a result, GPIO
> interrupt may be left ON at a boot time. Let's mask all GPIO interrupts
> at the driver's initialization time in order to resolve the issue.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>


Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
