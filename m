From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: Restore USB/PCIE info in new DT board
 file
Date: Fri, 08 Feb 2013 10:58:33 -0700
Message-ID: <51153CC9.4090906@wwwdotorg.org>
References: <1360308574-19658-1-git-send-email-hdoyu@nvidia.com> <1360308574-19658-5-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360308574-19658-5-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/08/2013 12:29 AM, Hiroshi Doyu wrote:
> Mainly for the compatibility for the existing driver.
> This would be removed once new USB/PCIE DT supports come.

This series makes Tegra20 broken between commit 3/4 and 4/4. Why not do
the following instead:

1) Patch 1/4 as-is.

2) Rename board-dt-tegra20.c to tegra.c with no code changes to it.

3) Add Tegra30/114 compatible values into tegra.c, and delete the old
Tegra30/114-specific board files.

Fewer patches, and each patch builds and runs on all systems without any
issue.
