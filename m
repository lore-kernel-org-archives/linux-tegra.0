From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Mon, 10 Jun 2019 12:41:03 -0700
Message-ID: <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
> 10.06.2019 20:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Remove BUG() and make Rx and Tx case handling
>> similar.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> Looks that this is still not correct. What if it transfer-complete flag
> is set and buffer is full on RX? In this case the transfer will succeed
> while it was a failure.
>=20
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..30619d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>=20
> Actually error should be returned here since out-of-bounds memory
> accesses must be avoided, hence:
>=20
> 	if (WARN_ON_ONCE(buf_remaining > 3))
> 		return -EINVAL;
buf_remaining will be less than equal to 3 because of the expression=20
earlier
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L520

>=20
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   		rx_fifo_avail--;
>>   	}
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>=20
> Better not to ignore this as well:
>=20
> 	if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
> 			 buf_remaining > 0))
> 		return -EINVAL;
>=20
Please check below line.
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L532=20


It ensures that buf_remaining will be 0 and we never hit the BUG_ON as=20
follows:

 >> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);

>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>>  =20
>> @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * boundary and fault.
>>   	 */
>>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>=20
> And here, cause this will corrupt stack:
>=20
> 		if (WARN_ON_ONCE(buf_remaining > 3))
> 			return -EINVAL;
>=20
Please check the line
https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L576

It ensures buf_remaining will be less or equal to 3.

>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>  =20
>> @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>>   			if (i2c_dev->msg_buf_remaining)
>>   				tegra_i2c_empty_rx_fifo(i2c_dev);
>>   			else
>> -				BUG();
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_RX_FIFO_DATA_REQ);
>=20
> Then here:
>=20
> 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
> 	    tegra_i2c_empty_rx_fifo(i2c_dev)) {
> 		i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
> 		goto err;
> 	}
>=20
Can you please elaborate why the condition needs to be as follows=20
instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?

 > 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
 > 	    tegra_i2c_empty_rx_fifo(i2c_dev)) {


-regards,
  Bitan
