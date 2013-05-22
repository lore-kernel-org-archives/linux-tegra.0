From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/6] ARM: tegra114: add CPU hotplug support
Date: Wed, 22 May 2013 15:21:24 -0600
Message-ID: <519D36D4.3010100@wwwdotorg.org>
References: <1369046369-12489-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369046369-12489-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/20/2013 04:39 AM, Joseph Lo wrote:
> Tegra 114 is different with other Tegra SoC chips. It using ARM Cortex-A15
> as CPU core and a enhanced flow controller for CPU power control. So
> we need to skip some code that was for Contex-A9 and some other support
> code that was for other Tegra SoC chips. Then adding the proper power up
> and hot plug control for Tegra114.

I have applied the series to Tegra's for-3.11/soc branch.
