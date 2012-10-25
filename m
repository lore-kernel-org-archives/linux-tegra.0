From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Tegra DRM on AC100
Date: Thu, 25 Oct 2012 09:34:56 +0200
Message-ID: <1811357.kEBJ3Y56iK@fb07-iapwap2>
References: <1351108489.16610.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351108489.16610.8.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thomas,

Am Mittwoch, 24. Oktober 2012, 21:54:49 schrieb Thomas Meyer:
> Hi,
> 
> I'm trying to run Thierry's latest linux kernel
> (git://gitorious.org/thierryreding/linux.git branch: tegra/next commit:
> 1633170) which contains the Tegra DRM driver on my AC100, but without
> success.
> 
> I did these steps:
> 1.) Patch kernel with attached patches. One patch is to support the
> native AC100 partition scheme, the other one is for the device tree.
> 
> 2.) Compile the kernel with the attached boot config.
> 3.) attach the compiled device-tree file to the zImage via "cat zImage
> tegra20-paz00 > zImage".
> 4.) Use abootimg to create an android boot loader file
> 
> After a reboot all I get is a blank screen, no messages, no errors,
> nothing. Sadly this device has no serial port, so any help is
> appreciated!
> 
> What am I missing/doing wrong?

this branch can not initialize the backlight yet. Just power off the machine 
and let fastboot do the work for you.

Marc
