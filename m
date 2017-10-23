From: Philipp Zabel <pza@pengutronix.de>
Subject: Re: [PATCH v7 4/4] soc/tegra: pmc: Use the new reset APIs to manage
 reset controllers
Date: Mon, 23 Oct 2017 11:20:58 +0200
Message-ID: <20171023092058.bdtixzyskncrocwl@pengutronix.de>
References: <1500479948-29988-1-git-send-email-p.zabel@pengutronix.de>
 <1500479948-29988-5-git-send-email-p.zabel@pengutronix.de>
 <1508426260.7665.24.camel@pengutronix.de>
 <1071671c-9edb-e3b0-a710-843b8644a512@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1071671c-9edb-e3b0-a710-843b8644a512@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 20, 2017 at 04:51:24PM +0100, Jon Hunter wrote:
> Hi Philipp,
> 
> On 19/10/17 16:17, Philipp Zabel wrote:
> > Hi Jon, Thierry,
> > 
> > On Wed, 2017-07-19 at 17:59 +0200, Philipp Zabel wrote:
> >> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> >>
> >> Make use of of_reset_control_array_get_exclusive() to manage
> >> an array of reset controllers available with the device.
> >>
> >> Cc: Jon Hunter <jonathanh@nvidia.com>
> >> Cc: Thierry Reding <treding@nvidia.com>
> >> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> >> [p.zabel@pengutronix.de: switch to hidden reset control array]
> >> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > will you pick this up now that the prerequisite patch 1 is contained in
> > master?
> > Please let me know if there are any issues with this patch.
> > 
> > regards
> > Philipp
> > 
> >> ---
> >> No changes since v6.
> >> ---
> >>  drivers/soc/tegra/pmc.c | 82 ++++++++++++-------------------------------------
> >>  1 file changed, 20 insertions(+), 62 deletions(-)
> >>
> >> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> >> index e233dd5dcab3d..749b218147a19 100644
> >> --- a/drivers/soc/tegra/pmc.c
> >> +++ b/drivers/soc/tegra/pmc.c
> >> @@ -124,8 +124,7 @@ struct tegra_powergate {
> >>  	unsigned int id;
> >>  	struct clk **clks;
> >>  	unsigned int num_clks;
> >> -	struct reset_control **resets;
> >> -	unsigned int num_resets;
> >> +	struct reset_control *reset;
> >>  };
> >>  
> >>  struct tegra_io_pad_soc {
> >> @@ -348,32 +347,14 @@ static int tegra_powergate_enable_clocks(struct tegra_powergate *pg)
> >>  	return err;
> >>  }
> >>  
> >> -static int tegra_powergate_reset_assert(struct tegra_powergate *pg)
> >> +static inline int tegra_powergate_reset_assert(struct tegra_powergate *pg)
> >>  {
> >> -	unsigned int i;
> >> -	int err;
> >> -
> >> -	for (i = 0; i < pg->num_resets; i++) {
> >> -		err = reset_control_assert(pg->resets[i]);
> >> -		if (err)
> >> -			return err;
> >> -	}
> >> -
> >> -	return 0;
> >> +	return reset_control_assert(pg->reset);
> >>  }
> >>  
> >> -static int tegra_powergate_reset_deassert(struct tegra_powergate *pg)
> >> +static inline int tegra_powergate_reset_deassert(struct tegra_powergate *pg)
> >>  {
> >> -	unsigned int i;
> >> -	int err;
> >> -
> >> -	for (i = 0; i < pg->num_resets; i++) {
> >> -		err = reset_control_deassert(pg->resets[i]);
> >> -		if (err)
> >> -			return err;
> >> -	}
> >> -
> >> -	return 0;
> >> +	return reset_control_deassert(pg->reset);
> >>  }
> 
> Nit-pick ... I think we should just get rid of this inline functions now
> and just call reset_control_assert/deassert() where these are used.
> 
[...]
> 
> Otherwise ...
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Thierry has just sent out his pull requests for v4.15 so we may have
> missed this release :-(

Thanks, I'll drop the inline functions and send a new version, then.

regards
Philipp
