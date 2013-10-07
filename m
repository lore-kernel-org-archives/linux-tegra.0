From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM: tegra: add SMP support for Tegra124
Date: Mon, 07 Oct 2013 11:19:55 -0600
Message-ID: <5252ED3B.9060808@wwwdotorg.org>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com> <1381131085-26116-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381131085-26116-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 01:31 AM, Joseph Lo wrote:
> The power up method is same as Tegra114, so we share the same function
> for it.

These first 3 patches are all small, related, and all to the same code
in arch/arm/mach-tegra/, so they could just be squashed into a single patch.
