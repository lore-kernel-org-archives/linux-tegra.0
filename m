From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/3] rtc: tegra: Dust off and deferred probe support
Date: Sat, 1 Jun 2019 22:39:55 +0200
Message-ID: <20190601203955.GZ3274@piout.net>
References: <20190527101359.5898-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527101359.5898-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Jon Hunter <jonathanh@nvidia.com>, Kartik Kartik <kkartik@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 27/05/2019 12:13:56+0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra RTC driver has accumulated a bit of dust over the
> years. Make a pass over it, addressing checkpatch warnings and fixing
> some inconsistencies in comments and kernel messages as well as in
> variable types and names.
> 
> Once cleaned up, also turn the driver into a regular driver in order
> to support deferred probe which is needed to avoid a future regression
> on Tegra186 and later.
> 
> Thierry
> 
> Thierry Reding (3):
>   rtc: tegra: checkpatch and miscellaneous cleanups
>   rtc: tegra: Use consistent variable names and types
>   rtc: tegra: Turn into regular driver
> 
>  drivers/rtc/rtc-tegra.c | 254 ++++++++++++++++++++--------------------
>  1 file changed, 128 insertions(+), 126 deletions(-)
> 

All applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
