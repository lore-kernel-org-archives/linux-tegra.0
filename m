From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Fix typo in conversion of ARCH_NR_GPIOS to Kconfig
Date: Thu, 5 Jan 2012 20:33:46 +0000
Message-ID: <20120105203346.GE11810@n2100.arm.linux.org.uk>
References: <1325795370-21576-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325795370-21576-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 05, 2012 at 01:29:30PM -0700, Stephen Warren wrote:
> Commit 44986ab "ARM: 7240/1: Make ARCH_NR_GPIO a Kconfig variable"
> spelled ARCH_NR_GPIOS as ARCH_NR_GPIO, hence making the change
> ineffective. This change fixes that.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This should probably go into 3.3 since the patch it fixes is there. I
> don't think this issue affects any Tegra platform, but I didn't investigate
> the other platforms that set CONFIG_ARCH_NR_GPIO by default now.

Bah, I've just sent my first batch of pull requests to Linus.  Oh well,
things can stay as they are until I send the second set roughly half way
through.  Please stick it in the patch system so it doesn't get forgotten.

Thanks.
