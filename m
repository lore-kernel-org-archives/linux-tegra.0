From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V7 5/7] cpufreq: Register notifiers with the PM QoS
 framework
Date: Mon, 14 Oct 2019 15:12:15 +0530
Message-ID: <20191014094215.kb6q32chgb5sd2nb@vireshk-i7>
References: <5ad2624194baa2f53acc1f1e627eb7684c577a19.1562210705.git.viresh.kumar@linaro.org>
 <2c7a751a58adb4ce6f345dab9714b924504009b6.1562583394.git.viresh.kumar@linaro.org>
 <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, mka@chromium.org, ulf.hansson@linaro.org, sfr@canb.auug.org.au, pavel@ucw.cz, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 22-09-19, 23:12, Dmitry Osipenko wrote:
> This patch causes use-after-free on a cpufreq driver module reload. Please take a look, thanks in advance.
> 
> 
> [   87.952369] ==================================================================
> [   87.953259] BUG: KASAN: use-after-free in notifier_chain_register+0x4f/0x9c
> [   87.954031] Read of size 4 at addr e6abbd0c by task modprobe/243

Hi Dmitry,

I tried to reproduce it on my ubuntu on ARM64 setup and I couldn't hit
these issues on v5.4-rc1 with Kasan built in.

I then enabled Kasan (tried both inline and outline instrumentation)
but I couldn't get past the issues with module insertion. It fails
like this for me:

root@linaro-developer:~/work# insmod cpufreq-dt.ko 
[   72.985974] cpufreq_dt: Unknown symbol __asan_report_load1_noabort (err -2)
[   72.993164] cpufreq_dt: Unknown symbol __asan_report_load4_noabort (err -2)
[   73.000307] cpufreq_dt: Unknown symbol __asan_report_load8_noabort (err -2)
[   73.007451] cpufreq_dt: Unknown symbol __asan_report_store1_noabort (err -2)
[   73.014643] cpufreq_dt: Unknown symbol __asan_register_globals (err -2)
[   73.021409] cpufreq_dt: Unknown symbol __asan_unregister_globals (err -2)
[   73.028349] cpufreq_dt: Unknown symbol __asan_report_store8_noabort (err -2)
[   73.035543] cpufreq_dt: Unknown symbol __asan_report_store4_noabort (err -2)
insmod: ERROR: could not insert module cpufreq-dt.ko: Unknown symbol in module

I tried to search for these errors but couldn't find why I am getting
these and why the symbols are missing here. Can you suggest something
here ?

-- 
viresh
