From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: dt: Add pinmux entries for Vbus regulator
 controls
Date: Fri, 14 Sep 2012 09:31:07 -0600
Message-ID: <50534DBB.6010700@wwwdotorg.org>
References: <1347614754-26357-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347614754-26357-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/14/2012 03:25 AM, Venu Byravarasu wrote:
> Adding pinmux entries for PI4 and PH7 to enable Vbus for USB1
> and USB3 controllers on Cardhu A02 board.
> 
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Given our internal discussions about whether to and how to configure
open-drain and enable-input on these pins, I'd like to hold off on this
patch. Lets resolve this internally first.

Also, I assume we'll need an equivalent patch for Cardhu A04 too.
