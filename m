From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 1/4] reset: Add APIs to manage array of resets
Date: Wed, 1 Nov 2017 15:24:18 -0700
Message-ID: <20171101222418.GC28761@minitux>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
 <1500479948-29988-2-git-send-email-p.zabel@pengutronix.de>
 <20171019185400.GZ1165@minitux>
 <1508502022.7455.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508502022.7455.6.camel@pengutronix.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

On Fri 20 Oct 05:20 PDT 2017, Philipp Zabel wrote:

> Hi,
> 
> On Thu, 2017-10-19 at 11:54 -0700, Bjorn Andersson wrote:
> > On Wed 19 Jul 08:59 PDT 2017, Philipp Zabel wrote:
> > 
> > > From: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > 
> > > Many devices may want to request a bunch of resets and control them. So
> > > it's better to manage them as an array. Add APIs to _get() an array of
> > > reset_control, reusing the _assert(), _deassert(), and _reset() APIs for
> > > single reset controls. Since reset controls already may control multiple
> > > reset lines with a single hardware bit, from the user perspective, reset
> > > control arrays are not at all different from single reset controls.
> > > Note that these APIs don't guarantee that the reset lines managed in the
> > > array are handled in any particular order.
> > > 
> > > Cc: Felipe Balbi <balbi@kernel.org>
> > > Cc: Jon Hunter <jonathanh@nvidia.com>
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > [p.zabel@pengutronix.de: changed API to hide reset control arrays behind
> > >  struct reset_control]
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > This looks more or less identical to how regulators and clocks already
> > deals with resources in bulk; see regulator_bulk_data and clk_bulk_data
> > and their associated functions.
> > 
> > I would really like to see that you follow this model, to make it easier
> > for developers to work with and use the various subsystems.
> 
> These APIs have two undesirable (in this case) properties; the driver
> has to know the number of resets and their identifiers in advance, and
> singular resets and bulk reset arrays can't be used interchangeably.

As a writer of device drivers as well as dts files I greatly appreciate
when this expectations is encoded in the kernel, so that it is clear
when the DT node is missing some resource - rather than having random
reboots because of spelling mistakes or variations between hardware
revisions.

We tend to express these things explicitly in the kernel, as magic
interfaces makes things harder to debug.

> Both are not well suited to this use case, which is "triggering one or
> any number of anonymous resets together".
> 

Triggering one is just a special case of N. 


But this does not change the fact that the reset framework interface
looks and function in a fundamentally different way than the clock and
regulator equivalents, which will be confusing - in particular since
most drivers will use 2 or 3 of these.

Regards,
Bjorn
