From: sumitg <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Thu, 26 Mar 2020 05:29:58 +0530
Message-ID: <aa9fb180-6a23-e27b-51f6-f6b5685d65be@nvidia.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20191204054043.o4ff7pnqec3fwdgu@vireshk-i7>
 <7347caa6-43a3-f761-de83-481b45f7b22a@nvidia.com>
 <20191204112749.jkwlyteal4hfvnhb@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20191204112749.jkwlyteal4hfvnhb@vireshk-i7>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Viresh,

Sorry for the late reply.

On 04/12/19 4:57 PM, Viresh Kumar wrote:
> On 04-12-19, 16:25, sumitg wrote:
>> In T194, CCPLEX doesn't have access to set clocks and the
>>
>> clk_{get|set}_rate() functions set clocks by hook to BPMP R5.
>>
>> CPU freq can be directly set by CCPLEX using MSR(NVFREQ_REQ_EL1).
>>
>> As DVFS run's on BPMP, another MSR (NVFREQ_FEEDBACK_EL1) is
>>
>> used to read the counters and calculate "actual" cpu freq at CCPLEX.
>>
>> So, "cpuinfo_cur_freq" node gives the actual cpu frequency and not
>>
>> given by node "scaling_cur_freq".
> Right, but why can't this be hidden in the CPU's clk driver instead,
> so cpufreq driver can just do clk_get_rate() and clk_set_rate() ?
>
>>> - populating cpufreq table, you can probably add OPPs instead using
>>>     the same mechanism
>> We are reading available frequencies from BPMP to populate
>>
>> cpufreq table and not using static opp table.
> Right and lot of other platforms read it from firmware (I believe BBMP
> is a firmware here), and create OPPs at runtime. Look at this for
> example:
>
> drivers/cpufreq/qcom-cpufreq-hw.c
>
> and search for dev_pm_opp_add().
>
- I think we don't need separate CPU clock driver & to reuse

 =C2=A0 cpufreq-dt driver as we will still have to replicate same logic

 =C2=A0 from cpufreq driver to that dummy clock driver for calculating

 =C2=A0 actual cpufreq from MSR value. So, it won't add much value.

 =C2=A0=C2=A0=C2=A0 - "qcom-cpufreq-hw.c" is using clk_get_rate() during in=
it, but

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the frequency ops "get/target_index" write =
to register directly

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and not using clk api's. Also, the clock dr=
iver from gcc-msm*.c

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seem to handle all clocks in CCPLEX.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tegra SOC's which didn't have BPMP had the =
clock handling

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done by CCPLEX. They were using clk_{get|se=
t}_rate() api's

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as you mentioned. But in Tegra194, all cloc=
k handling is done

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 within BPMP R5 core except CPU clock(which =
is through MSR).

- Adding OPP's with dev_pm_opp_add() is also not required as:

 =C2=A0=C2=A0 1) We don't have any consumer like energy model or EAS in

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Tegra194 which it seems was valid wit=
h "qcom-cpufreq-hw.c".

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So, i think it won't be useful for T1=
94.

 =C2=A0=C2=A0 2) Also, there is no way to map ndiv to voltage in kernel. Ke=
rnel

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver passes ndiv value to BPMP(R5) =
which converts to vhint.

Please share your inputs.
