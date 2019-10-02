From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] arm64: tegra: only map accessible sysram
Date: Wed, 2 Oct 2019 14:30:53 -0600
Message-ID: <c7d64f56-cb44-cb3a-aa7a-ee7b5c01d6db@wwwdotorg.org>
References: <20190929200851.14228-1-ykaukab@suse.de>
 <5d2e47ec-8304-d648-9c4a-80c7c02050a9@wwwdotorg.org>
 <20190930100212.GA21324@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930100212.GA21324@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mian Yousaf Kaukab <ykaukab@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 9/30/19 4:02 AM, Mian Yousaf Kaukab wrote:
> On Sun, Sep 29, 2019 at 11:28:43PM -0600, Stephen Warren wrote:
>> On 9/29/19 2:08 PM, Mian Yousaf Kaukab wrote:
>>> Most of the SysRAM is secure and only accessible by TF-A.
>>> Don't map this inaccessible memory in kernel. Only map pages
>>> used by bpmp driver.
>>
>> I don't believe this change is correct. The actual patch doesn't
>> implement mapping a subset of the RAM (a software issue), but rather it
>> changes the DT representation of the SYSRAM hardware. The SYSRAM
>> hardware always does start at 0x30000000, even if a subset of the
>> address range is dedicated to a specific purpose. If the kernel must map
>> only part of the RAM, then some additional property should indicate
>> this.[...]
> I agree the hardware description becomes inaccurate with this change.
> 
> In the current setup complete 0x3000_0000 to 0x3005_0000 range is being mapped
> as normal memory (MT_NORMAL_NC). Though only 0x3004_E000 to 0x3005_0000 are
> accessible by the kernel.

Nit: I expect that a much larger region than that is *accessible*, 
although it's quite plausible that only that region is actually 
*accessed*/used right now.

> I am seeing an issue where a read access (which I
> believe is speculative) to inaccessible range causes an SError. Another
> solution for this problem could be to add "no-memory-wc" to SysRAM node so that
> it is mapped as device memory (MT_DEVICE_nGnRE). Would that be acceptable?

Why does the driver blindly map the entire memory at all? Surely it 
should only map the portions of RAM that other drivers request/use? And 
surely the BPMP driver or DT node is already providing that information?

But yes, changing the mapping type to avoid speculation might be an 
acceptable solution for now, although I think we'd want to work things 
out better later. I don't know if there would be any impact to the BPMP 
driver related to the slower SRAM access due to this change. Best 
consult a BPMP expert or Tegra maintainer about that.

>> [...] Also, I believe it's incorrect to hard-code into the kernel's DT
>> the range of addresses used by the secure monitor/OS, since this can
>> vary depending on what the user actually chooses to install as the
>> secure monitor/OS. Any indication of such regions should be filled in at
>> runtime by some boot firmware or the secure monitor/OS itself, or
>> retrieved using some runtime API rather than DT.
> Secure-OS addresses are not of interest here. SysRAM is partitioned
> between secure-OS and BPMP and kernel is only interested in the BPMP
> part. The firmware can update these addresses in the device-tree if it
> wants to. Would you prefer something similar implemented in u-boot so
> that it updates SysRAM node to only expose kernel accessible part of it
> to the kernel?
> 
> Can u-boot dynamically figure out the Secure-OS vs BPMP partition?
> 
> BR,
> Yousaf
> 
