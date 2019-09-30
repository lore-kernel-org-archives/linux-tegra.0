From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 08/14] ARM: tegra: Make outer_disable() open-coded
Date: Mon, 30 Sep 2019 17:29:13 +0300
Message-ID: <a23edc5b-97c6-9dae-589e-b71d07069b0c@gmail.com>
References: <20190929175952.22690-1-digetx@gmail.com>
 <20190929175952.22690-9-digetx@gmail.com> <20190930080511.GE1518582@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930080511.GE1518582@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.09.2019 11:05, Thierry Reding пишет:
> On Sun, Sep 29, 2019 at 08:59:46PM +0300, Dmitry Osipenko wrote:
>> The outer_disable() of Tegra's suspend code is open-coded now since
>> that helper produces spurious warning message about secondary CPUs being
>> online. The secondaries are actually halted by the cpuidle driver on
>> entering into LP2 idle-state. This fixes a storm of warnings once LP2
>> idling state is enabled on Tegra30.
> 
> If the cpuidle driver halts the secondaries, shouldn't it set it offline
> then so that outer_disable() can still work correctly?

No.. how would you know what CPU's should be resumed?

AFAIK, the online status should be only changed by the hotplug code and
nothing else. I don't think that it's a good idea to manually touch the
online mask.

It looks to me that the only purpose of outer_disable() checking for the
num_online_cpus is to prevent people from doing wrong things by
disabling L2 in a random places in their code. Hence it should be
absolutely fine to open code when you know what you're doing, which is
the case here.

We can check the rail status in tegra_sleep_cpu():

if (trusted_foundations_registered() && outer_cache.disable) {
	if (WARN_ON(!tegra_cpu_rail_off_ready()))
		return -EBUSY;

	outer_cache.disable();
}

Which is equal to the check for num_online_cpus. Does it sound good?
