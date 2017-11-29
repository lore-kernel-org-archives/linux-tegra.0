From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: cros ec: spi: Simplify delay handling between
 SPI messages
Date: Wed, 29 Nov 2017 11:07:37 +0000
Message-ID: <20171129110737.t5bm5nvwsgfzfye6@dell>
References: <1510607140-30582-1-git-send-email-jonathanh@nvidia.com>
 <1510607140-30582-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510607140-30582-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 13 Nov 2017, Jon Hunter wrote:

> The EC SPI driver prevents SPI transfers being to rapidly by keeping
> track of the time the last transfer was issued via the
> 'last_transfer_ns' variable. Previously, if the 'last_transfer_ns'
> variable was zero, this indicated that no previous transfer had been
> sent and that no delay was needed. However, the EC SPI driver has
> been updated to always initialise the 'last_transfer_ns' variable
> during probe and therefore, it is no longer necessary to test if it
> is zero. Remove the code that checks if this variable is zero.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/cros_ec_spi.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
