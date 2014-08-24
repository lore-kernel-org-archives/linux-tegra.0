From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: apalis/colibri t30: fix on-module 5v0
 supplies
Date: Sun, 24 Aug 2014 11:21:51 -0700
Message-ID: <20140824182151.GA11563@localhost>
References: <1408735510-2654-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408735510-2654-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 22, 2014 at 01:25:10PM -0600, Stephen Warren wrote:
> From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
> 
> Working on Gigabit/PCIe support in U-Boot for Apalis T30 I realised
> that the current device tree source includes for our modules only
> happen to work due to referencing the on-carrier 5v0 supply from USB
> which is not at all available on-module. The modules actually contain
> TPS60150 charge pumps to generate the PMIC required 5 volts from the
> one and only 3.3 volt module supply. This patch fixes this.
> 
> (Note: When back-porting this to v3.16 stable releases, simply drop the
> change to tegra30-apalis.dtsi; that file was added in v3.17)
> 
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> #v3.16+
> Signed-off-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.


-Olof
