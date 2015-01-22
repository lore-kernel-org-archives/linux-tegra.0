From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Maintain CPU endianness
Date: Thu, 22 Jan 2015 16:55:36 +0900
Message-ID: <CAAVeFuJHST9VOWXe_cZNvLmfGdamuU4HSgdZC6EoQvrsGFt+Fg@mail.gmail.com>
References: <1421756555-20266-1-git-send-email-digetx@gmail.com> <20150122074001.GB427@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150122074001.GB427@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 22, 2015 at 4:40 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 20, 2015 at 03:22:25PM +0300, Dmitry Osipenko wrote:
>> Support CPU BE mode by adding endianness conversion for memcpy interactions.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 28b87e6..e0d3ef1 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -286,6 +286,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>       if (rx_fifo_avail > 0 && buf_remaining > 0) {
>>               BUG_ON(buf_remaining > 3);
>>               val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>> +             val = cpu_to_le32(val);
>
> Should this not technically be le32_to_cpu() since the data originates
> from the I2C controller?
>
>>               memcpy(buf, &val, buf_remaining);
>>               buf_remaining = 0;
>>               rx_fifo_avail--;
>> @@ -343,7 +344,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>        */
>>       if (tx_fifo_avail > 0 && buf_remaining > 0) {
>>               BUG_ON(buf_remaining > 3);
>> +             val = 0;
>
> Why does this have to be initialized to 0 now?

I suspect this is because we are going to memcpy less than 4 bytes
into it, but I cannot figure out how that memcpy if guaranteed to
produce the expected result for both endiannesses.
