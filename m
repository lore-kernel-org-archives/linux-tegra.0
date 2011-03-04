From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Patches for 2.6.39 merge window
Date: Thu, 3 Mar 2011 17:00:33 -0800
Message-ID: <AANLkTinr=ye2CtcG9FmFZZ1sK3ZYp8woUeZ_GzYNnQn2@mail.gmail.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
	<20110222205210.GF31611@opensource.wolfsonmicro.com>
	<AANLkTi=Er0pL-KcSqw1WwKy+CZeM9SWjmOkp08YkhKmQ@mail.gmail.com>
	<20110222210925.GH31611@opensource.wolfsonmicro.com>
	<AANLkTi=HBjhdSY_7nfeqFZ6Cd_pJA6VBRTaOjmpA3jaw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B480@HQMAIL01.nvidia.com>
	<AANLkTikMmoBT3ZG2UPNretXDK+UqMyk6X2GEpwMt5SC8@mail.gmail.com>
	<AANLkTinSQuFk9-NeA+F-35QitHO8KU4H_tffTneG8gxH@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B50A@HQMAIL01.nvidia.com>
	<AANLkTi=ASu7++j+qu_JDtjha5_b3=2jZE8rAf=HLKBuS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=ASu7++j+qu_JDtjha5_b3=2jZE8rAf=HLKBuS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I can do them (sorry, been out today and was also waiting on the i2c
merge to land).

I'll take them through my tree with the i2c changes. I'll post the
base i2c board changes either tonight or tomorrow morning, after that
Stephens can easily go on top.


-Olof

On Thu, Mar 3, 2011 at 3:47 PM, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Mar 3, 2011 at 2:40 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
>> Colin Cross wrote at Thursday, March 03, 2011 3:25 PM:
>>> I pushed the merge of Ben's i2c-tegra as for-next-i2c. =A0I will pu=
t any
>>> patches that depend on i2c support in that branch, and keep it reba=
sed
>>> on top of for-next.
>>
>> Previously, Olof said he'd take my board patches through his tree. I=
 assume
>> that's no longer the plan, and I should just create a patch-set base=
d on
>> Tegra for-next or for-next-i2c?
>>
>> FYI, I now have 3 patches left not applied, in git log order:
>>
>> ARM: Tegra: Enable Harmony audio support
>>
>> =A0 =A0* Set up platform data required by I2C, and ASoC machine & co=
dec drivers.
>> =A0 =A0* Enable required GPIO pins as GPIOs.
>> =A0 =A0* Initialize audio-related clocks.
>> =A0 =A0* Correctly configure pinmux for audio-related GPIOs.
>>
>> =A0 =A0(this can be split to parts before/after picking up latest AS=
oC, and
>> =A0 =A0perhaps also part for for-next, part for for-next-i2c?)
>>
>> ARM: Tegra: Create defines for GPIO names
>>
>> =A0 =A0This ensures they're kept in sync between platform_data defin=
itions and
>> =A0 =A0the GPIO table initialization.
>>
>> =A0 =A0(Should apply right away, to for-next)
>>
>> ARM: Tegra: Add devices.c entries for audio
>>
>> =A0 =A0For I2S, DAS, PCM devices
>>
>> =A0 =A0(Should apply right away, to for-next)
>>
>>> On Thu, Mar 3, 2011 at 1:37 PM, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wro=
te:
>>> > (resending as plain text)
>>> >
>>> > To prevent the merge window from becoming a mess, patches are sup=
posed
>>> > to be in linux-next by rc6 of the previous release.
>>> >
>>> > Ben never responded to my question about merging i2c-tegra, so I'=
ll
>>> > merge it for now.
>>> >
>>> > On Thu, Mar 3, 2011 at 11:29 AM, Stephen Warren <swarren@nvidia.c=
om>
>>> wrote:
>>> >> Colin Cross wrote at Thursday, March 03, 2011 12:12 PM:
>>> >>>
>>> >>> On Tue, Feb 22, 2011 at 1:09 PM, Mark Brown
>>> >>> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>>> >>> > On Tue, Feb 22, 2011 at 01:01:23PM -0800, Colin Cross wrote:
>>> >>> >> On Tue, Feb 22, 2011 at 12:52 PM, Mark Brown
>>> >>> >
>>> >>> >> > That's the standard way of handling this sort of thing - j=
ust
>>> send
>>> >>> the
>>> >>> >> > patch in a second pull request once the dependencies have =
all
>>> landed.
>>> >>> >
>>> >>> >> You could also put it in the tegra-arch branch and we could =
both
>>> re-
>>> >>> merge it.
>>> >>> >
>>> >>> > I basically can't rebase my tree - it's merged into Takashi's=
 tree
>>> and
>>> >>> > there's lots of cross dependencies with my 2.6.38 fixes branc=
h which
>>> >>> > would cause bisect breakage. =A0If you want to cherry pick th=
e
>>> relevant
>>> >>> > WM8903 commit over into your tree that'd also be OK by me.
>>> >>> >
>>> >>>
>>> >>> We should be fine with two pull requests. =A0I would still like=
 to get
>>> >>> all the changes into the for-next branch, without the wm8903 he=
ader
>>> >>> change, but with the harmony file that depends on it. =A0I will=
 point
>>> >>> the for-linus branch at the last change that compiles without t=
he
>>> >>> wm8903 header change. linux-next should get the ASoC tree and t=
he
>>> >>> Tegra for-next tree, so everything should compile there.
>>> >>
>>> >> OK. I can easily split my patch into two:
>>> >> a) Add basically everything, except for the gpio_base WM8903 pla=
tform
>>> >> =A0 data field. (for-linus)
>>> >> b) Add the WM8903 platform data field. (for 2nd pull request)
>>> >>
>>> >> However, my board patches also rely on I2C platform data. There =
was
>>> >> some discussion that Tegra's for-next would merge in Ben's I2C T=
egra
>>> >> branch and hence pick up the new platform header from that.
>>> >>
>>> >> Olof also mentioned he'd submit a patch through his branch to ad=
d all
>>> >> the I2C bus registrations for all boards once the I2C branch was
>>> >> merged.
>>> >>
>>> >> However, I haven't seen any traction on this. Is this still happ=
ening?
>>> >> If not, I'll have to split my patch slightly differently, to als=
o pull
>>> >> out the I2C registrations into the second patch.
>>> >>
>>> >>> I'm going to be out of the office next week, so this is probabl=
y the
>>> >>> last chance to get features in 2.6.39.
>>> >>
>>> >> I'm a little out-of-touch here, but this confuses me; 2.6.38 has=
n't
>>> >> been released yet, and hence the 2-week merge window isn't open =
yet.
>>> >> And even then, I think we can submit small pull requests for stu=
ff
>>> >> like this throughout 2.6.39's rc releases. I'm not why right now=
 is
>>> >> the last chance to get stuff in.
>>> >>
>>> >> --
>>> >> nvpublic
>>
>>
>>
>
> Olof, are you going to take these or should I?
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
