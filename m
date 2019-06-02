From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Sun, 2 Jun 2019 15:51:51 +0200
Message-ID: <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
References: <20190529145322.20630-1-thierry.reding@gmail.com> <20190529145322.20630-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529145322.20630-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Hierarchical IRQ domains can be used to stack different IRQ controllers
> on top of each other. One specific use-case where this can be useful is
> if a power management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional registers
> when an IRQ has its wake capability enabled or disabled.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> - add missing kerneldoc for new parent_domain field
> - keep IRQ_DOMAIN dependency for clarity

Actually I applied the patch, and dropped the two lines making
it possible to override .to_irq() for now, so I can illustrate my
idea on top. If I manage.

Yours,
Linus Walleij
