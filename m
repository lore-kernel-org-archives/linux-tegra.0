From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 2/5] genirq: Export irq_chip_set_wake_parent()
Date: Fri, 7 Dec 2018 00:12:56 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1812070012350.3743@nanos.tec.linutronix.de>
References: <20181129170312.23625-1-thierry.reding@gmail.com> <20181129170312.23625-3-thierry.reding@gmail.com> <CACRpkdbRswRmMWFGuB6pMWeUVdB6=rxqC-o4ytv1VhK-2yjWDg@mail.gmail.com> <cd55816a-68da-c7d3-5dc7-bfe0b27c2ad2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd55816a-68da-c7d3-5dc7-bfe0b27c2ad2@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 6 Dec 2018, Marc Zyngier wrote:

> On 05/12/2018 21:31, Linus Walleij wrote:
> > On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > 
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Interrupt controllers in a hierarchy want to use this function to
> >> propogate ->irq_set_wake() operations to their parent domains.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > Tglx/Marc: is this change OK? (ACK?)
> 
> It looks OK to me, as it is consistent with irq_chip_set_type_parent,
> among others.
> 
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>

No objections either:

Acked-by: Thomas Gleixner <tglx@linutronix.de>
