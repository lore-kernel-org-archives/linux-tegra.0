From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 16:10:23 +0100
Message-ID: <20120926151023.GC30938@n2100.arm.linux.org.uk>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org> <201209261417.18883.arnd@arndb.de> <506315A6.3090300@am.sony.com> <201209261449.48468.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201209261449.48468.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 26, 2012 at 02:49:48PM +0000, Arnd Bergmann wrote:
> Right now, a multiplatform kernel has no way of debugging the
> decompressor using console output, so it's actually /smaller/
> than a single-platform kernel, but also less capable.

Err, are you sure about all your details above?  You do realise when
debugging is disabled there is no debug code included anywhere in the
decompressor?

I think what you're referring to is not the debug output, but the normal
decompressor output.  (The "Decompressing Linux..." message is not
debug output.)

Let's be a little more clear about what "less capable" means - it will
be unable to report any errors that occur during the decompression.
What that means is that you'll end up with mere silence should an
error occur.
