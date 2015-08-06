From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Thu, 6 Aug 2015 16:57:43 +0900
Message-ID: <55C31377.2010204@nvidia.com>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
 <55B0D427.2000704@suse.de> <55C0C474.5090200@suse.de>
 <17113c2735bb46caa20531a106f8e15d@HQMAIL104.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17113c2735bb46caa20531a106f8e15d-wO81nVYWzR66sJks/06JalaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Guillaume Gardet <guillaume-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/05/2015 08:24 AM, Tom Warren wrote:
> Alex/Andreas,
>
>> -----Original Message-----
>> From: Tom Warren
>> Sent: Tuesday, August 04, 2015 8:41 AM
>> To: 'Andreas F=E4rber'; u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
>> Cc: Alex Courbot; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Ste=
phen
>> Warren; Guillaume Gardet
>> Subject: RE: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
>>
>> Andreas,
>>
>>> -----Original Message-----
>>> From: Andreas F=E4rber [mailto:afaerber-l3A5Bk7waGM@public.gmane.org]
>>> Sent: Tuesday, August 04, 2015 6:56 AM
>>> To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
>>> Cc: Alex Courbot; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
>>> Stephen Warren; Tom Warren; Guillaume Gardet
>>> Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
>>>
>>> Am 23.07.2015 um 13:46 schrieb Andreas F=E4rber:
>>>> Am 09.07.2015 um 09:32 schrieb Alexandre Courbot:
>>>>> Tegra124 requires the bootloader to perform VPR initialization,
>>>>> otherwise the GPU cannot be used by the system. Since using the G=
PU
>>>>> without that initialization results in a hang, the GPU DT node is
>>>>> left disabled, and it is the task of the bootloader to enable it
>>>>> after ensuring it is safe to use the GPU.
>>>>>
>>>>> VPR init is already performed since patch df3443dfa449, but the
>>>>> device tree was left untouched. This patch series performs this
>>>>> last step and prepares the GPU intialization code to receive more
>>>>> code for
>>> newer chips.
>>>>
>>>> Tested-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>>>
>>>> I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd6=
5
>>>> - with these two patches I get a console login on HDMI again.
>>>
>>> Ping! Independent of the Linux and X11 discussions this thread has
>>> drifted off into, these two patches are still missing in v2015.10-r=
c1
>>> and don't apply any more (as reported by Guillaume). Can you please=
 rebase
>> and merge them?
>> Is that request for me? Sorry, lost track of these patches since it =
appeared that
>> there was an on-going discussion.
>> If you're sure they're OK within the context of Tegra U-Boot, I'll a=
pply them and
>> send them with the next PR.
>>
>> Tom
> Applied to u-boot-tegra/next (along with some other pending Tegra pat=
ches for clocks/PLL/SPI/ums/etc.). I added T210/P2571 support to this p=
atchset.
>
> PTAL.  Also, there doesn't appear to be a 'gpu@0,57000000' property i=
n any t124/t210 DT file. Is that coming in another patch or one I misse=
d?

Thanks Tom! I have tried your branch and can confirm it is booting=20
Jetson TK1 as expected (i.e. the GPU is in a usable state).

The GPU node is not needed in U-boot's DT files (if that's what you=20
meant). It is present in the kernel though, and that's the DT my patche=
s=20
will modify.

Alex.
