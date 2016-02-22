From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 01/61] gpio: Add devm_ apis for gpiochip_add_data and
 gpiochip_remove
Date: Mon, 22 Feb 2016 15:32:31 +0100
Message-ID: <20160222143231.GB14970@lunn.ch>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456150130-2668-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, michael.hennerich@analog.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, bjorn.andersson@sonymobile.com, catalin.marinas@arm.com, a.kesavan@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

> +/**
> + * devm_gpiochip_add_data() - Resource manager piochip_add_data()

                                                  ^
missing g.

> + * @dev: the device pointer on which irq_chip belongs to.
> + * @chip: the chip to register, with chip->base initialized
> + * Context: potentially before irqs will work
> + *
> + * Returns a negative errno if the chip can't be registered, such as
> + * because the chip->base is invalid or already associated with a
> + * different chip.  Otherwise it returns zero as a success code.
> + *
> + * The gpio chip automatically be released when the device is unbound.
                   ^
                    will

    Andrew
