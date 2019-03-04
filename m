From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v9 1/7] ARM: trusted_foundations: Support L2 cache
 maintenance
Date: Mon, 4 Mar 2019 16:47:29 +0100
Message-ID: <20190304154729.GA13794@qmqm.qmqm.pl>
References: <20190303171214.24821-1-digetx@gmail.com>
 <20190303171214.24821-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190303171214.24821-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 03, 2019 at 08:12:08PM +0300, Dmitry Osipenko wrote:
> Implement L2 cache initialization firmware callback that should be
> invoked early during boot in order to set up the required outer cache
> driver's callbacks and add the callback required for L2X0 maintenance.
[...]
> @@ -43,6 +46,11 @@ void register_trusted_foundations(struct trusted_foundations_platform_data *pd);
>  void of_register_trusted_foundations(void);
>  
>  #else /* CONFIG_TRUSTED_FOUNDATIONS */
> +static inline void tf_dummy_write_sec(unsigned long val, unsigned int reg)
> +{
> +	if (reg == L2X0_CTRL && val == L2X0_CTRL_EN)
> +		pr_err("Trusted Foundations unavailable, ignoring request to enable L2C\n");
> +}
>  
>  static inline void register_trusted_foundations(
>  				   struct trusted_foundations_platform_data *pd)
> @@ -53,6 +61,10 @@ static inline void register_trusted_foundations(
>  	 */
>  	pr_err("No support for Trusted Foundations, continuing in degraded mode.\n");
>  	pr_err("Secondary processors as well as CPU PM will be disabled.\n");
> +#if IS_ENABLED(CONFIG_CACHE_L2X0)
> +	pr_err("L2X0 cache will be disabled.\n");
[...]

I guess this is redundant since tf_dummy_write_sec() will say the same
thing when trying to enable the cache.

Best Regards,
Micha³ Miros³aw
