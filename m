From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: cpuidle: remove redundant parameters for
 powered-down mode
Date: Wed, 03 Apr 2013 15:11:21 -0600
Message-ID: <515C9AF9.9060007@wwwdotorg.org>
References: <1364901650-25335-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364901650-25335-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 05:20 AM, Joseph Lo wrote:
> After the patch series for system suspending support, tegra_idle_lp2_last()
> no longer uses its parameters cpu_on_time or cpu_off_time, so remove them.

Applied to Tegra's for-3.10/soc branch.
