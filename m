From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v2 10/10] usb: chipidea: tegra: Add USB_TEGRA_PHY module
 to driver's dependencies
Date: Fri, 3 Jan 2020 08:25:36 +0100
Message-ID: <20200103072536.GA14228@qmqm.qmqm.pl>
References: <20191220015238.9228-1-digetx@gmail.com>
 <20191220015238.9228-11-digetx@gmail.com>
 <20191220035650.GC19921@b29397-desktop>
 <fb7dee6e-e645-fe45-126c-c5f1e280bc26@gmail.com>
 <20191223213234.GA28786@qmqm.qmqm.pl>
 <7174833f-8325-7fb4-d190-78ba4bed0cbb@gmail.com>
 <20191230210259.GD24135@qmqm.qmqm.pl>
 <b34972e3-569e-d74a-4d30-d52c89032a08@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b34972e3-569e-d74a-4d30-d52c89032a08@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter Chen <peter.chen@nxp.com>, Rob Herring <robh-dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 02, 2020 at 06:17:47PM +0300, Dmitry Osipenko wrote:
> 31.12.2019 00:02, Michał Mirosław пишет:
> > On Tue, Dec 24, 2019 at 07:21:05AM +0300, Dmitry Osipenko wrote:
> >> 24.12.2019 00:32, Michał Mirosław пишет:
> >>> On Fri, Dec 20, 2019 at 07:31:08AM +0300, Dmitry Osipenko wrote:
> >>>> 20.12.2019 06:56, Peter Chen пишет:
> >>>>> On 19-12-20 04:52:38, Dmitry Osipenko wrote:
> >>> [...]
> >>>>>> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> >>>>>> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> >>>>>> @@ -53,6 +53,12 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >>>>>>  	struct tegra_udc *udc;
> >>>>>>  	int err;
> >>>>>>  
> >>>>>> +	if (IS_MODULE(CONFIG_USB_TEGRA_PHY)) {
> >>>>>> +		err = request_module("phy_tegra_usb");
> >>>>>> +		if (err)
> >>>>>> +			return err;
> >>>>>> +	}
> >>>>>> +
> >>>>>
> >>>>> Why you do this dependency, if this controller driver can't
> >>>>> get USB PHY, it should return error. What's the return value
> >>>>> after calling below:
> >>>>>
> >>>>> 	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
> >>>>
> >>>> It returns -EPROBE_DEFER when phy_tegra_usb isn't loaded.
> >>>
> >>> How are other driver modules autoloaded? Isn't there an appropriate
> >>> MODALIAS or MODULE_DEVICE_TABLE in there?
> >>
> >> Hello Michał,
> >>
> >> The phy_tegra_usb module is fine by itself, it's getting autoloaded.
> >>
> >> The problem is that ci_hdrc_tegra module depends on the phy_tegra_usb
> >> module and thus the PHY module should be loaded before the CI module,
> >> otherwise CI driver fails with the EPROBE_DEFER.
> > 
> > Why, then, is CI driver not being probed again after PHY driver loads?
> > EPROBE_DEFER is what should cause driver core to re-probe a device after
> > other devices appear (PHY in this case).
> 
> CI driver is getting re-probed just fine if PHY's driver module is
> loaded manually after loading the CI's module. This patch removes this
> necessity to manually load PHY's module.
> 
> This is just a minor convenience change that brings the CI's driver
> loading behaviour on par with the behaviour of loading Tegra's EHCI
> driver module.

I fully understand the goal, but what I'm missing is that why this
doesn't work out of the box? If the PHY module is autoloaded, and so is
CI driver, and (as I understand) the driver's probe() correctly returns
EPROBE_DEFER when PHY is not probed yet, then I guess that means bug
somewhere else and the patch just covers it up.

Best Regards,
Michał Mirosław
