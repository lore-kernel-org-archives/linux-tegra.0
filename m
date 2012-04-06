From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC PATCH] cpuidle: allow per cpu latencies
Date: Fri, 06 Apr 2012 17:35:46 +0200
Message-ID: <4F7F0D52.8080305@linaro.org>
References: <1333619620-21201-1-git-send-email-pdeschrijver@nvidia.com> <4F7DA009.4010802@linux.intel.com> <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, Trinabh Gupta <g.trinabh@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Arjan van de Ven <arjan@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

On 04/06/2012 12:32 PM, Shilimkar, Santosh wrote:
> Peter,
>
> On Thu, Apr 5, 2012 at 7:07 PM, Arjan van de Ven<arjan@linux.intel.co=
m>  wrote:
>> On 4/5/2012 2:53 AM, Peter De Schrijver wrote:
>>> This patch doesn't update all cpuidle device registrations. I will =
do that
>>
>> question is if you want to do per cpu latencies, or if you want to h=
ave
>> both types of C state in one big table, and have each of the tegra c=
pyu
>> types pick half of them...
>>
>>
> Indeed !! That should work.
> I thought the C-states are always per CPU based and during the
> cpuidle registration you can register C-state accordingly based on th=
e
> specific CPU types with different latencies if needed.
>
> Am I missing something ?

That was the case before the cpuidle_state were moved from the=20
cpuidle_device to the cpuidle_driver structure [1].

That had the benefit of using a single latencies array instead of=20
multiple copy of the same array, which was the case until today.

I looked at the white paper for the tegra3 and understand this is no=20
longer true because of the 4-plus-1 architecture [2].

With the increasing number of SoCs, we have a lot of new cpuidle driver=
s=20
and each time we modify something in the cpuidle core, that impacts all=
=20
the cpuidle drivers.

My feeling is we are going back and forth when patching the cpuidle cor=
e=20
and may be it is time to define a clear semantic before patching again=20
the cpuidle, no ?

What could nice is to have:

  * in case of the same latencies for all cpus, use a single array

  * in case of different latencies, group the same latencies into a=20
single array (I assume this is the case for 4-plus-1, right ?)

May be we can move the cpuidle_state to a per_cpu pointer like=20
cpuidle_devices in cpuidle.c and then add:

register_latencies(struct cpuidle_latencies l, int cpu);

If we have the same latencies for all the cpus, then we can register th=
e=20
same array, which is only a pointer.

Thanks
   -- Daniel


[1] https://lkml.org/lkml/2011/10/3/57
[2]=20
http://www.nvidia.com/content/PDF/tegra_white_papers/Variable-SMP-A-Mul=
ti-Core-CPU-Architecture-for-Low-Power-and-High-Performance.pdf


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
