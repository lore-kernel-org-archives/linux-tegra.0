From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Update driver to use
 of_pm_clk_add_clk
Date: Mon, 22 Aug 2016 11:56:31 +0530
Message-ID: <20160822062631.GN2890@localhost>
References: <1470912140-11068-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470912140-11068-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 11, 2016 at 11:42:20AM +0100, Jon Hunter wrote:
> Commit 498b5fdd40dd ("PM / clk: Add support for adding a specific clock
> from device-tree") add a new helper function for adding a clock from
> device-tree to a device. Update the ADMA driver to use this new function
> to simplify the driver.

Applied, thanks

-- 
~Vinod
