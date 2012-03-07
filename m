From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v4 5/9] tegra: i2c: Add I2C driver
Date: Tue, 6 Mar 2012 20:48:50 -0800
Message-ID: <CAPnjgZ1RfqyOOT8nOYvArzfeZgqYeix4H=Ugsj8D8fM0WLwKfg@mail.gmail.com>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
	<1330536689-9121-6-git-send-email-sjg@chromium.org>
	<201203011529.11213.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <201203011529.11213.vapier@gentoo.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-tegra@vger.kernel.org, u-boot@lists.denx.de, Heiko Schocher <hs@denx.de>, Tom Warren <twarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Mike,

On Thu, Mar 1, 2012 at 12:29 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> On Wednesday 29 February 2012 12:31:25 Simon Glass wrote:
>> --- /dev/null
>> +++ b/arch/arm/include/asm/arch-tegra2/tegra_i2c.h
>>
>> +/* Convert i2c slave address to be put on bus =A0*/
>> +#define I2C_ADDR_ON_BUS(chip) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(chip << 1)
>
> i'm not sure the desc here is correct ... it's at least a little bit
> misleading. =A0addresses are 7bits, and the 8th bit is for telling the de=
vice to
> read/write. =A0since it only gets used in two places, might be better to =
inline
> the bit shift there ? =A0hard to say.

Yes I agree with you, have changed it.

>
>> --- /dev/null
>> +++ b/drivers/i2c/tegra_i2c.c
>>
>> + * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
>
> guess you need to -2012 that now ;)

Changed; pray I don't have to change it again.

>
>> +#include <common.h>
>> +#include <asm/io.h>
>> +#include <asm/arch/clk_rst.h>
>> +#include <asm/arch/clock.h>
>> +#include <asm/arch/funcmux.h>
>> +#include <asm/arch/gpio.h>
>> +#include <asm/arch/pinmux.h>
>> +#include <asm/arch/tegra_i2c.h>
>> +#include <fdtdec.h>
>
> needs to include i2c.h to make sure your local defs stay inline with the
> prototypes everyone else is using. =A0also, asm/* generally should come l=
ast (so
> after ftdec.h).

Done, which threw up an error in the i2c_init_board() signature. No
error checking :-(

>
>> +static int send_recv_packets(
>> + =A0 =A0 struct i2c_bus *i2c_bus,
>> + =A0 =A0 struct i2c_trans_info *trans)
>> +{
>> + =A0 =A0 struct i2c_control *control =3D i2c_bus->control;
>> + =A0 =A0 u32 int_status;
>> + =A0 =A0 u32 words;
>> + =A0 =A0 u8 *dptr;
>> + =A0 =A0 u32 local;
>> + =A0 =A0 uchar last_bytes;
>> + =A0 =A0 int error =3D 0;
>> + =A0 =A0 int is_write =3D trans->flags & I2C_IS_WRITE;
>> +
>> + =A0 =A0 /* clear status from previous transaction, XFER_COMPLETE, NOAC=
K, etc. */
>> + =A0 =A0 int_status =3D readl(&control->int_status);
>> + =A0 =A0 writel(int_status, &control->int_status);
>> +
>> + =A0 =A0 send_packet_headers(i2c_bus, trans, 1);
>> +
>> + =A0 =A0 words =3D DIV_ROUND_UP(trans->num_bytes, 4);
>> + =A0 =A0 last_bytes =3D trans->num_bytes & 3;
>> + =A0 =A0 dptr =3D trans->buf;
>> +
>> + =A0 =A0 while (words) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (is_write) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* deal with word alignment */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((unsigned)dptr & 3) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&local,=
 dptr, sizeof(u32));
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(local, =
&control->tx_fifo);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug("pkt dat=
a sent (0x%x)\n", local);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(*(u32 *=
)dptr, &control->tx_fifo);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 debug("pkt dat=
a sent (0x%x)\n", *(u32 *)dptr);
>
> generally inlining these types of bitsized casts are discouraged ...

OK I have added a separate variable for this.

Regards,
Simon

> -mike
