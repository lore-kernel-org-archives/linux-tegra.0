From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v5 05/16] pwm: Add device tree support
Date: Thu, 29 Mar 2012 22:47:18 +0100
Message-ID: <20120329214717.GG4153@opensource.wolfsonmicro.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332945238-14897-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 04:33:47PM +0200, Thierry Reding wrote:

> +	pwm-list ::= <single-pwm> [pwm-list]
> +	single-pwm ::= <pwm-phandle> <pwm-specifier>
> +	pwm-phandle : phandle to PWM controller node
> +	pwm-specifier : array of #pwm-cells specifying the given PWM
> +			(controller specific)

> +PWM properties should be named "pwms". The exact meaning of each pwms
> +property must be documented in the device tree binding for each device.
> +An optional property "pwm-names" may contain a list of strings to label
> +each of the PWM devices listed in the "pwms" property. If no "pwm-names"
> +property is given, the name of the user node will be used as fallback.

> +	pwm = pwm_request_from_chip(pc, args->args[0], NULL);
> +	if (IS_ERR(pwm))
> +		return ERR_PTR(-ENODEV);

It feels wrong to override the error code like this rather than passing
the error we got back to the caller.  Is there any great reason for
doing so?

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdNhfAAoJEBus8iNuMP3dwkcP/2Au1QfZ3jSOpjidxgoOHo3Y
oTrgHs24urb4/AemAYBC8sHNK43YAwfCtw8iwYEFJqiozzF9MNYBEVW1VlT9+zRb
8QHOjwTqYLWswsItV5o/2dJRxZzpJkJ7sv8/3QP6U0LUy3q0IxeqtasLME7i7fj0
kWSrzWz4pLG8LXh8HqfRBuabFpydbnykA9W0OXFFPOaIDkByHTyI+5JCSi3VKU3i
eweaRgZ1PCFiZO+ySzAwHR7fAX1IanIAO3nK6CIuJND3XdfOBFLdkmvl0cjIrPyj
NHQFG5TbUX44BKrGAmzz/9NjuUxufZzrNZOOSqoRLp7Zn60Cm3v6hJd7ByjC0O0T
jg2kh20oK40oB68MlGgClbGvFFIKmyEkc4pBN6kBgwgmE2f+v69hVxo74QIcpihC
WZptdqC3I4aWF9X0+c21ZnYSYCiqowvM4ALwxU405YTgZDddLZ1DTIezS1E+v/yh
37nGLNbvEkmT/i+MVfyabsEAnKXDCnlmsCEDw08kuoRp49r8yDJqsjYOzeaG+q2/
7lLzzKgHcMDxNN6xo6jvkUcBiVt2thvgbTEwu5DKHm7cUv+RjGje1yUK6bzvlPab
c08uPMgGGfgW2tWkcKb3JVMx6xeJwqHrqYT+6+wAGzD+bi40U+ATe6A190kJIi66
Cn/IvvoioKPwmVQG8ceP
=H/7m
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--
