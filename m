From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 7/7] pwm-backlight: Add rudimentary device-tree support
Date: Tue, 20 Dec 2011 15:33:36 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92EBE@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-8-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-8-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> This commit adds very basic support for device-tree probing. Currently,
> only a PWM and maximum and default brightness values can be specified.
> Enabling or disabling backlight power via GPIOs is not yet supported.

> diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight

> +Required properties:
> +  - compatible: "pwm-backlight"
> +  - default-brightness: the default brightness setting
> +  - max-brightness: the maximum brightness setting

What are the units of those two properties? Percentage seems like a
reasonable choice, although that's not what the patch implements.

> +  - pwm: OF device-tree PWM specification
> +
> +Example:
> +
> +	backlight {
> +		compatible = "pwm-backlight";
> +		default-brightness = <224>;
> +		max-brightness = <255>;
> +		pwm = <&pwm 0 5000000>;
> +	};

This may be fine, but I'm not sure that representing the backlight as a
standalone object is correct; I wonder if you want to represent a complete
LCD display complex, including backlight, various GPIOs, and other display
properties, all in the one node? That said, I suppose you could easily
layer this as follows:

reg: regulator {
    // GPIO regulator
};

bl: backlight {
    compatible = "pwm-backlight";
    default-brightness = <224>;
    max-brightness = <255>;
    pwm = <&pwm 0 5000000>;
    power-supply = <&reg>;
};

lcd@x {
    backlight = <&bl>;
    ...
};

so this probably is OK.

> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
...
> +static int pwm_backlight_parse_dt(struct device *dev,
> +				  struct platform_pwm_backlight_data *data)
...
> +	/*
> +	 * TODO: Most users of this driver use a number of GPIOs to control
> +	 *       backlight power. Support for specifying these needs to be
> +	 *       added.
> +	 */

At least for the power GPIO, this should probably modeled as a GPIO-based
fixed voltage regulator. Are there other GPIOs that are directly related
to a backlight rather than an LCD complex?

-- 
nvpublic
