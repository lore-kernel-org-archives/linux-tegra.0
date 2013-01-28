From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: dt: Add reset GPIO information to PHY DT
 node
Date: Mon, 28 Jan 2013 11:49:26 -0700
Message-ID: <5106C836.2040301@wwwdotorg.org>
References: <1359022606-13359-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359022606-13359-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/24/2013 03:16 AM, Venu Byravarasu wrote:
> As reset GPIO information is PHY specific detail, adding
> it to PHY DT node.

I have applied this to Tegra's for-3.9/soc-usb branch.

A couple minor notes: Changes to DT binding definitions should really be
sent to the devicetree-discuss mailing list. I didn't insist on that
here since the change is fairly minor. Also, the Linux ARM kernel
mailing list is possibly more useful than the main Linux kernel mailing
list for ARM-/Tegra-specific patches like this.
