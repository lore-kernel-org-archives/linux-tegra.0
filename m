From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Wed, 11 Sep 2019 11:14:58 +0200
Message-ID: <20190911091458.GD21254@piout.net>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com, ludovic.desroches@microchip.com, linux-imx@nxp.com, u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp, marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org, khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>, mark.rutland@arm.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net, thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org, ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org, jonathanh@nvidia.com, bgolasze
List-Id: linux-tegra@vger.kernel.org

On 11/09/2019 09:34:27+0200, Neil Armstrong wrote:
> Hi,
> 
> On 10/09/2019 15:47, Claudiu Beznea wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > Some timer drivers may behave either as clocksource or clockevent
> > or both. Until now, in case of platforms with multiple hardware
> > resources of the same type, the drivers were chosing the first
> > registered hardware resource as clocksource/clockevent and the
> > next one as clockevent/clocksource. Other were using different
> > compatibles (one for each functionality, although its about the
> > same hardware). Add DT bindings to be able to choose the
> > functionality of a timer.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index 45e79172a646..aad3034cdbdf 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -135,3 +135,23 @@ e.g.
> >  		linux,initrd-end = <0x82800000>;
> >  	};
> >  };
> > +
> > +linux,clocksource and linux,clockevent
> > +--------------------------------------
> > +
> > +Those nodes have a timer property. This property is a phandle to the timer to be
> > +chosen as the clocksource or clockevent. This is only useful when the platform
> > +has multiple identical timers and it is not possible to let linux make the
> > +correct choice.
> > +
> > +/ {
> > +	chosen {
> > +		linux,clocksource {
> > +			timer = <&timer0>;
> > +		};
> > +
> > +		linux,clockevent {
> > +			timer = <&timer1>;
> > +		};
> > +	};
> > +};
> > 
> 
> Why not in aliases ?
> 
> aliases {
>     clocksource0 = &timer0;
>     clockevent0 = &timer1;
> };
> 
> since we can have multiple of each, we should not limit ourselves to 1 clkevent
> and 1 clksource.
> 
> In the aliases case, each driver would expose both capabilities, and the core would select
> what to enable.
> 

For extendability, you need nodes for that because at some point, you
may need to also be able to select the timer frequency. You can't do
that with an alias.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
