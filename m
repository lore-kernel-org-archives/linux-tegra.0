From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add AHB driver
Date: Mon, 23 Apr 2012 18:32:15 +0000
Message-ID: <201204231832.16268.arnd@arndb.de>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com> <201204231233.09423.arnd@arndb.de> <4F9598AD.2030308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F9598AD.2030308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 23 April 2012, Stephen Warren wrote:
> I don't know whether it has to be early, but if this driver isn't going
> to be instantiated from device tree, I'd prefer it to be initialized by
> an explicit function call from the boards or common code rather than an
> initcall. It seems a lot easier to keep track of all the initialization
> by doing it explicitly. That said, it's quite possible this API couuld
> be called from say init_machine instead of init_early though.

Having it called from init_machine sounds ok, as long as it still
scans the device tree for the addresses rather than hardcoding.

	Arnd
