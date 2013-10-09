From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: tegra: hook the LP1 iram code area and sleep_core
 function for Tegra124
Date: Wed, 09 Oct 2013 17:25:29 -0600
Message-ID: <5255E5E9.50503@wwwdotorg.org>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com> <1381310411-11391-6-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-6-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 03:20 AM, Joseph Lo wrote:
> To support LP1, we need to hook sleep_core function. That will turn off
> MMU and jump to the IRAM to execute the rest of LP1 suspend function.
> And we need the the LP1 IRAM addr to backup the original content and
> replace it with LP1 low level support code.

Actually, I'd be tempted to squash all of patches 2-5 together.
