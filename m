From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v7 1/7] ARM: trusted_foundations: Support L2 cache
 maintenance
Date: Thu, 28 Feb 2019 13:27:48 +0000
Message-ID: <20190228132748.s2woduoycm7igfub@shell.armlinux.org.uk>
References: <20190228131707.2592-1-digetx@gmail.com>
 <20190228131707.2592-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190228131707.2592-2-digetx@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Thierry Reding <thierry.reding@gmail.com>, Robert Yang <decatf@gmail.com>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 28, 2019 at 04:17:01PM +0300, Dmitry Osipenko wrote:
> +#ifdef CONFIG_CACHE_L2X0
> +static void tf_cache_write_sec(unsigned long val, unsigned int reg)
> +{
> +	u32 l2x0_way_mask = 0xff;
> +
> +	switch (reg) {
> +	case L2X0_CTRL:
> +		if (l2x0_saved_regs.aux_ctrl & BIT(16))

And bit 16 is what?  We have definitions in one of the headers you've
added above, please use them.  Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
