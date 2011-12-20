From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: boards: more __init/__initdata annotations
Date: Tue, 20 Dec 2011 09:05:44 -0800
Message-ID: <CAOesGMiYbOuCzvuhMAUibtccTbA24J+-5pTsBqS72VbJZVE9Eg@mail.gmail.com>
References: <1324353802-31774-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF176BE92CFB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF176BE92CFB-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 20, 2011 at 8:26 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Olof Johansson wrote at Monday, December 19, 2011 9:03 PM:
>> Silence a bunch of section warnings, and mark some of the init functions as
>> __init.
>
> Is it correct to mark these as __init?
>
> With my recent patch "arm/tegra: Use bus notifiers to trigger pinmux
> setup", this data all gets used at pinmux/GPIO device probe time. Still,
> I suppose that does all get triggered by tegra_dt_init() which is __init,
> so if a device is guaranteed to probe as soon as a device registration
> and driver exist for it, then everything you've marked as __init really
> is guaranteed to be used then.

Ah, good point. I'll leave the functions alone until the new interface
settles down.


-Olof
