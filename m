From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7] i2c: tegra: remove BUG, BUG_ON
Date: Mon, 17 Jun 2019 22:28:59 +0300
Message-ID: <070ee927-be5a-327f-36d7-e6395c898574@gmail.com>
References: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
 <5a8ad23f-33c8-5140-cef8-f9cef70764b1@gmail.com>
 <43a3fae8-dd3e-c7d3-42a7-493210e601e2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <43a3fae8-dd3e-c7d3-42a7-493210e601e2@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

17.06.2019 21:41, Bitan Biswas пишет:
> 
> 
> On 6/17/19 5:13 AM, Dmitry Osipenko wrote:
>> 17.06.2019 8:09, Bitan Biswas пишет:
>>> Remove BUG, BUG_ON as it makes system usable:
>>>   - Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>     as needed.
>>>   - Remove BUG() and mask Rx interrupt similar as Tx
>>>     for message fully sent case.
>>>   - Add caller error handling and WARN_ON_ONCE check for non-zero
>>>     rx_fifo_avail in tegra_i2c_empty_rx_fifo() after all processing.
>>
>> The commit message should describe motivation of the change and not the change itself,
>> unless it's some additional information which is required for better understanding of
>> the code.
>>
>> In yours case it could be something like that:
>>
>>      The usage of BUG() macro is generally discouraged in kernel, unless
>>      it's a problem that results in a physical damage or loss of data.
>>      This patch removes unnecessary BUG() macros and replaces the rest
>>      with a warnings.
> I shall update as per above comments.
> 
>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 45 ++++++++++++++++++++++++++++++++++--------
>>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 4dfb4c1..b155b61 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -73,6 +73,7 @@
>>>   #define I2C_ERR_NO_ACK                BIT(0)
>>>   #define I2C_ERR_ARBITRATION_LOST        BIT(1)
>>>   #define I2C_ERR_UNKNOWN_INTERRUPT        BIT(2)
>>> +#define I2C_ERR_RX_BUFFER_OVERFLOW        BIT(3)
>>>     #define PACKET_HEADER0_HEADER_SIZE_SHIFT    28
>>>   #define PACKET_HEADER0_PACKET_ID_SHIFT        16
>>> @@ -515,7 +516,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>>        * prevent overwriting past the end of buf
>>>        */
>>>       if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>> -        BUG_ON(buf_remaining > 3);
>>> +        /*
>>> +         * buf_remaining > 3 check not needed as rx_fifo_avail == 0
>>> +         * when (words_to_transfer was > rx_fifo_avail) earlier
>>> +         * in this function.
>>> +         */
>>>           val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>>           val = cpu_to_le32(val);
>>>           memcpy(buf, &val, buf_remaining);
>>> @@ -523,7 +528,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>>           rx_fifo_avail--;
>>>       }
>>>   -    BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>> +    if ((!(i2c_dev->msg_buf_remaining)) &&
>>
>> The RX FIFO shall be drained completely no matter what.
>>
>> Hence why the "i2c_dev->msg_buf_remaining" checking is needed here?
> I moved the part of below condition in Patch V6 to function tegra_i2c_empty_rx_fifo:
> 
>>> +            err_val = tegra_i2c_empty_rx_fifo(i2c_dev);
>>> +            if ((!(i2c_dev->msg_buf_remaining)) &&
> 
>> Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL for that case.
>> This will make code to look cleaner.
> 
> Is above condition not needed?

Let's put it at the very beginning. This may give a bit more information about the
problem by knowing if the offending overflow happens after or during of the buffer's
fill up.

static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
{
	u32 val;
	int rx_fifo_avail;
	u8 *buf = i2c_dev->msg_buf;
	size_t buf_remaining = i2c_dev->msg_buf_remaining;
	int words_to_transfer;

	if (WARN_ON(!i2c_dev->msg_buf_remaining))
		return -EINVAL;
...

In general, the original logic should be preserved during of refactoring. In this case
we are keeping the original check and then also making it a bit more informative.

> 
>>
>> Secondly, in the future please don't add parens where they are not needed. In this
>> case parens around !i2c_dev->msg_buf_remaining are not needed at all.
>>
> I shall look out for similar unnecessary parentheses and update the patch.

Yes, please clean up all the occurrences in the code if there are any. And please do
it in a separate patch.
