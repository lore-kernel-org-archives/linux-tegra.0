From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Fri, 17 Feb 2012 11:25:28 -0800
Message-ID: <20120217192527.GG10146@opensource.wolfsonmicro.com>
References: <1329493468-7741-1-git-send-email-thierry.reding@avionic-design.de>
 <20120217163931.GB961@sirena.org.uk>
 <20120217191605.GA11127@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bO4vSxwwZtUjUWHo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120217191605.GA11127-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bO4vSxwwZtUjUWHo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2012 at 08:16:05PM +0100, Thierry Reding wrote:
> * Mark Brown wrote:

> > This is a bit weird, why is this not just set by constraints?

> I guess because I didn't know any better. I don't have access to the hardware
> right now, so it'll have to wait until Monday. I'll follow up with a patch
> after I've verified that setting via constraints works.

OK.  In general the expected idiom is that drivers will only use
set_voltage() if they actually need to change the voltage at runtime, if
they just need a single fixed voltage then the expectation is that
either the board will boot in the correct configuration or the setup
will be done by constraints.  This replaces code with data (which is
generally a good thing) and avoids issues with things like error
handling when working with fixed voltage regulators.

--bO4vSxwwZtUjUWHo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPPqmbAAoJEBus8iNuMP3dfQQP/2Zp/tALQu3wLVCoQ3Z9S6VF
23P1+NRsVwTP1MwMYy5USmmzRX3wrkchTScEgXPo21dslUQY/R7CRAmDq7Ua+AlC
cUVL2mCzibK5Y6mNNgfQKmqxLIIbkdj1VlYAzfYfCq1p1yhLYAKr8f6ez+RC9HQ5
Da7+fmfRuRYah8vtGwdK3q/FtmaPeJQJQj0DCIkMbid/8qby7edOCRrZzV/1dhlq
qXOmf5gzjyFdFiN96BGuG2C0ZIV7KlRfw/dp3bbr7XSGCwWlIQYQwdxHaUr1GXCg
pjv12Icvfrmr+k6SQgMPDWijCYu1K0y9kihDOinDV25ocy7eG9QaMNcW7//7NRDN
ntD4gub17to7K8RjuxWpHKv7dkhM5DcozqQUlzgA3RJBntY5HKJ+/EZuGklr/TIX
roHoNBtRYkGO7rJHwKm5+DyRbtOeceV57ERRaycXANnE+0PKtB2Hc+Ero6gNgisz
k3e7QQ6CtEOOuloaIbqz0ZsKTeukzv6mwhTKqaF16SXWiKt12L/EkJtiYvQGw8Me
FGGZm/0vVcVtP32Jr0kTLldnhtK/Ag0D7J2uCF/Ii5VHBiBUvqz57XLXns35xtIw
EF416PFsd9eY7t+2wFskRY9Oo/GVJm+Sz8SLdQcM/EdeaQVcROEZk+nNGUO64qsd
FwBnBjpeMT2KuP2YuDi4
=/QIA
-----END PGP SIGNATURE-----

--bO4vSxwwZtUjUWHo--
