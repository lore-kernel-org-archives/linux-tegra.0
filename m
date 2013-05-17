From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Add charger subnode to tps65090 node
Date: Fri, 17 May 2013 17:57:38 -0600
Message-ID: <5196C3F2.8070204@wwwdotorg.org>
References: <1365623505-6309-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365623505-6309-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/10/2013 01:51 PM, Rhyland Klein wrote:
> The charger is now represented by a distinct subnode of the tps65090
> device. Add this node and enable low current charging with it.

What's the status of the TPS60590 bindings; are they agreed upon by
NVIDIA, TI, and SlimLogic yet? In other words, is this patch still
something I should apply for 3.11, or does it need to be reworked?
