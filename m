From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove UART5/UARTE from tegra124.dtsi
Date: Thu, 01 May 2014 10:45:46 -0600
Message-ID: <53627A3A.80504@wwwdotorg.org>
References: <1398962608-11867-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398962608-11867-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/01/2014 10:43 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> (This is commit 862f0eea38409ff0d7f226c1245b787e3f0e2607 upstream)
> 
> Tegra124 only has 4 UARTs. Parts of the documentation hint at a fifth
> UART, but this appears to be left-over from earlier SoC documentation.
> Remove the non-existent DT node for UART5.
> 
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.14
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> This is a backport of the upstream commit specifically for 3.13.

Sorry for the confusion; this patch really is for 3.14 just like the Cc:
stable tag above says.
