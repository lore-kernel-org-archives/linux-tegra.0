From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Tue, 13 May 2014 22:16:30 +0200
Message-ID: <53727D9E.9050800@suse.de>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com> <536A57FA.2090608@wwwdotorg.org> <536AC45F.6080608@nvidia.com> <536CE414.5030406@suse.de> <536CF33A.3020906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536CF33A.3020906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 09.05.2014 17:24, schrieb Stephen Warren:
> On 05/09/2014 08:20 AM, Andreas F=E4rber wrote:
>> Am 08.05.2014 01:40, schrieb Alex Courbot:
>>> On 05/08/2014 12:57 AM, Stephen Warren wrote:
>>>> On 05/06/2014 09:18 PM, Alexandre Courbot wrote:
>>>>> Console rotation is needed for devices like Tegra Note 7 and NVID=
IA
>>>>> SHIELD to get the boot console in the expected orientation.
>>>>
>>>> I've squashed this into Tegra's for-3.16/defconfig branch.
>>>>
>>>> Can you please also update multi_v7_defconfig, and send that chang=
e to
>>>> arm-soc (arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) to be applied. Thanks.
>>>
>>> I omitted doing this for now because the devices that require this
>>> option (TN7/SHIELD) need a custom build with appended DTB and/or
>>> command-line anyway. Therefore they cannot use a multi-mach kernel
>>
>> What does appending a .dtb have to do with whether or not to use a
>> multi-mach kernel? We package zImage/uImage and .dtbs separately, so
>> surely the multi_v7_defconfig should be kept working with Tegra devi=
ces.
>> Appending a .dtb only comes into play for preparing installation ima=
ges.
>=20
> That would be a reasonable argument if generic distro installers or
> kernel packages were likely to support the TN7 and SHIELD. However,
> given the bootloader situation there and the need for a custom kernel
> anyway for APPENDED_DTB, I assume that's not the case on this particu=
lar
> device?

The Shield we probably don't, the TN7 I don't know. I was more concerne=
d
about the shortened justification.

> If you do intend to support this device with SuSe installer and kerne=
l
> packages, could you give an outline of how you do so?

I gave a presentation at embedded world Conference 2014 on how standard
distributions work on ARM/AArch64, but I fear the slides are not online=
=2E

As far as possible, we use a single kernel source and a "default" or
"lpae" v7 multi-platform config with lots of modules enabled.

http://kernel.opensuse.org/cgit/kernel-source/tree/config/armv7hl [*]

I just double-checked, and we do have CONFIG_ARM_APPENDED_DTB=3Dy enabl=
ed.
It does not restrict supplying the .dtb the "normal" way AIUI.

Our Open Build Service instance then builds a kernel-default .rpm
package containing zImage and modules. The .dts files are separately
compiled and packaged as, e.g., dtb-tegra2 for /boot/dtb/tegra20-*.dtb.

=46or building initrd, U-Boot boot.scr (including kernel command line) =
and
installation image, we use Kiwi.

Anyway, we don't rely on the defconfigs for our distro, so do as you se=
e
fit; just gently reminding that it's not feasible for everyone to build
kernels per device, as the above comment seemed to suggest.

Best regards,

Andreas


[*] Yes, some Tegra options are clearly missing; working on syncing the=
m
based on my tegra_defconfig.

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
