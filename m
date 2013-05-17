From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: DT: tegra: Add gpio-leds to Tegra30 Beaver
Date: Fri, 17 May 2013 17:52:29 -0600
Message-ID: <5196C2BD.4040709@wwwdotorg.org>
References: <1368232829-25716-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368232829-25716-1-git-send-email-ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/10/2013 06:40 PM, Eric Brower wrote:
> Add support for general-purpose LEDs present on Beaver

I've applied this to Tegra's for-3.11/dt branch. When applying, I moved
the newly added node to maintain the node sort order.
