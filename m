From: Dmitry Artamonow <mad_soft@inbox.ru>
Subject: Re: [PATCH 6/6] ARM: tegra: paz00: enable wifi card
Date: Fri, 20 May 2011 00:06:11 +0400
Message-ID: <20110519200611.GA20596@rainbow>
References: <1305806910-3903-1-git-send-email-marvin24@gmx.de>
	<1305806910-3903-7-git-send-email-marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1305806910-3903-7-git-send-email-marvin24@gmx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On 14:08 Thu 19 May     , Marc Dietrich wrote:
> The Wifi card attached to one usb port needs to be unkilled. The
> corresponding gpio and also the gpio for the LED are exported to be
> controlled by userspace later on.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>

[snip]

> +static void __init paz00_wifi_init(void)
> +{
> +	int ret;
> +
> +	/* unlock hw rfkill */
> +	ret = gpio_request_one(TEGRA_WIFI_PWRN, GPIOF_OUT_INIT_HIGH,
> +			"wifi_pwrn");
> +	if(ret) {
> +		pr_warning("WIFI: could not request PWRN gpio!\n");
> +		return;
> +	}
> +	gpio_export(TEGRA_WIFI_PWRN, 0);

Although enabling wifi on boot may be OK for now, I think in long term
it would be better and more proper to use rfkill infrastructure for this
instead of just exporting gpio to userspace. There were some patches for
gpio-based rfkill switch floating around lately. This is one the versions:
https://lkml.org/lkml/2011/5/6/372
Not sure about their status and if they are directly suitable for PAZ00, but
you may have a look. Btw, there's also another mostly generic gpio-rfkill
driver in the tree I'm aware of - see arch/arm/mach-pxa/tosa-bt.c

> +
> +	/* export wifi led */
> +	ret = gpio_request_one(TEGRA_WIFI_LED, GPIOF_OUT_INIT_HIGH,
> +			"wifi_led");
> +	if(ret)
> +		pr_warning("WIFI: could not request LED gpio!\n");
> +	gpio_export(TEGRA_WIFI_LED, 0);
For LED I think it's better to register gpio-leds platform device with
something like 'rfkill.0' or 'wifi-rx' or whatever as a default trigger
(not sure about exact names of triggers - you'll need to look up them).
That way you will get a wide choice of led triggers for free, and still
retain possibility of manual driving leds from userspace.

-- 
Best regards,
Dmitry "MAD" Artamonow
