From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] gpio: tegra186: Rename flow variable to type
Date: Fri, 14 Dec 2018 14:51:27 +0100
Message-ID: <CACRpkdb55-U_9rBK0wvcBk-eof3hzDmPc2YSXNuzEhw-cZGrRA@mail.gmail.com>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
 <20181129170312.23625-4-thierry.reding@gmail.com> <CACRpkdbuRJ+UAoZkZNtWNzrF2+_0h-ibkTaDXWcPe70yJCx+5w@mail.gmail.com>
 <20181214133636.GA23379@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214133636.GA23379@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 14, 2018 at 2:36 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Fri, Dec 14, 2018 at 02:34:43PM +0100, Linus Walleij wrote:
> > On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The IRQ core code refers to the interrupt type by that name, whereas the
> > > term flow is almost never used. Some GPIO controllers use the term
> > > flow_type, but it is most consistent to just go with the IRQ core
> > > terminology.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > Patch applied.
> >
> > No need to wait for genirq or other changes to apply this.
>
> The genirq patch was acked by both Thomas and Marc. Were you waiting for
> anything else on the rest of this series?

Yeah I had some comments on patch 1 (sorry for slowness ...)
but it's something I think you can fix up and test in 30 min.

Yours,
Linus Walleij
