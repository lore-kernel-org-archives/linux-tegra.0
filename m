From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 3/6] gpu: host1x: Improve debug disassembly formatting
Date: Thu, 28 Sep 2017 06:29:56 -0700
Message-ID: <1506605396.29089.22.camel@perches.com>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
         <20170928125044.32516-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928125044.32516-4-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2017-09-28 at 15:50 +0300, Mikko Perttunen wrote:
> The host1x driver prints out "disassembly" dumps of the command FIFO
> and gather contents on submission timeouts. However, the output has
> been quite difficult to read with unnecessary newlines and occasional
> missing parentheses.

I think it would be cleaner/simpler to change
this by adding a line initiator with just a
KERN_<LEVEL> at the few places that actually
start a newline.

Then change the write_to_seqfile to skip any
output that starts with KERN_<LEVEL>

> diff --git a/drivers/gpu/host1x/hw/debug_hw_1x01.c b/drivers/gpu/host1x/hw/debug_hw_1x01.c
[]
> @@ -111,11 +111,11 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
>  		val = host1x_sync_readl(host, HOST1X_SYNC_CFPEEK_READ);
>  
>  		if (!data_count) {
> -			host1x_debug_output(o, "%08x:", val);
> +			host1x_debug_output(o, "%08x: ", val);

ie: change this and the other start of lines to prepend KERN_INFO

			host_x_debug_putput(o, KERN_INFO "%08x ", val);

>  			data_count = show_channel_command(o, val);
>  		} else {
> -			host1x_debug_output(o, "%08x%s", val,
> -					    data_count > 0 ? ", " : "])\n");

And don't change all the other continuation lines

And change the write_to_ functions to

static inline void write_to_seqfile(void *ctx, const char *str, size_t len)
{
	const char *output = printk_skip_level(str);

	seq_write(ctx, output, len - (str - output)); 
}

static inline void write_to_printk(void *ctx, const char *str, size_t len)
{
	const char *output = printk_skip_level(str);

	if (output == str)
		pr_cont("%s", str);
	else
		printk("s", str);
}
