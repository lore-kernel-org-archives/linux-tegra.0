From: Matthias Reichl <hias@horus.com>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Tue, 18 Dec 2018 18:40:40 +0100
Message-ID: <20181218174040.k7u26vnnoplllnwb@camel2.lan>
References: <20181018111829.27056-1-marcel@ziswiler.com>
 <20181018111829.27056-4-marcel@ziswiler.com>
 <e25a7463-9ce0-d7f9-e77b-2bbaab2e0b25@nvidia.com>
 <20181021112301.GC8554@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20181021112301.GC8554@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On Sun, Oct 21, 2018 at 12:23:01PM +0100, Mark Brown wrote:
> On Fri, Oct 19, 2018 at 11:22:46AM +0100, Jon Hunter wrote:
> 
> > Looking at snd_soc_init_platform(), it seems that the platform pointer
> > can be allocated by the machine driver and so if it is not allocated by
> > the core, then I don't think we should clear it here. Seems we need a
> > way to determine if this was allocated by the core.
> 
> Indeed, this is a bit of a mess.  We probably shouldn't be modifying the
> data that the drivers passed in, otherwise we get into trouble like
> this.   That suggests that we should copy the data, probably all of it.
> I will try to have a proper look at this next week.

did you find the time to look into this?

The downstream Raspberry Pi kernel contains a bunch of machine drivers
that are implemented in a similar way as the tegra_sgtl5000 driver
(static card and dai link structs, dai_link->platform_of_node filled
in from device tree) which are breaking in 4.20 on deferred probing.

Switching these drivers to dynamically allocated dai link structs,
like 76836fd35492 "ASoC: omap-abe-twl6040: Fix missing audio card
caused by deferred probing" would be a possibility, but if there's
some solution on the horizon that doesn't require changes to the
driver code it'd be easier to wait for that.

so long,

Hias

> > Furthermore, it seems that it is possible that there is more than one
> > link that might be to be cleared.
> 
> Yes, that's an issue as well.



> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
