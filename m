From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Thu, 13 Jun 2019 15:28:02 +0300
Message-ID: <9cb7123a-1ebd-3a93-60dc-c8f57f60270b@gmail.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
 <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

13.06.2019 14:30, Bitan Biswas пишет:
> 
> 
> On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
>> 11.06.2019 13:51, Bitan Biswas пишет:
>>> Fix expression for residual bytes(less than word) transfer
>>> in I2C PIO mode RX/TX.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>
>> [snip]
>>
>>>           /*
>>> -         * Update state before writing to FIFO.  If this casues us
>>> +         * Update state before writing to FIFO.  If this causes us
>>>            * to finish writing all bytes (AKA buf_remaining goes to
>>> 0) we
>>>            * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>>> -         * not maskable).  We need to make sure that the isr sees
>>> -         * buf_remaining as 0 and doesn't call us back re-entrantly.
>>> +         * not maskable).
>>>            */
>>>           buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
>>
>> Looks like the comment could be removed altogether because it doesn't
>> make sense since interrupt handler is under xfer_lock which is kept
>> locked during of tegra_i2c_xfer_msg().
> I would push a separate patch to remove this comment because of
> xfer_lock in ISR now.
> 
>>
>> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
>> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>>
> I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips
> newer than Tegra30 allows one to not see interrupt after Packet transfer
> complete. With the xfer_lock in ISR the scenario discussed in comment
> can be ignored.

Also note that xfer_lock could be removed and replaced with a just
irq_enable/disable() calls in tegra_i2c_xfer_msg() because we only care
about IRQ not firing during of the preparation process.

It also looks like tegra_i2c_[un]nmask_irq isn't really needed and all
IRQ's could be simply unmasked during the driver's probe, in that case
it may worth to add a kind of "in-progress" flag to catch erroneous
interrupts.
