From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add kexec support to defconfig
Date: Fri, 4 Jan 2013 21:08:20 +0100
Message-ID: <20130104200820.GC4577@avionic-0098.adnet.avionic-design.de>
References: <1357161141-26430-1-git-send-email-swarren@wwwdotorg.org>
 <20130103210541.GB4412@avionic-0098.adnet.avionic-design.de>
 <50E5F5A3.1060507@wwwdotorg.org>
 <20130103212903.GA27749@avionic-0098.adnet.avionic-design.de>
 <50E5FBDE.90804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50E5FBDE.90804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 02:45:02PM -0700, Stephen Warren wrote:
> On 01/03/2013 02:29 PM, Thierry Reding wrote:
> > On Thu, Jan 03, 2013 at 02:18:27PM -0700, Stephen Warren wrote:
> >> On 01/03/2013 02:05 PM, Thierry Reding wrote:
> >>> On Wed, Jan 02, 2013 at 02:12:21PM -0700, Stephen Warren
> >>> wrote:
> >>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>=20
> >>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---=20
> >>>> arch/arm/configs/tegra_defconfig |    1 + 1 file changed, 1=20
> >>>> insertion(+)
> >>>>=20
> >>>> diff --git a/arch/arm/configs/tegra_defconfig=20
> >>>> b/arch/arm/configs/tegra_defconfig index 742dc41..e621603
> >>>> 100644 --- a/arch/arm/configs/tegra_defconfig +++=20
> >>>> b/arch/arm/configs/tegra_defconfig @@ -34,6 +34,7 @@=20
> >>>> CONFIG_AEABI=3Dy CONFIG_HIGHMEM=3Dy CONFIG_ZBOOT_ROM_TEXT=3D0x0=20
> >>>> CONFIG_ZBOOT_ROM_BSS=3D0x0 +CONFIG_KEXEC=3Dy CONFIG_CPU_FREQ=3Dy=20
> >>>> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy CONFIG_CPU_IDLE=3Dy
> >>>=20
> >>> Interesting. What do you plan to use this for? kdump?
> >>=20
> >> I plan to burn a kernel (and a small stub, and a DTB) into flash=20
> >> instead of U-Boot, and hence not have to rely on any bootloader.
> >=20
> > Why does that require kexec support?
>=20
> Because I'd be using that kernel plus an initrd to download the "real"
> kernel over e.g. TFTP and kexec it.

Right, that makes sense. Thanks for explaining.

Thierry

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ5za0AAoJEN0jrNd/PrOh8QwQAKCKLR0l4Pi+LDJbLMCfmbw7
eoXRIuBbm2MSLBj5Ga8TdvON5Qf0ABfWd0Ea8Z2vJKF+rR89SiP+Q7V8Qdypj/Gj
TRO5qlFpCLBEQD0Qzkbb2zYMIJhzcUtOyU6q+YUqtTEAyX76JcphpTy/EsROvmFQ
MBMLjLnt0fNNOXzmYDZbFna+kde60vNsLYsF8jXmHQzGMF2m5G1frVizgm75EpYV
PQ07xgcn0Jez2I5F415277WONxJKq7AJ7N8T1erUnbszv8KN7fuvf39CZ75kWgyc
R/m4a6UjTOc7CFYrCwDB/bJiDGrVquxlARChCpRgckjhxReMmqBS7ypKnhNLuj4g
MoIkYyolTWmjRitg9Mr//wWCyZ7vwdTpfCAbdq9gzyKhuWfftnZRx/LlZ5ABXwI9
o0gHq/xYN5oI9Qvb2NEBwKfK6jWi7CqD2Ra5rOtWZAogmCAsFGHAU9jocyTvQd1X
vMxMAcxdfKXtSLKoVjiDsOcMrU9T/2MfCx7IPZ/0dWt9M3X/NVSf/eUSnz1g87Sd
4xYn8cxj9KKD9whsB1i0xW6Fsa0svEvzJiyTBjtinNoNSspBjxBUbCGDDzEA+XbY
wLOgopaxhvK6Tc/YMm41wOwDEZa8/x08GdP9mUPkzKhKvDFadXCEb8jmhmmp1lY3
VOHEU96rjKZGhoIwScLT
=p6HF
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
