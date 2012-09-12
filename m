From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Linux timer interrupts not working when booting in normal-world
Date: Wed, 12 Sep 2012 13:32:44 -0600
Message-ID: <5050E35C.4050105@wwwdotorg.org>
References: <505095C9.5000108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <505095C9.5000108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/12/2012 08:01 AM, Nuno Santos wrote:
> Hi
> 
> I'm currently playing with the TrustZone technology on the Tegra2
> Harmony board, and my goal is to boot Linux not in the secure world (as
> it is in mainstream Linux), but in the normal world. However, in doing
> this, timer interrupts are not being triggered and the system halts
> early in the bootstrap stage. ...

This isn't a topic I really know anything about. I'd assume the answer
to your question is ARM-generic and not Tegra-specific; you may have
better luck asking on the main ARM Linux mailing list.

I assume you're using (or at least can reproduce the issue with)
mainline Linux, and not a downstream NVIDIA kernel? If you're using an
NVIDIA kernel, I'd suggest asking your contacts at NVIDIA about it.

> Assuming that this configuration is correct, one possible explanation
> for the absence of timer interrupts is that the Harmony board may impose
> some restrictions to the timer re-configuration in the normal world. ...

I don't think the board can impose any restrictions; the boot ROM in the
Tegra SoC is presumably identical across all instances of Tegra20, and
the code that runs after that is whatever bootloader you built and
flashed onto the board. Unless of course there are strapping/fuse
options that affect this, but if any do exist, and since Harmony is a
developer board, I'd imagine their settings would be left as wide open
as possible.

Sorry I'm not very helpful!
