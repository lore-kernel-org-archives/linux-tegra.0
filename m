From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] arm/tegra: select AUTO_ZRELADDR by default
Date: Fri, 14 Oct 2011 14:01:51 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A3A6@HQMAIL01.nvidia.com>
References: <1317172068-14872-1-git-send-email-pdeschrijver@nvidia.com>
 <201110141729.41515.arnd@arndb.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A283@HQMAIL01.nvidia.com>
 <201110141827.53906.arnd@arndb.de>
 <CAOesGMgDwMeVmwo1WJ3tU+ZdjCSJ6F8mY42e_KwTmzAkGQsqmg@mail.gmail.com>
 <20111014192011.GS21648@n2100.arm.linux.org.uk>
 <alpine.LFD.2.02.1110141549160.17040@xanadu.home>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A362@HQMAIL01.nvidia.com>
 <alpine.LFD.2.02.1110141631530.17040@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1110141631530.17040-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Nicolas Pitre wrote at Friday, October 14, 2011 2:45 PM:
> On Fri, 14 Oct 2011, Stephen Warren wrote:
...
> > I did originally briefly look into getting U-Boot to boot a zImage, but
> > that looked like a far more invasive patch. There were rumours of some
> > chip's custom U-Boot already having such support, but I couldn't find
> > it, nor any evidence of such support in mainline U-Boot.
> 
> FRom my clone of the u-Boot repo:
> 
> $ git grep -l zImage
> README
> arch/sh/lib/zimageboot.c
> arch/x86/lib/zimage.c
> ...
> 
> Even the name of some of those files clearly hints zImage support.
> 
> In any case, loading zImage should be even simpler than loading uImage.
> It is the same as loading uImage except that you just have to skip the
> checking and relocating steps.

Just by way of background in case anyone is wondering why I wrote the
patch I did:

Those files both implement custom commands "zimageboot" and "zboot". I
was looking for integration with the existing "bootm" command.

The advantage of re-using "bootm" for this is that it already supports
all the stuff like setting up kernel command-lines, initrds, knowing how
to pass the FDT to the kernel, and whatever other OS-specific setup might
be required.

The disadvantage of adding zImage support to bootm is that I'd have to
teach a bunch of U-Boot image handling code about a new image format; it
already knows about "legacy uImage", "FIT" images, and I'd have to add a
third "zImage" format. Doing so would at least require adding a lot of
"case IMAGE_FORMAT_ZIMAGE" everywhere, but it'd probably be best to add
some kind of vtable for image formats to move all the image-format
knowledge into format-specific files, leaving the users of the images
with much smaller code.

I didn't feel like making such a large change. Hence, I chose to make a
small change to the existing uImage support.

Now admittedly I did say I didn't find any traces of zImage support, which
isn't what I'm saying here; I guess I forgot about the stuff I did find
soon after I chose the path of modifying the uImage formats.

-- 
nvpublic
