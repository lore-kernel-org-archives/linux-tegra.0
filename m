From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Tue, 10 Sep 2019 09:05:30 -0700
Message-ID: <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
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
Cc: tmaimon77@gmail.com, Linus Walleij <linus.walleij@linaro.org>, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, ludovic.desroches@microchip.com, linux-imx@nxp.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, uclinux-h8-devel@lists.sourceforge.jp, Marc Zyngier <marc.zyngier@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, Thomas Gleixner <tglx@linutronix.de>, sbranden@broadcom.com, lkml <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, kernel@pengutronix.de, Mark Rutland <mark.rutland@arm.co>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 10, 2019 at 6:47 AM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:
>
> This series adds support to permit the selection of clocksource/clockevent
> via DT.

Sorry about this, but could you try to include more of a rational for
*why* this would be useful in your cover-letter/commit messages?

I'm not sure I understand the limitation that requires such an option
to be added to the dts.

thanks
-john
