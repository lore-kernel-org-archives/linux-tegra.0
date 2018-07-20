From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm9712: fix replace codec to component
Date: Fri, 20 Jul 2018 14:22:58 +0100
Message-ID: <20180720132258.GD18740@imbe.wolfsonmicro.main>
References: <20180720075148.14648-1-marcel@ziswiler.com>
 <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-mips@linux-mips.org, alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, James Hogan <jhogan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Gregory CLEMENT <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Donglin Peng <dolinux.peng@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, Han Xu <han.xu@nxp.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 20, 2018 at 08:30:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi Marcel
> 
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Since commit 143b44845d87 ("ASoC: wm9712: replace codec to component")
> > "wm9712-codec" got renamed to "wm9712-component", however, this change
> > never got propagated down to the actual board/platform drivers. E.g. on
> > Colibri T20 this lead to the following spew upon boot with sound/touch
> > being broken:
> 
> Oops, my bad...
> The platform_driver name is not important,
> how about simply rename back it to "wm9712-codec" ?
> 

Yeah I would agree here wm9712-component isn't great as a name
for board files etc. Lets rename back to wm9712-codec for these
specific bits.

Thanks,
Charles
