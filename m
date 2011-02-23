From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/4] usb: otg: Add ulpi viewport access ops
Date: Tue, 22 Feb 2011 20:02:17 -0800
Message-ID: <AANLkTimrae-ueZ9TgRDHb=NoVn_wgpHeMq=BwUKeFwbz@mail.gmail.com>
References: <1298000565-20627-1-git-send-email-benoit@android.com>
	<1298000565-20627-2-git-send-email-benoit@android.com>
	<4D5E9337.3010603@compulab.co.il>
	<4D622A97.2040101@parrot.com>
	<4D62593C.4070000@compulab.co.il>
	<4D628501.50105@parrot.com>
	<4D63CB73.8040506@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4D63CB73.8040506-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 6:42 AM, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
> I've looked into the IMX Reference Manual regarding the ulpi viewport register
> and it looks like these access ops can be utilized on another kind of ulpi access registers,
> as the same features are available in most (if not all) of ulpi access registers,
> whether they are called viewport or otherwise.
> This will require much more thinking and may be the right solution would be
> multiple access ops files (e.g. drivers/usb/otg/ulpi_...port.c).
> So for now, this patch is a good stuff to start from.
>
> Benoit,
>
> can you, please, address comments in my first reply?

Hi Igor,
Yes I fixed them.
I will send a new version of the patch.

Thanks,
Benoit

>
> Thanks.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
