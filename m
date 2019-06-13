From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Thu, 13 Jun 2019 04:30:20 -0700
Message-ID: <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
> 11.06.2019 13:51, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>=20
> [snip]
>=20
>>   		/*
>> -		 * Update state before writing to FIFO.  If this casues us
>> +		 * Update state before writing to FIFO.  If this causes us
>>   		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>>   		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>> -		 * not maskable).  We need to make sure that the isr sees
>> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
>> +		 * not maskable).
>>   		 */
>>   		buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
>=20
> Looks like the comment could be removed altogether because it doesn't
> make sense since interrupt handler is under xfer_lock which is kept
> locked during of tegra_i2c_xfer_msg().
I would push a separate patch to remove this comment because of=20
xfer_lock in ISR now.

>=20
> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>=20
I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips=20
newer than Tegra30 allows one to not see interrupt after Packet transfer=20
complete. With the xfer_lock in ISR the scenario discussed in comment=20
can be ignored.

-regards,
  Bitan
