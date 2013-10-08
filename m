From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 1/6] ARM: tegra: add Tegra124 SoC support
Date: Tue, 08 Oct 2013 14:02:24 -0600
Message-ID: <525464D0.9060009@wwwdotorg.org>
References: <1381207808-14734-1-git-send-email-josephl@nvidia.com> <1381207808-14734-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381207808-14734-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 10:50 PM, Joseph Lo wrote:
> Add Tegra124 SoC support that base on CortexA15MP Core. And enable the
> SMP function that can re-use the same procedure with Tegra114.

I have applied patches 1, 2 to Tegra's for-3.13/soc branch, patches 3, 4
to Tegra's for-3.13/dt branch, not applied patch 5, and squashed patch 6
into Tegra's for-3.13/defconfig branch.
