From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: add Ventana backlight device
Date: Fri, 29 Jun 2012 10:06:37 -0600
Message-ID: <4FEDD28D.1000303@wwwdotorg.org>
References: <1340976299-27601-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340976299-27601-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/29/2012 07:24 AM, Alexandre Courbot wrote:
> Add the backlight device to the Ventana device tree.

As I mentioned downstream, I have a patch to add all the regulators for
Ventana to DT. This patch should be rebased on top of that, since it
adds the backlight regulator node too, but co-locates it with a bunch of
other regulators, so won't merge with this patch.

I hope I'll be able to publish an updated version of the Ventana patch
today.

But aside from that, this patch looks reasonable.
