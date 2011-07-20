From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] usb: tegra20-ehci: Add devicetree support.
Date: Wed, 20 Jul 2011 14:28:48 -0600
Message-ID: <CACxGe6tOHxqsb-OrjPy_1+OdJykzamaxsUUgKT3cJgA-1JaRtA@mail.gmail.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
 <CACxGe6uDVdemjbjY_i-_M_-VT8HuLdtXP-R9V8kB+pSSin4dEw@mail.gmail.com>
 <643E69AA4436674C8F39DCC2C05F76383CF0DD2277@HQMAIL03.nvidia.com>
 <CACxGe6tEEr11vd3tqDwQ00YhUi7tMzovmS2PZGW9jt1K6VBefg@mail.gmail.com> <643E69AA4436674C8F39DCC2C05F76383CF0DD2278@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F76383CF0DD2278-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Willemsen <dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Moganty <vmoganty-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 20, 2011 at 2:27 PM, Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> >> Can the driver use sane defaults for any of these values?
>> This patch
>> >> will be a lot smaller if there isn't the need to check all
>> the return
>> >> values each time.
>> >
>> > The defaults are in the dt ehci node. =A0I'd really hate to
>> duplicate these defaults in C code as well, if that's what
>> you're suggesting (they're already duplicated privately
>> elsewhere, sadly, in mach-tegra, but I'm hoping those
>> defaults can go away once we move over to dt for good). =A0By
>> failing probe if these defaults aren't present, I think it
>> helps make sure the dt ehci node stays in sync with the code.
>>
>> I'm saying that if the binding and the driver encode sane defaults f=
or
>> those parameters, then the properties don't need to appear in the .d=
ts
>> at all unless they are being overridden. =A0It is by no means a crit=
ical
>> issue though. =A0Do what makes the most sense to you.
>
> I see. =A0I think that makes sense as well. =A0To be clear, you're su=
ggesting to document the defaults in the bindings file, and have the de=
faults in the driver (C code). =A0Then omit the properties from the dts=
 entirely unless they are different (i.e. the dts will no longer have a=
ny default values specified), right? =A0If that's more consistent with =
how the other drivers will work, I'll do that.

Yes, that's what I'm saying.  Again, it's up to you on whatever makes
the most sense.

g.


--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
