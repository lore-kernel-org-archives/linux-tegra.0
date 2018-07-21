From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error
	reporting
Date: Sat, 21 Jul 2018 10:06:23 +0000
Message-ID: <1532167581.19673.21.camel@toradex.com>
References: <20180720080424.31505-1-marcel@ziswiler.com>
 <20180720080424.31505-2-marcel@ziswiler.com>
 <20180720121612.GC10784@sirena.org.uk>
 <1532089865.19673.13.camel@toradex.com>
 <20180721095615.GG16228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180721095615.GG16228@sirena.org.uk>
Content-Language: en-US
Content-ID: <7AD8740C5954A74B90D843D13D70192E@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2018-07-21 at 10:56 +0100, Mark Brown wrote:
> On Fri, Jul 20, 2018 at 12:31:07PM +0000, Marcel Ziswiler wrote:
> > On Fri, 2018-07-20 at 13:16 +0100, Mark Brown wrote:
> > > >  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
> > > >  					    "nvidia,codec-
> > > > sync-
> > > > gpio", 0);

Above ac97->sync_gpio gets return value from of_get_named_gpio(),
right?

> > > >  	if (!gpio_is_valid(ac97->sync_gpio)) {

Here it goes if ac97->sync_gpio is not a valid GPIO e.g. in an error
case as reported by above of_get_named_gpio(), right?

> > > > -		dev_err(&pdev->dev, "no codec-sync GPIO
> > > > supplied\n");
> > > > +		ret = ac97->sync_gpio;

And here I assign ret with that return value from of_get_named_gpio(),
right?

> > > > +		dev_err(&pdev->dev, "no codec-sync GPIO
> > > > supplied:
> > > > %d\n", ret);

And then I actually report what error it was (e.g. probe deferral).

> > > >  		goto err_clk_put;
> > > >  	}
> > > This isn't reporting an error code associated with the attempt to
> > > find a
> > > codec-sync GPIO, it's the result of some other operation.
> > What exactly is then the of_get_named_gpio() above please doing if
> > not getting the codec sync GPIO? I am not following you, sorry.
> 
> It's not in any way involved in setting the value of ret, whatever
> value
> that has it's nothing to do with that operation.

I really do not understand what you are trying to get at, sorry.
