From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] amba: tegra-ahb: Replace zero-length array with
 flexible-array member
Date: Thu, 19 Mar 2020 15:03:55 -0500
Message-ID: <a5a852d9-9f42-ce8a-58e6-d14e3da001af@embeddedor.com>
References: <20200211210213.GA28043@embeddedor>
 <292f9b65-c2b5-c719-ba79-c0db4a11f482@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <292f9b65-c2b5-c719-ba79-c0db4a11f482@embeddedor.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

Friendly ping (second time): Who can take this?

Thanks
--
Gustavo

On 2/27/20 1:33 PM, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: Who can take this?
> 
> Thanks
> --
> Gustavo
> 
> On 2/11/20 15:02, Gustavo A. R. Silva wrote:
>> The current codebase makes use of the zero-length array language
>> extension to the C90 standard, but the preferred mechanism to declare
>> variable-length types such as these ones is a flexible array member[1][2],
>> introduced in C99:
>>
>> struct foo {
>>         int stuff;
>>         struct boo array[];
>> };
>>
>> By making use of the mechanism above, we will get a compiler warning
>> in case the flexible array does not occur last in the structure, which
>> will help us prevent some kind of undefined behavior bugs from being
>> inadvertenly introduced[3] to the codebase from now on.
>>
>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>> [2] https://github.com/KSPP/linux/issues/21
>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>  drivers/amba/tegra-ahb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
>> index b0b688c481e8..e9e5c7bb580c 100644
>> --- a/drivers/amba/tegra-ahb.c
>> +++ b/drivers/amba/tegra-ahb.c
>> @@ -129,7 +129,7 @@ static const u32 tegra_ahb_gizmo[] = {
>>  struct tegra_ahb {
>>  	void __iomem	*regs;
>>  	struct device	*dev;
>> -	u32		ctx[0];
>> +	u32		ctx[];
>>  };
>>  
>>  static inline u32 gizmo_readl(struct tegra_ahb *ahb, u32 offset)
>>
