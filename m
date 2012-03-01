From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 8/8] ARM: tegra: HACK: remove set_irq_flags() from driver
Date: Thu, 1 Mar 2012 20:40:17 +0000
Message-ID: <201203012040.18158.arnd@arndb.de>
References: <1330630010-11241-1-git-send-email-alan@signal11.us> <1330630010-11241-9-git-send-email-alan@signal11.us> <CACRpkdZK+9gF7N2akyWw=tvcBS2X2FmSd2-SiNKiuRgUCYXx7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZK+9gF7N2akyWw=tvcBS2X2FmSd2-SiNKiuRgUCYXx7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alan Ott <alan@signal11.us>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 01 March 2012, Linus Walleij wrote:
> The kernel is full of this kind of stuff (drivers/mfd/twl4030-irq.c):
> 
> #ifdef CONFIG_ARM
>         /* ARM requires an extra step to clear IRQ_NOREQUEST, which it
>          * sets on behalf of every irq_chip.  Also sets IRQ_NOPROBE.
>          */
>         set_irq_flags(irq, IRQF_VALID);
> #else
>         /* same effect on other architectures */
>         irq_set_noprobe(irq);
> #endif

That is the implementation of an irq_chip, not a random device driver.

	Arnd
