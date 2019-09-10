From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] clocksource/drivers/integrator-ap: parse the chosen
 node
Date: Wed, 11 Sep 2019 00:48:33 +0100
Message-ID: <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, "Nori, Sekhar" <nsekhar@ti.com>, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, Marc Zyngier <marc.zyngier@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Krzysztof Halasa <khalasa@piap.pl>, Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ral>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 10, 2019 at 2:50 PM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The driver currently uses aliases to know whether the timer is the
> clocksource or the clockevent.

OK maybe that wasn't the most elegant solution.

> Add the /chosen/linux,clocksource and
> /chosen/linux,clockevent parsing while keeping backward compatibility.

This is not how I would solve this today.

I would simply remove/comment out the IRQ from the timer
that cannot be used for clockevent from the device tree
(apparently it doesn't work anyway), and make the code only
pick a timer with a valid interrupt assigned as clock event,
while a timer without interrupt can be used for clock source.

This has the upside of not needing any special aliases or
chosen things.

Yours,
Linus Walleij
