From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: fuse: export chip id and revision
Date: Mon, 11 Mar 2013 17:10:29 +0000
Message-ID: <20130311171029.GO4977@n2100.arm.linux.org.uk>
References: <1363005441-26329-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363005441-26329-1-git-send-email-dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 11, 2013 at 08:37:21PM +0800, Danny Huang wrote:
> Expose tegra chip id and revision in /proc/cpu/chipinfo for user mode
> usage.

I thought we weren't exporting this stuff out via procfs, but had a
soc specific way to do it - drivers/base/soc.c ?  We have soc_id and
revision attributes there... it seems to do what you want already.
