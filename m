From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgs-iproc: Fix crash when driver is built as a module
Date: Thu, 7 Nov 2019 16:01:35 +0100
Message-ID: <CACRpkdZircUVEcQHV2saCk_Mihf-hUWWKUJ=h9jg1it58VeitA@mail.gmail.com>
References: <20191107103540.21088-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191107103540.21088-1-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 7, 2019 at 11:35 AM Jon Hunter <jonathanh@nvidia.com> wrote:

> Commit 6a41b6c5fc20 ("gpio: Add xgs-iproc driver") introduced a new
> GPIO driver for the Broadcom GPIO controller. When this driver is built
> as a module the following warning is observed because the
> bcm_iproc_gpio_of_match structure is defined with the __initconst
> attribute ...
>
>  MODPOST vmlinux.o
>  WARNING: vmlinux.o(.data+0x834d0): Section mismatch in reference from
>  the variable bcm_iproc_gpio_driver to the variable
>  .init.rodata:bcm_iproc_gpio_of_match
>  The variable bcm_iproc_gpio_driver references
>  the variable __initconst bcm_iproc_gpio_of_match
>
> This then causes a translation fault on boot which and results in a
> system crash. Fix this by dropping the __initconst attribute from the
> bcm_iproc_gpio_of_match structure.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Incidentally Mark Brown already sent an identical patch.

Thanks anyway!

Yours,
Linus Walleij
