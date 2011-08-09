From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: Tegra pinmux Device Tree support
Date: Tue, 9 Aug 2011 21:18:15 +0100
Message-ID: <20110809201815.GA21684@pulham.picochip.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E@HQMAIL01.nvidia.com>
 <20110809173428.GB32195@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110809173428.GB32195-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Grant,

On Tue, Aug 09, 2011 at 11:34:28AM -0600, Grant Likely wrote:
> We talked about this a bit at Linaro connect.  Outside of the more
> complex runtime-reconfiguration of pin mux, there is a general need
> for arbitrary initialization sequences to registers.  Also, pretty
> much exactly what you need for tegra is needed for imx, omap and many
> others.  The though was, rather than trying to come up with some kind
> of pinmux-specific binding for pin states, which could end up being
> very verbose if everything was split out into properties, we could
> instead have a binding for register initialization sequences.
> Something like this:
> 
> 	pinmux-initseq = <reg1 value1> <reg1 value2> ...;
> 
> And then add some macros for DTC to make it easier to define things
> like pinmux setup tables.  Although the binding above is probably too
> simple and naive.

Unfortunately we have devices where the pinmux registers aren't directly 
memory mapped so I'm not sure that this would work for our devices 
(which admittedly don't have a friendly muxing configuration...).  We 
don't have a single way of muxing pins so at the moment we have a fairly 
hideous set of structures and macros to allow us to create smallish 
definitions of pins, but I can't see a nice way to express this in the 
DT.

At the moment I have a simple pinmux API that takes the pin name and 
setting name as strings, so I was thinking for a simple binding (for 
configuration) I could have something like:

	pinmux {
		pinmux-decode0 = "decode";
		pinmux-decode1 = "gpio";
	};

I remember in another thread you mentioned the possibility of building 
some tables and embedding the binary data in the DT, but that has 
potential problems with versioning of the structures.

Jamie
