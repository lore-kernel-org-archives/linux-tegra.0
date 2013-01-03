From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add kexec support to defconfig
Date: Thu, 3 Jan 2013 22:05:41 +0100
Message-ID: <20130103210541.GB4412@avionic-0098.adnet.avionic-design.de>
References: <1357161141-26430-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357161141-26430-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2013 at 02:12:21PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_de=
fconfig
> index 742dc41..e621603 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -34,6 +34,7 @@ CONFIG_AEABI=3Dy
>  CONFIG_HIGHMEM=3Dy
>  CONFIG_ZBOOT_ROM_TEXT=3D0x0
>  CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_KEXEC=3Dy
>  CONFIG_CPU_FREQ=3Dy
>  CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
>  CONFIG_CPU_IDLE=3Dy

Interesting. What do you plan to use this for? kdump?

Thierry

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ5fKlAAoJEN0jrNd/PrOhkSMQAKOIwWsR5yHPhMQbXcJGdcy1
Anx2Q0RH2fFDmJ0pUFajHVt1+w4VjdjP2Z7i6/xTJSKZ+rnki0HYJtb07TaFN9Ci
f2wd57RU4y7WaI7jfGTyw8nXS6CIWUG4a6lT2TIzfKbEc7PMDQgRj+2g/PdTQYPp
v3RwJkTQXimbBXt3tYJb4tAF6ZnrDCzr/+klUON/9CY3cAI2GmSOZdQOQ0bcnzS5
Gv0cNe8jx5+LEdWv2vIBwxCIoLomzKQS6YiDilEsQF1/GzE0LhotU/M7QKmXpTgV
1zW+nksJTEIVb4CfgqCZSvK5YX+y7laR2wUrmgBWk32IJnL4qSA6JOIKr3kiZykm
3JbCsUefFJN9XbDfugNTWFU42VMpvuTvkzh7+5Ao52WMv92P28wEwiVSGRd/C06g
rMAt7Oc84dXOq+z98eToDA45J6uVn4vqSYHR+AVgevQOQoocdDDUmg6LgF0j82QD
6ZXst0YE/R9nL72jY2vMI2gbWyeAYbQdtfjMilHv26/SjLxebvuJbDrU7ejuiKzR
6yrJcl69O9TkYarYl5g24yNWcR6pE9kqEthwpdJIOD2micCBgi5DUd4m+7PNH2w5
EFzKlaLyH5Rmm5zZ36gHn6kSGwKgkQIHCw88pwWYG6YjEXyJ/zoQIzUcQ55uHo6U
UKPwNouUaJhwER1f0c8t
=xCGo
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
