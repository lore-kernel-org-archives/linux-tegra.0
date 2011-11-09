From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Adding board support
Date: Wed, 9 Nov 2011 11:41:32 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174080519F@HQMAIL01.nvidia.com>
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
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
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
> output whatsoever on the debug port.

Just to close the loop on this in the mailing list archives, the issue is
now solved. The specific fix was to add "USE_PRIVATE_LIBGCC=yes" to the
make command used to build U-Boot. And just for the record (Thierry was
already trying this), CONFIG_SYS_TEXT_BASE must match those nvflash and
fastboot.bin expect, which is 0x00108000 for the binaries shipped with our
Linux4Tegra alpha 1 release.

-- 
nvpublic
