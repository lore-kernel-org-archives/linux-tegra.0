From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Adding board support
Date: Fri, 21 Oct 2011 13:13:17 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173D51C577@HQMAIL01.nvidia.com>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
 <20111014232404.GB916@avionic-0098.mockup.avionic-design.de>
 <20111017102658.GA12373@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A4C4@HQMAIL01.nvidia.com>
 <20111020080808.GA5450@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173D51C14B@HQMAIL01.nvidia.com>
 <20111020190827.GA31480@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111020190827.GA31480-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Thursday, October 20, 2011 1:08 PM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Thursday, October 20, 2011 2:08 AM:
> > ...
> > > I've been working some on getting our boards to boot from a device tree.
> > > Unfortunately, the U-Boot issue seems to be more of a problem than I
> > > anticipated. Since the mainline U-Boot doesn't run properly,
> >
> > What issues are you having? I assume you're referring to something more
> > than just getting stuff flashed with nvflash.
> 
> Flashing U-Boot is not the problem, but when booting the device, there's no
> output whatsoever on the debug port. That's what I meant in one of the
> previous mails. nvflash says it's loading fastboot.bin at address 0x00108000,
> and quickboot seems to use the same load address. However, U-Boot is built
> with CONFIG_SYS_TEXT_BASE set to 0x00E08000. If it is loaded to the same
> address as fastboot/quickboot it obviously cannot run. So I went ahead and
> built U-Boot (both mainline and the one from the Chromium repo) with a load
> address of 0x00108000 - to no avail.

OK, I built U-Boot with load address 0x00108000 and also see nothing at boot.
So, I've reproduced at least one of your problems.

(This is with an Android-style nvflash that configures the BCT to tell the CPU
to load/boot the bootloader at address 0x00108000, so this should work.)

So, I've added this observation into the bug I filed. I'll let you know once
we've had a chance to investigate and/or solve this.

Sorry this isn't working yet; it's pretty early days for U-Boot on Tegra
outside of ChromeOS, which uses the modified nvflash and hence doesn't hit
these issues.

-- 
nvpublic
