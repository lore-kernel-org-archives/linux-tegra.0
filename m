From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 11:44:22 +0100
Message-ID: <20120926104421.GA7040@n2100.arm.linux.org.uk>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org> <201209261038.36223.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201209261038.36223.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 26, 2012 at 10:38:36AM +0000, Arnd Bergmann wrote:
> On Tuesday 25 September 2012, Stephen Warren wrote:
> > 
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Tegra's uncompress and debug-macro.S communicate to each-other. Hence,
> > we can't be left without uncompress.h in a multi-platform enabled kernel,
> > or we'll lose features. This series allows uncompress.h to be used in a
> > multi-platform kernel, restores the mvebu uncompress.h, and finally moves
> > the Tegra debug macros into the common location. The series as mainly an
> > RFC due to the outstanding question of where to put Tegra's <mach/iomap.h>
> > in the final patch.
> 
> 
> To follow up on the IRC discussion we had yesterday leading to this patch
> set, I had another idea of how to handle the same: Since the decompressor
> code is actually fairly separate from the kernel, we could also build
> multiple versions of it, and link in the same compressed vmlinux.

That rubbishes the idea of a single kernel though, which is to give
distros a single kernel image that they can boot on different ARM
platforms.

They want a single kernel binary that works everywhere, not one which
they need to select the right binary to work on platform X.  Yes, the
_internal_ uncompressed bulk may be the same, but it would require
distros to carry around N different kernel images for N different
platforms.
