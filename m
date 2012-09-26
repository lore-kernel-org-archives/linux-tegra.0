From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 10:38:36 +0000
Message-ID: <201209261038.36223.arnd@arndb.de>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348613212-21897-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 25 September 2012, Stephen Warren wrote:
> 
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra's uncompress and debug-macro.S communicate to each-other. Hence,
> we can't be left without uncompress.h in a multi-platform enabled kernel,
> or we'll lose features. This series allows uncompress.h to be used in a
> multi-platform kernel, restores the mvebu uncompress.h, and finally moves
> the Tegra debug macros into the common location. The series as mainly an
> RFC due to the outstanding question of where to put Tegra's <mach/iomap.h>
> in the final patch.


To follow up on the IRC discussion we had yesterday leading to this patch
set, I had another idea of how to handle the same: Since the decompressor
code is actually fairly separate from the kernel, we could also build
multiple versions of it, and link in the same compressed vmlinux.

We already allow building Image/zImage/uImage from the same vmlinux,
and that could theoretically be extended.

Your approach of course also sounds ok, and we could eventually combine
the two.

	Arnd
