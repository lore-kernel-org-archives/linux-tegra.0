From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Wed, 17 Jul 2013 12:21:18 +0200
Message-ID: <51E6701E.2070909@linaro.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com> <51E439BC.9030608@wwwdotorg.org> <1373973447.8538.80.camel@jlo-ubuntu-64.nvidia.com> <51E5A438.10004@wwwdotorg.org> <1374056130.10997.16.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374056130.10997.16.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/17/2013 12:15 PM, Joseph Lo wrote:
> On Wed, 2013-07-17 at 03:51 +0800, Stephen Warren wrote:
>> On 07/16/2013 05:17 AM, Joseph Lo wrote:
>>> On Tue, 2013-07-16 at 02:04 +0800, Stephen Warren wrote:
>>>> On 06/25/2013 03:23 AM, Joseph Lo wrote:
>>>>> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
>>>>> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
>>>>> this state.
>>> or something can increase
>>> the loading or make regressions. But I think you are testing with U=
SB
>>> device attached, right? That might cause some extra loading. You ca=
n
>>> give it a try after just removing USB device. And I double confirm =
that
>>> on Seaboard. Except that, the test result looks OK for me.
>>
>> Yes, having a USB device plugged in does affect the issue. In summar=
y:
>>
>> next-20130716, with or without USB devices plugged in: Works fine.
>>
>> next-20130716 with your patches, without USB device plugged in:
>> Occasional short problems (detailed below).
>>
>> next-20130716 with your patches, with USB device plugged in: Continu=
al
>> long problems (detailed below).
>>
>> The testing I did was to log in over the serial console, hit <enter>
>> around five times, and watch the shell prompt echo back, then type
>> "ls<enter" and watch the (directory listing appear (I have about 20
>> files in my directory, with long-ish names), then repeat. With plain
>> next-20130716, this is nice and fast and there are no pauses. With y=
our
>> patches applied, there are occasional or continual pauses, which las=
t
>> for either a short time (tenths of a second), or even a second or tw=
o,
>> both depending on whether a USB device is plugged in or not.
>>
>> I believe this is the same issue I saw when I applied your patches t=
o
>> the Tegra tree on top of v3.11-rc1.
>>
> OK. I did more stress tests last night and today. I found it cause by
> the patch "ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag" and
> only impact the Tegra20 platform. The hot plug regression seems due t=
o
> this patch. After dropping this patch on top of v3.11-rc1, the Tegra2=
0
> can back to normal.
>=20
> And the hop plug and suspend stress test can pass on Tegra30/114 too.
>=20
> Can the other two patch series for Tegra114 to support CPU idle power
> down mode and system suspend still moving forward, not be blocked by
> this patch?
>=20
> Looks the CPUIDLE_FLAG_TIMER_STOP flag still cause some other issue f=
or
> hot plug on Tegra20, I will continue to check this. You can just drop
> this patch.

Please in the future Cc me when problems occur with some patches I
submitted. That would be easier for me to track the issues and fix them
when they happen.

Thanks
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
