From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] ARM: dt: tegra114: add PWM nodes
Date: Tue, 12 Mar 2013 20:24:29 +0100
Message-ID: <20130312192429.GA21924@avionic-0098.mockup.avionic-design.de>
References: <1363045695-28874-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363045695-28874-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 11, 2013 at 04:48:15PM -0700, Andrew Chew wrote:
[...]
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
[...]
> +	pwm0: pwm@7000a000 {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a000 0x4>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +		status = "disabled";
> +	};
> +
> +	pwm1: pwm@7000a010 {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a010 0x4>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +		status = "disabled";
> +	};
> +
> +	pwm2: pwm@7000a020 {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a020 0x4>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +		status = "disabled";
> +	};
> +
> +	pwm3: pwm@7000a030 {
> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
> +		reg = <0x7000a030 0x4>;
> +		#pwm-cells = <2>;
> +		clocks = <&tegra_car 17>;
> +		status = "disabled";
> +	};

Shouldn't these rather go into a single PWM node which provides 4 PWM
devices? Just like we do on Tegra20?

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRP4DtAAoJEN0jrNd/PrOhd2AP/00iZv5OkWoNigKwBShB37Xk
iphjieROrJXalhXNMpXSYjMUX7kXXDQuTp1t/UrlDuu2EiQf6+FuhB+960ceta6d
CykfyDv3kLgbidqmwKILszqcliekth+s8mh5gIf7ZfCJMEWykjSH77wwOUSeTenB
B7bpS8GpGjynE7dln8mVPpy3jJpO0xQlkCX3zEK+QdZQ3TXn0+25H3RNOgdIwraR
HMj8ICmuAGwjFd8iOmiHb+xO3G3Ivl9NovhQjEKqVnEnDYngZCEAIW1fl4ZUAxsE
Sm6AwXilaaWj7PvNY4Tv+ck00Gqnmq8tpxrd1x6UJG4nOBShgC2urROYGgmD5WsY
map8iVHm8kvY77EW6jdUN+3piktY6aMYOLEk+xFS5OK06Ov3INLnqPBF+h0VCzdX
iIeyrIolummsQXl3UDsEcr444yc9lIhbbhmXpPQPWVsXkiCmo+Tx8RolsMKr3q3n
/or6RiBTypw9loUfX/YecE4Ma5FVc4KYi9d9+PWM8fk8iJZSrGYlLycOzi1+34B7
Hu6WxNlrMhJt2y5NR6+MkdD6Yu4MEYFXBwzJ7F7Uoa/1GMtg+QLj9XSUNRbcnO1F
89N+XYrZgWPD230WReWgxWRlIDPbwrnIifalqHXsY37SePRWug37Npa4yz977+NE
9Qzc0P3F42kwA6+5o3Ru
=fPxF
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
