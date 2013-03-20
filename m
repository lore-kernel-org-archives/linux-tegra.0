From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 9/9] pwm_bl: Add mandatory backlight enable regulator
Date: Wed, 20 Mar 2013 12:00:10 -0600
Message-ID: <5149F92A.3070004@wwwdotorg.org>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com> <1363719573-20926-10-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363719573-20926-10-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 12:59 PM, Andrew Chew wrote:
> Many backlights need to be explicitly enabled.  Typically, this is done
> with a GPIO.  For flexibility, we generalize the enable mechanism to a
> regulator.
> 
> If an enable regulator is not needed, then a dummy regulator can be given
> to the backlight driver.  If a GPIO is used to enable the backlight,
> then a fixed regulator can be instantiated to control the GPIO.
> 
> The backlight enable regulator can be specified in the device tree node
> for the backlight, or can be done with legacy board setup code in the
> usual way.

> diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> index 1e4fc72..7e2e089 100644
> --- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> +++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
> @@ -10,6 +10,11 @@ Required properties:
>        last value in the array represents a 100% duty cycle (brightest).
>    - default-brightness-level: the default brightness level (index into the
>        array defined by the "brightness-levels" property)
> +  - enable-supply: A phandle to the regulator device tree node. This
> +      regulator will be turned on and off as the pwm is enabled and disabled.
> +      Many backlights are enabled via a GPIO. In this case, we instantiate
> +      a fixed regulator and give that to enable-supply. If a regulator
> +      is not needed, then provide a dummy fixed regulator.

"enable" doesn't seem like the right name here; if this really is an
"enable" input, then it's not a regulator. If you're calling it "enable"
because the regulator is usually controlled by a GPIO that enables it,
then what you really have is a regulator that provides power to the
backlight, and the method that you enable that regulator is irrelevant.

Put another way, wouldn't "power" be a better name, thus making the
property "power-supply"? Although that property name migth be considered
to have some negative correlation with other concepts, so if people
object to that, perhaps e.g. "vdd-supply"?
