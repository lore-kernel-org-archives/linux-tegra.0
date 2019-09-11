From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 0/7] add support for clocksource/clockevent DT selection
Date: Wed, 11 Sep 2019 06:52:36 +0000
Message-ID: <cb451591-88ad-f1b3-b654-cea86ae11cac@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
Content-Language: en-US
Content-ID: <C5F237E5FF12BA4F89A78E016541450F@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: john.stultz@linaro.org
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.co
List-Id: linux-tegra@vger.kernel.org



On 10.09.2019 19:05, John Stultz wrote:
> External E-Mail
> 
> 
> On Tue, Sep 10, 2019 at 6:47 AM Claudiu Beznea
> <claudiu.beznea@microchip.com> wrote:
>>
>> This series adds support to permit the selection of clocksource/clockevent
>> via DT.
> 
> Sorry about this, but could you try to include more of a rational for
> *why* this would be useful in your cover-letter/commit messages?
> 

Sorry for not being to clear in the cover letter.

The case I am trying to solve here is as follows:
The timer hardware for which I publish a driver at [1] cannot work at the
same time as a clocksource and clockevent. On some of our platforms we have
more than one such a timer. So we could use one hardware resource as
clocksource and one as clockevent but not one for both.
Due to this, I proposed in the driver at [1] to have 1st probed hardware to
work as clocksource and the 2nd one to work as clockevent.
There are also other timer drivers that uses this approach. While working
on this series I noticed that there are others that are using even
different compatibles (although it looks to be related to the same hardware).

Due to this Daniel proposed to have an unified mechanism for this scenario,
see [2], (something like what I proposed in this series), such that to have
a determinism b/w the function that the hardware resources would behave
(either clocksource or clockevent or both).

The description I gave in cover letter was not the best one. Because,
actually, at this time, the clocksource/clockevent of the system would not
be the one pointed by DT bindings, these DT bindings would chose only the
function that a timer would have. Because if more than one
clocksource/clockevent would be registered in a system the rating field of
struct clocksource/struct clockevent would be the one that would decide the
chosen clocksource/clockevent.

[1]
https://lore.kernel.org/lkml/1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com/
[2]
https://lore.kernel.org/lkml/2f831f1b-c87d-48bd-cf02-2ebb334b964c@linaro.org/

> I'm not sure I understand the limitation that requires such an option
> to be added to the dts.
> 
> thanks
> -john
> 
