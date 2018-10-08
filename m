From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 0/9] Implement wake event support on Tegra186 and later
Date: Mon, 08 Oct 2018 00:14:53 -0700
Message-ID: <153898289355.119890.15326986475278938009@swboyd.mtv.corp.google.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <CACRpkdbLoz+gSFa292OFNszeS6tNywpBRHyGwL9SK2u5s=UhZw@mail.gmail.com>
 <20180925095723.GC7097@ulmo> <20180925171605.GK17420@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925171605.GK17420@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Lina Iyer (2018-09-25 10:16:05)
> Thanks Linus, for bringing this to my attention.
> =

> Hi Thierry,
> =

> On Tue, Sep 25 2018 at 03:57 -0600, Thierry Reding wrote:
> >On Tue, Sep 25, 2018 at 10:48:39AM +0200, Linus Walleij wrote:
> >> Hi Thierry,
> >>
> >> thanks for working on the wakeup business!
> >>
> >> This patch gets me a bit confused on our different approaches
> >> toward wakeups in the kernel, so I included Lina, Marc and Ulf
> >> to see if we can get some common understanding.
> >>
> >> On Fri, Sep 21, 2018 at 12:25 PM Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >>
> >> > The following is a set of patches that allow certain interrupts to be
> >> > used as wakeup sources on Tegra186 and later. To implement this, each
> >> > of the GPIO controllers' IRQ domain needs to become hierarchical, and
> >> > parented to the PMC domain. The PMC domain in turn implements a new
> >> > IRQ domain that is a child to the GIC IRQ domain.
> >> >
> >> > The above ensures that the interrupt chip implementation of the PMC =
is
> >> > called at the correct time. The ->irq_set_type() and ->irq_set_wake()
> >> > implementations program the PMC wake registers in a way to enable the
> >> > given interrupts as wakeup sources.
> >> >
> >> > This is based on a suggestion from Thomas Gleixner that resulted from
> >> > the following thread:
> >> >
> >> >         https://lkml.org/lkml/2018/9/13/1042
[...]
> >
> >Yes, there was some good discussion in that thread which helped me come
> >up with this solution. I think it's pretty elegant because it allows all
> >of this interaction to happen almost automatically via the existing
> >infrastructure. I'm not sure the same could be applied to the PDC,
> >though, because of the need to manually replay the interrupt. That's not
> >something I think can be done with just the simple parent/child
> >relationship that we use on Tegra.
> >
> I wasn't able to use the hierarchy because not all GPIOs and the summary
> line are routed to the PDC. But I am exploring options of hierarchy as
> well.
> =


From=20reading this thread (and https://lkml.org/lkml/2018/9/17/756) it
looks almost exactly the same. The only difference is that Nvidia Tegra
does the replay in hardware whereas Qualcomm SDM845 decided to replay
the irq in software. Either way, the gpio controller has two parent
domains, one is wakeup capable (PDC or PMC) and the other is not (GIC)
and some wakeup capable irqs only go through the PDC/PMC and then to the
GIC (e.g. RTC) instead of through gpio first. And it sounds like not all
gpios are wakeup capable in both designs.

The plan to have the gpio to wakeup capable irq map live in DT for the
PMC sounds good too. That way, the wakeup domain alloc function can
figure things out and redirect gpios by itself while the gpio controller
doesn't need to do anything special besides ask for wakeup to be set and
fail if the parent can't support it.

Can hierarchical irq domains entirely replace the chained irqchip code
in gpiolib? That would be interesting.
