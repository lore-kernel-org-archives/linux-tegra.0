From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] usb: otg: Add ulpi viewport access ops
Date: Mon, 21 Feb 2011 14:23:24 +0200
Message-ID: <4D62593C.4070000@compulab.co.il>
References: <1298000565-20627-1-git-send-email-benoit@android.com> <1298000565-20627-2-git-send-email-benoit@android.com> <4D5E9337.3010603@compulab.co.il> <4D622A97.2040101@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D622A97.2040101-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 02/21/11 11:04, Matthieu CASTET wrote:

> Hi,
>
> Igor Grinberg a =E9crit :
>> Hi,
>>
>> On 02/18/11 05:42, Benoit Goby wrote:
>>> Add generic access ops for controllers with a ulpi viewport registe=
r
>>> (e.g. Chipidea/ARC based controllers).
>>
>> I can see mxc, msm and langwell are using the same bits
>> (or at least some of them).
> They all use the Chipidea/ARC usb controllers.

This means, that it is not generic, but Chipidea/ARC usb controller spe=
cific.
And it is common to some/many platforms.

Can it be utilized on platforms that have another kind of ulpi access r=
egister?

May be, by allowing a platform to pass some platform data, that "descri=
bes"
the ulpi access register and have this driver handle it?
Or is it too complicated for now?

>
>> Is there some kind of specification for this ulpi viewport register?
> You can find the Chipidea/ARC datasheet in IMX35 datasheet ( got  0x0=
170  ULPI VIEWPORT) or a newer version (extra fields in some registers =
but miss 0x168-0x170) in
> http://www.nxp.com/documents/user_manual/UM10314.pdf

I don't have the IMX35 datasheet which describes the USB OTG registers.
The one that can be downloaded from Freescale website, only describes
hardware and no ULPI viewport is mentioned there.

NXP's LPC3130/31 uses UTMI and therefore does not have the view port
register(s) documented.

Are there any public versions of documents describing the ulpi viewport=
?
Quick googling haven't got me any.

--=20
Regards,
Igor.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
