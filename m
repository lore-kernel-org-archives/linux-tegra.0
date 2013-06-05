From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] Add support for Tegra114 SPI boot device
Date: Wed, 05 Jun 2013 10:45:47 -0600
Message-ID: <51AF6B3B.40703@wwwdotorg.org>
References: <1370421333-2748-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370421333-2748-1-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/05/2013 02:35 AM, Penny-u79uwXL29TY76Z2rM5mHXA@public.gmane.org wrote:
> From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This patch adds SpiFlashParams to generate/dump BCT for SPI flash.

This looks fine to me.

Allen, if you ack, I can apply/push if you want.

Penny,

When posting patches upstream, it might be a good idea to prefix the
subject line with "cbootimage:" so it's obvious what the patch is for.

Your git configuration (perhaps git send-email configuration) is a bit
broken; this email contains the following header:

From:	Penny-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chiu-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

which should be:

From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This won't stop me applying this, but you should fix that.
