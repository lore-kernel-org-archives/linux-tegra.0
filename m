From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm/dt: add basic usb nodes to tegra device trees
Date: Fri, 4 Nov 2011 14:20:05 -0400
Message-ID: <CACxGe6u5UJLwE+-iS_GzQxE5wkJ1RH_c9MFdrHfa__Wju-SuHg@mail.gmail.com>
References: <1320377174-28047-1-git-send-email-olof@lixom.net> <74CDBE0F657A3D45AFBB94109FB122FF173F9A4CAC@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173F9A4CAC-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 4, 2011 at 11:27 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Olof Johansson wrote at Thursday, November 03, 2011 9:26 PM:
>> For now they are a minimal binding. It needs to be amended with
>> vendor-specific settings for phy setup and link tuning, etc.
> ...
>> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dt=
s/tegra-seaboard.dts
> ...
>> + =A0 =A0 usb@c5000000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 nvidia,vbus-gpio =3D <&gpio 24 0>; /* PD0 =
*/
>> + =A0 =A0 };
>
> Given that's a custom property, don't we need bindings documentation =
in
> Documentation/devictree/bindings/usb/? Even if the binding is pretty =
self-
> explanatory.

Yes, you're right.  Please add a binding, but you can leave my ack in
place when reposted.

g.
