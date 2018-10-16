From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: tegra: Propagate errors from platform_get_irq()
Date: Tue, 16 Oct 2018 12:58:54 +0200
Message-ID: <20181016105854.GK17341@piout.net>
References: <20180921101209.11895-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921101209.11895-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 21/09/2018 12:12:09+0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of confusingly returning -EBUSY on failure to obtain an
> interrupt, propagate the real error code. While at it, let the user know
> why the interrupt could not be acquired.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/rtc/rtc-tegra.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
