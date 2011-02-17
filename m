From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 1/4] usb: otg: Add ulpi viewport access ops
Date: Thu, 17 Feb 2011 15:18:34 -0800
Message-ID: <AANLkTinteYmM8knSLZiAvDayiBhv+v4z11ySAqOoONGu@mail.gmail.com>
References: <1297980904-23466-1-git-send-email-benoit@android.com>
	<1297980904-23466-2-git-send-email-benoit@android.com>
	<20110217223108.GB22126@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110217223108.GB22126-l3A5Bk7waGM@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 17, 2011 at 2:31 PM, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org> wrote:
> On Thu, Feb 17, 2011 at 02:15:01PM -0800, Benoit Goby wrote:
>> diff --git a/drivers/usb/otg/Kconfig b/drivers/usb/otg/Kconfig
>> index 9ffc823..02952c4 100644
>> --- a/drivers/usb/otg/Kconfig
>> +++ b/drivers/usb/otg/Kconfig
>> @@ -49,6 +49,13 @@ config USB_ULPI
>> =A0 =A0 =A0 =A0 Enable this to support ULPI connected USB OTG transc=
eivers which
>> =A0 =A0 =A0 =A0 are likely found on embedded boards.
>>
>> +config USB_ULPI_VIEWPORT
>> + =A0 =A0 bool "ULPI Viewport Access Operations"
>> + =A0 =A0 depends on USB_ULPI
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Provides read/write operations to the ULPI phy registe=
r set for
>> + =A0 =A0 =A0 controllers with a viewport register (e.g. Chipidea/AR=
C controllers).
>
> Why would this be a Kconfig option? =A0Why not just always have this
> option enabled if USB_ULPI is enabled? =A0How will someone know to en=
able
> this or not?
>

This is not part of the ulpi spec. You may have a ulpi phy but have a
controller that does not have a viewport register. I will remove the
Kconfig option. Drivers that depend on it should select it, it does
not need to be user configurable.

Thanks,
Benoit
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
