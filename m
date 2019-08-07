From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] gpio: hierarchical IRQ improvements
Date: Wed, 7 Aug 2019 15:41:05 +0200
Message-ID: <CACRpkdYQhyh1BW789OcxGTomMkC3e8hMr8sodbWz-z1=5s9fDw@mail.gmail.com>
References: <20190708110138.24657-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <treding@nvidia.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:

> This builds on top of Linus Walleij's existing patches that adds
> hierarchical IRQ support to the GPIO core [1] so that Qualcomm's
> spmi-gpio and ssbi-gpio can be converted to use these new helpers.
>
> Linus: Feel free to squash these into your existing patches if you'd
> like to use any of this code. Just give me some kind of mention in the
> commit description.
>
> [1] https://lore.kernel.org/linux-gpio/20190624132531.6184-1-linus.walleij@linaro.org/
>
> Brian Masney (4):
>   gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell
>     functions
>   gpio: allow customizing hierarchical IRQ chips
>   gpio: use handler in gpio_irq_chip instead of handle_bad_irq
>   qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core

I solved things like this:

- I kept patches 1 & 4 as-is
- I squashed patches 2 and 3 into the main patch with minor modifications.
- I added Co-developed-by: for your contributions

Now I need to address Masahiro's comments on top and let's see if the
result looks acceptable!

Yours,
Linus Walleij
