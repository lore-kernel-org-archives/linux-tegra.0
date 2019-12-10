From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: Fix restoration of PLLM when exiting suspend
Date: Tue, 10 Dec 2019 14:32:40 +0000
Message-ID: <cd2aaa4a-c0de-a6e7-ca93-06901f5bb142@nvidia.com>
References: <20191210103708.7023-1-jonathanh@nvidia.com>
 <20191210120909.GA2703785@ulmo>
 <8bf12fcd-02c7-4dc0-90e6-30009ab9f8e7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <8bf12fcd-02c7-4dc0-90e6-30009ab9f8e7@nvidia.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 10/12/2019 14:29, Jon Hunter wrote:
> 
> On 10/12/2019 12:09, Thierry Reding wrote:
>> On Tue, Dec 10, 2019 at 10:37:08AM +0000, Jon Hunter wrote:
>>> The suspend entry and exit code for 32-bit Tegra devices assumes that
>>> the PLLM (which is used to provide the clock for external memory)
>>> is always enabled on entry to suspend. Hence, the current code always
>>> disables the PLLM on entry to suspend and re-enables the PLLM on exit
>>> from suspend.
>>>
>>> Since the introduction of the Tegra124 EMC driver by commit 73a7f0a90641
>>> ("memory: tegra: Add EMC (external memory controller) driver"), which is
>>> used to scale the EMC frequency, PLLM may not be the current clock
>>> source for the EMC on entry to suspend and hence may not be enabled.
>>> Always enabling the PLLM on exit from suspend can cause the actual
>>> status on the PLL to be different from that reported by the common clock
>>> framework.
>>>
>>> On kernels prior to v4.5, the code to set the rate of the PLLM had a
>>> test to verify if the PLL was enabled and if the PLL was enabled,
>>> setting the rate would fail. Since commit 267b62a96951
>>> ("clk: tegra: pll: Update PLLM handling") the test to see if PLLM is
>>> enabled was removed.
>>>
>>> With these earlier kernels, if the PLLM is disabled on entering suspend
>>> and the EMC driver attempts to set the parent of the EMC clock to the
>>> PLLM on exiting suspend, then the set rate for the PLLM will fail and in
>>> turn cause the resume to fail.
>>>
>>> We should not be re-enabling the PLLM on resume from suspend unless it
>>> was enabled on entry to suspend. Therefore, fix this by saving the state
>>> of PLLM on entry to suspend and only re-enable it, if it was already
>>> enabled.
>>>
>>> Fixes: 73a7f0a90641 ("memory: tegra: Add EMC (external memory controller) driver")
>>> Cc: stable@vger.kernel.org
>>>
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>  arch/arm/mach-tegra/sleep-tegra30.S | 33 +++++++++++++++++++++++------
>>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>
>> Looks good to me. If I understand correctly we really only need this on
>> v4.4 and earlier because the issue doesn't happen on later kernels
>> because of that PLLM handling update change that you mentioned, right?
> 
> Yes.

However, although we don't see any failures so far on mainline, it is
possible for the CCF status for PLLM to be incorrect following suspend.

Jon

-- 
nvpublic
