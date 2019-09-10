From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Tue, 10 Sep 2019 16:08:26 +0100
Message-ID: <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Claudiu.Beznea@microchip.com
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolaszewski@baylibre.co
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 10.09.2019 17:32, Sudeep Holla wrote:
> > External E-Mail
> > 
> > 
> > On Tue, Sep 10, 2019 at 04:47:13PM +0300, Claudiu Beznea wrote:
> >> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>
> >> Some timer drivers may behave either as clocksource or clockevent
> >> or both. Until now, in case of platforms with multiple hardware
> >> resources of the same type, the drivers were chosing the first
> >> registered hardware resource as clocksource/clockevent and the
> >> next one as clockevent/clocksource. Other were using different
> >> compatibles (one for each functionality, although its about the
> >> same hardware). Add DT bindings to be able to choose the
> >> functionality of a timer.
> >>
> > 
> > Is the piece of hardware not capable of serving as both clocksource
> > and clockevent or is it just the platform choice ?
> 
> In my case, the hardware is not capable of serving at the same time
> a clocksource device and a clockevent device.
> 
> First, I published v1 for a hardware device having this behavior at
> [1] requesting 1st probed hardware device to work as clocksource and
> the 2nd one to work as clockevent. The discussion at [1] ended up with
> the idea of having a mechanism to specify which hardware device behaves
> as clocksource and which one behaves as clockevent.
>

In that case, why can't we identify capability that with the compatibles
for this timer IP ?

IOW, I don't like the proposal as it's hardware limitation.

--
Regards,
Sudeep
