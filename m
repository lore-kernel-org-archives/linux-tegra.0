From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 00/11] Add T210 support in Tegra soctherm
Date: Fri, 22 Jan 2016 15:27:49 +0800
Message-ID: <56A1D9F5.9090108@nvidia.com>
References: <1453111356-12298-1-git-send-email-wni@nvidia.com> <20160121145657.GF32301@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121145657.GF32301@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8821=E6=97=A5 22:56, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Jan 18, 2016 at 06:02:25PM +0800, Wei Ni wrote:
>> This patchset adds following functions for tegra_soctherm driver:
>> 1. add T210 support.
>> 2. export debugfs to show some registers.
>> 3. add thermtrip funciton.
>> 4. add suspend/resume function.
>>
>> The V1 serial is in:
>> http://www.spinics.net/lists/linux-tegra/msg24808.html
>> The V2 serial is in:
>> http://www.spinics.net/lists/linux-tegra/msg24901.html
>>
>> Main changes from V2:
>> 1. Fix build error in patch [1/11].
>> 2. Use of_get_child_by_name instead of of_find_node_by_name in patch=
 [8/11].
>> 3. Use debugfs_remove_recursive to remove debugfs in patch [6/11].
>>
>> Main changes from V1:
>> 1. Use the new type to handl different Tegra chips in one driver,
>> which suggested by Thierry.
>> 2. Changes per Thieery's other comments.
>>
>> Wei Ni (11):
>>   thermal: tegra: move tegra thermal files into tegra directory
>>   thermal: tegra: combine sensor group-related data
>>   thermal: tegra: get rid of PDIV/HOTSPOT hack
>>   thermal: tegra: split tegra_soctherm driver
>>   thermal: tegra: add T210-specific SOC_THERM driver
>>   thermal: tegra: add a debugfs to show registers
>>   of: Add bindings of hw-trips for soctherm
>>   thermal: tegra: add thermtrip function
>>   thermal: tegra: add PM support
>>   arm64: tegra: add soctherm node for Tegra210
>>   ARM: tegra: set hw trips for Tegra124
>=20
> Hi Wei,
>=20
> This series looks mostly good to me. I've commented on a couple of mi=
nor
> things as replies to the individual patches.

Thanks for your review, I will check your comments and send out next ve=
rsion in
next few days.

>=20
> On a higher level, what's the test procedure that we can use to valid=
ate
> that this code works?

You can check following files:
1. Run "cat /sys/class/thermal/thermal*/temp" to read temperature
This driver will register four thermal zones: cpu, gpu, mem and pll.
2. Run "cat /sys/kernel/debug/tegra_soctherm/regs" to show the register=
 contents.
3. Write a low temperature value to
/sys/kernel/debug/tegra_soctherm/thermtrip/xxx to trigger the thermtrip=
 function.
=46or example, if the cpu temperature is 30000 now, you can read it fro=
m above
thermal zones, then "echo 25000 >
/sys/kernel/debug/tegra_soctherm/thermtrip/cpu", the system will be shu=
tdown
immediately.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
