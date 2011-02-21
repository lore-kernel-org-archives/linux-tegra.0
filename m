From: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/4] usb: otg: Add ulpi viewport access ops
Date: Mon, 21 Feb 2011 10:04:23 +0100
Message-ID: <4D622A97.2040101@parrot.com>
References: <1298000565-20627-1-git-send-email-benoit@android.com> <1298000565-20627-2-git-send-email-benoit@android.com> <4D5E9337.3010603@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D5E9337.3010603-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

Igor Grinberg a =E9crit :
> Hi,
>=20
> On 02/18/11 05:42, Benoit Goby wrote:
>> Add generic access ops for controllers with a ulpi viewport register
>> (e.g. Chipidea/ARC based controllers).
>=20
> I can see mxc, msm and langwell are using the same bits
> (or at least some of them).
They all use the Chipidea/ARC usb controllers.

> Is there some kind of specification for this ulpi viewport register?
You can find the Chipidea/ARC datasheet in IMX35 datasheet ( got  0x017=
0=20
  ULPI VIEWPORT) or a newer version (extra fields in some registers but=
=20
miss 0x168-0x170) in
http://www.nxp.com/documents/user_manual/UM10314.pdf

Matthieu
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
