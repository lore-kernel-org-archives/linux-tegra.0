From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 04/17] pwm: Add table-based lookup for static mappings
Date: Wed, 11 Apr 2012 20:38:18 +0800
Message-ID: <20120411123815.GB2445@S2101-09.ap.freescale.net>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
 <1334070400-25013-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334070400-25013-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 10, 2012 at 05:06:27PM +0200, Thierry Reding wrote:
> In order to get rid of the global namespace for PWM devices, this commit
> provides an alternative method, similar to that of the regulator or
> clock frameworks, for registering a static mapping for PWM devices. This
> works by providing a table with a provider/consumer map in the board
> setup code.
> 
> With the new pwm_get() and pwm_put() functions available, usage of
> pwm_request() and pwm_free() becomes deprecated.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
...
> diff --git a/Documentation/pwm.txt b/Documentation/pwm.txt
> index 48f598a..bb3d2f9 100644
> --- a/Documentation/pwm.txt
> +++ b/Documentation/pwm.txt
> @@ -12,14 +12,33 @@ this kind of flexibility the generic PWM API exists.
>  Identifying PWMs
>  ----------------
>  
> -Users of the legacy PWM API use unique IDs to refer to PWM devices. One
> -goal of the new PWM framework is to get rid of this global namespace.
> +Users of the legacy PWM API use unique IDs to refer to PWM devices.
> +
> +Instead of referring to a PWM device via its unique ID, board setup code
> +should instead register a static mapping that can be used to match PWM
> +consumers to providers, as given in the following example:
> +
> +	static struct pwm_lookup board_pwm_lookup[] = {
> +		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight"),

PWM_LOOKUP takes 4 parameters now.  Other than that,

Reviewed-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Shawn

> +	};
> +
> +	static void __init board_init(void)
> +	{
> +		...
> +		pwm_add_table(board_pwm_lookup, ARRAY_SIZE(board_pwm_lookup));
> +		...
> +	}
