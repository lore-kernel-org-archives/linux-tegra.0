From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: ventana: enable internal display
Date: Fri, 16 Nov 2012 10:07:43 -0700
Message-ID: <50A672DF.1070003@wwwdotorg.org>
References: <1353051891-26725-1-git-send-email-acourbot@nvidia.com> <2481172.Lt8JIisq3X@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2481172.Lt8JIisq3X@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/16/2012 12:51 AM, Alex Courbot wrote:
> On Friday 16 November 2012 15:44:51 Alexandre Courbot wrote:
>> Enable host1x and add the rgb output, providing EDID as a binary blob.
> 
> I would really prefer to have the EDID data fetched from DDC, but all my 
> attempts have failed so far. I don't even see the DDC wires on the platform 
> design guide. Mark, are you sure the EDID data you fetched with i2cget was 
> actually on Ventana? I can see that the DDC lines of T2 are connected to the 
> corresponding lines of the HDMI interface, but nothing similar regarding 
> internal display.

Yes, there is an EDID EEPROM on Ventana. We should certainly use that.

Assuming you have CONFIG_I2C_CHARDEV=y in the kernel's .config, and the
latest Ventana .dts file which enables the I2C bus mux, then the
following command dumps the EDID:

i2cdump  -f -y 5 0x50

That should be equivalent to something like:

	nvidia,ddc-i2c-bus = <&lcd_ddc>;

with lcd_ddc pointing at /i2cmux/i2c@1

That seems to work fine for me; how about you?

For reference, the patch below, although all the whitespace is screwed
up due to pasting it; I should really start using a "proper" email
client...:

> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> index 9731ba9..951f432 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -14,7 +14,7 @@
>                 dc@54200000 {
>                         rgb {
>                                 status = "okay";
> -                               nvidia,edid = /incbin/("tegra20-ventana.edid");
> +                               nvidia,ddc-i2c-bus = <&lcd_ddc>;
>                                 backlight = <&backlight>;
>                         };
>                 };
> @@ -351,7 +351,7 @@
>                         #size-cells = <0>;
>                 };
>  
> -               i2c@1 {
> +               lcd_ddc: i2c@1 {
>                         reg = <1>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
