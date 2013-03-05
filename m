From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 06/10] ARM: dts: tegra: add the PM configurations of PMC
Date: Tue, 05 Mar 2013 11:57:40 -0700
Message-ID: <51364024.3070203@wwwdotorg.org>
References: <1362397259-5888-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362397259-5888-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 04:40 AM, Joseph Lo wrote:
> Adding the PM configuration of PMC when the platform support suspend
> function.

I think this patch should come after the current patch 9/10. The reason
is that this patch enables system suspend using LP2 mode on the boards,
yet patches 8/10 and 9/10 are required for system suspend to operate
correctly.
