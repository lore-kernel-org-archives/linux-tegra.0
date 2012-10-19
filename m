From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra: move debug-macro.S to include/debug
Date: Fri, 19 Oct 2012 10:37:09 -0600
Message-ID: <508181B5.3020207@wwwdotorg.org>
References: <1350328024-30485-1-git-send-email-swarren@wwwdotorg.org> <1350328024-30485-3-git-send-email-swarren@wwwdotorg.org> <507EC303.1080000@gmail.com> <507EDB37.1060102@wwwdotorg.org> <507F1F31.2060503@wwwdotorg.org> <20121018095328.GS21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121018095328.GS21164-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 03:53 AM, Russell King - ARM Linux wrote:
> On Wed, Oct 17, 2012 at 03:12:17PM -0600, Stephen Warren wrote:
>> That implies we really do need to keep the two pieces of code completely
>> in sync, so a shared header is the right way to go. It also implies that
>> having duplicate mappings of the same physical address doesn't cause any
>> immediate obvious catastrophic problems.
>>
>> Ways we might avoid files in arch/arm/include/debug having to use
>> relative include paths to pick up that header are:
> 
> Why not take the opposite approach.  Treat the platform as setting up the
> addresses for the UART.  Then arrange for the debug macros to match that.

Well, wouldn't the debug macros match it by including a common header
file that defined the virtual address:-)

> Or we define a common virtual address for debug UARTs (which platforms
> would not be able to use).

That seems like good idea.

>> b) Rework debug-macro.S so that it isn't an include file, but rather a
>> regular top-level file.
> 
> No, that won't work.  It's used in two places - the kernel and the
> decompressor.  Hence why it is an include file (it's not an include
> file just for the fun of it.)

Can't the file just be compiled twice by the two different Makefiles?
