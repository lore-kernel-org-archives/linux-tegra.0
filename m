From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V2 10/21] clk: tegra: dfll: add CVB tables for Tegra210
Date: Fri, 14 Dec 2018 15:43:28 +0800
Message-ID: <9f0d08e3-a87a-2e85-e0d2-49ab25afc109@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-11-josephl@nvidia.com>
 <8fda3564-ab10-bb24-6d2a-6bd26358fe88@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8fda3564-ab10-bb24-6d2a-6bd26358fe88@nvidia.com>
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

On 12/13/18 8:50 PM, Jon Hunter wrote:
> 
> On 13/12/2018 09:34, Joseph Lo wrote:
>> Add CVB tables with different chip characterization, so that we can
>> generate the customize OPP table that suitable for different chips with
>> different SKUs.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> 
> ...
> 
>> diff --git a/drivers/clk/tegra/cvb.h b/drivers/clk/tegra/cvb.h
>> index bcf15a089b93..91a1941c21ef 100644
>> --- a/drivers/clk/tegra/cvb.h
>> +++ b/drivers/clk/tegra/cvb.h
>> @@ -41,6 +41,7 @@ struct cvb_cpu_dfll_data {
>>   	u32 tune0_low;
>>   	u32 tune0_high;
>>   	u32 tune1;
>> +	unsigned int tune_high_min_millivolts;
>>   };
> 
> Sorry, I forgot to respond to this on the previous version. I think that
> it is OK to add now, but please add a comment in the changelog to
> reflect that this is not currently used, but we have plans to use it and
> so we are adding all the data now.

Okay, will do. Thanks.

> 
> Cheers
> Jon
> 
