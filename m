From: Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Fri, 7 Jun 2019 12:24:12 -0700
Message-ID: <40f730a0-d602-fe94-8e20-3e209b1c9eda@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
 <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
 <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
 <9adcde41-2450-27dc-36a0-b3b99022b43d@gmail.com>
 <75a7f16f-5d54-797d-fb72-445411f20424@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75a7f16f-5d54-797d-fb72-445411f20424@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 6/7/19 11:55 AM, Bitan Biswas wrote:
>=20
>=20
> On 6/7/19 5:18 AM, Dmitry Osipenko wrote:
>> 07.06.2019 15:12, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 07.06.2019 15:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 07.06.2019 14:55, Bitan Biswas =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>>>>> as needed. Replace BUG() with error handling code.
>>>>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>>>>
>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>> ---
>>>>> =C2=A0 drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>>>>> =C2=A0 1 file changed, 8 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c=20
>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>> index 4dfb4c1..c407bd7 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -73,6 +73,7 @@
>>>>> =C2=A0 #define I2C_ERR_NO_ACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>>> =C2=A0 #define I2C_ERR_ARBITRATION_LOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>>>>> =C2=A0 #define I2C_ERR_UNKNOWN_INTERRUPT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
>>>>> +#define I2C_ERR_UNEXPECTED_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(3)
>>>>> =C2=A0 #define PACKET_HEADER0_HEADER_SIZE_SHIFT=C2=A0=C2=A0=C2=A0 28
>>>>> =C2=A0 #define PACKET_HEADER0_PACKET_ID_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 16
>>>>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct=20
>>>>> tegra_i2c_dev *i2c_dev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * prevent overwriting past the e=
nd of buf
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3)=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D i2c_re=
adl(i2c_dev, I2C_RX_FIFO);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D cpu_to=
_le32(val);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(buf, &v=
al, buf_remaining);
>>>>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct=20
>>>>> tegra_i2c_dev *i2c_dev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx_fifo_avail-=
-;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> -=C2=A0=C2=A0=C2=A0 BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf_remaining =3D buf_rem=
aining;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_buf =3D buf;
>>>>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct=20
>>>>> tegra_i2c_dev *i2c_dev)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * boundary and fault.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tx_fifo_avail > 0 && buf_remaining=
 > 0) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(buf_remaining > 3)=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&val, b=
uf, buf_remaining);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D le32_t=
o_cpu(val);
>>>>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq,=20
>>>>> void *dev_id)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!i2c_dev->is_curr_dma_xfer) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i2c_dev->m=
sg_read && (status &=20
>>>>> I2C_INT_RX_FIFO_DATA_REQ)) {
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (i2c_dev->msg_buf_remaining)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (i2c_dev->msg_buf_remaining) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_i2c_empty_rx_fifo(i2c_dev);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
lse
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 else {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(i2c_dev->dev, "unexpected rx data=20
>>>>> request\n");
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 i2c_dev->msg_err |=3D I2C_ERR_UNEXPECTED_STATUS;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!i2c_dev->=
msg_read && (status &=20
>>>>> I2C_INT_TX_FIFO_DATA_REQ)) {
>>>>> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void=20
>>>>> *dev_id)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (status & I2C_INT_PACKET_XFER_COMPL=
ETE) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i2c_dev->i=
s_curr_dma_xfer)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 i2c_dev->msg_buf_remaining =3D 0;
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(i2c_dev->msg_buf_r=
emaining);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON_ONCE(i2c_dev->msg=
_buf_remaining);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete(&i2c_=
dev->msg_complete);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>>>>>
>>>>
>>>> Very nice, thank you very much! BTW, I think it may worth to add=20
>>>> another
>>>> patch that will reset hardware state in a case of the warning since we
>>>> know that something gone wrong.
>>>>
>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>>
>>>
>>> Something like that:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete(&i2c_dev->msg_complete);
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
>>>
>>
>> Ah, that's inside the ISR, so maybe will make sense to just not complete
>> the transfer and let it timeout:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0if (!WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete(&i2c_dev->msg_comple=
te);
> OK. I shall send the updated patch.
I see that there is already err label in the ISR that could be jumped=20
into. Hence, planning to share updated patch with the error handling.

-regards,
  Bitan
