From: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Re: Trimslice Barebone fails to detect HDMI connection, no DDC i2c
 channel present
Date: Wed, 11 Dec 2013 22:54:01 +0000
Message-ID: <20131211225401.GB24176@bart.dudau.co.uk>
References: <20131211214911.GA24176@bart.dudau.co.uk>
 <52A8E473.8050502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A8E473.8050502-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 11, 2013 at 03:17:23PM -0700, Stephen Warren wrote:
> On 12/11/2013 02:49 PM, Liviu Dudau wrote:
> > Hello,
> > 
> > Prompted by a discussion on G+, here is a report of an issue I'm seeing
> > with mainline kernel (commit 78fd82238d0e57).
> > 
> > The kernel fails to detect the DDC i2c interface (on Trimslice that's
> > on Tegra2 I2C-0 interface), so I'm getting no output on the HDMI
> 
> That probably should be I2C-1 for HDMI; I2C-0 is likely the DVI port's
> DDC interface. But since you tested all ports, this isn't the cause of
> the problem.

Sorry, I had the Trimslice manual opened on the other screen while I was
composing the email and I've read the wrong paragraph. You are correct,
it is connected to I2C-1.

> 
> > U-Boot 2014.01-rc1-dirty (Nov 26 2013 - 22:29:37)
> 
> Are you using an unmodified upstream U-Boot? The environment you posted
> doesn't match upstream's environment, and the "-dirty" implies you have
> some local modifications.

Yes, the U-Boot is upstream, the only change being the removal of some
artefact from boards.cfg that got commited a while ago. The environment
is a streamlined version that I've comed up with as I didn't like the
whole scanning for u-boot scripts.

> 
> If you break into U-Boot, can you read the EDID using the "i2c" command?

Ughh, another one of the ugly, not properly documented set of U-Boot commands.
I need to read on the documentation to learn how to use it (what's the muxaddr
for tegra2?).

> 
> In Linux, can you "i2cget" from bus 1 device 0x50 even if "i2cdetect"
> didn't see the EDID?

# i2cget -y 1 0x50
Error: Read failed.

> 
> Is the monitor you have plugged in known-working without any
> EDID-related issues?

I've tried another one as well (an Atrix Lapdock), no success. The current one
is connected over an 4-to-1 box and my PC is happy to read the EDID off it
using the radeon driver.

Could you send me a log of your kernel booting with i2c being detected? I want
to compare with mine just in case there might be some config options that
I might have selected as modules and they don't get properly loaded.

Many thanks,
Liviu

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
