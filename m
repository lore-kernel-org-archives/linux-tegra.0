From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable fhandle in tegra_defconfig
Date: Wed, 26 Mar 2014 23:20:37 +0100
Message-ID: <201403262320.37195.arnd@arndb.de>
References: <1395800972-26483-1-git-send-email-acourbot@nvidia.com> <53333303.70709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53333303.70709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 26 March 2014, Stephen Warren wrote:
> On 03/25/2014 08:29 PM, Alexandre Courbot wrote:
> > CONFIG_FHANDLE is required by systemd >= 210 to spawn a serial TTY.
> 
> The series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Patch 1/2,
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> (although not with the new systemd version that requires the change, but
> rather for regressions in Ubuntu 12.04)
> 
> 

Applied both to next/boards, thanks!

	Arnd
