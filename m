From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH] ASoC: wm9712: fix replace codec to component
Date: Fri, 20 Jul 2018 11:20:47 +0200
Message-ID: <1532078447.19673.8.camel@ziswiler.com>
References: <20180720075148.14648-1-marcel@ziswiler.com>
         <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87effy48lz.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mips@linux-mips.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, James Hogan <jhogan@kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>, Bhumika Goyal <bhumirks@gmail.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ralf Baechle <ralf@linux-mips.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Paul Burton <paul.burton@mips.com>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>, Daniel Mack <daniel@zonque.org>, Manuel Lauss <manuel.lauss@gmail.com>, Russell
List-Id: linux-tegra@vger.kernel.org

Hi Kuninori

On Fri, 2018-07-20 at 08:30 +0000, Kuninori Morimoto wrote:
> Hi Marcel
> 
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Since commit 143b44845d87 ("ASoC: wm9712: replace codec to
> > component")
> > "wm9712-codec" got renamed to "wm9712-component", however, this
> > change
> > never got propagated down to the actual board/platform drivers.
> > E.g. on
> > Colibri T20 this lead to the following spew upon boot with
> > sound/touch
> > being broken:
> 
> Oops, my bad...
> The platform_driver name is not important,
> how about simply rename back it to "wm9712-codec" ?

Sure, that's your call. After all it was now broken for almost half a
year (;-p). Should I cook that up as well or are you gona do it?

> Best regards
> ---
> Kuninori Morimoto

Cheers

Marcel
