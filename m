From: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] hwspinlock: core: support for TEGRA hardware spinlocks
Date: Mon, 21 Nov 2011 12:21:20 +0200
Message-ID: <CAK=WgbYW_YH+b3xu1R+mDNPXj57mQ8547dzOJ7VUf2Y1wa8JnQ@mail.gmail.com>
References: <1321334342-3283-1-git-send-email-vwadekar@nvidia.com> <4EC205AC.4000202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EC205AC.4000202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Varun,

On Tue, Nov 15, 2011 at 8:24 AM, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
>> +The Tegra line of processors has a CPU and a COP similar to the OMA=
P processors.
>> +The Tegra SoC has a hardware block which arbitrates access to diffe=
rent hardware
>> +modules on the SoC between the CPU and the COP. The hardware spinlo=
ck block
>> +also has the capability to interrupt the caller when it has access =
to the
>> +requested hardware module. To facilitate SoCs like Tegra which do a=
 lot more
>> +than just share data structures between the CPU and the COP, a new =
callback,
>> +int (*lock_timeout)(struct hwspinlock *lock, unsigned int to), has =
been added
>> +to struct hwspinlock_ops. The drivers which support functionality s=
imilar to
>> +the Tegra SoCs, will use lock_timeout to grant access to the hardwa=
re spinlock
>> +block on the SoCs. Such SoC drivers will not support all the apis e=
xposed
>> +by the hwspinlock framework. More information below.
=2E..
>> =A0 =A0 - lock a previously-assigned hwspinlock with a timeout limit=
 (specified in
>> =A0 =A0 =A0 msecs). If the hwspinlock is already taken, the function=
 will busy loop
>> =A0 =A0 =A0 waiting for it to be released, but give up when the time=
out elapses.
>> - =A0 =A0 Upon a successful return from this function, preemption is=
 disabled so
>> - =A0 =A0 the caller must not sleep, and is advised to release the h=
wspinlock as
>> + =A0 =A0 If the underlying hardware driver supports lock_timeout in=
 it's ops structure
>> + =A0 =A0 then upon a successful return from this function, the call=
er is allowed
>> + =A0 =A0 to sleep since we do not disable premption or interrupts i=
n this scenario.
>> + =A0 =A0 If not, upon a successful return from this function, preem=
ption is disabled
>> + =A0 =A0 so the caller must not sleep, and is advised to release th=
e hwspinlock as
>> =A0 =A0 =A0 soon as possible, in order to minimize remote cores poll=
ing on the
>> =A0 =A0 =A0 hardware interconnect.
>> =A0 =A0 =A0 Returns 0 when successful and an appropriate error code =
otherwise (most
=2E..
>> @@ -182,6 +186,9 @@ int __hwspin_lock_timeout(struct hwspinlock *hwl=
ock, unsigned int to,
>>
>> =A0 =A0 =A0 expire =3D msecs_to_jiffies(to) + jiffies;
>>
>> + =A0 =A0 if (hwlock->bank->ops->lock_timeout)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return hwlock->bank->ops->lock_timeout(hwl=
ock, expire);
>> +
>> =A0 =A0 =A0 for (;;) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Try to take the hwspinlock */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D __hwspin_trylock(hwlock, mode, f=
lags);

I'm afraid this makes it impossible to write generic drivers, as the
locking requirements of __hwspin_lock_timeout() depend now on the
underlying hardware: on OMAP it's a spinlock, and on Tegra it becomes
a semaphore. We should instead provide driver authors a well defined
API that is consistent across all systems.

In addition this proposal hides the entire ->lock_time()
implementation in the platform-specific driver, but we really only
want to hide the platform-specific differences, and keep the generic
parts in the core, so other platforms wouldn't have to duplicate it.

I think we should:
1. define a new 'struct hwsemaphore' object (or hwmutex to get shorter
api names..).
2. allow users to request either a hwspinlock or a hwsemaphore. it's
up to the drivers to request the synchronization primitive they need.
If it's not supported by the hardware, the request will fail.
3. add API to manipulate these new hwsemaphore objects (lock_timeout, u=
nlock)
4. abstract only the bare minimum hw differences in the
platform-specific drivers, and keep generic parts in the core

This way drivers will always know whether a certain hardware
synchronization primitive allow them to sleep or not. It's much less
error prone too; a casual reader of the code will immediately tell the
difference between hwspin_lock and hwsemaphore_lock.

Eventually we will probably also have to rename the hwspinlock
subsystem to something like hwlock, but that's just a minor detail at
this point.

Thanks,
Ohad.
