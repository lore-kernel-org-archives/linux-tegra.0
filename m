From: sumitg <sumitg@nvidia.com>
Subject: Re: [TEGRA194_CPUFREQ Patch v2 2/3] cpufreq: Add Tegra194 cpufreq
 driver
Date: Wed, 8 Apr 2020 00:26:22 +0530
Message-ID: <9004e519-61c0-83fd-dc24-07f84c384f8a@nvidia.com>
References: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
 <1586028547-14993-3-git-send-email-sumitg@nvidia.com>
 <ba12496f-ac27-d4f2-dc69-d0a7e2d58679@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ba12496f-ac27-d4f2-dc69-d0a7e2d58679@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bbasu@nvidia.com, mperttunen@nvidia.com, sumitg@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 05/04/20 7:41 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>=20
>=20
> 04.04.2020 22:29, Sumit Gupta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static void tegra_read_counters(struct work_struct *work)
>> +{
>> +     struct read_counters_work *read_counters_work;
>> +     struct tegra_cpu_ctr *c;
>> +     u64 val;
>> +
>> +     /*
>> +      * ref_clk_counter(32 bit counter) runs on constant clk,
>> +      * pll_p(408MHz).
>=20
> Is changing PLLP rate really impossible on T194? What makes you say that
> it runs on a fixed 408MHz?
>=20
Pasting below from TRM.
Register "NVFREQ_FEEDBACK_EL1":
....
[31:0] PLLP counter: This counter counts at a fixed frequency (408 MHz).
