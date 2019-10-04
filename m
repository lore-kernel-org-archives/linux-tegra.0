From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: max77620: Do not allocate IRQs upfront
Date: Sat, 5 Oct 2019 00:01:03 +0200
Message-ID: <CACRpkdafEeMKDqmqoxk-6FcNBYoJtfUCD4QzTdCR_5hxzHz_OQ@mail.gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com> <20191002122825.3948322-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002122825.3948322-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Timo Alho <talho@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
> upfront if passed a non-zero irq_base parameter. However, the intention
> is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
> instead of -1 to fix that use-case.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij

Yours,
Linus Walleij
