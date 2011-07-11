From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter functionality
Date: Mon, 11 Jul 2011 00:50:47 -0700
Message-ID: <CAMbhsRSofeeNY9aTeZoMZM2qMMbgcARgeEa5O39Z16ui4x7qgQ@mail.gmail.com>
References: <20110711073755.GA8665@gentoodev.compulab.local>
	<CAMbhsRS-REFiAiEnukVtarTx7PRrzLT0BHAHdmuPGqDRRppGtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMbhsRS-REFiAiEnukVtarTx7PRrzLT0BHAHdmuPGqDRRppGtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
Cc: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 11, 2011 at 12:49 AM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrot=
e:
> On Mon, Jul 11, 2011 at 12:37 AM, =A0<mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
>> Hi Ben,
>> This patch has been waiting for quite a long time and I've got no re=
sponse
>> from you concerning it.
>> Can you _please_ at last merge it so it'll make to 3.1?
>>
>> --
>> Sincerely yours,
>> Mike,
>>
>>
>> From 5ac2b2824d2d49954aa9897344481e32f2368749 Mon Sep 17 00:00:00 20=
01
>> From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> Date: Mon, 11 Jul 2011 10:28:57 +0300
>> Subject: [PATCH] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter func=
tionality
>>
>> as there are a lot of i2c device drivers that require it
>>
>> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> ---
>> =A0drivers/i2c/busses/i2c-tegra.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c=
-tegra.c
>> index 4d93196..2fe4951 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -524,7 +524,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *ad=
ap, struct i2c_msg msgs[],
>>
>> =A0static u32 tegra_i2c_func(struct i2c_adapter *adap)
>> =A0{
>> - =A0 =A0 =A0 return I2C_FUNC_I2C;
>> + =A0 =A0 =A0 return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> =A0}
>>
>> =A0static const struct i2c_algorithm tegra_i2c_algo =3D {
>> --
>> 1.7.3.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegr=
a" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> Your mailer added @mike-pc.compulab.local to all of the addresses.
>
> Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>
> It should go in through Ben's tree.
>

The quotes in the wrong place made my mailer do the same thing.  Resent=
=2E
