From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] rtc: tegra: set range
Date: Mon, 8 Apr 2019 13:54:06 +0200
Message-ID: <20190408115406.GJ7480@piout.net>
References: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
 <20190408102249.GC6644@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408102249.GC6644@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-rtc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/04/2019 12:22:49+0200, Thierry Reding wrote:
> On Sun, Apr 07, 2019 at 11:16:44PM +0200, Alexandre Belloni wrote:
> > The Tegra 20 RTC is a 32bit seconds counter (with an unused millisecond
> > counter).
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/rtc/rtc-tegra.c | 24 ++++++++++++++----------
> >  1 file changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> > index c6b0a99aa3a9..3f93a1f7abb5 100644
> > --- a/drivers/rtc/rtc-tegra.c
> > +++ b/drivers/rtc/rtc-tegra.c
> > @@ -306,6 +306,13 @@ static int __init tegra_rtc_probe(struct platform_device *pdev)
> >  
> >  	info->tegra_rtc_irq = ret;
> >  
> > +	info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> > +	if (IS_ERR(info->rtc_dev))
> > +		return PTR_ERR(info->rtc_dev);
> > +
> > +	info->rtc_dev->ops = &tegra_rtc_ops;
> > +	info->rtc_dev->range_max = U32_MAX;
> 
> The placement of this new block seems somewhat arbitrary, but either
> way:
> 

Well, I needed it to be before the clk_prepare_enable call so it can
just return and I thought it would be better to leave devm_clk_get close
to that clk_prepare_enable call. I don't mind, I can respin with it
placed somewhere else.

> Acked-by: Thierry Reding <treding@nvidia.com>



-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
