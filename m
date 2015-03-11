From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Wed, 11 Mar 2015 16:28:30 +0300
Message-ID: <550042FE.90706@gmail.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com> <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150311102957.GM19577@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150311102957.GM19577@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.03.2015 13:29, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thu, Jan 15, 2015 at 01:58:57PM +0300, Dmitry Osipenko wrote:
>> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") changed =
tegra_resume()
>> location storing from late to early and, as a result, broke suspend =
on Tegra20.
>> PMC scratch register 41 is used by tegra LP1 resume code for retriev=
ing stored
>> physical memory address of common resume function and in the same ti=
me used by
>> tegra20_cpu_shutdown() (shared by Tegra20 cpuidle driver and platfor=
m SMP code),
>> which is storing CPU1 "resettable" status. It implies strict order o=
f scratch
>> register usage, otherwise resume function address is lost on Tegra20=
 after
>> disabling non-boot CPU's on suspend. Fix it by storing "resettable" =
status in
>> IRAM instead of PMC scratch register.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Fixes: 7232398abc6a (ARM: tegra: Convert PMC to a driver)
>> Cc: <stable@vger.kernel.org> # v3.17+
>> ---
>>   arch/arm/mach-tegra/cpuidle-tegra20.c |  5 ++---
>>   arch/arm/mach-tegra/reset-handler.S   | 10 +++++++---
>>   arch/arm/mach-tegra/reset.h           |  4 ++++
>>   arch/arm/mach-tegra/sleep-tegra20.S   | 37 ++++++++++++++++++++---=
------------
>>   arch/arm/mach-tegra/sleep.h           |  4 ++++
>>   5 files changed, 38 insertions(+), 22 deletions(-)
>
> Sorry for the long delay, but I've applied this now to the Tegra tree=
=2E
>
> Thierry
>

Thanks, now we can move forward.

--=20
Dmitry
