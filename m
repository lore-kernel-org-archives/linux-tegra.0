From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Patch V2] drivers: power: Add support for bq24735 charger
Date: Mon, 23 Sep 2013 15:53:33 -0600
Message-ID: <5240B85D.3050803@wwwdotorg.org>
References: <1379607514-11200-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379607514-11200-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/19/2013 10:18 AM, Rhyland Klein wrote:
> Adding driver support for bq24735 charger chipset.

> diff --git a/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt b/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt

> +Optional properties :
> + - ti,ac-detect: This gpio is optionally used to read the ac adapter
> +   presence.

GPIO property names ought to end in "-gpios", i.e. "ti,ac-detect-gpios".

> + - ti,charge-current : Used to control and set the charging current. This value
> +   must follow the below guidelines:
> +	bit 0 - 5:	Not used
> +	bit 6:		1 = Adds 64mA of charger current
> +	bit 7:		1 = Adds 128mA of charger current
> +	bit 8:		1 = Adds 256mA of charger current
> +	bit 9:		1 = Adds 512mA of charger current
> +	bit 10:		1 = Adds 1024mA of charger current
> +	bit 11:		1 = Adds 2048mA of charger current
> +	bit 12:		1 = Adds 4096mA of charger current
> +	bit 13 - 15:	Not used

That's a little odd. Why not just put the number of mA directly into the
property unshifted?

> +   Setting the value to < 128mA or > 8.128A terminates charging.

"terminates charging" is a driver action, not a description of HW. It's
fine to say that what min/max value should be specified in the property
for it to be valid, but not what action SW should take in response to that.

Those same two comments apply to other properties too.

> + - ti,input-current:	Used to control and set the charger input current. This
> +   value must follow the below guidelines:

What if this value is inconsistent with the charger's power consumption
derived from the other two properties? Is it really necessary to include
this property in the DT and hence create the potential for mismatch?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
