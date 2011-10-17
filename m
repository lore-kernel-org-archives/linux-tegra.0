From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Adding board support
Date: Mon, 17 Oct 2011 09:15:58 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4@HQMAIL01.nvidia.com>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
 <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111017102658.GA12373-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Monday, October 17, 2011 4:27 AM:
> * Thierry Reding wrote:
> > * Stephen Warren wrote:
> > > ... [U-Boot patch/build instructions]
> > > Then, run nvflash just like you would normally.
> >
> > Okay, I've been able to build U-Boot and setup some scripts that should
> > automate the nvflash procedure according to your instructions. I'll have to
> > wait until I get back to work on Monday to see whether it actually works,
> > though.
> 
> I'm unable to make this work. I've done as you said, branched from the commit
> you mentioned and applied the patches you listed. Then ran:
> 
> 	$ make CROSS_COMPILE=... O=build/harmony harmony_config
> 	$ make CROSS_COMPILE=... O=build/harmony -j8
> 
> And flashed the resulting u-boot.bin like you described, by replacing the
> fastboot.bin in the configuration with u-boot.bin. When rebooting the device
> (I used a Harmony for this testing obviously) there's nothing. No output on
> the serial line. Flashing fastboot.bin I can at least see some debugging
> output.
> 
> I also tried to update the TEXT_BASE, which seems to be 0x00108000 for
> fastboot, and 0x00E08000 for U-Boot, but that didn't make a difference. Any
> ideas on what could be the problem?

Ah yes, sorry, I'd forgotten about that.

The default load address for fastboot and U-Boot is different. I don't
know why, but apparently U-Boot doesn't work when built with a load
address that matches fastboot. I believe we have a bug filed to investigate
why, but I don't know any more details.

> I'm not quite sure where these values come from. Are they hard-coded in the
> boot ROM? And how does it know from which NAND partition to load the
> bootloader?

These addresses exist in a couple places:

* In the BCT, which tells the boot ROM the SDRAM address where the boot-
loader should be copied to, and what the entry point is.

* Hard-coded into nvflash, and the fastboot.bin used during the flashing
process.

Hence, internally, I believe we use nvflash/fastboot.bin that have been
specifically recompiled to support U-Boot's load address.

Thinking about this some more, I think we have shipped those rebuilt
versions outside NVIDIA in a publically accessible place. I'll follow
up internally and see if we have, or what we can do about it. Sorry for
sending you on a wild goose chase.

-- 
nvpublic
