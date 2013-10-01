From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [Patch V4] drivers: power: Add support for bq24735 charger
Date: Tue, 01 Oct 2013 14:00:46 -0600
Message-ID: <524B29EE.4090608@wwwdotorg.org>
References: <1380211376-7539-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380211376-7539-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/26/2013 10:02 AM, Rhyland Klein wrote:
> From: Darbha Sriharsha <dsriharsha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Adds support for the bq24735 charger chipset. The bq24735 is a
> high-efficiency, synchronous battery charger.
> 
> It allows control of the charging current, input current, and the charger
> voltage DAC's through SMBus.

> diff --git a/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt b/Documentation/devicetree/bindings/power_supply/ti,bq24735.txt

> +Optional properties :

> + - ti,charge-current : Used to control and set the charging current. This value
> +   must be between 128mA and 8.128A with a 64mA step resolution. The POR value
> +   is 0x0000h. See spec for more details.
> + - ti,charge-voltage : Used to control and set the charging voltage. This value
> +   must be between 1.024V and 19.2V with a 16mV step resolution. The POR value
> +   is 0x0000h. See spec for more details.
> + - ti,input-current : Used to control and set the charger input current. This
> +   value must be between 128mA and 8.064A with a 128mA step resolution. The
> +   POR value is 0x1000h. See spec for more details.

What units and representation do those properties use? I assume it's mA
and mV, without any shift or register encoding, but the text doesn't
make it clear. It'd be best to reference a specific register name rather
than just saying "see the spec".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
