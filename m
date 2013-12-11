From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Trimslice Barebone fails to detect HDMI connection, no DDC i2c
 channel present
Date: Wed, 11 Dec 2013 15:17:23 -0700
Message-ID: <52A8E473.8050502@wwwdotorg.org>
References: <20131211214911.GA24176@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131211214911.GA24176-hOhETlTuV5niMG9XS5x8Mg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/11/2013 02:49 PM, Liviu Dudau wrote:
> Hello,
> 
> Prompted by a discussion on G+, here is a report of an issue I'm seeing
> with mainline kernel (commit 78fd82238d0e57).
> 
> The kernel fails to detect the DDC i2c interface (on Trimslice that's
> on Tegra2 I2C-0 interface), so I'm getting no output on the HDMI

That probably should be I2C-1 for HDMI; I2C-0 is likely the DVI port's
DDC interface. But since you tested all ports, this isn't the cause of
the problem.

> U-Boot 2014.01-rc1-dirty (Nov 26 2013 - 22:29:37)

Are you using an unmodified upstream U-Boot? The environment you posted
doesn't match upstream's environment, and the "-dirty" implies you have
some local modifications.

If you break into U-Boot, can you read the EDID using the "i2c" command?

In Linux, can you "i2cget" from bus 1 device 0x50 even if "i2cdetect"
didn't see the EDID?

Is the monitor you have plugged in known-working without any
EDID-related issues?
