From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 4/6] gpu: host1x: Disassemble more instructions
Date: Tue, 5 Sep 2017 16:02:18 +0300
Message-ID: <47d93f9f-008c-503d-b475-fba65fe69dc0@gmail.com>
References: <20170905081029.19769-1-mperttunen@nvidia.com>
 <20170905081029.19769-5-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905081029.19769-5-mperttunen@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05.09.2017 11:10, Mikko Perttunen wrote:
> The disassembler for debug dumps was missing some newer host1x opcodes.
> Add disassembly support for these.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/hw/debug_hw.c      | 57 ++++++++++++++++++++++++++++++++---
>  drivers/gpu/host1x/hw/debug_hw_1x01.c |  3 +-
>  drivers/gpu/host1x/hw/debug_hw_1x06.c |  3 +-
>  3 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
> index 1e67667e308c..de2a0ba7a32d 100644
> --- a/drivers/gpu/host1x/hw/debug_hw.c
> +++ b/drivers/gpu/host1x/hw/debug_hw.c
> @@ -30,6 +30,13 @@ enum {
>  	HOST1X_OPCODE_IMM	= 0x04,
>  	HOST1X_OPCODE_RESTART	= 0x05,
>  	HOST1X_OPCODE_GATHER	= 0x06,
> +	HOST1X_OPCODE_SETSTRMID = 0x07,
> +	HOST1X_OPCODE_SETAPPID  = 0x08,
> +	HOST1X_OPCODE_SETPYLD   = 0x09,
> +	HOST1X_OPCODE_INCR_W    = 0x0a,
> +	HOST1X_OPCODE_NONINCR_W = 0x0b,
> +	HOST1X_OPCODE_GATHER_W  = 0x0c,
> +	HOST1X_OPCODE_RESTART_W = 0x0d,
>  	HOST1X_OPCODE_EXTEND	= 0x0e,
>  };
>  
> @@ -38,11 +45,16 @@ enum {
>  	HOST1X_OPCODE_EXTEND_RELEASE_MLOCK	= 0x01,
>  };
>  
> -static unsigned int show_channel_command(struct output *o, u32 val)
> +#define INVALID_PAYLOAD				0xffffffff
> +
> +static unsigned int show_channel_command(struct output *o, u32 val,
> +					 u32 *payload)
>  {
> -	unsigned int mask, subop, num;
> +	unsigned int mask, subop, num, opcode;
> +
> +	opcode = val >> 28;
>  
> -	switch (val >> 28) {
> +	switch (opcode) {
>  	case HOST1X_OPCODE_SETCLASS:
>  		mask = val & 0x3f;
>  		if (mask) {
> @@ -97,6 +109,42 @@ static unsigned int show_channel_command(struct output *o, u32 val)
>  				    val >> 14 & 0x1, val & 0x3fff);
>  		return 1;
>  

Opcodes below aren't relevant to older Tegra's, seems "#if HOST1X_HW >= 6"
should be added here.

> +	case HOST1X_OPCODE_SETSTRMID:
> +		host1x_debug_cont(o, "SETSTRMID(offset=%06x)\n",
> +				  val & 0x3fffff);
> +		return 0;
> +
> +	case HOST1X_OPCODE_SETAPPID:
> +		host1x_debug_cont(o, "SETAPPID(appid=%02x)\n", val & 0xff);
> +		return 0;
> +
> +	case HOST1X_OPCODE_SETPYLD:
> +		*payload = val & 0xffff;
> +		host1x_debug_cont(o, "SETPYLD(data=%04x)\n", *payload);
> +		return 0;
> +
> +	case HOST1X_OPCODE_INCR_W:
> +	case HOST1X_OPCODE_NONINCR_W:
> +		host1x_debug_cont(o, "%s(offset=%06x, ",
> +				  opcode == HOST1X_OPCODE_INCR_W ?
> +					"INCR_W" : "NONINCR_W",
> +				  val & 0x3fffff);
> +		if (*payload == 0) {
> +			host1x_debug_cont(o, "[])\n");
> +			return 0;
> +		} else if (*payload == INVALID_PAYLOAD) {
> +			host1x_debug_cont(o, "unknown)\n");
> +			return 0;
> +		} else {
> +			host1x_debug_cont(o, "[");
> +			return *payload;
> +		}
> +
> +	case HOST1X_OPCODE_GATHER_W:
> +		host1x_debug_cont(o, "GATHER_W(count=%04x, addr=[",
> +				  val & 0x3fff);
> +		return 2;
> +
>  	case HOST1X_OPCODE_EXTEND:
>  		subop = val >> 24 & 0xf;
>  		if (subop == HOST1X_OPCODE_EXTEND_ACQUIRE_MLOCK)
> @@ -122,6 +170,7 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
>  	/* Map dmaget cursor to corresponding mem handle */
>  	u32 offset = phys_addr - pin_addr;
>  	unsigned int data_count = 0, i;
> +	u32 payload = INVALID_PAYLOAD;
>  
>  	/*
>  	 * Sometimes we're given different hardware address to the same
> @@ -139,7 +188,7 @@ static void show_gather(struct output *o, phys_addr_t phys_addr,
>  
>  		if (!data_count) {
>  			host1x_debug_output(o, "%08x: %08x: ", addr, val);
> -			data_count = show_channel_command(o, val);
> +			data_count = show_channel_command(o, val, &payload);
>  		} else {
>  			host1x_debug_cont(o, "%08x%s", val,
>  					    data_count > 1 ? ", " : "])\n");
> diff --git a/drivers/gpu/host1x/hw/debug_hw_1x01.c b/drivers/gpu/host1x/hw/debug_hw_1x01.c
> index 09e1aa7bb5dd..7d1401c6c193 100644
> --- a/drivers/gpu/host1x/hw/debug_hw_1x01.c
> +++ b/drivers/gpu/host1x/hw/debug_hw_1x01.c
> @@ -78,6 +78,7 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
>  					   struct output *o)
>  {
>  	u32 val, rd_ptr, wr_ptr, start, end;
> +	u32 payload = INVALID_PAYLOAD;
>  	unsigned int data_count = 0;
>  
>  	host1x_debug_output(o, "%u: fifo:\n", ch->id);
> @@ -112,7 +113,7 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
>  
>  		if (!data_count) {
>  			host1x_debug_output(o, "%08x: ", val);
> -			data_count = show_channel_command(o, val);
> +			data_count = show_channel_command(o, val, &payload);
>  		} else {
>  			host1x_debug_cont(o, "%08x%s", val,
>  					  data_count > 1 ? ", " : "])\n");
> diff --git a/drivers/gpu/host1x/hw/debug_hw_1x06.c b/drivers/gpu/host1x/hw/debug_hw_1x06.c
> index bd89da5dc64c..b503c740c022 100644
> --- a/drivers/gpu/host1x/hw/debug_hw_1x06.c
> +++ b/drivers/gpu/host1x/hw/debug_hw_1x06.c
> @@ -63,6 +63,7 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
>  					   struct output *o)
>  {
>  	u32 val, rd_ptr, wr_ptr, start, end;
> +	u32 payload = INVALID_PAYLOAD;
>  	unsigned int data_count = 0;
>  
>  	host1x_debug_output(o, "%u: fifo:\n", ch->id);
> @@ -107,7 +108,7 @@ static void host1x_debug_show_channel_fifo(struct host1x *host,
>  		if (!data_count) {
>  			host1x_debug_output(o, "%03x 0x%08x: ",
>  					    rd_ptr - start, val);
> -			data_count = show_channel_command(o, val);
> +			data_count = show_channel_command(o, val, &payload);
>  		} else {
>  			host1x_debug_cont(o, "%08x%s", val,
>  					  data_count > 1 ? ", " : "])\n");
> 


-- 
Dmitry
