From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: mask GPIO IRQs during IRQ shutdown
Date: Tue, 28 Apr 2020 16:22:56 +0200
Message-ID: <CACRpkdY6nU4DW-cadbo8+LTsCbL08nrZM4e9DXz2Nxp0PHj=qQ@mail.gmail.com>
References: <20200427232605.11608-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200427232605.11608-1-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 28, 2020 at 1:26 AM Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> The driver currently leaves GPIO IRQs unmasked even when the GPIO IRQ
> client has released the GPIO IRQ. This allows the HW to raise IRQs, and
> SW to process them, after shutdown. Fix this by masking the IRQ when it's
> shut down. This is usually taken care of by the irqchip core, but since
> this driver has a custom irq_shutdown implementation, it must do this
> explicitly itself.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
