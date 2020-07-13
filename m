From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Date: Mon, 13 Jul 2020 17:37:36 +0100
Message-ID: <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200713032554.cykywnygxln6ukrl@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200713032554.cykywnygxln6ukrl@vireshk-i7>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 13/07/2020 04:25, Viresh Kumar wrote:
> On 12-07-20, 11:06, Jon Hunter wrote:
>> Commit 6cc3d0e9a097 ("cpufreq: tegra186: add
>> CPUFREQ_NEED_INITIAL_FREQ_CHECK flag") fixed CPUFREQ support for
>> Tegra186 but as a consequence the following warnings are now seen on
>> boot ...
>>
>>  cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 2035200 KHz
>>  cpufreq: cpufreq_online: CPU1: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU1: Unlisted initial frequency changed to: 2035200 KHz
>>  cpufreq: cpufreq_online: CPU2: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU2: Unlisted initial frequency changed to: 2035200 KHz
>>  cpufreq: cpufreq_online: CPU3: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU3: Unlisted initial frequency changed to: 2035200 KHz
>>  cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 2035200 KHz
>>  cpufreq: cpufreq_online: CPU5: Running at unlisted freq: 0 KHz
>>  cpufreq: cpufreq_online: CPU5: Unlisted initial frequency changed to: 2035200 KHz
>>
>> Although we could fix this by adding a 'get' operator for the Tegra186
>> CPUFREQ driver, there is really little point because the CPUFREQ on
>> Tegra186 is set by writing a value stored in the frequency table to a
>> register and we just need to set the initial frequency.
> 
> The hardware still runs at the frequency requested by cpufreq core here, right ?

Yes.

> It is better to provide the get() callback as it is also used to show the
> current frequency in userspace.

I looked at that and I saw that if the get() callback is not provided,
the current frequency showed by userspace is policy->cur. For this
device, policy->cur is accurate and so if we added the get() callback we
essentially just going to return policy->cur. Therefore, given that we
already know policy->cur, I did not see the point in adding a device
specific handler to do the same thing.

Cheers
Jon

-- 
nvpublic
