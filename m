From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Date: Fri, 7 Jun 2019 14:11:26 +0200
Message-ID: <20190607121126.GG5168@piout.net>
References: <20190605122613.21303-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605122613.21303-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/06/2019 15:26:13+0300, Dmitry Osipenko wrote:
> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
> macro has no effect for the OF drivers since the alias is overridden by
> the drivers core to follow the OF naming convention of the driver's alias,
> which is based on the device-tree matching name.
> 
> $ cat /sys/devices/soc0/7000e000.rtc/modalias
> of:NrtcT(null)Cnvidia,tegra20-rtc
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/rtc/rtc-tegra.c | 1 -
>  1 file changed, 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
