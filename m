From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix restoration of PLLM when exiting suspend
Date: Fri, 12 Jun 2020 18:20:49 +0300
Message-ID: <ce82c0c9-2396-136c-a4d5-e5530295e593@gmail.com>
References: <20191210103708.7023-1-jonathanh@nvidia.com>
 <1f2a4f23-5be5-aa7e-6eb4-2aeb4058481d@gmail.com>
 <1fe9cd2d-50a2-aae5-95fa-0329acce4c4c@gmail.com>
 <6ee48145-7315-4283-ae56-fbf00b00f16b@nvidia.com>
 <57264acd-2623-9e9f-53c6-3b4cd3991315@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57264acd-2623-9e9f-53c6-3b4cd3991315-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

17.12.2019 17:28, Dmitry Osipenko пишет:
> 17.12.2019 17:19, Jon Hunter пишет:
>>
>> On 10/12/2019 20:29, Dmitry Osipenko wrote:
>>> 10.12.2019 22:28, Dmitry Osipenko пишет:
>>>> Hello Jon,
>>>>
>>>> 10.12.2019 13:37, Jon Hunter пишет:
>>>>> The suspend entry and exit code for 32-bit Tegra devices assumes that
>>>>> the PLLM (which is used to provide the clock for external memory)
>>>>> is always enabled on entry to suspend. Hence, the current code always
>>>>> disables the PLLM on entry to suspend and re-enables the PLLM on exit
>>>>> from suspend.
>>>>>
>>>>> Since the introduction of the Tegra124 EMC driver by commit 73a7f0a90641
>>>>> ("memory: tegra: Add EMC (external memory controller) driver"), which is
>>>>> used to scale the EMC frequency, PLLM may not be the current clock
>>>>> source for the EMC on entry to suspend and hence may not be enabled.
>>>>> Always enabling the PLLM on exit from suspend can cause the actual
>>>>> status on the PLL to be different from that reported by the common clock
>>>>> framework.
>>>>>
>>>>> On kernels prior to v4.5, the code to set the rate of the PLLM had a
>>>>> test to verify if the PLL was enabled and if the PLL was enabled,
>>>>> setting the rate would fail. Since commit 267b62a96951
>>>>> ("clk: tegra: pll: Update PLLM handling") the test to see if PLLM is
>>>>> enabled was removed.
>>>>>
>>>>> With these earlier kernels, if the PLLM is disabled on entering suspend
>>>>> and the EMC driver attempts to set the parent of the EMC clock to the
>>>>> PLLM on exiting suspend, then the set rate for the PLLM will fail and in
>>>>> turn cause the resume to fail.
>>>>>
>>>>> We should not be re-enabling the PLLM on resume from suspend unless it
>>>>> was enabled on entry to suspend. Therefore, fix this by saving the state
>>>>> of PLLM on entry to suspend and only re-enable it, if it was already
>>>>> enabled.
>>>>>
>>>>> Fixes: 73a7f0a90641 ("memory: tegra: Add EMC (external memory controller) driver")
>>>>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>>
>>>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> ---
>>>>>  arch/arm/mach-tegra/sleep-tegra30.S | 33 +++++++++++++++++++++++------
>>>>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
>>>>> index 3341a12bbb9c..c2f0793a424f 100644
>>>>> --- a/arch/arm/mach-tegra/sleep-tegra30.S
>>>>> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
>>>>> @@ -337,26 +337,42 @@ ENTRY(tegra30_lp1_reset)
>>>>>  	add	r1, r1, #2
>>>>>  	wait_until r1, r7, r3
>>>>>  
>>>>> -	/* enable PLLM via PMC */
>>>>> +	/* restore PLLM state */
>>>>>  	mov32	r2, TEGRA_PMC_BASE
>>>>> +	adr	r7, tegra_pllm_status
>>>>> +	ldr	r1, [r7]
>>>>> +	cmp	r2, #(1 << 12)
>>>>> +	bne	_skip_pllm
>>>>> +
>>>>>  	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
>>>>>  	orr	r1, r1, #(1 << 12)
>>>>>  	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
>>>>>  
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLM_BASE, 0
>>>>> +	pll_locked r1, r0, CLK_RESET_PLLM_BASE
>>>>> +
>>>>> +_skip_pllm:
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLC_BASE, 0
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLX_BASE, 0
>>>>>  
>>>>>  	b	_pll_m_c_x_done
>>>>>  
>>>>>  _no_pll_iddq_exit:
>>>>> -	/* enable PLLM via PMC */
>>>>> +	/* restore PLLM state */
>>>>>  	mov32	r2, TEGRA_PMC_BASE
>>>>> +	adr	r7, tegra_pllm_status
>>>>> +	ldr	r1, [r7]
>>>>> +	cmp	r2, #(1 << 12)
>>>>> +	bne	_skip_pllm_no_iddq
>>>>> +
>>>>>  	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
>>>>>  	orr	r1, r1, #(1 << 12)
>>>>>  	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
>>>>>  
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC
>>>>> +	pll_locked r1, r0, CLK_RESET_PLLM_BASE
>>>>> +
>>>>> +_skip_pllm_no_iddq:
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLX_BASE, CLK_RESET_PLLX_MISC
>>>>>  
>>>>> @@ -364,7 +380,6 @@ _pll_m_c_x_done:
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC
>>>>>  	pll_enable r1, r0, CLK_RESET_PLLA_BASE, CLK_RESET_PLLA_MISC
>>>>>  
>>>>> -	pll_locked r1, r0, CLK_RESET_PLLM_BASE
>>>>>  	pll_locked r1, r0, CLK_RESET_PLLP_BASE
>>>>>  	pll_locked r1, r0, CLK_RESET_PLLA_BASE
>>>>>  	pll_locked r1, r0, CLK_RESET_PLLC_BASE
>>>>> @@ -526,6 +541,8 @@ __no_dual_emc_chanl:
>>>>>  ENDPROC(tegra30_lp1_reset)
>>>>>  
>>>>>  	.align	L1_CACHE_SHIFT
>>>>> +tegra_pllm_status:
>>>>> +	.word	0
>>>>>  tegra30_sdram_pad_address:
>>>>>  	.word	TEGRA_EMC_BASE + EMC_CFG				@0x0
>>>>>  	.word	TEGRA_EMC_BASE + EMC_ZCAL_INTERVAL			@0x4
>>>>> @@ -624,10 +641,14 @@ tegra30_switch_cpu_to_clk32k:
>>>>>  	add	r1, r1, #2
>>>>>  	wait_until r1, r7, r9
>>>>
>>>>
>>>>> -	/* disable PLLM via PMC in LP1 */
>>>>> +	/* disable PLLM, if enabled, via PMC in LP1 */
>>>>> +	adr	r1, tegra_pllm_status
>>>>>  	ldr	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
>>>>> -	bic	r0, r0, #(1 << 12)
>>>>> -	str	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
>>>>> +	and	r2, r0, #(1 << 12)
>>>>> +	str     r2, [r1]
>>>>> +	cmp	r2, #(1 << 12)
>>>>> +	biceq	r0, r0, #(1 << 12)
>>>>> +	streq	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
>>>>>  
>>>>>  	/* disable PLLP, PLLA, PLLC and PLLX */
>>>>>  	ldr	r0, [r5, #CLK_RESET_PLLP_BASE]
>>>>
>>>> PLLM's enable-status could be defined either by PMC or CaR. Thus at
>>>> first you need to check whether PMC overrides CaR's enable and then
>>>> judge the enable state based on PMC or CaR state respectively.
>>>>
>>>
>>> Actually, now I think that it doesn't make sense to check PMC WB0 state
>>> at all. IIUC, PLLM's state of the WB0 register defines whether Boot ROM
>>> should enable PLLM on resume from suspend. Thus it will be correct to
>>> check only the CaR's enable-state of PLLM.
>>
>> Thanks for pointing this out and sorry for the delay. However, I am not
>> sure I agree that we should not check this at all. If the override bit
>> is set, then we do want to check the state from the PMC register and if
>> it is not then we should just use the PLLM register itself.
> 
> Sorry if I wasn't clear.. my point is that the PMC's override register
> bit doesn't reflect the PLLM's enable-state. The PLLM could be disabled
> while PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE bit is set.
> 
> The CaR's PLLM enable-state reflects the actual hardware state. At least
> that's what I see on T30.
> 
>>> Looks like it is a bit of nonsense that clk_pll_is_enabled() checks
>>> PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE for judging of the enable-state. This
>>> is not the first time I'm getting confused by it, perhaps will be
>>> worthwhile to clean up that part of the clk driver's code (if I'm not
>>> missing something).
>>
>> That code looks fine to me. I just think this code entering and exiting
>> suspend needs to be fixed. I will re-work this fix.

Hello, Jon! Do you have any plans to continue working on this patch? A
day ago I sent out patch that improves PLLM handling within the clk
driver [1], will be great if the resume from suspend could be improved
as well! :)

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200610163738.29304-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
