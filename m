From: Hin-Tak Leung <htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: [PATCH 1/1] driver-core: Shut up dev_dbg_reatelimited() without DEBUG
Date: Thu, 23 Aug 2012 13:54:23 +0100 (BST)
Message-ID: <1345726463.82057.YahooMailClassic@web29403.mail.ird.yahoo.com>
References: <5034F8E3.2060700@iki.fi>
Reply-To: htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5034F8E3.2060700-X3B1VOXEql0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--- On Wed, 22/8/12, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org> wrote:

> On 08/22/2012 04:57 PM, Hin-Tak Leung
> wrote:
> > Antti Palosaari wrote:
> >> Hello Hiroshi,
> >>
> >> On 08/21/2012 10:02 AM, Hiroshi Doyu wrote:
> >>> Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
> wrote @ Mon, 20 Aug 2012 23:29:34 +0200:
> >>>
> >>>> On 08/20/2012 02:14 PM, Hiroshi Doyu
> wrote:
> >>>>> Hi Antti,
> >>>>>
> >>>>> Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
> wrote @ Sat, 18 Aug 2012 02:11:56
> >>>>> +0200:
> >>>>>
> >>>>>> On 08/17/2012 09:04 AM, Hiroshi
> Doyu wrote:
> >>>>>>> dev_dbg_reatelimited() without
> DEBUG printed "217078 callbacks
> >>>>>>> suppressed". This shouldn't
> print anything without DEBUG.
> >>>>>>>
> >>>>>>> Signed-off-by: Hiroshi Doyu
> <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>>> Reported-by: Antti Palosaari
> <crope-X3B1VOXEql0@public.gmane.org>
> >>>>>>> ---
> >>>>>>>=A0
> =A0=A0=A0include/linux/device.h |=A0 =A0 6
> +++++-
> >>>>>>>=A0 =A0=A0=A01 files
> changed, 5 insertions(+), 1 deletions(-)
> >>>>>>>
> >>>>>>> diff --git
> a/include/linux/device.h b/include/linux/device.h
> >>>>>>> index eb945e1..d4dc26e 100644
> >>>>>>> --- a/include/linux/device.h
> >>>>>>> +++ b/include/linux/device.h
> >>>>>>> @@ -962,9 +962,13 @@ do {=A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 \
> >>>>>>>=A0 =A0 =A0
> =A0=A0=A0dev_level_ratelimited(dev_notice, dev,
> fmt, ##__VA_ARGS__)
> >>>>>>>=A0 =A0=A0=A0#define
> dev_info_ratelimited(dev, fmt, ...)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 \
> >>>>>>>=A0 =A0 =A0
> =A0=A0=A0dev_level_ratelimited(dev_info, dev, fmt,
> ##__VA_ARGS__)
> >>>>>>> +#if defined(DEBUG)
> >>>>>>>=A0 =A0=A0=A0#define
> dev_dbg_ratelimited(dev, fmt, ...)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 \
> >>>>>>>=A0 =A0 =A0
> =A0=A0=A0dev_level_ratelimited(dev_dbg, dev, fmt,
> ##__VA_ARGS__)
> >>>>>>> -
> >>>>>>> +#else
> >>>>>>> +#define
> dev_dbg_ratelimited(dev, fmt, ...)=A0 =A0 =A0
> =A0 =A0 =A0 \
> >>>>>>> +=A0 =A0
> no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> >>>>>>> +#endif
> >>>>>>>=A0 =A0=A0=A0/*
> >>>>>>>=A0 =A0 =A0 * Stupid
> hackaround for existing uses of non-printk uses
> >>>>>>> dev_info
> >>>>>>>=A0 =A0 =A0 *
> >>>>>>>
> >>>>>>
> >>>>>> NACK. I don't think that's correct
> behavior. After that patch it
> >>>>>> kills
> >>>>>> all output of
> dev_dbg_ratelimited(). If I use dynamic debugs and
> >>>>>> order
> >>>>>> debugs, I expect to see debugs as
> earlier.
> >>>>>
> >>>>> You are right. I attached the update
> patch, just moving *_ratelimited
> >>>>> functions after dev_dbg() definitions.
> >>>>>
> >>>>> With DEBUG defined/undefined in your
> "test.ko", it works fine. With
> >>>>> CONFIG_DYNAMIC_DEBUG, it works with
> "+p", but with "-p", still
> >>>>> "..callbacks suppressed" is printed.
> >>>>
> >>>> I am using dynamic debugs and behavior is
> now just same as it was when
> >>>> reported that bug. OK, likely for static
> debug it is now correct.
> >>>
> >>> The following patch can also refrain
> "..callbacks suppressed" with
> >>> "-p". I think that it's ok for all cases.
> >>>
> >>>> From
> b4c6aa9160f03b61ed17975c73db36c983a48927 Mon Sep 17 00:00:00
> 2001
> >>> From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Date: Mon, 20 Aug 2012 13:49:19 +0300
> >>> Subject: [v3 1/1] driver-core: Shut up
> dev_dbg_reatelimited() without
> >>> DEBUG
> >>>
> >>> dev_dbg_reatelimited() without DEBUG printed
> "217078 callbacks
> >>> suppressed". This shouldn't print anything
> without DEBUG.
> >>>
> >>> With CONFIG_DYNAMIC_DEBUG, the print should be
> configured as expected.
> >>>
> >>> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Reported-by: Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
> >>> ---
> >>>=A0=A0=A0include/linux/device.h
> |=A0=A0=A062
> >>>
> +++++++++++++++++++++++++++++------------------
> >>>=A0=A0=A01 files changed, 38
> insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/include/linux/device.h
> b/include/linux/device.h
> >>> index 9648331..bb6ffcb 100644
> >>> --- a/include/linux/device.h
> >>> +++ b/include/linux/device.h
> >>> @@ -932,6 +932,32 @@ int _dev_info(const struct
> device *dev, const
> >>> char *fmt,
> >>> ...)
> >>>
> >>>=A0=A0=A0#endif
> >>>
> >>> +/*
> >>> + * Stupid hackaround for existing uses of
> non-printk uses dev_info
> >>> + *
> >>> + * Note that the definition of dev_info below
> is actually _dev_info
> >>> + * and a macro is used to avoid redefining
> dev_info
> >>> + */
> >>> +
> >>> +#define dev_info(dev, fmt, arg...)
> _dev_info(dev, fmt, ##arg)
> >>> +
> >>> +#if defined(CONFIG_DYNAMIC_DEBUG)
> >>> +#define dev_dbg(dev, format, ...)=A0 =A0
> =A0 =A0 =A0 =A0=A0=A0\
> >>> +do {=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0=A0=A0\
> >>> +=A0 =A0 dynamic_dev_dbg(dev, format,
> ##__VA_ARGS__); \
> >>> +} while (0)
> >>> +#elif defined(DEBUG)
> >>> +#define dev_dbg(dev, format, arg...)=A0
> =A0 =A0 =A0 \
> >>> +=A0 =A0 dev_printk(KERN_DEBUG, dev,
> format, ##arg)
> >>> +#else
> >>> +#define dev_dbg(dev, format, arg...)=A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> >>> +({=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 \
> >>> +=A0 =A0 if (0)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 \
> >>> +=A0 =A0 =A0 =A0
> dev_printk(KERN_DEBUG, dev, format, ##arg);=A0 =A0 \
> >>> +=A0 =A0 0;=A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 \
> >>> +})
> >>> +#endif
> >>> +
> >>>=A0=A0=A0#define
> dev_level_ratelimited(dev_level, dev, fmt, ...)=A0 =A0
> =A0 =A0 =A0 =A0 \
> >>>=A0=A0=A0do {=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> >>>=A0 =A0 =A0=A0=A0static
> DEFINE_RATELIMIT_STATE(_rs,=A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 \
> >>> @@ -955,33 +981,21 @@ do {=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> >>>=A0 =A0
> =A0=A0=A0dev_level_ratelimited(dev_notice, dev,
> fmt, ##__VA_ARGS__)
> >>>=A0=A0=A0#define
> dev_info_ratelimited(dev, fmt, ...)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 \
> >>>=A0 =A0
> =A0=A0=A0dev_level_ratelimited(dev_info, dev, fmt,
> ##__VA_ARGS__)
> >>> +#if defined(CONFIG_DYNAMIC_DEBUG) ||
> defined(DEBUG)
> >>>=A0=A0=A0#define
> dev_dbg_ratelimited(dev, fmt, ...)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 \
> >>> -=A0 =A0 dev_level_ratelimited(dev_dbg,
> dev, fmt, ##__VA_ARGS__)
> >>> -
> >>> -/*
> >>> - * Stupid hackaround for existing uses of
> non-printk uses dev_info
> >>> - *
> >>> - * Note that the definition of dev_info below
> is actually _dev_info
> >>> - * and a macro is used to avoid redefining
> dev_info
> >>> - */
> >>> -
> >>> -#define dev_info(dev, fmt, arg...)
> _dev_info(dev, fmt, ##arg)
> >>> -
> >>> -#if defined(CONFIG_DYNAMIC_DEBUG)
> >>> -#define dev_dbg(dev, format, ...)=A0 =A0
> =A0 =A0 =A0 =A0=A0=A0\
> >>> -do {=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0=A0=A0\
> >>> -=A0 =A0 dynamic_dev_dbg(dev, format,
> ##__VA_ARGS__); \
> >>> +do {=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 \
> >>> +=A0 =A0 static
> DEFINE_RATELIMIT_STATE(_rs,=A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 \
> >>> +=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0
> DEFAULT_RATELIMIT_INTERVAL,=A0 =A0 \
> >>> +=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0
> DEFAULT_RATELIMIT_BURST);=A0 =A0 =A0 =A0 \
> >>> +=A0 =A0
> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);=A0 =A0
> =A0 =A0 =A0 =A0 \
> >>> +=A0 =A0 if (unlikely(descriptor.flags
> & _DPRINTK_FLAGS_PRINT) &&=A0 =A0 \
> >>> +=A0 =A0 =A0 =A0
> __ratelimit(&_rs))=A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> >>> +=A0 =A0 =A0 =A0
> __dynamic_pr_debug(&descriptor, pr_fmt(fmt),=A0
> =A0 =A0 =A0 \
> >>> +=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0=A0=A0##__VA_ARGS__);=A0 =A0
> =A0 =A0 =A0 =A0 \
> >>>=A0=A0=A0} while (0)
> >>> -#elif defined(DEBUG)
> >>> -#define dev_dbg(dev, format, arg...)=A0
> =A0 =A0 =A0 \
> >>> -=A0 =A0 dev_printk(KERN_DEBUG, dev,
> format, ##arg)
> >>>=A0=A0=A0#else
> >>> -#define dev_dbg(dev, format, arg...)=A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> >>> -({=A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 \
> >>> -=A0 =A0 if (0)=A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 =A0 \
> >>> -=A0 =A0 =A0 =A0
> dev_printk(KERN_DEBUG, dev, format, ##arg);=A0 =A0 \
> >>> -=A0 =A0 0;=A0 =A0 =A0 =A0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0 =A0 \
> >>> -})
> >>> +#define dev_dbg_ratelimited(dev, fmt,
> ...)=A0 =A0 =A0 =A0 =A0 =A0 \
> >>> +=A0 =A0 no_printk(KERN_DEBUG
> pr_fmt(fmt), ##__VA_ARGS__)
> >>>=A0=A0=A0#endif
> >>>
> >>>=A0=A0=A0#ifdef VERBOSE_DEBUG
> >>
> >> That seems to work correctly now. I tested it using
> dynamic debugs. It
> >> was
> >> Hin-Tak who originally reported that bug for me
> after I added few
> >> ratelimited
> >> debugs for DVB stack. Thank you!
> >>
> >> Reported-by: Hin-Tak Leung <htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> >> Tested-by: Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
> >>
> >>
> >> regards
> >> Antti
> >>
> >
> > This is with mediatree/for_v3.7-8 , playing DVB-T video
> with mplayer.
> >
> > echo 'file ...media_build/v4l/usb_urb.c +p' >
> > /sys/kernel/debug/dynamic_debug/control
> >
> > With +p
> >
> > [137749.698202] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137749.699449] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137749.700825] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.690862] usb_urb_complete: 3570 callbacks
> suppressed
> > [137754.690888] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.692489] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.693745] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.694882] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.696240] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.697483] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.699002] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.700884] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.701613] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137754.702986] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137759.695906] usb_urb_complete: 3595 callbacks
> suppressed
> > [137759.695934] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137759.697788] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> > [137759.698772] usb 1-3: usb_urb_complete: bulk urb
> completed status=3D0
> > length=3D4096/4096 pack_num=3D0 errors=3D0
> >
> > with -p
> >
> > [137814.730303] usb_urb_complete: 3555 callbacks
> suppressed
> > [137819.740698] usb_urb_complete: 3519 callbacks
> suppressed
> > [137824.744857] usb_urb_complete: 3443 callbacks
> suppressed
> > [137829.746023] usb_urb_complete: 3345 callbacks
> suppressed
> > [137834.749931] usb_urb_complete: 3558 callbacks
> suppressed
> > [137839.753102] usb_urb_complete: 3465 callbacks
> suppressed
> > [137844.755521] usb_urb_complete: 3438 callbacks
> suppressed
>=20
> I think you are using media_build.git (with my devel tree)?
> Could that=20
> be due to that as there is some compat stuff? I am not very
> familiar=20
> with media_build.git...

Acked-by: Hin-Tak Leung <htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Reported-by: Hin-Tak Leung <htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>

Yes, sorry about that. media_build is picking up the system's kernel he=
ader, I think - dev_dbg_ratelimited is defined in the older kernel 3.5.=
x's include/linux/device.h .

Yes, it was me who first noticed the problem (when DVB-usb started usin=
g the define).
