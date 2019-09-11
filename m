From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Wed, 11 Sep 2019 01:03:03 +0100
Message-ID: <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190910151055.GX21254@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, "Nori, Sekhar" <nsekhar@ti.com>, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Marc Zyngier <marc.zyngier@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Krzysztof Halasa <khalasa@piap.pl>, Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ral>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
> > On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:

> > In that case, why can't we identify capability that with the compatibles
> > for this timer IP ?
> >
> > IOW, I don't like the proposal as it's hardware limitation.
>
> To be clear, bot timers are exactly the same but can't be clocksource
> and clockevent at the same time. Why would we have different compatibles
> for the exact same IP?

In that case why not just pick the first one you find as clocksource
and the second one as clock event? As they all come to the
same timer of init function two simple local state variables can
solve that:

static bool registered_clocksource;
static bool registered_clockevent;

probe(timer) {
   if (!registered_clocksource) {
       register_clocksource(timer);
       registrered_clocksource = true;
       return;
   }
   if (!registered_clockevent) {
       register_clockevent(timer);
       registered_clockevent = true;
       return;
   }
   pr_info("surplus timer %p\n", timer);
}

Clocksource and clockevent are natural singletons so there is
no need to handle more than one of each in a driver for identical
hardware.

With the Integrator AP timer there is a real reason to select one over
the other but as I replied to that patch it is pretty easy to just identify
which block has this limitation by simply commenting out the IRQ
line for it from the device tree.

Maybe there is something about this I don't understand.

Yours,
Linus Walleij
