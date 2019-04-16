From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH RFT V2 1/8] clk: divider: add explicit big endian support
Date: Tue, 16 Apr 2019 12:05:48 +0800
Message-ID: <201904161252.kWbdH4TW%lkp@intel.com>
References: <20190415101046.5872-2-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190415101046.5872-2-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Sascha Hauer <s.hauer@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Michal Simek <michal.simek@xilinx.com>, Shawn Guo <shawnguo@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Paul Mackerras <paulus@samba.org>, kbuild-all@01.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-tegra@vger.kernel.org

Hi Jonas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.1-rc5 next-20190415]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jonas-Gorski/clk-make-register-endianness-a-run-time-property/20190415-235847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   drivers/clk/clk-divider.c:317:18: sparse: expression using sizeof(void)
   drivers/clk/clk-divider.c:317:18: sparse: expression using sizeof(void)
>> drivers/clk/clk-divider.c:391:44: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct clk_divider *divider @@    got voistruct clk_divider *divider @@
   drivers/clk/clk-divider.c:391:44:    expected struct clk_divider *divider
   drivers/clk/clk-divider.c:391:44:    got void [noderef] <asn:2>*reg
   drivers/clk/clk-divider.c:416:16: sparse: expression using sizeof(void)
   drivers/clk/clk-divider.c:416:16: sparse: expression using sizeof(void)
   drivers/clk/clk-divider.c:441:44: sparse: incorrect type in argument 1 (different address spaces) @@    expected struct clk_divider *divider @@    got voistruct clk_divider *divider @@
   drivers/clk/clk-divider.c:441:44:    expected struct clk_divider *divider
   drivers/clk/clk-divider.c:441:44:    got void [noderef] <asn:2>*reg

vim +391 drivers/clk/clk-divider.c

   289	
   290	static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
   291				       unsigned long rate,
   292				       unsigned long *best_parent_rate,
   293				       const struct clk_div_table *table, u8 width,
   294				       unsigned long flags)
   295	{
   296		int i, bestdiv = 0;
   297		unsigned long parent_rate, best = 0, now, maxdiv;
   298		unsigned long parent_rate_saved = *best_parent_rate;
   299	
   300		if (!rate)
   301			rate = 1;
   302	
   303		maxdiv = _get_maxdiv(table, width, flags);
   304	
   305		if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
   306			parent_rate = *best_parent_rate;
   307			bestdiv = _div_round(table, parent_rate, rate, flags);
   308			bestdiv = bestdiv == 0 ? 1 : bestdiv;
   309			bestdiv = bestdiv > maxdiv ? maxdiv : bestdiv;
   310			return bestdiv;
   311		}
   312	
   313		/*
   314		 * The maximum divider we can use without overflowing
   315		 * unsigned long in rate * i below
   316		 */
 > 317		maxdiv = min(ULONG_MAX / rate, maxdiv);
   318	
   319		for (i = _next_div(table, 0, flags); i <= maxdiv;
   320						     i = _next_div(table, i, flags)) {
   321			if (rate * i == parent_rate_saved) {
   322				/*
   323				 * It's the most ideal case if the requested rate can be
   324				 * divided from parent clock without needing to change
   325				 * parent rate, so return the divider immediately.
   326				 */
   327				*best_parent_rate = parent_rate_saved;
   328				return i;
   329			}
   330			parent_rate = clk_hw_round_rate(parent, rate * i);
   331			now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
   332			if (_is_best_div(rate, now, best, flags)) {
   333				bestdiv = i;
   334				best = now;
   335				*best_parent_rate = parent_rate;
   336			}
   337		}
   338	
   339		if (!bestdiv) {
   340			bestdiv = _get_maxdiv(table, width, flags);
   341			*best_parent_rate = clk_hw_round_rate(parent, 1);
   342		}
   343	
   344		return bestdiv;
   345	}
   346	
   347	long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
   348				       unsigned long rate, unsigned long *prate,
   349				       const struct clk_div_table *table,
   350				       u8 width, unsigned long flags)
   351	{
   352		int div;
   353	
   354		div = clk_divider_bestdiv(hw, parent, rate, prate, table, width, flags);
   355	
   356		return DIV_ROUND_UP_ULL((u64)*prate, div);
   357	}
   358	EXPORT_SYMBOL_GPL(divider_round_rate_parent);
   359	
   360	long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
   361					  unsigned long rate, unsigned long *prate,
   362					  const struct clk_div_table *table, u8 width,
   363					  unsigned long flags, unsigned int val)
   364	{
   365		int div;
   366	
   367		div = _get_div(table, val, flags, width);
   368	
   369		/* Even a read-only clock can propagate a rate change */
   370		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
   371			if (!parent)
   372				return -EINVAL;
   373	
   374			*prate = clk_hw_round_rate(parent, rate * div);
   375		}
   376	
   377		return DIV_ROUND_UP_ULL((u64)*prate, div);
   378	}
   379	EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
   380	
   381	
   382	static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
   383					unsigned long *prate)
   384	{
   385		struct clk_divider *divider = to_clk_divider(hw);
   386	
   387		/* if read only, just return current value */
   388		if (divider->flags & CLK_DIVIDER_READ_ONLY) {
   389			u32 val;
   390	
 > 391			val = clk_div_readl(divider->reg) >> divider->shift;
   392			val &= clk_div_mask(divider->width);
   393	
   394			return divider_ro_round_rate(hw, rate, prate, divider->table,
   395						     divider->width, divider->flags,
   396						     val);
   397		}
   398	
   399		return divider_round_rate(hw, rate, prate, divider->table,
   400					  divider->width, divider->flags);
   401	}
   402	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
