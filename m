From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Use PMC scratch register 40 for tegra_resume()
 location store
Date: Fri, 09 Jan 2015 17:36:37 +0300
Message-ID: <54AFE775.3090209@gmail.com>
References: <1419202392-1159-1-git-send-email-digetx@gmail.com> <54984429.8040905@wwwdotorg.org> <5498549B.8070101@gmail.com> <54985C30.7020605@wwwdotorg.org> <20150108105742.GI1987@ulmo.nvidia.com> <20150108123709.GX10073@tbergstrom-lnx.Nvidia.com> <20150109095134.GC27845@ulmo> <20150109102922.GC10073@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150109102922.GC10073-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

09.01.2015 13:29, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Fri, Jan 09, 2015 at 10:51:35AM +0100, Thierry Reding wrote:
>> * PGP Signed by an unknown key
>>
>> On Thu, Jan 08, 2015 at 02:37:09PM +0200, Peter De Schrijver wrote:
>>> On Thu, Jan 08, 2015 at 11:57:43AM +0100, Thierry Reding wrote:
>>>>> Old Signed by an unknown key
>>>>
>>>> On Mon, Dec 22, 2014 at 11:00:16AM -0700, Stephen Warren wrote:
>>>>> On 12/22/2014 10:27 AM, Dmitry Osipenko wrote:
>>>>>> 22.12.2014 19:17, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 12/21/2014 03:52 PM, Dmitry Osipenko wrote:
>>>>>>>> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") ch=
anged
>>>>>>>> tegra_resume()
>>>>>>>> location storing from late to early and as result broke suspen=
d on tegra20.
>>>>>>>> PMC scratch register 41 was used by tegra lp1 suspend core cod=
e for storing
>>>>>>>> physical memory address of common resume function and in the s=
ame time used by
>>>>>>>> tegra20 cpuidle driver for storing cpu1 "resettable" status, s=
o it implied
>>>>>>>> strict order of scratch register use. Fix it by using scratch =
40 instead of 41
>>>>>>>> for tegra_resume() location store.
>>>>>>>
>>>>>>> You likely can't simply change the PMC scratch register usage a=
rbitrarily;
>>>>>>> specific registers are designated for specific purposes, and co=
de outside the
>>>>>>> Linux kernel (bootloaders, LP0 resume code, secure monitors, et=
c.) may depend on
>>>>>>> those specific values being in those registers. Without signifi=
cant research,
>>>>>>> I'd suggest not changing the PMC scratch register usage.
>>>>>>
>>>>>> Sure, that's why I asked to verify if scratch register 40 is in =
use in the
>>>>>> comment after commit message.
>>>>>
>>>>> Sorry, I didn't notice that.
>>>>>
>>>>>> I've checked that u-boot doesn't use it (since
>>>>>> upstream kernel doesn't care about any other bootloader), but no=
 idea about
>>>>>> secure monitor. It's definitely safer to avoid changing scratch =
regs usage, I
>>>>>> thought that proposed solution would be best from the pure code =
point of view.
>>>>>> So, I'm considering your answer as a rejection of the patch (ple=
ase, let me know
>>>>>> if I'm wrong) and will prepare another one. Btw, it would be nic=
e to have
>>>>>> scratch registers usage publicly documented somewhere (on "Tegra=
 Public
>>>>>> Application Notes" webpage for example), if it's possible, of co=
urse.
>>>>>
>>>>> At this stage in Tegra20 development, I think it'd be best to avo=
id changing
>>>>> any scratch register usage if at all possible.
>>>>
>>>> Sorry, I had completely missed this discussion. When looking at th=
e code
>>>> it doesn't look like this particular "resettable" status needs to =
be
>>>> stored in a PMC scratch register. It can't be stored in RAM becaus=
e that
>>>> goes into self-refresh as part of LP1, but how about just putting =
it
>>>> into IRAM? That stays on in both LP1 and LP2, so should be suitabl=
e for
>>>> this use-case. It would make the code slightly more complex but us=
ing a
>>>> single scratch register for multiple purposes sounds brittle and e=
asy to
>>>> break (as evidenced by the offending commit).
>>>>
>>>> Otherwise it would seem that PMC_SCRATCH40 is only used to store E=
MC
>>>> configuration data across LP0 suspend/resume, so I wouldn't think =
it'd
>>>> cause problems if we used that instead of PMC_SCRATCH41 to store t=
he
>>>> "resettable" state.
>>>>
>>>
>>> No. Usually the scratch registers for EMC config data are setup onc=
e by the
>>> bootloader and never touched by the kernel after that. So I would n=
ot
>>> recommend reusing those registers for different purposes.
>>
>> Right, I misread the code in the downstream kernel. Though it's not =
the
>> bootloader that does it (at least on Tegra20), but some early code i=
n
>> the kernel.
>>
>> IRAM sounds like a good candidate still. Or do you know of anything =
that
>> would exclude IRAM as storage location for this data?
>=20
> No. I can't think of a reason this flag could not be in IRAM.
>=20
> Cheers,
>=20
> Peter.
>=20

IRAM is a good candidate. Just tested draft patch version in QEMU, will=
 give it
more testing and polish during weekend and send next week.

--=20
Dmitry
