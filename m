From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Tue, 27 Aug 2013 09:46:10 +0200
Message-ID: <20130827074609.GE8686@ulmo>
References: <20130826153050.GC8764@redacted.bos.redhat.com>
 <521BD48F.1060202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521BD48F.1060202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 04:19:59PM -0600, Stephen Warren wrote:
> On 08/26/2013 09:30 AM, Kyle McMartin wrote:
> > While poking at something using the for-3.12/* trees, I hit the
> > following compile error:
> > drivers/built-in.o: In function `tegra_pcie_map_irq':
> > /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.a=
rmv7hl/drivers/pci/host/pci-tegra.c:640:
> > undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> > drivers/built-in.o: In function `tegra_msi_map':
> > /builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.a=
rmv7hl/drivers/pci/host/pci-tegra.c:1227:
> > undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
> > make: *** [vmlinux] Error 1
> >=20
> > Since our .config had CONFIG_CPU_IDLE off. We should probably provide
> > an empty function to handle this to avoid cluttering up pci-tegra.c
> > with conditionals.
>=20
> Another approach would be to use if (IS_ENABLED(CPU_IDLE)) at the call
> site. I guess the approach in this patch is better than that though,
> since it doesn't pollute the callers with knowledge of when this
> function is available.
>=20
> Thierry, if you're OK with this, I can forward it on to arm-soc.

I agree. The dummy seems like the better option. Feel free to add my
Reviewed-by (in my reply to the original patch) when you forward.

Thanks,
Thierry

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHFlBAAoJEN0jrNd/PrOhzHgQALqpjFJhFVpCcvL2xsQF37bZ
a0CQS/AWA40FJ6dzEOP3j1ZF6hRrsIiHSxLf5b/Fwhlo5ejuF4ccj1NG1+6mKh2i
hvNSRwUjrCWO3o/b5SqJAnHqIEWa7JwDUDJBiX6S7lF8V7sqYC8gm7ikUdowBxFf
klbIkye79BWIzERKz7gi4a38yCTNh6W/wpEi7OcgFHLDC7uLVrsIEEa5SbfdxI1b
IjER3iwEovoUL46fbMsMLuyTn9zDH2+McKpnMg+pC2OcNzpAnpZahw2B2GHmciAZ
f1KcjhKhoIeJGIBvF7CI7dBrHTY0j1GZkFLQIBwC062OgkbQhRmVU7zVwbNqZlvs
CQXBM+ErC4m8MznzvoYrHQaLVWNPqQmBUnQNdBBlM+zFupGK5C1jjLgYZk09T9tY
RwwW1IrDhm7Zuw+Ma57evDC9mLKoe/1DRAm8lOZ5ybTRJZHYLBOYKJOoJO0hJNoI
cIQHQcLCiCVFl6JevUuLazjL/LmC/KATABYATHcE5YFWEgVuT73WDFxEaihzRs5N
7hUAUMW3+aifrPv0hFJry756hcnLgEi2HS0zmlsJvrB6bLslTR5mO6pSYi04PrGe
01moaWQEtIAINwVPi05gDOv0K2JpDhgqUzWwrw8ZDSkVT/UYcaoGFo353V6TrVtf
C2DVAPalm61lyKPDKrOd
=Lm2o
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
