From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] soc/tegra: pmc: Turn powergates_lock into spinlock
Date: Mon, 15 Oct 2018 16:52:15 +0300
Message-ID: <57c3b1a6-0a60-613e-a4e7-5d66c199b860@gmail.com>
References: <20180830183635.4474-1-digetx@gmail.com>
 <7369869e-e58f-3760-d428-b00fb9cd28d9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7369869e-e58f-3760-d428-b00fb9cd28d9@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/18 3:52 PM, Jon Hunter wrote:
> 
> On 30/08/18 19:36, Dmitry Osipenko wrote:
>> This fixes splats like the one below if CONFIG_DEBUG_ATOMIC_SLEEP=y
>> and machine (Tegra30) booted with SMP=n or all secondary CPU's are put
>> offline.
>>
>>  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:254
>>  in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: swapper/0
>>  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        4.18.0-next-20180821-00180-gc3ebb6544e44-dirty #823
>>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>>  [<c01134f4>] (unwind_backtrace) from [<c010db2c>] (show_stack+0x20/0x24)
>>  [<c010db2c>] (show_stack) from [<c0bd0f3c>] (dump_stack+0x94/0xa8)
>>  [<c0bd0f3c>] (dump_stack) from [<c0151df8>] (___might_sleep+0x13c/0x174)
>>  [<c0151df8>] (___might_sleep) from [<c0151ea0>] (__might_sleep+0x70/0xa8)
>>  [<c0151ea0>] (__might_sleep) from [<c0bec2b8>] (mutex_lock+0x2c/0x70)
>>  [<c0bec2b8>] (mutex_lock) from [<c0589844>] (tegra_powergate_is_powered+0x44/0xa8)
>>  [<c0589844>] (tegra_powergate_is_powered) from [<c0581a60>] (tegra30_cpu_rail_off_ready+0x30/0x74)
>>  [<c0581a60>] (tegra30_cpu_rail_off_ready) from [<c0122244>] (tegra30_idle_lp2+0xa0/0x108)
>>  [<c0122244>] (tegra30_idle_lp2) from [<c0853438>] (cpuidle_enter_state+0x140/0x540)
>>  [<c0853438>] (cpuidle_enter_state) from [<c08538a4>] (cpuidle_enter+0x40/0x4c)
>>  [<c08538a4>] (cpuidle_enter) from [<c01595e0>] (call_cpuidle+0x30/0x48)
>>  [<c01595e0>] (call_cpuidle) from [<c01599f8>] (do_idle+0x238/0x28c)
>>  [<c01599f8>] (do_idle) from [<c0159d28>] (cpu_startup_entry+0x28/0x2c)
>>  [<c0159d28>] (cpu_startup_entry) from [<c0be76c8>] (rest_init+0xd8/0xdc)
>>  [<c0be76c8>] (rest_init) from [<c1200f50>] (start_kernel+0x41c/0x430)
> 
> Given the above, rather than converting to a spinlock I wonder if we are
> just better off dropping the mutex completely from
> tegra_powergate_is_powered()? Otherwise ...
> 
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 36 ++++++++++++++++++------------------
>>  1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 2d6f3fcf3211..d6bc9f66f1cd 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -186,7 +186,7 @@ struct tegra_pmc_soc {
>>   * @lp0_vec_phys: physical base address of the LP0 warm boot code
>>   * @lp0_vec_size: size of the LP0 warm boot code
>>   * @powergates_available: Bitmap of available power gates
>> - * @powergates_lock: mutex for power gate register access
>> + * @powergates_lock: lock for power gate register access
>>   */
>>  struct tegra_pmc {
>>  	struct device *dev;
>> @@ -215,7 +215,7 @@ struct tegra_pmc {
>>  	u32 lp0_vec_size;
>>  	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
>>  
>> -	struct mutex powergates_lock;
>> +	spinlock_t powergates_lock;
>>  };
>>  
>>  static struct tegra_pmc *pmc = &(struct tegra_pmc) {
>> @@ -288,10 +288,10 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
>>  	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
>>  		return -EINVAL;
>>  
>> -	mutex_lock(&pmc->powergates_lock);
>> +	spin_lock(&pmc->powergates_lock);
>>  
>>  	if (tegra_powergate_state(id) == new_state) {
>> -		mutex_unlock(&pmc->powergates_lock);
>> +		spin_unlock(&pmc->powergates_lock);
>>  		return 0;
>>  	}
>>  
>> @@ -300,7 +300,7 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
>>  	err = readx_poll_timeout(tegra_powergate_state, id, status,
>>  				 status == new_state, 10, 100000);
>>  
>> -	mutex_unlock(&pmc->powergates_lock);
>> +	spin_unlock(&pmc->powergates_lock);
> 
> ... the above readx_poll_timeout needs to be converted to the atomic
> version. Furthermore, the above 100ms timeout is probably not suited to
> spinlock.

It's converted in the second patch. Seems mutex indeed could be dropped from tegra_powergate_is_powered, at least for now I can't recall why decided to keep the locking. Thank you for the review, I'll try to drop the mutex and come back with v2 if it will be fine.
