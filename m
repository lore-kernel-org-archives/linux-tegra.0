From: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 13:27:10 -0700
Message-ID: <643E69AA4436674C8F39DCC2C05F76383CF0DD2278@HQMAIL03.nvidia.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
 <CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
 <643E69AA4436674C8F39DCC2C05F76383CF0DD2277@HQMAIL03.nvidia.com>
 <CACxGe6tEEr11vd3tqDwQ00YhUi7tMzovmS2PZGW9jt1K6VBefg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tEEr11vd3tqDwQ00YhUi7tMzovmS2PZGW9jt1K6VBefg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> >> Can the driver use sane defaults for any of these values? =A0
> This patch
> >> will be a lot smaller if there isn't the need to check all=20
> the return
> >> values each time.
> >
> > The defaults are in the dt ehci node. =A0I'd really hate to=20
> duplicate these defaults in C code as well, if that's what=20
> you're suggesting (they're already duplicated privately=20
> elsewhere, sadly, in mach-tegra, but I'm hoping those=20
> defaults can go away once we move over to dt for good). =A0By=20
> failing probe if these defaults aren't present, I think it=20
> helps make sure the dt ehci node stays in sync with the code.
>=20
> I'm saying that if the binding and the driver encode sane defaults fo=
r
> those parameters, then the properties don't need to appear in the .dt=
s
> at all unless they are being overridden.  It is by no means a critica=
l
> issue though.  Do what makes the most sense to you.

I see.  I think that makes sense as well.  To be clear, you're suggesti=
ng to document the defaults in the bindings file, and have the defaults=
 in the driver (C code).  Then omit the properties from the dts entirel=
y unless they are different (i.e. the dts will no longer have any defau=
lt values specified), right?  If that's more consistent with how the ot=
her drivers will work, I'll do that.--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
