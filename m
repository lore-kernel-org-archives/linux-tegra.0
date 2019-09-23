From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 5/7] cpufreq: Register notifiers with the PM QoS
 framework
Date: Mon, 23 Sep 2019 20:27:51 +0300
Message-ID: <16bfccc5-36d5-3050-fd8d-5bce59e2d7b3@gmail.com>
References: <5ad2624194baa2f53acc1f1e627eb7684c577a19.1562210705.git.viresh.kumar@linaro.org>
 <2c7a751a58adb4ce6f345dab9714b924504009b6.1562583394.git.viresh.kumar@linaro.org>
 <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
 <20190923135654.wcsdl5jdzxqeht3l@vireshk-mac-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923135654.wcsdl5jdzxqeht3l@vireshk-mac-ubuntu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, mka@chromium.org, ulf.hansson@linaro.org, sfr@canb.auug.org.au, pavel@ucw.cz, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.09.2019 16:56, Viresh Kumar пишет:
> On 22-09-19, 23:12, Dmitry Osipenko wrote:
>> This patch causes use-after-free on a cpufreq driver module reload. Please take a look, thanks in advance.
>>
>>
>> [   87.952369] ==================================================================
>> [   87.953259] BUG: KASAN: use-after-free in notifier_chain_register+0x4f/0x9c
>> [   87.954031] Read of size 4 at addr e6abbd0c by task modprobe/243
>>
>> [   87.954901] CPU: 1 PID: 243 Comm: modprobe Tainted: G        W
>> 5.3.0-next-20190920-00185-gf61698eab956-dirty #2408
>> [   87.956077] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>> [   87.956807] [<c0110aad>] (unwind_backtrace) from [<c010bb71>] (show_stack+0x11/0x14)
>> [   87.957709] [<c010bb71>] (show_stack) from [<c0d37b25>] (dump_stack+0x89/0x98)
>> [   87.958616] [<c0d37b25>] (dump_stack) from [<c02937e1>]
>> (print_address_description.constprop.0+0x3d/0x340)
>> [   87.959785] [<c02937e1>] (print_address_description.constprop.0) from [<c0293c6b>]
>> (__kasan_report+0xe3/0x12c)
>> [   87.960907] [<c0293c6b>] (__kasan_report) from [<c014988f>] (notifier_chain_register+0x4f/0x9c)
>> [   87.962001] [<c014988f>] (notifier_chain_register) from [<c01499b5>]
>> (blocking_notifier_chain_register+0x29/0x3c)
>> [   87.963180] [<c01499b5>] (blocking_notifier_chain_register) from [<c06f7ee9>]
>> (dev_pm_qos_add_notifier+0x79/0xf8)
>> [   87.964339] [<c06f7ee9>] (dev_pm_qos_add_notifier) from [<c092927d>] (cpufreq_online+0x5e1/0x8a4)
> 
> Hi Dmitry,
> 
> Unfortunately I am traveling right now and can't test this stuff, though I may
> have found the root cause here. Can you please test the below diff for me ?
> 
> diff --git a/drivers/base/power/qos.c b/drivers/base/power/qos.c
> index 6c90fd7e2ff8..9ac244ee05fe 100644
> --- a/drivers/base/power/qos.c
> +++ b/drivers/base/power/qos.c
> @@ -328,6 +328,8 @@ void dev_pm_qos_constraints_destroy(struct device *dev)
>         spin_unlock_irq(&dev->power.lock);
>  
>         kfree(qos->resume_latency.notifiers);
> +       kfree(qos->min_frequency.notifiers);
> +       kfree(qos->max_frequency.notifiers);
>         kfree(qos);
>  
>   out:
> 

Doesn't help. The use-after-free bugs are usually caused by a missing
NULL assignment after kfree(), like in this snippet:

	..
	if (!a)
		a = kmalloc();
	..
	kfree(a);
	// a = NULL    <-- missing!
	..

I briefly looked through the code and don't see anything obviously
wrong. The bug isn't critical since unlikely that somebody reloads
cpufreq module for a non-development purposes, so it's not a big deal
and can wait. Please take your time.

I also want to point out that kernel crashes after second module reload,
hence the KASAN report should be valid.
