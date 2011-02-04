From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/3] USB: ehci: tegra: Align DMA transfers to 32 bytes
Date: Fri, 4 Feb 2011 12:16:16 -0800
Message-ID: <20110204201616.GA12482@suse.de>
References: <1295559715-14264-1-git-send-email-rmorell@nvidia.com>
 <1296097609-32302-4-git-send-email-rmorell@nvidia.com>
 <20110204194954.GA25180@kroah.com>
 <AANLkTinRtch4Pvr3GLz5wZU2xkG3FMJxxzSNAdParA7j@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinRtch4Pvr3GLz5wZU2xkG3FMJxxzSNAdParA7j-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Sarah Sharp <sarah.a.sharp-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthew Wilcox <willy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jacob Pan <jacob.jun.pan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 04, 2011 at 12:14:54PM -0800, Olof Johansson wrote:
> On Fri, Feb 4, 2011 at 11:49 AM, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Jan 26, 2011 at 07:06:49PM -0800, Robert Morell wrote:
> >> The Tegra2 USB controller doesn't properly deal with misaligned DM=
A
> >> buffers, causing corruption. =A0This is especially prevalent with =
USB
> >> network adapters, where skbuff alignment is often in the middle of=
 a
> >> 4-byte dword.
> >>
> >> To avoid this, allocate a temporary buffer for the DMA if the prov=
ided
> >> buffer isn't sufficiently aligned.
> >>
> >> Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> =A0drivers/usb/host/ehci-tegra.c | =A0 90 ++++++++++++++++++++++++=
+++++++++++++++++
> >
> > This file doesn't seem to be in any tree that I can find, including=
 my
> > own, so I can't apply this patch.
> >
> > What am I supposed to do with it?
>=20
> It hasn't been posted for upstream yet, so nothing for you to do. The
> driver will be posted for review soon, hopefully in time for .39.

Then why would someone send me a patch for it already?

Still confused,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
