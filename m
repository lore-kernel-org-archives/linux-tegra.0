From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM64: tegra: Add chosen node for tegra132 norrin
Date: Mon, 25 Jan 2016 18:10:21 +0100
Message-ID: <20160125171021.GB10182@ulmo>
References: <1453737310-11391-1-git-send-email-jonathanh@nvidia.com>
 <56A645CC.5070907@nvidia.com>
 <56A646BC.1010708@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56A646BC.1010708-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 04:01:00PM +0000, Jon Hunter wrote:
> Correcting ARM-SOC email address ..

You might have to resend so that the original patch shows up in the
ARM SoC maintainers' inbox.

Thierry

> On 25/01/16 15:57, Jon Hunter wrote:
> >=20
> > On 25/01/16 15:55, Jon Hunter wrote:
> >> The NVIDIA bootloader, nvtboot, expects the "chosen" node to be present
> >> in the device-tree blob and if it is not then it fails to boot the ker=
nel.
> >> Add the chosen node so we can boot the kernel on Tegra132 Norrin with =
the
> >> nvtboot bootloader.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> Ideally, we would like to get this into v4.5 as a fix for Tegra132 Nor=
rin
> >> so that we can enable booting this board as part of our automated test=
ing
> >> setup for Tegra [0][1]. Thierry suggested I send this directly as a fix
> >> to ARM-SOC. Let me know if this is ok. I have not included a "fixes" a=
s it
> >> may not be needed for all bootloaders, but if you need this we could p=
ut:
> >>
> >> Fixes: 0f279eb arm64: tegra: Add NVIDIA Tegra132 Norrin support
> >>
> >> [0] http://nvtb.github.io/linux/
> >> [1] http://nvtb.github.io/linux-next/
> >=20
> > Forgot to mentioned that the differences for v1 -> v2 are just some
> > minor corrections to the commit message.
> >=20
> > Jon
> >=20
> >>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm=
64/boot/dts/nvidia/tegra132-norrin.dts
> >> index 7dfe1c085966..62f33fc84e3e 100644
> >> --- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> >> +++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> >> @@ -12,6 +12,8 @@
> >>  		rtc1 =3D "/rtc@0,7000e000";
> >>  	};
> >> =20
> >> +	chosen { };
> >> +
> >>  	memory {
> >>  		device_type =3D "memory";
> >>  		reg =3D <0x0 0x80000000 0x0 0x80000000>;
> >>

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWplb8AAoJEN0jrNd/PrOhxJkQAKEbbJo1IiRdFQS41G5nTSrN
7FiXQk8fIl8x9C1BIgouqnwRh2t1JvE0NRMmdI1Lh/7xJ3DYXNhVXbN1mueL3rkc
qg2Fogk450jH/ppptT8CJ8YTZUxiq0lDWWUDB0+qLozDbEasmiRUNvsz1/EOz5Nv
umEk4CDe74aS5c9SQQKJ7NZsvbz6gVXYL+6FIbAj/eQCL1hYTobNCckTTxYpJUGE
C/+wQLzdUHRjn3fCRsaOt3DabYjUkB1AemkdG4J4t+Dwr9BGce3BEhaTBkSQqOuP
ggzk/GQduMQ2Yk2t5UX7yiLPLdFTCWmCT62R/dOcepUTw1VzCMf9vdcpjyNyl7Kd
1OUM2yvh4+DVVg9k4nizitvGSq0mAUU24omdUiFd6kSc3IbSwrVracZ1RVdXSM+S
FjG1qKAlLDoKyW0ZvGzKvHJDu8OaZKceuGmafiMB6VE1q81cORF3vAIAfxC0swxT
qsEhzv0FuUO3IBHumJXAb0vU7A5YON8WvUbXiCsTTRu9fKpki5mqzFYHTVxav9pC
Q9nZ308wxq95foTt2IjQy7DsqdWznTm18/5aBK3l8JcVDESJtYXSiHvbDTJ/oFh9
jZzsZAhzorSzooiRw9wY34t4II2kyuDV4XTjg7dsyqX++Kwfi8sz2CU04cLWABg1
o6MzWhgKQz9Q6N2+yNIG
=6ibI
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
