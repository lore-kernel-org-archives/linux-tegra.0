From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Date: Thu, 6 Jun 2019 20:40:11 -0700
Message-ID: <7f24640f-5031-1413-e96d-6a28e6a50869@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
 <8df7648d-c5bd-7179-6368-66dab9b7fa39@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8df7648d-c5bd-7179-6368-66dab9b7fa39@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/6/19 1:45 PM, Peter Rosin wrote:
> On 2019-06-06 09:35, Bitan Biswas wrote:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>>
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 67 +++++++++++++++++++++++-------------------
>>   1 file changed, 37 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 76b7926..55a5d87 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -78,6 +78,7 @@
>>   #define I2C_ERR_NO_ACK				0x01
>>   #define I2C_ERR_ARBITRATION_LOST		0x02
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		0x04
>> +#define I2C_ERR_UNEXPECTED_STATUS               0x08
> 
> Use tabs like the the surrounding code. And perhaps convert all
> these flags to use the BIT() macro?
I shall correct the line and use tabs. I shall convert macros to BIT() 
if possible.

> 
>>   
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -112,7 +113,7 @@
>>   #define I2C_CLKEN_OVERRIDE			0x090
>>   #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
>>   
>> -#define I2C_CONFIG_LOAD_TIMEOUT			1000000
>> +#define I2C_CONFIG_LOAD_TMOUT			1000000
> 
> Similar to xfer_tm already mentioned by Dmitry; just keep it as
> ..._TIMEOUT and ignore checkpatch on this issue. Or juggle the
> code in some other way to pacify checkpatch. E.g. abbreviate
> CONFIG instead? Or something. CONF is way easier to read than
> TMOUT IMHO...
OK. Just for consistency planning to ignore checkpatch warning and shall 
keep current macro I2C_CONFIG_LOAD_TIMEOUT.

-Thanks,
  Bitan
