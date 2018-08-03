From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to
 arch_init level
Date: Fri, 3 Aug 2018 19:18:43 +0200
Message-ID: <CACRpkdas4qF51eesZ-M2+7wzp1t81qYSZSyxsmm-zAuvcaE2Pg@mail.gmail.com>
References: <20180802111144.12512-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802111144.12512-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 2, 2018 at 1:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> There is a bug in regards to deferred probing within the drivers core
> that causes GPIO-driver to suspend after its users. The bug appears if
> GPIO-driver probe is getting deferred, which happens after introducing
> dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
> property in device-tree. The bug in the drivers core is old (more than 4
> years now) and is well known, unfortunately there is no easy fix for it.
> The good news is that we can workaround the deferred probe issue by
> changing GPIO / PINCTRL drivers registration order and hence by moving
> PINCTRL driver registration to the arch_init level and GPIO to the
> subsys_init.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Patch applied with Stefan's ACK.

Yours,
Linus Walleij
