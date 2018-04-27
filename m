From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 09/15] memory: tegra: Squash tegra20-mc into common
 tegra-mc driver
Date: Fri, 27 Apr 2018 13:13:47 +0300
Message-ID: <882f14b8-78c8-95bb-326e-3917c9736faf@gmail.com>
References: <cover.1523301400.git.digetx@gmail.com>
 <675f74f82378b5f7d8f61d35e929614a0e156141.1523301400.git.digetx@gmail.com>
 <20180427093435.GB30388@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427093435.GB30388@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 27.04.2018 12:34, Thierry Reding wrote:
> On Mon, Apr 09, 2018 at 10:28:31PM +0300, Dmitry Osipenko wrote:
> [...]
>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> [...]
>> +#define MC_GART_ERROR_REQ		0x30
>> +#define MC_DECERR_EMEM_OTHERS_STATUS	0x58
>> +#define MC_SECURITY_VIOLATION_STATUS	0x74
> [...]
>> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> [...]
>> @@ -21,19 +21,30 @@
>>  #define MC_INT_INVALID_SMMU_PAGE (1 << 10)
>>  #define MC_INT_ARBITRATION_EMEM (1 << 9)
>>  #define MC_INT_SECURITY_VIOLATION (1 << 8)
>> +#define MC_INT_INVALID_GART_PAGE (1 << 7)
>>  #define MC_INT_DECERR_EMEM (1 << 6)
>>  
>>  static inline u32 mc_readl(struct tegra_mc *mc, unsigned long offset)
>>  {
>> +	if (mc->regs2 && offset >= 0x24)
>> +		return readl(mc->regs2 + offset - 0x3c);
> 
> I'm still not sure how this is supposed to work. If we pass in
> MC_GART_ERROR_REQ as offset into mc_readl(), then the condition above
> will be true (0x30 >= 0x24) but then the new offset will be computed
> and we end up with:
> 
> 	return readl(mc->regs2 + 0x30 - 0x3c);
> 
> which means we'll be adding a negative offset (or rather a very large
> offset because it will wrap around).

Indeed! Thank you for pointing at it again, now I see the issue. It probably
works because actual registers mapping is aligned to page(?) size and adding the
large offset with wraparound is equal to subtraction.

That register belongs to the GART and we can't simply move interrupt handling to
the GART driver because status register is within the MC in device tree. We can
omit reading of MC_GART_ERROR_REQ and simply report GART page fault for the
starter and then reorganize drivers by making MC driver MFD and GART its
sub-device, what do you think?
