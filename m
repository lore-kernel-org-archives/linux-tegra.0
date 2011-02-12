From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] usb: host: Add EHCI driver for NVIDIA Tegra SoCs
Date: Fri, 11 Feb 2011 16:59:59 -0800
Message-ID: <AANLkTinREvijcK9Ed+jRc=349DyiZ0iadTZdc719a1OZ@mail.gmail.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com>
	<1297228927-23497-4-git-send-email-benoit@android.com>
	<4D5257FA.1030605@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D5257FA.1030605-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 9, 2011 at 1:01 AM, Matthieu CASTET
<matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org> wrote:
> Benoit Goby a =E9crit :
>> +static int tegra_ehci_hub_control(
>> + =A0 =A0 =A0 struct usb_hcd =A0*hcd,
>> + =A0 =A0 =A0 u16 =A0 =A0 =A0 =A0 =A0 =A0 typeReq,
>> + =A0 =A0 =A0 u16 =A0 =A0 =A0 =A0 =A0 =A0 wValue,
>> + =A0 =A0 =A0 u16 =A0 =A0 =A0 =A0 =A0 =A0 wIndex,
>> + =A0 =A0 =A0 char =A0 =A0 =A0 =A0 =A0 =A0*buf,
>> + =A0 =A0 =A0 u16 =A0 =A0 =A0 =A0 =A0 =A0 wLength
>> +)
>> +{
>> +
>
> I don't know enough usb layer, but can't you done something similar t=
han in
> msm otg : let's the otg layer handle the power management ?
>
> http://www.spinics.net/lists/linux-usb/msg41247.html
>

This function overrides ehci_hub_control to fix tegra specific quirks
when we suspend/resume the root hub. I don't see how this could be
handled at the otg level.

Benoit
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
