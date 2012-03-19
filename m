From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: update main repo and add patchwork
Date: Mon, 19 Mar 2012 21:09:00 +0000
Message-ID: <201203192109.00862.arnd@arndb.de>
References: <1332092651-25346-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332092651-25346-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sunday 18 March 2012, Olof Johansson wrote:
> Stephen is taking over the main tegra repo, so change the entry to point at his tree on kernel.org
> 
> Also, document the patchwork URL.
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> 
> 
> Arnd, I applied the previous Tegra maintainer patch to next/maintainers
> directly, so this should just go on top of there.

Hi Olof,

I've applied all four trivial pull requests now, the dt ones ended up on the next/dt2
branch and will be sent together with the other late dt patches, which meant that
I also had to pull in the previous tegra/dt patches into both next/dt2 in addition
to next/dt.

	Arnd
