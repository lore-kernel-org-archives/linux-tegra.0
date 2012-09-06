From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: enable SUSPEND/ARCH_SUSPEND_POSSIBLE for ARCH_TEGRA
Date: Thu, 06 Sep 2012 12:28:18 -0600
Message-ID: <5048EB42.8020807@wwwdotorg.org>
References: <1346861811-6597-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346861811-6597-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/05/2012 10:16 AM, Stephen Warren wrote:
> Even though system suspend/resume hasn't been validated on Tegra yet,
> this Kconfig option needs to be enabled so that system shutdown is
> reliable on an SMP system. Without it, I2C interrupts may be routed
> to CPU0, whereas shutdown code may be running on CPU1, causing I2C
> timeouts, preventing communication with the external PMIC.
> 
> This reverts 3d5e8af "ARM: disable SUSPEND/ARCH_SUSPEND_POSSIBLE for
> ARCH_TEGRA".

Applied to Tegra's for-3.7/fixes branch.
