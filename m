From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v7 1/4] reset: Add APIs to manage array of resets
Date: Fri, 20 Oct 2017 14:20:22 +0200
Message-ID: <1508502022.7455.6.camel@pengutronix.de>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
         <1500479948-29988-2-git-send-email-p.zabel@pengutronix.de>
         <20171019185400.GZ1165@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171019185400.GZ1165@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, 2017-10-19 at 11:54 -0700, Bjorn Andersson wrote:
> On Wed 19 Jul 08:59 PDT 2017, Philipp Zabel wrote:
> 
> > From: Vivek Gautam <vivek.gautam@codeaurora.org>
> > 
> > Many devices may want to request a bunch of resets and control them. So
> > it's better to manage them as an array. Add APIs to _get() an array of
> > reset_control, reusing the _assert(), _deassert(), and _reset() APIs for
> > single reset controls. Since reset controls already may control multiple
> > reset lines with a single hardware bit, from the user perspective, reset
> > control arrays are not at all different from single reset controls.
> > Note that these APIs don't guarantee that the reset lines managed in the
> > array are handled in any particular order.
> > 
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > [p.zabel@pengutronix.de: changed API to hide reset control arrays behind
> >  struct reset_control]
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> This looks more or less identical to how regulators and clocks already
> deals with resources in bulk; see regulator_bulk_data and clk_bulk_data
> and their associated functions.
> 
> I would really like to see that you follow this model, to make it easier
> for developers to work with and use the various subsystems.

These APIs have two undesirable (in this case) properties; the driver
has to know the number of resets and their identifiers in advance, and
singular resets and bulk reset arrays can't be used interchangeably.
Both are not well suited to this use case, which is "triggering one or
any number of anonymous resets together".

I have nothing against adding a bulk API as well. There are already
users such as the pcie-qcom driver that could profit from it.

regards
Philipp
