From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: Add API to detect SCU base address from CP15
Date: Fri, 18 Jan 2013 09:53:45 -0700
Message-ID: <50F97E19.8070607@wwwdotorg.org>
References: <1358506755-13705-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358506755-13705-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/18/2013 03:59 AM, Hiroshi Doyu wrote:
> Add API to detect SCU base address from CP15.

So this patch appears to be a dependency for the Tegra114 series from
Hiroshi. As such, I need to get it into the Tegra tree somehow.

What I'd like to propose is that I put this one patch in a topic branch
based on v3.8-rcN, send a pull request to arm-soc containing that
branch, and then merge the branch into the Tegra tree. This will allow
anyone else to use the patch in code destined for 3.9.

Or, if nobody else wants to use this function, I could just apply it
directly to the Tegra tree.

But either way, I'd need an ack from a core ARM maintainer in order to
apply this (well, v2 once it's posted).
