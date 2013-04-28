From: Bibek Basu <bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] pinctrl: tegra: add suspend-resume support
Date: Sun, 28 Apr 2013 19:08:15 +0530
Message-ID: <77F7DB30C698A44DA22FB222C89DE941A6692E62BC@BGMAIL01.nvidia.com>
References: <1366740542-26127-1-git-send-email-bbasu@nvidia.com>
 <20130423184332.GA31374@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130423184332.GA31374-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Thierry Reding [mailto:thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org]
> Sent: Wednesday, April 24, 2013 12:14 AM
> To: Bibek Basu
> Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Pritesh Raithatha
> Subject: Re: [PATCH 1/2] pinctrl: tegra: add suspend-resume support
> 
> * PGP Signed by an unknown key
> 
> > diff --git a/drivers/pinctrl/pinctrl-tegra.c
> > b/drivers/pinctrl/pinctrl-tegra.c
> [...]
> > @@ -41,6 +42,8 @@ struct tegra_pmx {
> >
> >  	int nbanks;
> >  	void __iomem **regs;
> > +	int *regs_size;
> 
> Perhaps this should be unsigned int *. The values stored in this array will
> never be negative, right?
Agree. 
> 
> >  int tegra_pinctrl_probe(struct platform_device *pdev,
> >  			const struct tegra_pinctrl_soc_data *soc_data)  {
> > -	struct tegra_pmx *pmx;
> >  	struct resource *res;
> > -	int i;
> > +	struct tegra_pmx *pmx;
> > +	int i, pg_data_size = 0;
> 
> There's a needless move of the pmx variable declaration here.
Agree
> 
> > @@ -735,6 +769,21 @@ int tegra_pinctrl_probe(struct platform_device
> *pdev,
> >  		return -ENODEV;
> >  	}
> >
> > +if (IS_ENABLED(CONFIG_PM_SLEEP))
> > +	pmx->regs_size = devm_kzalloc(&pdev->dev,
> > +				pmx->nbanks * sizeof(*(pmx->regs_size)),
> > +				GFP_KERNEL);
> > +	if (!pmx->regs_size) {
> > +		dev_err(&pdev->dev, "Can't alloc regs pointer\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	pmx->pg_data = devm_kzalloc(&pdev->dev, pg_data_size,
> GFP_KERNEL);
> > +	if (!pmx->pg_data) {
> > +		dev_err(&pdev->dev, "Can't alloc pingroup data pointer\n");
> > +		return -ENODEV;
> > +	}
> 
> I don't think this works the way you expect it to. The line
> 
> 	if (IS_ENABLED(CONFIG_PM_SLEEP))
> 
> is a standard conditional and therefore needs to be properly indented and
> use { and } to delimit the block.
> 
My Bad. Will fix
> > @@ -756,6 +805,9 @@ int tegra_pinctrl_probe(struct platform_device
> *pdev,
> >  			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n",
> i);
> >  			return -ENODEV;
> >  		}
> > +
> > +if (IS_ENABLED(CONFIG_PM_SLEEP))
> > +		pmx->regs_size[i] = resource_size(res);
> 
> In this case it will actually work as expected, but the if () should be properly
> indented.
> 
> Thierry
> 
Thanks for the review
Bibek
> * Unknown Key
> * 0x7F3EB3A1
