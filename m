From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dynamically calculate pll_d parameters
Date: Tue, 18 Dec 2012 09:40:27 +0100
Message-ID: <1355820027.1490.37.camel@tellur>
References: <1355767103-5303-1-git-send-email-dev@lynxeye.de>
	 <20121218065857.GA5151@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121218065857.GA5151-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 18.12.2012, 07:58 +0100 schrieb Thierry Reding:
> On Mon, Dec 17, 2012 at 06:58:23PM +0100, Lucas Stach wrote:
> [...]
> > +static int tegra20_plld_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +		unsigned long parent_rate)
> > +{
> > +	struct clk_tegra *c = to_clk_tegra(hw);
> > +	unsigned long input_rate = parent_rate;
> > +	u64 n = 0;
> > +	int m_max, m_min, m = 0;
> > +	u32 val, rem = 0;
> > +	u8 cpcon = 0;
> > +
> > +	m_max = input_rate / c->u.pll.cf_min;
> > +	m_min = (input_rate / c->u.pll.cf_max) + 1;
> > +
> > +	for (m = m_min; m <= m_max; m++) {
> > +		n = (u64)rate * m;
> > +		rem = do_div(n, input_rate);
> > +		if (!rem)
> > +			break;
> > +	}
> > +
> > +	if (rem)
> > +		return -EINVAL;
> 
> This code is common to both .round_rate() and .set_rate() so maybe you
> should factor it out.
> 
Right.

> > +
> > +	c->mul = n;
> > +	c->div = n;
> > +
> > +	val = clk_readl(c->reg + PLL_BASE);
> > +	val &= ~(PLL_BASE_DIVP_MASK | PLL_BASE_DIVN_MASK |
> > +		 PLL_BASE_DIVM_MASK);
> > +	val |= (m << PLL_BASE_DIVM_SHIFT) | (n << PLL_BASE_DIVN_SHIFT);
> > +	clk_writel(val, c->reg + PLL_BASE);
> > +
> > +	if (n <= 50)
> > +		cpcon = 2;
> > +	else if (n <= 300)
> > +		cpcon = 4;
> > +	else if (n <= 600)
> > +		cpcon = 8;
> > +	else if (n <= 1000)
> > +		cpcon = 12;
> > +
> > +	val = clk_readl(c->reg + PLL_MISC(c));
> > +	val &= ~PLL_MISC_CPCON_MASK;
> > +	val |= cpcon << PLL_MISC_CPCON_SHIFT;
> > +	clk_writel(val, c->reg + PLL_MISC(c));
> > +
> > +
> 
> There's a gratuitous blank line here.
> 
> Other than that this algorithm looks pretty much like what I came up
> with in an earlier prototype. One difference is that I used an
> additional outer loop for the p-divider. Taking that into account should
> allow even more frequencies to be matched.

I don't think the outer loop is needed. The Coordinated Video Timings
(CVT) spec demands that pixelclocks are always aligned to 0.25MHz. As we
are running pll_d at four times the pixel clock we are always hitting a
plain integer value for the pll_d MHz.

Regards,
Lucas
