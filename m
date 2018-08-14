From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: wm9712: fix replace codec to
	component
Date: Tue, 14 Aug 2018 09:12:43 +0100
Message-ID: <20180814081243.GM32322@imbe.wolfsonmicro.main>
References: <20180813223556.16262-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20180813223556.16262-1-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 14, 2018 at 12:35:56AM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Since commit 143b44845d87 ("ASoC: wm9712: replace codec to component")
> "wm9712-codec" got renamed to "wm9712-component", however, this change
> never got propagated down to the actual board/platform drivers. E.g. on
> Colibri T20 this lead to the following spew upon boot with sound/touch
> being broken:
> 
> [    2.214121] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
> [    2.222137] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
> ...
> [    2.344384] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
> [    2.351885] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
> ...
> [    2.668339] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
> [    2.675811] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
> ...
> [    3.208408] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
> [    3.216312] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
> ...
> [    3.235397] tegra-snd-wm9712 sound: ASoC: CODEC DAI wm9712-hifi not registered
> [    3.248938] tegra-snd-wm9712 sound: snd_soc_register_card failed (-517)
> ...
> [   14.970443] ALSA device list:
> [   14.996628]   No soundcards found.
> 
> This commit finally fixes this again.
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
