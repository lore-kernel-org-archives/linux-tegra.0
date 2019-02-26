From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] usb: chipidea: tegra: Fix missed
 ci_hdrc_remove_device()
Date: Tue, 26 Feb 2019 11:56:15 +0100
Message-ID: <20190226105615.GA12397@kroah.com>
References: <20190224153622.8877-1-digetx@gmail.com>
 <VI1PR04MB5327FE97DC8C68B4D56DE0A98B7A0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190225080715.4965810a@dimatab>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190225080715.4965810a@dimatab>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter Chen <peter.chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 25, 2019 at 08:07:15AM +0300, Dmitry Osipenko wrote:
> В Mon, 25 Feb 2019 02:27:19 +0000
> Peter Chen <peter.chen@nxp.com> пишет:
> 
> >  
> > > 
> > > Fixes: dfebb5f43a78827a ("usb: chipidea: Add support for
> > > Tegra20/30/114/124")  
> > 
> > I suppose you need to apply at stable tree too, right?
> > 
> 
> It is enough to have the "Fixes" tag to get patch backported into all
> relevant kernel versions.

No it is not.  My scripts do NOT trigger off of the fixes: tag, please
read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.


> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > index 772851bee99b..12025358bb3c 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > > @@ -130,6 +130,7 @@ static int tegra_udc_remove(struct
> > > platform_device *pdev) {
> > >  	struct tegra_udc *udc = platform_get_drvdata(pdev);
> > > 
> > > +	ci_hdrc_remove_device(udc->dev);
> > >  	usb_phy_set_suspend(udc->phy, 1);
> > >  	clk_disable_unprepare(udc->clk);
> > >   
> >  
> > Acked-by: Peter Chen <peter.chen@nxp.com>
> > 
> > Hi Greg, would you still accept the bug-fix for this release (v5.0)?
> > Or I send you later?

I can pick it up now, thanks.

greg k-h
