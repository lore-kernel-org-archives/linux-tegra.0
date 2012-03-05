From: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v6 11/20] tegra: fdt: Add clock bindings for
 Tegra2 Seaboard
Date: Mon, 5 Mar 2012 13:46:53 -0700
Message-ID: <20120305204653.GA913@bill-the-cat>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
 <1330375973-10681-12-git-send-email-sjg@chromium.org>
 <4F4C11E9.1050907@nvidia.com>
 <CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com>
 <CAPnjgZ1LsFeADVHRcS694EwJrz3V+ONdp9ds+bdAG5rNupQ_ag@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB0@HQMAIL01.nvidia.com>
 <CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 28, 2012 at 10:41:15AM -0800, Stephen Warren wrote:
> Simon Glass wrote at Tuesday, February 28, 2012 11:37 AM:
> > On Tue, Feb 28, 2012 at 10:31 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > Simon Glass wrote at Tuesday, February 28, 2012 10:38 AM:
> > > ...
> > >> I am going to add your binding, less the #clock-cells which U-Boot
> > >> currently can't support because it conflicts with the C preprocessor
> > >> (at some point I may look at a patch to use sed or some other means of
> > >> avoiding this).
> > >
> > > Out of curiosity, why does the C preprocessor come into it? Is U-Boot's
> > > build process running cpp on the .dts files or something? That's non-
> > > standard, although perhaps it could be a useful standard...
> > 
> > Yes, but at the moment we only use it for '/include/ ARCH_CPU_DTS'.
> 
> Uggh. That's going to make the device tree files look different between
> the kernel and U-Boot:-( With # disallowed in particular, it's going to
> prevent U-Boot from /ever/ using the correct protocols for parsing the
> device tree. This seems like an extremely bad idea.

Keeping my TI hat on, I think it'd be a bad idea to have dts stuff
divergent from the kernel.  Have you raised the problem you're trying to
solve to the general DT gurus?  My very high level hope is that someday
we can have them shared between kernel and u-boot (either directly or
something silly like a .dtss that spits out a kernel dts and a u-boot
dts).  Going with a manual sync from kernel form to u-boot form seems
like adding a burden on ourselves we might not have to.

-- 
Tom
