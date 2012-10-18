From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra: move debug-macro.S to include/debug
Date: Thu, 18 Oct 2012 14:54:44 +0100
Message-ID: <20121018135444.GT21164@n2100.arm.linux.org.uk>
References: <1350328024-30485-1-git-send-email-swarren@wwwdotorg.org> <1350328024-30485-3-git-send-email-swarren@wwwdotorg.org> <507EC303.1080000@gmail.com> <507EDB37.1060102@wwwdotorg.org> <507F1F31.2060503@wwwdotorg.org> <5080088C.9090607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5080088C.9090607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 18, 2012 at 08:47:56AM -0500, Rob Herring wrote:
> Here is what I mentioned previously. This removes the static mapping from 
> the platforms. This is untested and probably breaks on different DEBUG_LL 
> options. For now, platforms call debug_ll_io_init, but once all platforms 
> are converted, this can be called from devicemaps_init.

There's a problem with this approach.  What if the platform specifically
sets the debug addresses to be within one of it's existing mappings (which
is definitely what you'd want to do with 8250-based UARTs attached to a
PCI bus.)

This isn't going to work in that case unless we split the debug mapping
from the PCI IO space mapping.
