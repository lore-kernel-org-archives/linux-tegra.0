From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra: Use PMC scratch register 40 for tegra_resume()
 location store
Date: Fri, 09 Jan 2015 20:07:09 +0300
Message-ID: <54B00ABD.4030304@gmail.com>
References: <1419202392-1159-1-git-send-email-digetx@gmail.com> <54984429.8040905@wwwdotorg.org> <5498549B.8070101@gmail.com> <54985C30.7020605@wwwdotorg.org> <20150108105742.GI1987@ulmo.nvidia.com> <20150108123709.GX10073@tbergstrom-lnx.Nvidia.com> <20150109095134.GC27845@ulmo> <20150109102922.GC10073@tbergstrom-lnx.Nvidia.com> <54B00864.7040102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <54B00864.7040102@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, stable@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>
List-Id: linux-tegra@vger.kernel.org

09.01.2015 19:57, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 01/09/2015 03:29 AM, Peter De Schrijver wrote:
>> On Fri, Jan 09, 2015 at 10:51:35AM +0100, Thierry Reding wrote:
>>> * PGP Signed by an unknown key
>>>
>>> On Thu, Jan 08, 2015 at 02:37:09PM +0200, Peter De Schrijver wrote:
>>>> On Thu, Jan 08, 2015 at 11:57:43AM +0100, Thierry Reding wrote:
>>>>>> Old Signed by an unknown key
>>>>>
>>>>> On Mon, Dec 22, 2014 at 11:00:16AM -0700, Stephen Warren wrote:
>>>>>> On 12/22/2014 10:27 AM, Dmitry Osipenko wrote:
>>>>>>> 22.12.2014 19:17, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>>> On 12/21/2014 03:52 PM, Dmitry Osipenko wrote:
>>>>>>>>> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") c=
hanged
>>>>>>>>> tegra_resume()
>>>>>>>>> location storing from late to early and as result broke suspe=
nd on
>>>>>>>>> tegra20.
>>>>>>>>> PMC scratch register 41 was used by tegra lp1 suspend core co=
de for
>>>>>>>>> storing
>>>>>>>>> physical memory address of common resume function and in the =
same time
>>>>>>>>> used by
>>>>>>>>> tegra20 cpuidle driver for storing cpu1 "resettable" status, =
so it implied
>>>>>>>>> strict order of scratch register use. Fix it by using scratch=
 40
>>>>>>>>> instead of 41
>>>>>>>>> for tegra_resume() location store.
>>>>>>>>
>>>>>>>> You likely can't simply change the PMC scratch register usage =
arbitrarily;
>>>>>>>> specific registers are designated for specific purposes, and c=
ode
>>>>>>>> outside the
>>>>>>>> Linux kernel (bootloaders, LP0 resume code, secure monitors, e=
tc.) may
>>>>>>>> depend on
>>>>>>>> those specific values being in those registers. Without signif=
icant
>>>>>>>> research,
>>>>>>>> I'd suggest not changing the PMC scratch register usage.
>>>>>>>
>>>>>>> Sure, that's why I asked to verify if scratch register 40 is in=
 use in the
>>>>>>> comment after commit message.
>>>>>>
>>>>>> Sorry, I didn't notice that.
>>>>>>
>>>>>>> I've checked that u-boot doesn't use it (since
>>>>>>> upstream kernel doesn't care about any other bootloader), but n=
o idea about
>>>>>>> secure monitor. It's definitely safer to avoid changing scratch=
 regs
>>>>>>> usage, I
>>>>>>> thought that proposed solution would be best from the pure code=
 point of
>>>>>>> view.
>>>>>>> So, I'm considering your answer as a rejection of the patch (pl=
ease, let
>>>>>>> me know
>>>>>>> if I'm wrong) and will prepare another one. Btw, it would be ni=
ce to have
>>>>>>> scratch registers usage publicly documented somewhere (on "Tegr=
a Public
>>>>>>> Application Notes" webpage for example), if it's possible, of c=
ourse.
>>>>>>
>>>>>> At this stage in Tegra20 development, I think it'd be best to av=
oid changing
>>>>>> any scratch register usage if at all possible.
>>>>>
>>>>> Sorry, I had completely missed this discussion. When looking at t=
he code
>>>>> it doesn't look like this particular "resettable" status needs to=
 be
>>>>> stored in a PMC scratch register. It can't be stored in RAM becau=
se that
>>>>> goes into self-refresh as part of LP1, but how about just putting=
 it
>>>>> into IRAM? That stays on in both LP1 and LP2, so should be suitab=
le for
>>>>> this use-case. It would make the code slightly more complex but u=
sing a
>>>>> single scratch register for multiple purposes sounds brittle and =
easy to
>>>>> break (as evidenced by the offending commit).
>>>>>
>>>>> Otherwise it would seem that PMC_SCRATCH40 is only used to store =
EMC
>>>>> configuration data across LP0 suspend/resume, so I wouldn't think=
 it'd
>>>>> cause problems if we used that instead of PMC_SCRATCH41 to store =
the
>>>>> "resettable" state.
>>>>>
>>>>
>>>> No. Usually the scratch registers for EMC config data are setup on=
ce by the
>>>> bootloader and never touched by the kernel after that. So I would =
not
>>>> recommend reusing those registers for different purposes.
>>>
>>> Right, I misread the code in the downstream kernel. Though it's not=
 the
>>> bootloader that does it (at least on Tegra20), but some early code =
in
>>> the kernel.
>>>
>>> IRAM sounds like a good candidate still. Or do you know of anything=
 that
>>> would exclude IRAM as storage location for this data?
>>
>> No. I can't think of a reason this flag could not be in IRAM.
>=20
> The only thing you might want to watch out for is whether something e=
lse is
> using IRAM. For example, our product SW stacks use the AVP as a media
> co-processor and that runs at least some of its code from IRAM. To su=
pport
> something similar, you'd need to make sure to save/restore the IRAM c=
ontent when
> using it for other purposes rather than just blindly over-writing it =
(and of
> course synchronize with any driver for the AVP execution, to ensure i=
t was shut
> down first and brought back up last after any power saving event). Of=
 course, we
> don't actually support loading code onto the AVP upstream at the mome=
nt, so
> perhaps we can defer handling that for now.
>=20

Sure, currently I placed "resettable" variable in IRAM reset handler ar=
ea for
that reason. As I wrote before, I'll give patch more polish and send af=
ter.

--=20
Dmitry
