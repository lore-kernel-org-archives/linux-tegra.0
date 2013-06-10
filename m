From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Mon, 10 Jun 2013 10:13:31 -0600
Message-ID: <51B5FB2B.9040306@wwwdotorg.org>
References: <1370680435.24531.12.camel@localhost.localdomain> <5714076.saxNrNAXNW@ax5200p> <1963558.n4FXxA4Dl5@ax5200p> <3787332.hnuOIkUjPE@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3787332.hnuOIkUjPE@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/09/2013 06:22 AM, Marc Dietrich wrote:
...
> Subject: [PATCH] regulator: tps6586x: correct module alias
> 
> Set the module alias to the actual driver name tps6586x-pmic. This
> fixes kernel module loading.

> diff --git a/drivers/regulator/tps6586x-regulator.c 

> -MODULE_ALIAS("platform:tps6586x-regulator");
> +MODULE_ALIAS("platform:tps6586x-pmic");

This patch highlights the issue correctly, but I think it'd be better to
change tps6586x_cell[] in drivers/mfd/tps6586x.c instead; that keeps the
module alias and module filename more consistent (and really, pmic is
the whole chip, whereas regulator is the sub-component, I think).
