From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v5 04/16] pwm: Add table-based lookup for static mappings
Date: Thu, 29 Mar 2012 23:03:42 +0100
Message-ID: <20120329220342.GK4153@opensource.wolfsonmicro.com>
References: <1332945238-14897-1-git-send-email-thierry.reding@avionic-design.de>
 <1332945238-14897-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vk/v8fjDPiDepTtA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332945238-14897-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vk/v8fjDPiDepTtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 04:33:46PM +0200, Thierry Reding wrote:

> +	static struct pwm_lookup board_pwm_lookup[] = {
> +		PWM_LOOKUP("tegra-pwm", 0, "pwm-backlight"),
> +	};

The clock and regulator APIs namespace the consumers by struct device -
might this not be sensible here?  pwm_get() does already take the device
as an argument.  It'd feel safer, and for example there's plenty of
phones out there with two backlit displays...

> + * pwm_get() - look up and request a PWM device
> + * @dev: device for PWM consumer
> + * @provider: name of provider PWM chip
> + * @index: per-chip index of PWM to request

The documentation is out of sync with the signature.

--vk/v8fjDPiDepTtA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdNwrAAoJEBus8iNuMP3dgn0P/ivbJo8dqKi/dia2JboA0H0k
R5X0YUZSQZYJ4VQebi9vE1UO7Cg6piWU7jJXr1hJMpDtQSBWWfB3J+8bnGAO26+7
mT/Ce4rn74I2bvw4m/b2SqxMnT0+0pM3yK79PGsETJX6dcv4bEVtMUFlajgmNS87
O3Bzpt6/p6hPhQ3PK2r/MQkFN3x677CXbwwMVN9KB6ccFCp5QfvYf5heJiWebjhd
kL3JWUORfAoWjOv68gJYuIHSXZYa87FlDAdfu1id9AkMNVUzzVluVFXnTyxZj0il
RCLrFKkhaE8JaiskKCdkUBuuC4FY+YzNIvjSurnmmffJ6t0mx4iFvo6o4zTyIkze
HTTERKcaEK9486iIG0g80SSA10uzMxW73LHx/LM32SGVUzHN1f31lPF4NcgrlYUM
l+qcRsZLw3PIOloly1P92R+qxqzTLNw3zvAOeXXWxVE3Q2m2qWCM/NWcOm3LtTGc
cPDgekpbEvpmxxXv0oUN2iS7mt26OVjLFmwkOaGzHjcI3UlGPRMGTHYQ8KijaSzt
2oTgYodycnbbWFRE7tmC77wiJi1uqwGWOfNwLmbXjxk2zSBKaBXne10+wrGAR4D3
lK3aDPkxjASOMiSo14UadaDX3CPeO1x+L3AAxE7QkfYgFN/DAg+e/lRpP1eSgII4
fpCg4pI/U15jEuEpjtCc
=4vkJ
-----END PGP SIGNATURE-----

--vk/v8fjDPiDepTtA--
