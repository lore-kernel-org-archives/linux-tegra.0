From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 09/19] clk: tegra: dfll: add CVB tables for Tegra210
Date: Tue, 11 Dec 2018 15:34:26 +0800
Message-ID: <dcd13c46-423c-f03a-5df2-70316c5d21c9@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-10-josephl@nvidia.com>
 <61658127-d299-013a-d745-47a648f7a4cf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <61658127-d299-013a-d745-47a648f7a4cf@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/7/18 10:39 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> Add CVB tables with different chip characterization, so that we can
>> generate the customize OPP table that suitable for different chips with
>> different SKUs.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 426 +++++++++++++++++++++
>>   drivers/clk/tegra/cvb.h                    |   1 +
>>   2 files changed, 427 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> index 071a5c674832..bc1358d8084b 100644
>> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
>> @@ -88,6 +88,421 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
>>   	},
>>   };
>>   
snip.
>>   
>> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
>> index bcf15a089b93..91a1941c21ef 100644
>> --- a/drivers/clk/tegra/cvb.h
>> +++ b/drivers/clk/tegra/cvb.h
>> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>>   	u32 tune0_low;
>>   	u32 tune0_high;
>>   	u32 tune1;
>> +	unsigned int tune_high_min_millivolts;
> 
> Where is this actually used?

It's just part of the initial CVB table. We don't have the dynamic 
tunning support yet that will use this tune parameter for output freq 
tunning. It's on my plan of the next series for DFLL enhancement.

Should I remove that from the table?

Thanks,
Joseph
