From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] ASOC: tegra: move AC97 clock defines to the controller
 node
Date: Tue, 23 Jul 2013 09:47:34 -0700
Message-ID: <51EEB3A6.1060507@wwwdotorg.org>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de> <1374442132-24040-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/21/2013 02:28 PM, Lucas Stach wrote:
> Different from other Tegra sound controllers drivers, the AC97
> controller driver uses the tegra asoc utils directly to request the
> needed clocks, as they are needed at AC97 init time. Move the DT clock
> defines to the right place.

I'm not convinced this is the correct approach.

The machine driver needs to manage these clocks, so that it can
co-ordinate between different audio paths. For example, consider a
system that supports two different I2S paths. In HW, if both are active
at once, these need to both run at a derivative of 48KHz or both run at
a derivative of 44.1KHz. The machine driver is the central place that
enforces that, and should eventually automatically place constraints on
one stream when another is configured for a specific sample rate. By the
same argument, AC'97 can't be a special case here, in case there's some
system with both AC'97 and I2S hooked up.
