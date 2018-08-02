From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to arch_init level
Date: Thu, 02 Aug 2018 16:01:24 +0300
Message-ID: <4576764.PLucfz68jK@dimapc>
References: <20180802111144.12512-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802111144.12512-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thursday, 2 August 2018 14:11:43 MSK Dmitry Osipenko wrote:
> There is a bug in regards to deferred probing within the drivers core
> that causes GPIO-driver to suspend after its users. The bug appears if

I meant "before its users", of course. If the rest of the patches is fine, 
please let me know if re-sending is needed or you'll correct the comment in 
place while applying.

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
