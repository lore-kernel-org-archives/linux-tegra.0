From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: move tegra-ahb.h out of arch/arm/mach-tegra/
Date: Mon, 15 Oct 2012 12:05:17 -0600
Message-ID: <507C505D.6020003@wwwdotorg.org>
References: <1348091708-6622-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348091708-6622-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/19/2012 03:55 PM, Stephen Warren wrote:
> We wish to empty arch/arm/mach-tegra/include/mach/ as much as possible
> to enable single zImage. Move tegra-ahb.h to a more central location
> (suggested by Arnd, OK'd by Greg KH), and actually make tegra-ahb.c
> include the header to ensure client and provider agree on the prototype.

Applied to Tegra's for-3.8/cleanup branch.
