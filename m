From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] Some Tegra I2C Updates
Date: Wed, 24 Aug 2016 12:10:23 +0100
Message-ID: <f5152264-b42b-08ca-cc56-bcdfe78a2ec7@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Wolfram,

On 11/08/16 11:16, Jon Hunter wrote:
> Add runtime-pm and pinctrl support for Tegra I2C driver.
> 
> The first 4 patches are trivial clean-up/simplification changes.
> 
> Jon Hunter (6):
>   i2c: tegra: Add missing new line characters
>   i2c: tegra: Remove non device-tree support
>   i2c: tegra: Use device name for adapter name
>   i2c: tegra: Simplify I2C resume
>   i2c: tegra: Add runtime power-management support
>   i2c: tegra: Add pinctrl support
> 
>  drivers/i2c/busses/i2c-tegra.c | 97 +++++++++++++++++++++++++++---------------
>  1 file changed, 63 insertions(+), 34 deletions(-)

Any comments or can these be queued?

Cheers
Jon

-- 
nvpublic
