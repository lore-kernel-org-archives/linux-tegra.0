From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 10/15] ARM: tegra: iomap: Add missing devices, fix use
 of SZ_8, SZ_64
Date: Thu, 10 Feb 2011 17:44:31 -0800
Message-ID: <AANLkTi=ZrTsvLoocLeztqzGK4TUgt1pFnHR-0MBUmOc0@mail.gmail.com>
References: <1297320204-31882-1-git-send-email-ccross@android.com>
	<1297320204-31882-11-git-send-email-ccross@android.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0310F60414@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310F60414-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 10, 2011 at 8:45 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Colin Cross wrote at Wednesday, February 09, 2011 11:43 PM:
>>
>> From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Adds gart, hdmi, avp, host1x, and pwm controllers to mach/iomap.h
>> There is no SZ_8 or SZ_64, replace them with constants
>
> Can't we add those SZ_* constants?

Sure, you already added SZ_64, and nothing depends on the SZ_8 defines
right now, so I'll drop that part of the change and send a patch that
completes the SZ_* defines.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
