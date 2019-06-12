From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Wed, 12 Jun 2019 16:33:28 +0300
Message-ID: <740f00e5-728a-e31d-28bb-193c7061753c@gmail.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
 <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
 <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
 <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
 <d29804b9-d3be-9eb2-ba06-f4de2aad3764@gmail.com>
 <acb7970e-b1b2-ce14-d822-fc74ca7751fb@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <acb7970e-b1b2-ce14-d822-fc74ca7751fb@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

11.06.2019 21:22, Bitan Biswas пишет:
> 
> 
> On 6/11/19 4:34 AM, Dmitry Osipenko wrote:
>> 11.06.2019 10:38, Bitan Biswas пишет:
>>>
>>>
>>> On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
>>>> 10.06.2019 22:41, Bitan Biswas пишет:
>>>>>
>>>>>
>>>>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>>>>> 10.06.2019 20:08, Bitan Biswas пишет:
>>>>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>>>>> similar.
>>>>>>>
>>>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>>>> ---
>>>>>>>     drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>>>>>     1 file changed, 6 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> Looks that this is still not correct. What if it transfer-complete
>>>>>> flag
>>>>>> is set and buffer is full on RX? In this case the transfer will
>>>>>> succeed
>>>>>> while it was a failure.
>>>>>>
>>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> index 4dfb4c1..30619d6 100644
>>>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>>>>> tegra_i2c_dev *i2c_dev)
>>>>>>>          * prevent overwriting past the end of buf
>>>>>>>          */
>>>>>>>         if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>>>>>> -        BUG_ON(buf_remaining > 3);
>>>>>>
>>>>>> Actually error should be returned here since out-of-bounds memory
>>>>>> accesses must be avoided, hence:
>>>>>>
>>>>>>       if (WARN_ON_ONCE(buf_remaining > 3))
>>>>>>           return -EINVAL;
>>>>> buf_remaining will be less than equal to 3 because of the expression
>>>>> earlier
>>>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L520
>>>>>
>>>>>
>>>>>
>>>>
>>>> Ah yes, indeed!
>>>>
>>> I see that I am wrong and buf_remaining > 3 needs to be prevented at
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L528
>>>
>>>
>>>
>>> because of word_to_transfer is limited to rx_fifo_avail:
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L515
>>>
>>>
>>>
>>> I shall add the check for less than 3 in both RX and TX cases in a
>>> separate patch in this series.
>>
>> When word_to_transfer is more than rx_fifo_avail, then the rx_fifo_avail
>> becomes zero and hence the nibbles won't be copied. Please take a closer
>> look, the current code is correct, but the buf_remaining > 3 is unneeded
>> because it can't ever happen.
>>
>> The code is structured the way that it's difficult to follow, apparently
>> the person who added the BUG_ON check in the first place couldn't follow
>> it either. Maybe it's worth to invest some more effort into refactoring
>> at least that part of the code. At minimum a clarifying comments would
>> be helpful.
>>
> I shall try to add some comments near the BUG_ON check.
> 
>> [snip]
>>
>>>>>> Then here:
>>>>>>
>>>>>>       if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>>>           tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>>>           i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>>>>>           goto err;
>>>>>>       }
>>>>>>
>>>>> Can you please elaborate why the condition needs to be as follows
>>>>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>>>>
>>>>>>        if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
>>>>>>            tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>
>>>> Because this is a "receive" transfer and hence it is a error condition
>>>> if the data-message was already fully received and then there is
>>>> another
>>>> request from hardware to receive more data. So
>>>> "!i2c_dev->msg_buf_remaining" is the error condition here because there
>>>> is no more space in the buffer.
>>>>
>>>> Looking at this again, seems checking for "if
>>>> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
>>>> enough since a not fully drained RX FIFO means that there is no enough
>>>> space in the buffer. Then it could be:
>>>>
>>>>           if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
>>>>                   i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
>>>>                   goto err;
>>>>      }
>>>>
>>> In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not
>>> have any tegra_i2c_empty_rx_fifo call today. In this current driver I do
>>> not see any code that checks for the buffer space and prevents RX FIFO
>>> from being drained. The transfer complete when seen must have already
>>> consumed all bytes of msg_buf_remaining in the call at the line
>>>
>>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L860
>>>
>>>
>>>
>>> So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_err
>>> assignment and goto err" to confirm if some corner case is not handled.
>>>
>>> Planning to share updated patch.
>>
>> There are two possible error conditions:
>>
>> 1) Underflow: the XFER_COMPLETE happens before message is fully sent.
>>
>> 2) Overflow: message is fully sent, but there is no XFER_COMPLETE and
>> then hardware asks to transfer more.
>>
>> We are addressing the second case here, while you seems are confusing it
>> with the first case.
>>
> Is the Overflow case pointed above corresponding to when
> msg_buf_remaining is zero?

Yes!

 If no, what indicates that message is fully
> sent? I see that if msg_buf_remaining is already zero, the call
> tegra_i2c_empty_rx_fifo will not do any copy of the bytes from FIFO to buf.
> 
> One more point that is not clear to me is are the above suggestions you
> made is corresponding to replacing below line in linux-next ?
> 
> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L888

That addresses the "underflow" case. I'm not suggesting to replace it at
all. I was talking about replacing this and nothing else:

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-tegra.c#L862

> Can you please also review the newly added patch "V5 6/7 "that was newly
> posted? I think it is needed.

Sure.
