From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARM: uncompress.h multi-platform enablement
Date: Wed, 26 Sep 2012 09:34:46 -0600
Message-ID: <50632096.7080208@wwwdotorg.org>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org> <201209261417.18883.arnd@arndb.de> <506315A6.3090300@am.sony.com> <201209261449.48468.arnd@arndb.de> <20120926151023.GC30938@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120926151023.GC30938-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tim Bird <tim.bird-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/26/2012 09:10 AM, Russell King - ARM Linux wrote:
> On Wed, Sep 26, 2012 at 02:49:48PM +0000, Arnd Bergmann wrote:
>> Right now, a multiplatform kernel has no way of debugging the
>> decompressor using console output, so it's actually /smaller/
>> than a single-platform kernel, but also less capable.
> 
> Err, are you sure about all your details above?  You do realise when
> debugging is disabled there is no debug code included anywhere in the
> decompressor?
> 
> I think what you're referring to is not the debug output, but the normal
> decompressor output.  (The "Decompressing Linux..." message is not
> debug output.)
> 
> Let's be a little more clear about what "less capable" means - it will
> be unable to report any errors that occur during the decompression.
> What that means is that you'll end up with mere silence should an
> error occur.

In the Tegra case, by omitting uncompress.h, we lose more than just the
"Decompressing Linux..." message; uncompress.h contains code to parse
extract the platform's debug UART ID from data set up by the boot ROM
(since we have 5 UARTs), and pass this on to debug-macro.S. Without
uncompress.h running, debug-macro.S would either have to hard-code a
single UART ID (and different boards uses different UARTs, which would
make running a single kernel image across all Tegra devices with
earlyprintk enabled impossible) *or* we'd have to port the UART ID
extraction code to debug-macro.S too, which I don't fancy very much
since that's assembly whereas uncompress.h is C.
