From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Thu, 13 Jun 2019 02:59:25 -0700
Message-ID: <3899af9b-07b0-8a76-e343-82871d3eb19a@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/12/19 6:55 AM, Dmitry Osipenko wrote:
> 11.06.2019 13:51, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Fix expression for residual bytes(less than word) transfer
>> in I2C PIO mode RX/TX.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..0596c12 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -514,7 +514,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_=
dev *i2c_dev)
>>   	 * If there is a partial word at the end of buf, handle it manually t=
o
>>   	 * prevent overwriting past the end of buf
>>   	 */
>> -	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> +	if (rx_fifo_avail > 0 &&
>> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>=20
> The buf_remaining >=3D BYTES_PER_FIFO_WORD is not possible to happen
> because there are three possible cases:
>=20
> 1) buf_remaining > rx_fifo_avail * 4:
>=20
> 	In this case rx_fifo_avail =3D 0
>=20
> 2) buf_remaining < rx_fifo_avail * 4;
>=20
> 	In this case buf_remaining is always < 4 because
> 	words_to_transfer is a buf_remaining rounded down to 4
> 	and then divided by 4. Hence:
>=20
> 	buf_remaining -=3D (buf_remaining / 4) * 4 always results
> 	into buf_remaining < 4.
>=20
> 3) buf_remaining =3D=3D rx_fifo_avail * 4:
>=20
> 	In this case rx_fifo_avail =3D 0 and buf_remaining =3D 0.
>=20
> Case 2 should never happen and means that something gone wrong.
>=20
Yes I now agree with you. The first condition "rx_fifo_avail > 0"=20
failure will take care and prevent need for additional checks.

>>   		BUG_ON(buf_remaining > 3);
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>> @@ -557,11 +558,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c=
_dev *i2c_dev)
>>   			words_to_transfer =3D tx_fifo_avail;
>>  =20
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
>>   		tx_fifo_avail -=3D words_to_transfer;
>> @@ -580,7 +580,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_d=
ev *i2c_dev)
>>   	 * prevent reading past the end of buf, which could cross a page
>>   	 * boundary and fault.
>>   	 */
>> -	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> +	if (tx_fifo_avail > 0 &&
>> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>>   		BUG_ON(buf_remaining > 3);
>>   		memcpy(&val, buf, buf_remaining);
>>   		val =3D le32_to_cpu(val);
>>
>=20
> Same as for RX.
>=20
Yes shall discard this patch from the next update.

-Thanks,
  Bitan
