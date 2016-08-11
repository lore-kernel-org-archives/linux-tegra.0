From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/6] i2c: tegra: Add runtime power-management support
Date: Thu, 11 Aug 2016 20:31:02 +0530
Message-ID: <57AC932E.5060205@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com> <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470910620-9898-6-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 11 August 2016 03:46 PM, Jon Hunter wrote:
> Update the Tegra I2C driver to use runtime PM and move the code in the
> tegra_i2c_clock_enable/disable() functions to the PM runtime resume and
> suspend callbacks, respectively.
>
> Note that given that CONFIG_PM is not mandatory for Tegra, if CONFIG_PM
> is not enabled and so runtime PM is not enabled, ensure that the I2C
> clocks are turned on during probe and kept on by calling the resume
> callback directly.
>
> In the function tegra_i2c_init(), the variable 'err' does not need to be
> initialised to zero in tegra_i2c_init() because it is initialised when
> pm_runtime_get_sync() is called. Furthermore, to ensure we only return 0
> from tegra_i2c_init(), it is necessary to re-initialise 'err' to 0 after
> a successful call to pm_runtime_get_sync() because it can return a
> positive value on success. However, alternatively re-initialise 'err' by
> using the return value of the function tegra_i2c_flush_fifos() because
> it can only be 0 or -ETIMEDOUT.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
