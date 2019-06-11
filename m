From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Tue, 11 Jun 2019 00:38:03 -0700
Message-ID: <fe0a0cb2-73e3-8f5c-8115-f99c150bd5df@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
 <851d7837-5b98-228e-d8c9-3c41be1fb2e0@nvidia.com>
 <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e733bcb0-ea8c-61d1-e6b5-cee8b7696c70@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/10/19 2:00 PM, Dmitry Osipenko wrote:
> 10.06.2019 22:41, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>
>> On 6/10/19 11:12 AM, Dmitry Osipenko wrote:
>>> 10.06.2019 20:08, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>> as needed. Remove BUG() and make Rx and Tx case handling
>>>> similar.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>>>  =C2=A0 1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> Looks that this is still not correct. What if it transfer-complete flag
>>> is set and buffer is full on RX? In this case the transfer will succeed
>>> while it was a failure.
>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>> index 4dfb4c1..30619d6 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * prevent overwriting past the e=
nd of buf
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3);
>>>
>>> Actually error should be returned here since out-of-bounds memory
>>> accesses must be avoided, hence:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(buf_remaining > 3))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> buf_remaining will be less than equal to 3 because of the expression
>> earlier
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L520
>>
>=20
> Ah yes, indeed!
>=20
I see that I am wrong and buf_remaining > 3 needs to be prevented at

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L528

because of word_to_transfer is limited to rx_fifo_avail:

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L515

I shall add the check for less than 3 in both RX and TX cases in a=20
separate patch in this series.

>>
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D i2c_re=
adl(i2c_dev, I2C_RX_FIFO);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D cpu_to=
_le32(val);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(buf, &v=
al, buf_remaining);
>>>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_fifo_avail-=
-;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining =
> 0);
>>>
>>> Better not to ignore this as well:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 buf_remaining > 0))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>
>> Please check below line.
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L532
>>
>>
>> It ensures that buf_remaining will be 0 and we never hit the BUG_ON as
>> follows:
>=20
> [1] Okay, but it doesn't ensure about rx_fifo_avail. So it could be:
>=20
> 	if (WARN_ON_ONCE(rx_fifo_avail))
> 		return -EINVAL;
I shall add the WARN_ON_ONCE.


>=20
>>>> -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf_remaining =3D buf_rem=
aining;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf =3D buf;
>>>>  =C2=A0 @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct
>>>> tegra_i2c_dev *i2c_dev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * boundary and fault.
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3);
>>>
>>> And here, cause this will corrupt stack:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(buf_remain=
ing > 3))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EINVAL;
>>>
>> Please check the line
>> https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-=
tegra.c#L576
>>
>>
>> It ensures buf_remaining will be less or equal to 3.
>=20
> Okay, agree here.
>=20
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&val, b=
uf, buf_remaining);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D le32_t=
o_cpu(val);
>>>>  =C2=A0 @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, =
void
>>>> *dev_id)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (i2c_dev->msg_buf_remaining)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fifo(i2c_dev);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BUG();
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_mask_irq(i2c_dev,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 I2C_INT_RX_FIFO_DATA_REQ);
>>>
>>> Then here:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) =
||
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fifo(i2c=
_dev)) {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_err |=3D I2C_E=
RR_UNKNOWN_INTERRUPT;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0}
>>>
>> Can you please elaborate why the condition needs to be as follows
>> instead of " if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) " ?
>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining)=
 ||
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fi=
fo(i2c_dev)) {
>=20
> Because this is a "receive" transfer and hence it is a error condition
> if the data-message was already fully received and then there is another
> request from hardware to receive more data. So
> "!i2c_dev->msg_buf_remaining" is the error condition here because there
> is no more space in the buffer.
>=20
> Looking at this again, seems checking for "if
> (WARN_ON_ONCE(rx_fifo_avail))" in the above hunk [1] will be already
> enough since a not fully drained RX FIFO means that there is no enough
> space in the buffer. Then it could be:
>=20
>          if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
>                  i2c_dev->msg_err |=3D I2C_ERR_UNKNOWN_INTERRUPT;
>                  goto err;
> 	}
>=20
In the case "if (status & I2C_INT_PACKET_XFER_COMPLETE) {" , we do not=20
have any tegra_i2c_empty_rx_fifo call today. In this current driver I do=20
not see any code that checks for the buffer space and prevents RX FIFO=20
from being drained. The transfer complete when seen must have already=20
consumed all bytes of msg_buf_remaining in the call at the line

https://elixir.bootlin.com/linux/v5.2-rc4/source/drivers/i2c/busses/i2c-teg=
ra.c#L860

So we can put the "WARN_ON_ONCE(i2c_dev->msg_buf_remaining) with msg_err=20
assignment and goto err" to confirm if some corner case is not handled.

Planning to share updated patch.

-Thanks,
  Bitan
