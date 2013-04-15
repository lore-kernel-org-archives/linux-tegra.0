From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: pm: fix build error w/o PM_SLEEP
Date: Mon, 15 Apr 2013 16:53:34 -0600
Message-ID: <516C84EE.8010204@wwwdotorg.org>
References: <1365730733-22701-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365730733-22701-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2013 07:38 PM, Joseph Lo wrote:
> This fixes the building error when the PM_SLEEP is disabled. The fucntional
> defintion of "tegra_pm_validate_suspend_mode" without "static inline"
> would become a multiple definition error.

Thanks. I have forwarded this to arm-soc to be applied.
