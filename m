From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: of: Allow overriding the device node
Date: Tue, 5 Jul 2016 22:10:43 +0900
Message-ID: <CAAVeFu+bjFPKHkfz84V+da=rOUMqiTtfmXdnkaAkHsGZ_-aW_w@mail.gmail.com>
References: <20160705121114.10650-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160705121114.10650-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 5, 2016 at 9:11 PM, Thierry Reding <thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> When registering a GPIO chip, drivers can override the device tree node
> associated with the chip by setting the chip's ->of_node field. If set,
> this field is supposed to take precedence over the ->parent->of_node
> field, but the code doesn't actually do that.
>
> Commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
> struct gg_data") exposes this because it now no longer matches on the
> GPIO chip's ->of_node field, but the GPIO device's ->of_node field that
> is set using the procedure described above.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
