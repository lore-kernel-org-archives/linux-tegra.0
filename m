From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: tegra20-ehci: Add devicetree support.
Date: Tue, 19 Jul 2011 16:59:19 -0600
Message-ID: <20110719225919.GW6848@ponder.secretlab.ca>
References: <1311115617-9697-1-git-send-email-achew@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF049EBDED24@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049EBDED24-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2011 at 03:56:29PM -0700, Stephen Warren wrote:
> achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote at Tuesday, July 19, 2011 4:47 PM:
> > From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > Add code to try to get platform data information (register base, irq,
> > modes, various tuning parameters) from device tree, if not present in board
> > files.
> > 
> > Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/tegra20-ehci.txt       |   27 +++
> >  arch/arm/mach-tegra/include/mach/usb_phy.h         |    2 +-
> >  drivers/usb/host/ehci-tegra.c                      |  197 +++++++++++++++++++-
> >  3 files changed, 219 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/tegra20-ehci.txt
> 
> I sent a variety of comments on this patch internally to Andrew, but the
> email crossed paths with the posting to the public mailing lists. I won't
> bother repeating those comments here, but I assume they'll be addressed
> in a new version of this patch.

Okay, I'll wait for the next version then.

g.
