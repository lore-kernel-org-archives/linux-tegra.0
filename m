From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix cdev1 and cdev2 IDs
Date: Thu, 04 Apr 2013 12:15:54 -0600
Message-ID: <515DC35A.4030301@wwwdotorg.org>
References: <1365066304-2327-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365066304-2327-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 03:05 AM, Prashant Gaikwad wrote:
> Correct IDs for cdev1 and cdev2 are 94 and 93 respectively.

This looks OK, but needs to be split up before I can apply it.

The binding change and driver changes will be applied to Tegra's
for-3.10/clk branch, since that's where clk changes are going.

The DT changes will be applied to Tegra's for-3.10/dt branch, since
that's where most of the DT content that's being edited here was
actually added, this kernel cycle.

There's no dependency between these two sets of changes, since the
clocks properties for the sound and USB PHY nodes aren't actually used
by the drivers yet; they're just being added this kernel cycle to avoid
dependencies in the next kernel version.

Mike, can you please ack this patch anyway, and I'll repost later in the
day when I get around to splitting it up and applying it. Thanks.
