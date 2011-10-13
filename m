From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: update defconfig
Date: Thu, 13 Oct 2011 09:25:31 -0700
Message-ID: <CAOesGMj7Me+ownneH7yJ0C4z1tCTdreWcjqGSMR8-M6BsLOFKA@mail.gmail.com>
References: <1318478219-9462-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A05A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A05A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 8:55 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Olof Johansson wrote at Wednesday, October 12, 2011 9:57 PM:
>> Refresh tegra_defconfig:
>>
>> New options enabled: RTC, SPI, USB and USB_STORAGE together with
>> corresponding tegra drivers. Also enable some of the common usb ethernet
>> adapters.
>>
>> Finally, enable new merged boards (Ventana) and the generic devicetree board.
>>
>> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>
> This transitively enables USE_OF by default. For Tegra, that's a good
> thing. However, it does mean we won't be able to detect code that only
> compiles with USE_OF enabled, which might affect other platform's
> buildability if we're talking about core code. I'm not sure if we should
> be concerned about this or not, or if ARM should select USE_OF now?

Right, it uses USE_OF by default because the TEGRA_DT board was
enabled. The defconfig should really be a superset of needed configs
for running on most hardware out there (since we do a multiplatform
kernel), so keeping it enabled on Tegra does make some sense.

Also, the direction is to keep moving towards 100% device-tree (on
tegra), it does make sense to keep it enabled. For testing, explicitly
disabling it to compile-test will be needed for a while longer, but I
don't expect to do much !USE_OF work (for tegra specifically) in the
times ahead.

When changing ARM-generic core code, you should probably pick a few
other defconfigs and make sure those build as well -- that should
cover those aspects.


-Olof
