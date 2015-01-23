From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Maintain CPU endianness
Date: Fri, 23 Jan 2015 18:10:58 +0900
Message-ID: <CAAVeFuLLn8L0s7_19TX+RzSY88T0tno4SRguM2ipBe6yWHrgmw@mail.gmail.com>
References: <1421950352-26515-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421950352-26515-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 23, 2015 at 3:12 AM, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Support CPU BE mode by adding endianness conversion for memcpy interactions.
>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changelog:
> v2: For consistency cpu_to_le32() changed to le32_to_cpu() because
>     i2c_writel() takes BE value in BE CPU mode and value is in LE format.
>
>  drivers/i2c/busses/i2c-tegra.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 28b87e6..b5afb9f 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -286,6 +286,7 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>         if (rx_fifo_avail > 0 && buf_remaining > 0) {
>                 BUG_ON(buf_remaining > 3);
>                 val = i2c_readl(i2c_dev, I2C_RX_FIFO);
> +               val = cpu_to_le32(val);
>                 memcpy(buf, &val, buf_remaining);
>                 buf_remaining = 0;
>                 rx_fifo_avail--;
> @@ -343,7 +344,9 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>          */
>         if (tx_fifo_avail > 0 && buf_remaining > 0) {
>                 BUG_ON(buf_remaining > 3);
> +               val = 0;
>                 memcpy(&val, buf, buf_remaining);
> +               val = le32_to_cpu(val);

Ok, with le32_to_cpu() this makes sense now. memcpying part of an int
will keep the lowest byte at the lowest address, so this should work
for little-endian.

Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
