From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] rtc: tegra: convert to DT driver
Date: Wed, 19 Dec 2012 10:09:21 -0700
Message-ID: <50D1F4C1.7060207@wwwdotorg.org>
References: <1355885237-4448-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355885237-4448-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/18/2012 07:47 PM, Joseph Lo wrote:
> After Kernel 3.7, the Tegra device will only support booting with DT. The
> legacy Tegra RTC platform driver will not work anymore. This patch convert
> the driver to support DT.

I think Andrew Morton usually ends up picking up drivers/rtc/ patches
since Alessandro hasn't been active recently. But since Andrew wasn't
Cc'd, I'd be happy to take this through the Tegra tree for 3.9.
