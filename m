From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Tue, 4 Aug 2015 15:56:04 +0200
Message-ID: <55C0C474.5090200@suse.de>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
 <55B0D427.2000704@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0D427.2000704-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guillaume Gardet <guillaume-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am 23.07.2015 um 13:46 schrieb Andreas F=E4rber:
> Am 09.07.2015 um 09:32 schrieb Alexandre Courbot:
>> Tegra124 requires the bootloader to perform VPR initialization, othe=
rwise the
>> GPU cannot be used by the system. Since using the GPU without that
>> initialization results in a hang, the GPU DT node is left disabled, =
and it is
>> the task of the bootloader to enable it after ensuring it is safe to=
 use the
>> GPU.
>>
>> VPR init is already performed since patch df3443dfa449, but the devi=
ce tree was
>> left untouched. This patch series performs this last step and prepar=
es the GPU
>> intialization code to receive more code for newer chips.
>=20
> Tested-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>=20
> I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd65 -
> with these two patches I get a console login on HDMI again.

Ping! Independent of the Linux and X11 discussions this thread has
drifted off into, these two patches are still missing in v2015.10-rc1
and don't apply any more (as reported by Guillaume). Can you please
rebase and merge them?

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
