From: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 3/9] tegra: Enhance clock support to handle 16-bit
 clock divisors
Date: Fri, 10 Feb 2012 09:52:29 -0800
Message-ID: <5FBF8E85CA34454794F0F7ECBA79798F3792269ADE@HQMAIL04.nvidia.com>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
 <1328318041-10943-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-4-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon,

> -----Original Message-----
> From: Simon Glass [mailto:sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org]
> Sent: Friday, February 03, 2012 6:14 PM
> To: U-Boot Mailing List
> Cc: Tom Warren; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Simon Glass
> Subject: [PATCH v3 3/9] tegra: Enhance clock support to handle 16-bit clock
> divisors
> 
> I2C ports have a 16-bit clock divisor. Add code to handle this special case
> so that I2C speeds below 150KHz are supported.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v3:
> - Add new patch to support 16-bit clock divisors required by I2C
> 
>  arch/arm/cpu/armv7/tegra2/clock.c          |   63 ++++++++++++++++++-------
> ---
>  arch/arm/include/asm/arch-tegra2/clk_rst.h |   10 ++++-
>  2 files changed, 49 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/cpu/armv7/tegra2/clock.c
> b/arch/arm/cpu/armv7/tegra2/clock.c
> index 11d2346..e58cb3b 100644
> --- a/arch/arm/cpu/armv7/tegra2/clock.c
> +++ b/arch/arm/cpu/armv7/tegra2/clock.c
> @@ -67,6 +67,7 @@ enum clock_type_id {
>  	CLOCK_TYPE_MCPT,
>  	CLOCK_TYPE_PCM,
>  	CLOCK_TYPE_PCMT,
> +	CLOCK_TYPE_PCMT16,	/* CLOCK_TYPE_PCMT with 16-bit divider */
>  	CLOCK_TYPE_PCXTS,
>  	CLOCK_TYPE_PDCT,
> 
> @@ -98,6 +99,7 @@ static enum clock_id
> clock_source[CLOCK_TYPE_COUNT][CLOCK_MAX_MUX] = {
>  	{ CLK(MEMORY),	CLK(CGENERAL),	CLK(PERIPH),	CLK(OSC)	},
>  	{ CLK(PERIPH),	CLK(CGENERAL),	CLK(MEMORY),	CLK(NONE)	},
>  	{ CLK(PERIPH),	CLK(CGENERAL),	CLK(MEMORY),	CLK(OSC)	},
> +	{ CLK(PERIPH),	CLK(CGENERAL),	CLK(MEMORY),	CLK(OSC)	},
>  	{ CLK(PERIPH),	CLK(CGENERAL),	CLK(XCPU),	CLK(OSC)	},
>  	{ CLK(PERIPH),	CLK(DISPLAY),	CLK(CGENERAL),	CLK(OSC)
> 	},
>  };
> @@ -211,8 +213,8 @@ static enum clock_type_id
> clock_periph_type[PERIPHC_COUNT] = {
> 
>  	/* 0x08 */
>  	TYPE(PERIPHC_XIO,	CLOCK_TYPE_PCMT),
> -	TYPE(PERIPHC_I2C1,	CLOCK_TYPE_PCMT),
> -	TYPE(PERIPHC_DVC_I2C,	CLOCK_TYPE_PCMT),
> +	TYPE(PERIPHC_I2C1,	CLOCK_TYPE_PCMT16),
> +	TYPE(PERIPHC_DVC_I2C,	CLOCK_TYPE_PCMT16),
>  	TYPE(PERIPHC_TWC,	CLOCK_TYPE_PCMT),
>  	TYPE(PERIPHC_NONE,	CLOCK_TYPE_NONE),
>  	TYPE(PERIPHC_SPI1,	CLOCK_TYPE_PCMT),
> @@ -246,7 +248,7 @@ static enum clock_type_id
> clock_periph_type[PERIPHC_COUNT] = {
>  	TYPE(PERIPHC_HDMI,	CLOCK_TYPE_PDCT),
>  	TYPE(PERIPHC_NONE,	CLOCK_TYPE_NONE),
>  	TYPE(PERIPHC_TVDAC,	CLOCK_TYPE_PDCT),
> -	TYPE(PERIPHC_I2C2,	CLOCK_TYPE_PCMT),
> +	TYPE(PERIPHC_I2C2,	CLOCK_TYPE_PCMT16),
>  	TYPE(PERIPHC_EMC,	CLOCK_TYPE_MCPT),
> 
>  	/* 0x28 */
> @@ -256,7 +258,7 @@ static enum clock_type_id
> clock_periph_type[PERIPHC_COUNT] = {
>  	TYPE(PERIPHC_NONE,	CLOCK_TYPE_NONE),
>  	TYPE(PERIPHC_NONE,	CLOCK_TYPE_NONE),
>  	TYPE(PERIPHC_SPI4,	CLOCK_TYPE_PCMT),
> -	TYPE(PERIPHC_I2C3,	CLOCK_TYPE_PCMT),
> +	TYPE(PERIPHC_I2C3,	CLOCK_TYPE_PCMT16),
>  	TYPE(PERIPHC_SDMMC3,	CLOCK_TYPE_PCMT),
> 
>  	/* 0x30 */
> @@ -518,14 +520,16 @@ void clock_ll_set_source(enum periph_id periph_id,
> unsigned source)
>   * Given the parent's rate and the required rate for the children, this
> works
>   * out the peripheral clock divider to use, in 7.1 binary format.
>   *
> + * @param divider_bits	number of divider bits (8 or 16)
>   * @param parent_rate	clock rate of parent clock in Hz
>   * @param rate		required clock rate for this clock
>   * @return divider which should be used
>   */
> -static int clk_div7_1_get_divider(unsigned long parent_rate,
> -				  unsigned long rate)
> +static int clk_get_divider(unsigned divider_bits, unsigned long
> parent_rate,
> +			   unsigned long rate)
>  {
>  	u64 divider = parent_rate * 2;
> +	unsigned max_divider = 1 << divider_bits;
> 
>  	divider += rate - 1;
>  	do_div(divider, rate);
> @@ -533,7 +537,7 @@ static int clk_div7_1_get_divider(unsigned long
> parent_rate,
>  	if ((s64)divider - 2 < 0)
>  		return 0;
> 
> -	if ((s64)divider - 2 > 255)
> +	if ((s64)divider - 2 >= max_divider)
>  		return -1;
> 
>  	return divider - 2;
> @@ -571,6 +575,7 @@ unsigned long clock_get_periph_rate(enum periph_id
> periph_id,
>   * required child clock rate. This function assumes that a second-stage
>   * divisor is available which can divide by powers of 2 from 1 to 256.
>   *
> + * @param divider_bits	number of divider bits (8 or 16)
>   * @param parent_rate	clock rate of parent clock in Hz
>   * @param rate		required clock rate for this clock
>   * @param extra_div	value for the second-stage divisor (not set if
> this
> @@ -578,8 +583,8 @@ unsigned long clock_get_periph_rate(enum periph_id
> periph_id,
>   * @return divider which should be used, or -1 if nothing is valid
>   *
>   */
> -static int find_best_divider(unsigned long parent_rate, unsigned long rate,
> -		int *extra_div)
> +static int find_best_divider(unsigned divider_bits, unsigned long
> parent_rate,
> +			     unsigned long rate, int *extra_div)
>  {
>  	int shift;
>  	int best_divider = -1;
> @@ -588,7 +593,8 @@ static int find_best_divider(unsigned long parent_rate,
> unsigned long rate,
>  	/* try dividers from 1 to 256 and find closest match */
>  	for (shift = 0; shift <= 8 && best_error > 0; shift++) {
>  		unsigned divided_parent = parent_rate >> shift;
> -		int divider = clk_div7_1_get_divider(divided_parent, rate);
> +		int divider = clk_get_divider(divider_bits, divided_parent,
> +					      rate);
>  		unsigned effective_rate = get_rate_from_divider(divided_parent,
>  						       divider);
>  		int error = rate - effective_rate;
> @@ -614,10 +620,11 @@ static int find_best_divider(unsigned long
> parent_rate, unsigned long rate,
>   * @param periph_id	peripheral to start
>   * @param source	PLL id of required parent clock
>   * @param mux_bits	Set to number of bits in mux register: 2 or 4
> + * @param divider_bits	Set to number of divider bits (8 or 16)
>   * @return mux value (0-4, or -1 if not found)
>   */
>  static int get_periph_clock_source(enum periph_id periph_id,
> -		enum clock_id parent, int *mux_bits)
> +		enum clock_id parent, int *mux_bits, int *divider_bits)
>  {
>  	enum clock_type_id type;
>  	enum periphc_internal_id internal_id;
> @@ -631,11 +638,18 @@ static int get_periph_clock_source(enum periph_id
> periph_id,
>  	type = clock_periph_type[internal_id];
>  	assert(clock_type_id_isvalid(type));
> 
> -	/* Special case here for the clock with a 4-bit source mux */
> +	/*
> +	 * Special cases here for the clock with a 4-bit source mux and I2C
> +	 * with its 16-bit divisor
> +	 */
>  	if (type == CLOCK_TYPE_PCXTS)
>  		*mux_bits = 4;
>  	else
>  		*mux_bits = 2;
> +	if (type == CLOCK_TYPE_PCMT16)
> +		*divider_bits = 16;
> +	else
> +		*divider_bits = 8;
> 
>  	for (mux = 0; mux < CLOCK_MAX_MUX; mux++)
>  		if (clock_source[type][mux] == parent) @@ -661,24 +675,22 @@
> static int get_periph_clock_source(enum periph_id periph_id,
>   * Adjust peripheral PLL to use the given divider and source.
>   *
>   * @param periph_id	peripheral to adjust
> - * @param parent	Required parent clock (for source mux)
> - * @param divider	Required divider in 7.1 format
> + * @param source	Source number (0-3 or 0-7)
> + * @param mux_bits	Number of mux bits (2 or 4)
> + * @param divider	Required divider in 7.1 or 15.1 format
>   * @return 0 if ok, -1 on error (requesting a parent clock which is not
> valid
>   *		for this peripheral)
>   */
> -static int adjust_periph_pll(enum periph_id periph_id,
> -		enum clock_id parent, unsigned divider)
> +static int adjust_periph_pll(enum periph_id periph_id, int source,
> +			     int mux_bits, unsigned divider)
>  {
>  	u32 *reg = get_periph_source_reg(periph_id);
> -	unsigned source;
> -	int mux_bits;
> 
>  	clrsetbits_le32(reg, OUT_CLK_DIVISOR_MASK,
>  			divider << OUT_CLK_DIVISOR_SHIFT);
>  	udelay(1);
> 
>  	/* work out the source clock and set it */
> -	source = get_periph_clock_source(periph_id, parent, &mux_bits);
>  	if (source < 0)
>  		return -1;
>  	if (mux_bits == 4) {
> @@ -696,14 +708,21 @@ unsigned clock_adjust_periph_pll_div(enum periph_id
> periph_id,
>  		enum clock_id parent, unsigned rate, int *extra_div)  {
>  	unsigned effective_rate;
> +	int mux_bits, divider_bits, source;
>  	int divider;
> 
> +	/* work out the source clock and set it */
> +	source = get_periph_clock_source(periph_id, parent, &mux_bits,
> +					 &divider_bits);
> +
>  	if (extra_div)
> -		divider = find_best_divider(pll_rate[parent], rate, extra_div);
> +		divider = find_best_divider(divider_bits, pll_rate[parent],
> +					    rate, extra_div);
>  	else
> -		divider = clk_div7_1_get_divider(pll_rate[parent], rate);
> +		divider = clk_get_divider(divider_bits, pll_rate[parent],
> +					  rate);
>  	assert(divider >= 0);
> -	if (adjust_periph_pll(periph_id, parent, divider))
> +	if (adjust_periph_pll(periph_id, source, mux_bits, divider))
>  		return -1U;
>  	debug("periph %d, rate=%d, reg=%p = %x\n", periph_id, rate,
>  		get_periph_source_reg(periph_id),
> diff --git a/arch/arm/include/asm/arch-tegra2/clk_rst.h
> b/arch/arm/include/asm/arch-tegra2/clk_rst.h
> index 0b6e004..415e420 100644
> --- a/arch/arm/include/asm/arch-tegra2/clk_rst.h
> +++ b/arch/arm/include/asm/arch-tegra2/clk_rst.h
> @@ -125,9 +125,15 @@ struct clk_rst_ctlr {
>  #define OSC_FREQ_SHIFT		30
>  #define OSC_FREQ_MASK		(3U << OSC_FREQ_SHIFT)
> 
> -/* CLK_RST_CONTROLLER_CLK_SOURCE_x_OUT_0 */
> +/*
> + * CLK_RST_CONTROLLER_CLK_SOURCE_x_OUT_0 - the mask here is normally 8
> +bits
> + * but can be 16. We could use knowledge we have to restrict the mask
> +in
> + * the 8-bit cases (the divider_bits value returned by
> + * get_periph_clock_source()) but it does not seem worth it since the
> +code
> + * already checks the ranges of values it is writing, in clk_get_divider().
> + */
>  #define OUT_CLK_DIVISOR_SHIFT	0
> -#define OUT_CLK_DIVISOR_MASK	(255 << OUT_CLK_DIVISOR_SHIFT)
> +#define OUT_CLK_DIVISOR_MASK	(0xffff << OUT_CLK_DIVISOR_SHIFT)
> 
>  #define OUT_CLK_SOURCE_SHIFT	30
>  #define OUT_CLK_SOURCE_MASK	(3U << OUT_CLK_SOURCE_SHIFT)
> --
> 1.7.7.3

This looks reasonable from what I can see looking at the TRM for the CAR controller, so:
Acked-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tom

-- 
nvpublic
