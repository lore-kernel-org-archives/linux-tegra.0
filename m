From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v7 1/4] reset: Add APIs to manage array of resets
Date: Thu, 02 Nov 2017 13:57:59 +0100
Message-ID: <1509627479.10280.4.camel@pengutronix.de>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
         <1500479948-29988-2-git-send-email-p.zabel@pengutronix.de>
         <20171019185400.GZ1165@minitux> <1508502022.7455.6.camel@pengutronix.de>
         <20171101222418.GC28761@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171101222418.GC28761@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

Hi Bjorn,

On Wed, 2017-11-01 at 15:24 -0700, Bjorn Andersson wrote:
[...]
> > > This looks more or less identical to how regulators and clocks already
> > > deals with resources in bulk; see regulator_bulk_data and clk_bulk_data
> > > and their associated functions.
> > > 
> > > I would really like to see that you follow this model, to make it easier
> > > for developers to work with and use the various subsystems.
> > 
> > These APIs have two undesirable (in this case) properties; the driver
> > has to know the number of resets and their identifiers in advance, and
> > singular resets and bulk reset arrays can't be used interchangeably.
> 
> As a writer of device drivers as well as dts files I greatly appreciate
> when this expectations is encoded in the kernel, so that it is clear
> when the DT node is missing some resource - rather than having random
> reboots because of spelling mistakes or variations between hardware
> revisions.
> 
> We tend to express these things explicitly in the kernel, as magic
> interfaces makes things harder to debug.

I have no control over how most of those bindings are designed. While I
prefer bindings to explicitly specify resets by identifier where
possible, there are some generic bindings that just don't have this
information.
See for example the ohci/ehci-platform USB host drivers, which are used
for platform integration on various SoCs, or the Tegra pmc driver, which
has to handle resets for other peripherals when power gating.

Also, I currently don't see many drivers that would profit much from a
bulk API, as many drivers that request multiple reset controls have to
handle them individually anyway, to guarantee ordering or reset timings.
One candidate would be the pcie-qcom driver. If you are aware of more
potential users of a bulk API, please let me know.

> > Both are not well suited to this use case, which is "triggering one or
> > any number of anonymous resets together".
> > 
> 
> Triggering one is just a special case of N. 
>
> But this does not change the fact that the reset framework interface
> looks and function in a fundamentally different way than the clock and
> regulator equivalents, which will be confusing - in particular since
> most drivers will use 2 or 3 of these.

There is no way to make them work all exactly the same, as the resources
 themselves are used in different ways. Surely we should try to minimize
the API differences to allow transfer of expectations, but that should
not be the only goal.
For example neither clock nor regulator framework have support for
exclusive clocks/regulators that can be forced-off, and _optional
requests are handled differently in the gpio and regulator frameworks.

That being said, I'd be happy to add a bulk API if that actually helps
some drivers.

regards
Philipp
