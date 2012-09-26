From: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 15:10:58 +0200
Message-ID: <20120926131058.GA9891@glitch>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
 <201209261038.36223.arnd@arndb.de>
 <20120926104421.GA7040@n2100.arm.linux.org.uk>
 <201209261205.01351.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201209261205.01351.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 26, 2012 at 12:05:01PM +0000, Arnd Bergmann wrote:
> On Wednesday 26 September 2012, Russell King - ARM Linux wrote:
> > That rubbishes the idea of a single kernel though, which is to give
> > distros a single kernel image that they can boot on different ARM
> > platforms.
> > 
> > They want a single kernel binary that works everywhere, not one which
> > they need to select the right binary to work on platform X.  Yes, the
> > internal uncompressed bulk may be the same, but it would require
> > distros to carry around N different kernel images for N different
> > platforms.
> 
> Right. It still helps the distros ensure that they only have a single
> configuration and a single binary to test, which I expect is their main
> interest, but keeping multiple copies of the same binary with different
> headers is a bit silly, I agree.
> 
> On PowerPC, we have a similar problem, and the way that distros usually
> deal with that is to do the final link of the zImage from the post-install
> stage of their rpm or deb packages, depending on the platform they are
> on. In the same stage, they also link in the newly created initrd and
> the device tree blob if necessary.

Wouldn't help to have a sort of generic console driver in the decompressor
accepting some regs and masks provided by DT? This would fit most of the
uarts around, would be totally generic and multi-platform friendly.

Regards,
Domenico
