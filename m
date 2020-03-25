From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Wed, 25 Mar 2020 21:15:56 +0100
Message-ID: <20200325201125.GA832965@ulmo>
References: <20200319074401.GA4116@Red>
 <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
 <20200325134003.GA27961@Red>
 <cf63d40c-7b84-60f6-76be-a13255e69c99@nvidia.com>
 <20200325142306.GB27961@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200325142306.GB27961@Red>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 03:23:06PM +0100, LABBE Corentin wrote:
> On Wed, Mar 25, 2020 at 02:00:25PM +0000, Jon Hunter wrote:
> >=20
> > On 25/03/2020 13:40, LABBE Corentin wrote:
> > > On Thu, Mar 19, 2020 at 08:55:38AM +0100, Nicolas Chauvet wrote:
> > >> Le jeu. 19 mars 2020 =C3=A0 08:44, LABBE Corentin <clabbe@baylibre.c=
om> a =C3=A9crit :
> > >>>
> > >>> Hello
> > >>>
> > >>> sata doesnt work on tegra124-jetson-tk1 on next and master and at l=
east since 5.2 (but 5.1 works).
> > >>> [    0.492810] +5V_SATA: supplied by +5V_SYS
> > >>> [    0.493230] +12V_SATA: supplied by +VDD_MUX
> > >>> [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci =
not found, using dummy regulator
> > >>> [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy n=
ot found, using dummy regulator
> > >>> [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci =
not found, using dummy regulator
> > >>> [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy n=
ot found, using dummy regulator
> > >>> [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci =
not found, using dummy regulator
> > >>> [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy n=
ot found, using dummy regulator
> > >>> [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply targe=
t not found, using dummy regulator
> > >>> [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> > >>> [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI co=
ntroller: -110
> > >>> [    5.323022] tegra-ahci: probe of 70027000.sata failed with error=
 -110
> > >>> [   35.694269] +5V_SATA: disabling
> > >>> [   35.697438] +12V_SATA: disabling
> > >>
> > >> It looks strange, because (on same device) , I have sata working as
> > >> appropriate, but ethernet fails with me.
> > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D206217
> > >>
> > >> It might worth to have another report.
> > >>
> > >=20
> > > Hello
> > >=20
> > > Mine has ethernet works well. But I hit many problem with it and olde=
r kernel.
> > > Perhaps the 5.1.21, were I am stuck, does not have it.
> > >=20
> > > Anyway, the tegra of kerneci has the same SATA problem.
> > > https://storage.kernelci.org/next/master/next-20200325/arm/multi_v7_d=
efconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/boot-tegra124-jetson-tk1.txt
> > >=20
> > > Maintainers, any idea on this sata issue ?
> >=20
> > I have checked our bootlogs for v5.6-rc7 and don't see the issue with
> > either the tegra_defconfig or the multi_v7_defconfig. I am wondering if
> > this could be due a difference in the bootloader version. Currently we
> > are testing with a v2019.07 u-boot bootloader. Looks like the kernelci
> > board is using an older u-boot. Obviously it should still work, but
> > would be good to know if the reason why were are not seeing this is
> > because of the bootloader.
> >=20
> > Another thing to check would be the pll_e clock frequency on a working
> > build and non-working build to see if there is a difference in the pll
> > frequency that is causing this.
> >=20
> > Cheers
> > Jon
> >=20
>=20
> Hello
>=20
> My uboot is 2016.01-rc4-00002-g3861d78, so a bit old.
> I have a mainline uboot build for this tegra, but still didnt find a clea=
r way to update it.
> Did you have a good documentation on how to update it ?
> If possible some clear uboot commands to update it via tftp.

Not sure about TFTP, but you can find the standard flashing scripts for
various devices here:

	https://github.com/NVIDIA/tegra-uboot-flasher-scripts

Those work by uploading the image via RCM and then running the commands
to flash it.

I think those scripts will also create the images that they will flash,
so you should be able to download that image via TFTP and then flash it
using the command that the tool would normally use.

Thierry

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl57u/wACgkQ3SOs138+
s6GNUhAAkrcqqRMGZtLkT0sMvVkiyOWw3Bj/DAvkCBNjNgmtxBu//ZjPqOsK7B/h
4eZJO8SfPWTHHh3zi76o8xMbKu1KFQZxANZ6vNj71GwM2f7iqrHe/wYlD+vv5Myb
hRYw7oSJVcaAhbTIeQCG4SrGFXT7EBpBHsQqRizsj9voCjY4TrWvG+ZTJZ6fqA5t
+QtsdOy32rdCIJbLGzHTkzHZg3LDPr6x5KnPhtCUDzoVWJgmBlLjgjPzxcgxzawJ
MGqvqEkl9I7TAdIBFoxna3HVOX1jZWS1NhCXSP8fJzxmKwrRIgDWP+QYkUegbmve
RjiI8A94VcdOTnfDTyZSfo7m3rXP4gtLQDTP4r2VUjvElByBlwN5rHM8bNEOyZCM
FgIVc8kByoK6+leOOfBQWl5aQiQoaUN1pnJHJk/VvC99spAv5Ik692/Tm7wH30SV
keDGeh7J7QTdsJ/++Obc7vteJo1jNkh0fZLSSA6wukFAYUK9O/+bDkigVOcBmLNY
H9otuH0Y1uGzwb0Jc1aRKDYOO9FDWNpTop2vGXNOz+BMLFBMjes6/EqmCEPgDtZH
/4yxLajy71mEl01i8B4cyZSwD796xya9L7cinyVYevxpoxUOmOgb9p/QNG1ziy3C
IZgWNp5TzacaL4iBFb/UZ86N8BMuwnWADLI8O+1l1kiONPp9i4A=
=8N/K
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
