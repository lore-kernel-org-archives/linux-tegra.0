From: <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 2/7] clocksource: change timer registration macros
Date: Tue, 10 Sep 2019 14:57:23 +0000
Message-ID: <b0ff3339-4016-0979-d971-9d30e05e1db3@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-3-git-send-email-claudiu.beznea@microchip.com>
 <86k1agryu2.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <86k1agryu2.wl-maz@kernel.org>
Content-Language: en-US
Content-ID: <5CC15C8274802D449C3F3BE5E146EC8D@namprd11.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: maz@kernel.org
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.orga
List-Id: linux-tegra@vger.kernel.org



On 10.09.2019 17:49, Marc Zyngier wrote:
> External E-Mail
> 
> 
> [crazy Cc list, not sure it'll go anywhere]

It is what get_maintainer.pl script returned to.

> 
> On Tue, 10 Sep 2019 14:47:11 +0100,
> Claudiu Beznea <claudiu.beznea@microchip.com> wrote:
>>
>> Change timer registration macros (TIMER_OF_DECLARE() and
>> CLOCKSOURCE_OF_DECLARE()) by adding a new argument. This new argument
>> is a pointer to an object of type struct timer_of and is used in
>> timer_probe(). Based on the flags filled in the struct timer_of object
>> the probing process will parse different DT bindings. Later on the
>> drivers will use the result of this parsing. Even at the moment only
>> few drivers are using this functionality there are other that could
>> be converted to use it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Why don't you introduce a new registration macro that does what you
> want instead of creating this unnecessary churn all over the place?
>

I though it would be good to keep only one interface for all drivers.
I'll keep in mind your proposal for next version.

Thank you,
Claudiu Beznea
 
> 	M.
> 
