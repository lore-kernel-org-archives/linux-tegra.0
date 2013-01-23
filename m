From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: DT: tegra: move serial clock-frequency attr
 into the SoC dtsi
Date: Wed, 23 Jan 2013 09:47:50 -0700
Message-ID: <51001436.5020506@wwwdotorg.org>
References: <1358423961-24318-1-git-send-email-dev@lynxeye.de> <1358891169-5939-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358891169-5939-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 02:46 PM, Lucas Stach wrote:
> No Tegra Platform is running PLL_P at another rate than 216MHz, nor is
> any using an other PLL as UART source clock. Move attribute into SoC
> level dtsi file to slim down board DT files.

I've applied the series to Tegra's for-3.9/dt branch.
