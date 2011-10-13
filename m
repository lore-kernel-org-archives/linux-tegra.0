From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: update defconfig
Date: Thu, 13 Oct 2011 09:25:52 -0700
Message-ID: <CAOesGMgRBRwDwEALDRhO_KZzoZnWA-Eq7KhGtm+Fqnb83i+0hw@mail.gmail.com>
References: <1318478219-9462-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A063@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A063-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 13, 2011 at 9:03 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
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
> We should also enable ASoC (sound) support. Do you want to rev the patch, or
> should I submit a patch on top of yours?

Let's keep the amount of defconfig churn down as much as possible,
since it's somewhat of a touchy subject. Please send me a patch but
I'll squash it in with mine when I apply it.


-Olof
