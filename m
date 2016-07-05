From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v2 01/11] clk: tegra: Switch to using critical clks
Date: Tue, 5 Jul 2016 18:07:15 -0400
Message-ID: <af4df731-df9a-56cc-4240-6cfac4ddafec@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-2-git-send-email-rklein@nvidia.com>
 <20160622121630.GB26943@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622121630.GB26943@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On 6/22/2016 8:16 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, May 27, 2016 at 04:38:04PM -0400, Rhyland Klein wrote:
>> Mark some of the required-to-be-enabled clks as critical clks. These
>> need to be kept on through the disabling of unused clks during init.
>> They may not get any reference before or after init, but are required
>> to be on, therefore let the core enable them.
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>> v2:
>>  - Remove mention of HAND_OFF clks as they are not supported yet.
>>
>>  drivers/clk/tegra/clk-tegra-periph.c     | 21 ++++++++++++++-------
>>  drivers/clk/tegra/clk-tegra-super-gen4.c | 12 +++++++-----
>>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> I have some difficulty to follow why some of these clocks are critical.
> It might help if the commit message mentioned why each of these need to
> remain enabled forever, even if never used.

Sure, I can add what I found/know for each.

> 
> Also, it's fairly unlikely that pll_p for example would ever get
> disabled because a bunch of others are derived from it. I'm also not
> quite convinced yet that it really is critical. What does it drive which
> isn't claimed by any drivers?
> 

I think Peter already responded to this comment correctly, citing
mselect and sclk as necessary CRITICAL clk children of pll_p.

> A few more comments below.
> 
>> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
>> index 29d04c663abf..9365770bcaa5 100644
>> --- a/drivers/clk/tegra/clk-tegra-periph.c
>> +++ b/drivers/clk/tegra/clk-tegra-periph.c
>> @@ -162,6 +162,13 @@
>>  			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0,\
>>  			NULL)
>>  
>> +#define MUX8_FLAGS(_name, _parents, _offset,\
>> +			     _clk_num, _gate_flags, _clk_id, _flags)	\
>> +	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
>> +			29, MASK(8), 0, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,\
>> +			_clk_num, _gate_flags, _clk_id, _parents##_idx, _flags,\
>> +			NULL)
>> +
>>  #define MUX8_NOGATE_LOCK(_name, _parents, _offset, _clk_id, _lock)	\
>>  	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,	\
>>  			      29, MASK(3), 0, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP,\
>> @@ -651,7 +658,7 @@ static struct tegra_periph_init_data periph_clks[] = {
>>  	INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d_8),
>>  	INT8("vic03", mux_pllm_pllc_pllp_plla_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03),
>>  	INT8("vic03", mux_pllc_pllp_plla1_pllc2_c3_clkm, CLK_SOURCE_VIC03, 178, 0, tegra_clk_vic03_8),
>> -	INT_FLAGS("mselect", mux_pllp_clkm, CLK_SOURCE_MSELECT, 99, 0, tegra_clk_mselect, CLK_IGNORE_UNUSED),
>> +	INT_FLAGS("mselect", mux_pllp_clkm, CLK_SOURCE_MSELECT, 99, 0, tegra_clk_mselect, CLK_IGNORE_UNUSED | CLK_IS_CRITICAL),
> 
> Doesn't CLK_IS_CRITICAL always trump CLK_IGNORE_UNUSED anyway? Why do we
> need to keep both?

Yep, makes sense to remove CLK_IGNORE_UNUSED.

> 
>>  	MUX("i2s0", mux_pllaout0_audio0_2x_pllp_clkm, CLK_SOURCE_I2S0, 30, TEGRA_PERIPH_ON_APB, tegra_clk_i2s0),
>>  	MUX("i2s1", mux_pllaout0_audio1_2x_pllp_clkm, CLK_SOURCE_I2S1, 11, TEGRA_PERIPH_ON_APB, tegra_clk_i2s1),
>>  	MUX("i2s2", mux_pllaout0_audio2_2x_pllp_clkm, CLK_SOURCE_I2S2, 18, TEGRA_PERIPH_ON_APB, tegra_clk_i2s2),
>> @@ -691,8 +698,8 @@ static struct tegra_periph_init_data periph_clks[] = {
>>  	MUX("dsiblp", mux_pllp_pllc_clkm, CLK_SOURCE_DSIBLP, 148, 0, tegra_clk_dsiblp),
>>  	MUX("tsensor", mux_pllp_pllc_clkm_clk32, CLK_SOURCE_TSENSOR, 100, TEGRA_PERIPH_ON_APB, tegra_clk_tsensor),
>>  	MUX("actmon", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_ACTMON, 119, 0, tegra_clk_actmon),
>> -	MUX("dfll_ref", mux_pllp_clkm, CLK_SOURCE_DFLL_REF, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_ref),
>> -	MUX("dfll_soc", mux_pllp_clkm, CLK_SOURCE_DFLL_SOC, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_soc),
>> +	MUX_FLAGS("dfll_ref", mux_pllp_clkm, CLK_SOURCE_DFLL_REF, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_ref, CLK_IS_CRITICAL),
>> +	MUX_FLAGS("dfll_soc", mux_pllp_clkm, CLK_SOURCE_DFLL_SOC, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_soc, CLK_IS_CRITICAL),
> 
> Aren't these used by the CPU frequency scaling code? Do they have to
> remain on if we don't enable CPU frequency scaling?

They are. They seem to be only required to remain on through boot if
cpufreq is enabled. I am only seeing problems with them on Tegra124.
Right now there is no way to only mark them CRITICAL for T124 (or more
accurately, only enable them if cpufreq is enabled). Thats why I had
them marked CRITICAL.

> 
>>  	MUX("i2cslow", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_I2CSLOW, 81, TEGRA_PERIPH_ON_APB, tegra_clk_i2cslow),
>>  	MUX("sbc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC1, 41, TEGRA_PERIPH_ON_APB, tegra_clk_sbc1),
>>  	MUX("sbc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC2, 44, TEGRA_PERIPH_ON_APB, tegra_clk_sbc2),
>> @@ -730,7 +737,7 @@ static struct tegra_periph_init_data periph_clks[] = {
>>  	MUX8("ndflash", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash_8),
>>  	MUX8("ndspeed", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed_8),
>>  	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
>> -	MUX8("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1),
>> +	MUX8_FLAGS("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1, CLK_IS_CRITICAL),
> 
> Would you mind refreshing my memory about what this is and why it is
> critical?

I think this was carry over from the init table. Removing it, I can
still boot fine on A44 Smaug.

> 
>> @@ -825,7 +832,7 @@ static struct tegra_periph_init_data gate_clks[] = {
>>  	GATE("pllg_ref", "pll_ref", 189, 0, tegra_clk_pll_g_ref, 0),
>>  	GATE("hsic_trk", "usb2_hsic_trk", 209, TEGRA_PERIPH_NO_RESET, tegra_clk_hsic_trk, 0),
>>  	GATE("usb2_trk", "usb2_hsic_trk", 210, TEGRA_PERIPH_NO_RESET, tegra_clk_usb2_trk, 0),
>> -	GATE("xusb_gate", "osc", 143, 0, tegra_clk_xusb_gate, 0),
>> +	GATE("xusb_gate", "osc", 143, 0, tegra_clk_xusb_gate, CLK_IS_CRITICAL),
> 
> Wouldn't this better be handled by the XUSB driver? It certainly seems
> very specific to XUSB and I don't see why we would want to keep it
> enabled even if XUSB wasn't used.

Yes it should be.

> 
>>  	GATE("pll_p_out_cpu", "pll_p", 223, 0, tegra_clk_pll_p_out_cpu, 0),
>>  	GATE("pll_p_out_adsp", "pll_p", 187, 0, tegra_clk_pll_p_out_adsp, 0),
>>  	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
>> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
>> index 474de0f0c26d..5283138af093 100644
>> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
>> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
>> @@ -116,7 +116,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>>  		clk = tegra_clk_register_super_mux("sclk_mux",
>>  						gen_info->sclk_parents,
>>  						gen_info->num_sclk_parents,
>> -						CLK_SET_RATE_PARENT,
>> +						CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>  						clk_base + SCLK_BURST_POLICY,
>>  						0, 4, 0, 0, NULL);
>>  		*dt_clk = clk;
>> @@ -137,7 +137,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>>  			clk = tegra_clk_register_super_mux("sclk",
>>  						gen_info->sclk_parents,
>>  						gen_info->num_sclk_parents,
>> -						CLK_SET_RATE_PARENT,
>> +						CLK_SET_RATE_PARENT |
>> +						CLK_IS_CRITICAL,
>>  						clk_base + SCLK_BURST_POLICY,
>>  						0, 4, 0, 0, NULL);
>>  			*dt_clk = clk;
>> @@ -166,7 +167,8 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
>>  				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
>>  				   &sysrate_lock);
>>  	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
>> -				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
>> +				CLK_IGNORE_UNUSED | CLK_IS_CRITICAL,
>> +				clk_base + SYSTEM_CLK_RATE,
>>  				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
>>  	*dt_clk = clk;
>>  }
> 
> Same comments as for pll_p.
> 
>> @@ -187,14 +189,14 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
>>  			clk = tegra_clk_register_super_mux("cclk_g",
>>  					gen_info->cclk_g_parents,
>>  					gen_info->num_cclk_g_parents,
>> -					CLK_SET_RATE_PARENT,
>> +					CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>  					clk_base + CCLKG_BURST_POLICY,
>>  					0, 4, 8, 0, NULL);
>>  		} else {
>>  			clk = tegra_clk_register_super_mux("cclk_g",
>>  					gen_info->cclk_g_parents,
>>  					gen_info->num_cclk_g_parents,
>> -					CLK_SET_RATE_PARENT,
>> +					CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>  					clk_base + CCLKG_BURST_POLICY,
>>  					0, 4, 0, 0, NULL);
>>  		}
> 
> I thought this was driving the G cluster, what if we switched to the LP
> cluster, wouldn't that mean we can disable cclk_g?

This is a care over of converting init_table enables to CRITICAL CLKS.
Without this being critical, things seem to be booting just fine.

> 
> I've only briefly scanned through the remainder of the series, and I
> suspect that many of the below changes are simply moving the data out of
> the init tables, so not effectively changing anything, but I'd still
> like to get this documented a little better. As it is, it's completely
> non-obvious why some of these clocks have the CLK_IS_CRITICAL flag while
> others don't. It's almost as obfuscated in the current init tables, but
> them being in those tables indicates that they're somehow special,
> whereas that's much more difficult to see with the conversion to the
> CLK_IS_CRITICAL flag.

I went through and verified which clks should be CRITICAL. Apparently I
missed some of the clks which aren't required when I was going though
the ones that we already being enabled through the clk init_table (which
has the same effect, always leaving them enabled).

-rhyland

-- 
nvpublic
