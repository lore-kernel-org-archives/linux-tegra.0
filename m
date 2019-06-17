From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V7] i2c: tegra: remove BUG, BUG_ON
Date: Mon, 17 Jun 2019 11:41:00 -0700
Message-ID: <43a3fae8-dd3e-c7d3-42a7-493210e601e2@nvidia.com>
References: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
 <5a8ad23f-33c8-5140-cef8-f9cef70764b1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a8ad23f-33c8-5140-cef8-f9cef70764b1@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/17/19 5:13 AM, Dmitry Osipenko wrote:
> 17.06.2019 8:09, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove BUG, BUG_ON as it makes system usable:
>>   - Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>     as needed.
>>   - Remove BUG() and mask Rx interrupt similar as Tx
>>     for message fully sent case.
>>   - Add caller error handling and WARN_ON_ONCE check for non-zero
>>     rx_fifo_avail in tegra_i2c_empty_rx_fifo() after all processing.
>=20
> The commit message should describe motivation of the change and not the c=
hange itself,
> unless it's some additional information which is required for better unde=
rstanding of
> the code.
>=20
> In yours case it could be something like that:
>=20
>      The usage of BUG() macro is generally discouraged in kernel, unless
>      it's a problem that results in a physical damage or loss of data.
>      This patch removes unnecessary BUG() macros and replaces the rest
>      with a warnings.
I shall update as per above comments.

>=20
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 45 ++++++++++++++++++++++++++++++++++=
--------
>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-teg=
ra.c
>> index 4dfb4c1..b155b61 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -73,6 +73,7 @@
>>   #define I2C_ERR_NO_ACK				BIT(0)
>>   #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>   #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
>>  =20
>>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -515,7 +516,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c=
_dev *i2c_dev)
>>   	 * prevent overwriting past the end of buf
>>   	 */
>>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>> +		/*
>> +		 * buf_remaining > 3 check not needed as rx_fifo_avail =3D=3D 0
>> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
>> +		 * in this function.
>> +		 */
>>   		val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
>>   		val =3D cpu_to_le32(val);
>>   		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +528,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c=
_dev *i2c_dev)
>>   		rx_fifo_avail--;
>>   	}
>>  =20
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>> +	if ((!(i2c_dev->msg_buf_remaining)) &&
>=20
> The RX FIFO shall be drained completely no matter what.
>=20
> Hence why the "i2c_dev->msg_buf_remaining" checking is needed here?
I moved the part of below condition in Patch V6 to function=20
tegra_i2c_empty_rx_fifo:

 >> +			err_val =3D tegra_i2c_empty_rx_fifo(i2c_dev);
 >> +			if ((!(i2c_dev->msg_buf_remaining)) &&

 > Let's move this check into tegra_i2c_empty_rx_fifo() and return=20
-EINVAL for that case.
 > This will make code to look cleaner.

Is above condition not needed?


>=20
> Secondly, in the future please don't add parens where they are not needed=
. In this
> case parens around !i2c_dev->msg_buf_remaining are not needed at all.
>=20
I shall look out for similar unnecessary parentheses and update the patch.

>> +	    WARN_ON_ONCE(rx_fifo_avail))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * buf_remaining > 0 at this point can only have rx_fifo_avail =3D=3D =
0
>=20
> The rx_fifo_avail is always 0 at this point, including the case of buf_re=
maining =3D=3D 0.
> It will be better if you'll add a comment for the WARN_ON_ONCE(rx_fifo_av=
ail) above,
> saying that RX FIFO must be fully drained, and then just drop this commen=
t.
>=20

OK.

>> +	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
>> +	 * case earlier in this function.
>> +	 */
>>   	i2c_dev->msg_buf_remaining =3D buf_remaining;
>>   	i2c_dev->msg_buf =3D buf;
>=20
> [snip]
>=20
