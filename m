From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix suspend hang on Tegra124 Chromebooks
Date: Tue, 22 Dec 2015 15:42:03 -0800
Message-ID: <20151222234203.GA28181@localhost>
References: <1449570409-30244-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449570409-30244-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 08, 2015 at 10:26:49AM +0000, Jon Hunter wrote:
> Enabling CPUFreq support for Tegra124 Chromebooks is causing the Tegra124
> to hang when resuming from suspend.
> 
> When CPUFreq is enabled, the CPU clock is changed from the PLLX clock to
> the DFLL clock during kernel boot. When resuming from suspend the CPU
> clock is temporarily changed back to the PLLX clock before switching back
> to the DFLL. If the DFLL is operating at a much lower frequency than the
> PLLX when we enter suspend, and so the CPU voltage rail is at a voltage
> too low for the CPUs to operate at the PLLX frequency, then the device
> will hang.
> 
> Please note that the PLLX is used in the resume sequence to switch the CPU
> clock from the very slow 32K clock to a faster clock during early resume
> to speed up the resume sequence before the DFLL is resumed.
> 
> Ideally, we should fix this by setting the suspend frequency so that it
> matches the PLLX frequency, however, that would be a bigger change. For
> now simply disable CPUFreq support for Tegra124 Chromebooks to avoid the
> hang when resuming from suspend.
> 
> Fixes: 9a0baee960a7 ("ARM: tegra: Enable CPUFreq support for Tegra124
> 		      Chromebooks")
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> 
> Please note that this fix is required for v4.4

Since I saw this mentioned on IRC, I applied it directly to the arm-soc
fixes branch.


Thanks,

-Olof
