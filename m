From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: moving the CPU power timer function to
 PMC driver
Date: Wed, 13 Mar 2013 11:40:06 -0600
Message-ID: <5140B9F6.3060604@wwwdotorg.org>
References: <1363163246-26368-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363163246-26368-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/13/2013 02:27 AM, Joseph Lo wrote:
> The CPU power timer set up fucntion was related to PMC register. Now moving
> it to PMC driver. And it also help to clean up the PM related code later.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This series was based on the patch set of suspending support.

So the series is based on the suspend series in terms of patch context,
but does it actually /depend/ on that series?

This series feels like cleanup to me, so I'd be tempted to apply it to
Tegra's for-3.10/cleanup branch, whereas I was planning on applying the
suspend series to its own for-3.10/suspend topic branch.

If that won't work, I guess I can apply this series on top of the
suspend series in the suspend topic branch.
