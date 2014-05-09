From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable console framebuffer rotation
Date: Fri, 09 May 2014 16:20:04 +0200
Message-ID: <536CE414.5030406@suse.de>
References: <1399432682-677-1-git-send-email-acourbot@nvidia.com> <536A57FA.2090608@wwwdotorg.org> <536AC45F.6080608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536AC45F.6080608-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 08.05.2014 01:40, schrieb Alex Courbot:
> On 05/08/2014 12:57 AM, Stephen Warren wrote:
>> On 05/06/2014 09:18 PM, Alexandre Courbot wrote:
>>> Console rotation is needed for devices like Tegra Note 7 and NVIDIA
>>> SHIELD to get the boot console in the expected orientation.
>>
>> I've squashed this into Tegra's for-3.16/defconfig branch.
>>
>> Can you please also update multi_v7_defconfig, and send that change =
to
>> arm-soc (arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org) to be applied. Thanks.
>=20
> I omitted doing this for now because the devices that require this
> option (TN7/SHIELD) need a custom build with appended DTB and/or
> command-line anyway. Therefore they cannot use a multi-mach kernel

What does appending a .dtb have to do with whether or not to use a
multi-mach kernel? We package zImage/uImage and .dtbs separately, so
surely the multi_v7_defconfig should be kept working with Tegra devices=
=2E
Appending a .dtb only comes into play for preparing installation images=
=2E

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
