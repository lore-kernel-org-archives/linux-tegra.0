From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v3 1/6] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date: Thu, 9 Jul 2020 20:24:50 +0530
Message-ID: <15bac6b3-3f24-6990-101f-9d58c50041bc@nvidia.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708202355.28507-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
> let's use it instead of a raw value in order to improve the code's
> readability a tad.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>

Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
