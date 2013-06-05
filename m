From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 0/6] USB: make ehci-tegra its own module
Date: Wed, 5 Jun 2013 14:09:31 +0200
Message-ID: <201306051409.31575.arnd@arndb.de>
References: <1370390014-25452-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370390014-25452-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 05 June 2013, Stephen Warren wrote:
> 
> Today 01:53:28
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ehci-tegra is currently built into the main ehci-hcd driver, rather than
> being a separate module. This causes issues with multi-platform ARM
> kernels. This series separates ehci-tegra into its own module to avoid
> those problems.
> 
> Manjunath Goudar originally wrote most of this series. I've since cleaned
> it up, rebased it on Venu's recent changes to the Tegra USB driver, and
> tested it.
> 
> Note that I expect this series will need to go through the USB PHY tree,
> since it builds upon Venu's recent changes to the Tegra USB driver, which
> were applied there.

Thanks for following up on this!

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
