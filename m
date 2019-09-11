From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 7/7] clocksource/drivers/integrator-ap: parse the chosen
 node
Date: Wed, 11 Sep 2019 07:14:11 +0000
Message-ID: <9c46343e-504e-fbd9-45aa-a67416109e36@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
 <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
Content-Language: en-US
Content-ID: <561EB454363D5F43AF07179372AB2643@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org
Cc: tmaimon77@gmail.com, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.orgalex
List-Id: linux-tegra@vger.kernel.org



On 11.09.2019 02:48, Linus Walleij wrote:
> External E-Mail
> 
> 
> On Tue, Sep 10, 2019 at 2:50 PM Claudiu Beznea
> <claudiu.beznea@microchip.com> wrote:
>> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>
>> The driver currently uses aliases to know whether the timer is the
>> clocksource or the clockevent.
> 
> OK maybe that wasn't the most elegant solution.
> 
>> Add the /chosen/linux,clocksource and
>> /chosen/linux,clockevent parsing while keeping backward compatibility.
> 
> This is not how I would solve this today.
> 
> I would simply remove/comment out the IRQ from the timer
> that cannot be used for clockevent from the device tree
> (apparently it doesn't work anyway), and make the code only
> pick a timer with a valid interrupt assigned as clock event,
> while a timer without interrupt can be used for clock source.
This could also be used but it will not be compatible with old device
trees. There are different ideas implemented in timer drivers with regards
to this issue. Some of them are registering 1st timer to work as
clocksource/clockevent and the 2nd one to work as clockevent/clocksource.
Some are using different compatibles, one for clocksource, one for
clockevent although these compatible seems to be for the same hardware type
(I can point drivers/clocksource/timer-sprd.c).

The idea with this series was, at it has been proposed in [1] to have one
single mechanism for this kind of situations.

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/lkml/2f831f1b-c87d-48bd-cf02-2ebb334b964c@linaro.org/

> 
> This has the upside of not needing any special aliases or
> chosen things.
> 
> Yours,
> Linus Walleij
> 
