From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RE: [PATCH 3/5] ARM: dt: tegra: add ADT7461 temperature sensor topaz00 device tree
Date: Tue, 31 Jan 2012 12:48:57 +0100
Message-ID: <4539920.1hFmNlShaA@fb07-iapwap2>
References: <cover.1327776641.git.marvin24@gmx.de> <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24@gmx.de> <74CDBE0F657A3D45AFBB94109FB122FF178E12414D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E12414D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, 30. Januar 2012, 09:26:47 schrieb Stephen Warren:
> Marc Dietrich wrote at Saturday, January 28, 2012 12:03 PM:
> > Add the ADT7461 temperature monitoring IC which is connected via
> > the DVC controller.
> > 
> > diff --git a/arch/arm/boot/dts/tegra-paz00.dts
> > b/arch/arm/boot/dts/tegra-paz00.dts
> > 
> > +		adt7461@4c {
> > +			compatible = "adt7461";
> 
> Compatible should have a vendor prefix, so "adi,adt7461".

you are right, that's the problem when just copy-n-paste from seaboard. On the other 
hand, I wonder why this worked at all, because lm90 does not contain an 
of_match_table yet. Is there also some "hidden" DT->platfrom_data conversion? 

grep adi arch/*/boot/dts/ shows the PowerPC people are also using "adi,...". I'll 
send an update of the series with the correction and Acked-By.

Thanks

Marc
