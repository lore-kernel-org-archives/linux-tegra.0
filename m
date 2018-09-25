From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/9] Implement wake event support on Tegra186 and later
Date: Tue, 25 Sep 2018 10:48:39 +0200
Message-ID: <CACRpkdbLoz+gSFa292OFNszeS6tNywpBRHyGwL9SK2u5s=UhZw@mail.gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, ilina@codeaurora.org, Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

thanks for working on the wakeup business!

This patch gets me a bit confused on our different approaches
toward wakeups in the kernel, so I included Lina, Marc and Ulf
to see if we can get some common understanding.

On Fri, Sep 21, 2018 at 12:25 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> The following is a set of patches that allow certain interrupts to be
> used as wakeup sources on Tegra186 and later. To implement this, each
> of the GPIO controllers' IRQ domain needs to become hierarchical, and
> parented to the PMC domain. The PMC domain in turn implements a new
> IRQ domain that is a child to the GIC IRQ domain.
>
> The above ensures that the interrupt chip implementation of the PMC is
> called at the correct time. The ->irq_set_type() and ->irq_set_wake()
> implementations program the PMC wake registers in a way to enable the
> given interrupts as wakeup sources.
>
> This is based on a suggestion from Thomas Gleixner that resulted from
> the following thread:
>
>         https://lkml.org/lkml/2018/9/13/1042

I am not sure if you are aware about Lina's series
"Wakeup GPIO support for SDM845 SoC"
that is now in v3:
https://patchwork.kernel.org/cover/10587965/

It appears to me, though I am blissfully ignorant of the
details, that there is a relationship between this patch
series and the other one.

Your approach is to insert an hiearchical PMC irq controller
and Lina's approach is to simply put a mechanism on the
side to inject IRQs into the GIC after sleep (IIUC).

I guess your hierarchy is in response to this mail from tglx:
https://lkml.org/lkml/2018/9/14/339

So from a birds eye point of view I don't see how the Tegra
PMC irq controller and Qualcomm's PDC power domain
controller are conceptually different. Are you doing the same
thing in two different ways for the same problem space
here?

Or are these hardwares so very different that they really
warrant two different approaches to wakeups?

I guess I miss a bit of hardware insight... is the key difference
that in Qualcomm's PDC the IRQs need to be replayed/injected
by software while Tegra's PMC will do this in hardware?

Yours,
Linus Walleij
