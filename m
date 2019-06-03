From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Mon, 3 Jun 2019 12:58:02 +0200
Message-ID: <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603075324.GA27753@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> Me

> > Please drop this. The default .to_irq() should be good for everyone.
> > Also patch 2/2 now contains a identical copy of the gpiolib
> > .to_irq() which I suspect you indended to drop, actually.
>
> It's not actually identical to the gpiolib implementation. There's still
> the conversion to the non-linear DT representation for GPIO specifiers
> from the linear GPIO number space, which is not taken care of by the
> gpiolib variant. That's precisely the point why this patch makes it
> possible to let the driver override things.

OK something is off here, because the purpose of the irqdomain
is exactly to translate between different number spaces, so it should
not happen in the .to_irq() function at all.

Irqdomain uses .map() in the old variant and .translate() in the
hierarchical variant to do this, so something is skewed.

All .to_irq() should ever do is just call the irqdomain to do the
translation, no other logic (unless I am mistaken) so we should
be able to keep the simple .to_irq() logic inside gpiolib.

Yours,
Linus Walleij
