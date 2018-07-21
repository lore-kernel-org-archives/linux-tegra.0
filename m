From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error reporting
Date: Sat, 21 Jul 2018 14:17:54 +0300
Message-ID: <8512069.csTsg4TRIJ@dimapc>
References: <20180720080424.31505-1-marcel@ziswiler.com> <1532089865.19673.13.camel@toradex.com> <20180721095615.GG16228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180721095615.GG16228@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Saturday, 21 July 2018 12:56:15 MSK Mark Brown wrote:
> On Fri, Jul 20, 2018 at 12:31:07PM +0000, Marcel Ziswiler wrote:
> > On Fri, 2018-07-20 at 13:16 +0100, Mark Brown wrote:
> > > >  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
> > > >  	
> > > >  					    "nvidia,codec-sync-
> > > > 
> > > > gpio", 0);
> > > > 
> > > >  	if (!gpio_is_valid(ac97->sync_gpio)) {
> > > > 
> > > > -		dev_err(&pdev->dev, "no codec-sync GPIO
> > > > supplied\n");
> > > > +		ret = ac97->sync_gpio;
> > > > +		dev_err(&pdev->dev, "no codec-sync GPIO supplied:
> > > > %d\n", ret);
> > > > 
> > > >  		goto err_clk_put;
> > > >  	
> > > >  	}
> > > 
> > > This isn't reporting an error code associated with the attempt to
> > > find a
> > > codec-sync GPIO, it's the result of some other operation.
> > 
> > What exactly is then the of_get_named_gpio() above please doing if
> > not getting the codec sync GPIO? I am not following you, sorry.
> 
> It's not in any way involved in setting the value of ret, whatever value
> that has it's nothing to do with that operation.

The comment to gpio_is_valid() says that it "Returns GPIO number to use with 
Linux generic GPIO API, or one of the errno value on the error condition". 
Comment doesn't explicitly states that the returned GPIO number is always 
valid, but it is kinda implied.
