From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/8] ARM: tegra: support LP1 suspend mode
Date: Sat, 27 Jul 2013 23:11:29 +0400
Message-ID: <51F41B61.7030402@gmail.com>
References: <1374830110-30685-1-git-send-email-josephl@nvidia.com> <4555938.6N2HxzJnNO@ax5200p> <51F410BE.3000904@gmail.com> <1515727.YuaSFu1ggc@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515727.YuaSFu1ggc@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.07.2013 23:03, Marc Dietrich =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Saturday 27 July 2013 22:26:06 Dmitry Osipenko wrote:
>> 27.07.2013 22:09, Marc Dietrich =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Saturday 27 July 2013 20:20:38 Dmitry Osipenko wrote:
>>>> 27.07.2013 20:12, Marc Dietrich =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Friday 26 July 2013 17:15:02 Joseph Lo wrote:
>>>>>> This series adds the support of LP1 suspend mode for Tegra.
>>>>>>
>>>>>> Verified on Seaboard, Cardhu and Dalmore.
>>>>>
>>>>> tested on AC100 and worked fine, except
>>>>>
>>>>> [   68.448007] PM: Syncing filesystems ... done.
>>>>> [   71.370086] Freezing user space processes ... (elapsed 0.001 s=
econds)
>>>>> done. [   71.370088] Freezing remaining freezable tasks ... (elap=
sed
>>>>> 0.001 seconds) done.
>>>>> [   71.371253] Suspending console(s) (use no_console_suspend to d=
ebug)
>>>>> [   71.638481] PM: suspend of devices complete after 266.604 msec=
s
>>>>> [   71.638905] PM: late suspend of devices complete after 0.417 m=
secs
>>>>> [   71.639477] PM: noirq suspend of devices complete after 0.568 =
msecs
>>>>> [   71.639480] Disabling non-boot CPUs ...
>>>>> [   71.640242] CPU1: shutdown
>>>>> [   71.641216] Entering suspend state LP1
>>>>> [   71.641267] Enabling non-boot CPUs ...
>>>>> [   71.643125] CPU1: Booted secondary processor
>>>>> [   71.643449] CPU1 is up
>>>>> [   71.643786] PM: noirq resume of devices complete after 0.331 m=
secs
>>>>> [   71.644300] PM: early resume of devices complete after 0.364 m=
secs
>>>>> [   71.648038] ------------[ cut here ]------------
>>>>> [   71.648061] WARNING: CPU: 0 PID: 1025 at kernel/irq/manage.c:5=
29
>>>>> irq_set_irq_wake+0xb8/0xf0()
>>>>> [   71.648064] Unbalanced IRQ 384 wake disable
>>>>> [   71.648068] Modules linked in:
>>>>> [   71.648075] CPU: 0 PID: 1025 Comm: bash Not tainted 3.11.0-rc2=
-
>>>>> next-20130726-00008-gef01509-dirty #6
>=20
>>> Stephen Warren said on IRC that this is known and on the internal b=
ug
>>> tracker already. I just posted it so others are not surprised. Well=
, I
>>> should have added that it's a know problem. Sorry for that.
>>
>> It might be a known problem only for those who faced with it. Since =
it's on
>> their internal irc, it wasn't a known issue.
>>
>> It also would be interesting to know if suspend with thumb2 works co=
rrectly.
>> On 3.8 I've ported lp0 suspend and it works fine with arm compiled k=
ernel,
>> thumb2 also works but only for about 5-10 hours (resuming on each 5-=
30
>> minutes, default android behavior) and after I'm getting pmd corrupt=
ion. I
>> have no idea from where that corruption comes from without ability f=
or hw
>> debugging.
>=20
> I don't think anyone can comment on this because lp0 support for main=
line is=20
> not published yet. On the other hand, if you have patches for which y=
ou want=20
> some review, feel free to post them here.
>=20
> Marc
>=20
I'm not expecting comment on it, just for notice :) I'll try this patch=
es in
some near future.
