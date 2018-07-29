From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: drop tegra specific GPIO lockdep classes
Date: Sun, 29 Jul 2018 23:39:16 +0200
Message-ID: <CACRpkdZtF2SvXHpFtdav=Scw5BGNCEJbT1qzAVbQnkxvdbi6UA@mail.gmail.com>
References: <20180726154252.14137-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726154252.14137-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 26, 2018 at 5:42 PM Stefan Agner <stefan@agner.ch> wrote:

> Since commit e45d1c80c0ee ("gpio: put GPIO IRQs into their own lock
> class") and commit a0a8bcf4670c ("gpiolib: irqchip: use different
> lockdep class for each gpio irqchip") GPIO lib takes care of lockdep
> classes. In fact, gpiochip_irq_map() overwrites the class anyway, so
> the lockdep class set by the driver is useless. Remove it.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied. Makes perfect sense.

Yours,
Linus Walleij
