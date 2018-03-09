From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci: tegra: Add runtime PM support
Date: Fri, 9 Mar 2018 09:36:29 +0100
Message-ID: <20180309083629.GA13877@ulmo>
References: <1518626085-29102-1-git-send-email-jonathanh@nvidia.com>
 <1518626085-29102-2-git-send-email-jonathanh@nvidia.com>
 <54bd00b7-2835-a253-0399-370e8c8203b8@linux.intel.com>
 <f1a1c300-a558-f31a-bcfa-c3eda697b0fd@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1a1c300-a558-f31a-bcfa-c3eda697b0fd@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 08, 2018 at 09:31:07PM +0000, Jon Hunter wrote:
>=20
> On 01/03/18 14:18, Mathias Nyman wrote:
> > On 14.02.2018 18:34, Jon Hunter wrote:
> >> Add runtime PM support to the Tegra XHCI driver and move the function
> >> calls to enable/disable the clocks, regulators and PHY into the runtime
> >> PM callbacks.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >> =C2=A0 drivers/usb/host/xhci-tegra.c | 80
> >> ++++++++++++++++++++++++++++++-------------
> >> =C2=A0 1 file changed, 56 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/usb/host/xhci-tegra.c
> >> b/drivers/usb/host/xhci-tegra.c
> >> index 02b0b24faa58..42aa67858b53 100644
> >> --- a/drivers/usb/host/xhci-tegra.c
> >> +++ b/drivers/usb/host/xhci-tegra.c
> >> @@ -18,6 +18,7 @@
> >> =C2=A0 #include <linux/phy/tegra/xusb.h>
> >> =C2=A0 #include <linux/platform_device.h>
> >> =C2=A0 #include <linux/pm.h>
> >> +#include <linux/pm_runtime.h>
> >> =C2=A0 #include <linux/regulator/consumer.h>
> >> =C2=A0 #include <linux/reset.h>
> >> =C2=A0 #include <linux/slab.h>
> >> @@ -1067,22 +1068,12 @@ static int tegra_xusb_probe(struct
> >> platform_device *pdev)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, tegra);
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_xusb_clk_enable(tegra);
> >> -=C2=A0=C2=A0=C2=A0 if (err) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "faile=
d to enable clocks: %d\n", err);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto put_usb2;
> >> -=C2=A0=C2=A0=C2=A0 }
> >> -
> >> -=C2=A0=C2=A0=C2=A0 err =3D regulator_bulk_enable(tegra->soc->num_supp=
lies,
> >> tegra->supplies);
> >> -=C2=A0=C2=A0=C2=A0 if (err) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&pdev->dev, "faile=
d to enable regulators: %d\n", err);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto disable_clk;
> >> -=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 pm_runtime_enable(&pdev->dev);
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_xusb_phy_enable(tegra);
> >> +=C2=A0=C2=A0=C2=A0 err =3D pm_runtime_get_sync(&pdev->dev);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0) {
> >=20
> > Does this mean that if runtime PM is disabled then clocks and regulator
> > will never be enabled
> > for Tegra xhci?
> >=20
> > How about keeping the clock and regualtor enabling in probe, and instead
> > add something like:
> >=20
> > pm_runtime_set_active(&pdev->dev);
> > pm_runtime_enable(&pdev->dev);
> > pm_runtime_get_noresume(&pdev->dev);
>=20
> For 64-bit Tegra there is a dependency on CONFIG_PM, but for 32-bit
> AFAIK there is not and so yes we should handle the case when PM_RUNTIME
> is disabled.
>=20
> Typically we do something like ...
>=20
>     pm_runtime_enable(&pdev->dev);
>     if (!pm_runtime_enabled(&pdev->dev))
> 	ret =3D tegra_xusb_runtime_resume(&pdev->dev);
>     else
>         ret =3D pm_runtime_get_sync(&pdev->dev);
>=20
> That way we can keep the regulator and clock stuff in the handler. I
> will update this series.

Is there any good reason why we don't depend on PM for 32-bit as well?
I'm not aware of any differences in drivers that are 32-bit specific for
Tegra, and I'm not even sure the !PM case gets any testing at all. And
even if, do we really still want to support that?

I don't see any advantage these days for having it disabled.

Thierry

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqiR4sACgkQ3SOs138+
s6GNiA//X3I2OQDwVf2dkPjQ29rUYps6NVTfwWqSz8oNmK9UnoEnQ47vRbTPP7QW
szuryupTCPIpXzZFXL2A4zxO0BFpKw/nENNYFepmOYj0s7+agpawbPor4x0Rtlnn
etCLwjpZk5iJSHbMVH6Cb9w2tAex8BY1fyyYVz+TATDowsEVU+agIVqRgfYTAUZq
jWw46thN5oiLW+wODbR44C+RNVd5+gICb486Z9bsxU+ZkzdpfWgJ3s4aHJEP2RxN
A42FkxBbZ1klyvqo8KBcfAsNuVGQS3xnR0NmhLZVVNG7cGdFsW+EJFAecQF8oX9P
999RQwfmwXQyWe9fuXL4BSZv/gnQk+Z+EjEWX1rgwtpfFXgKKGPsd+4eG9VkRqGT
XQCOkDeFNyQBfi9aGFX5hgvg+dpTBooXqUhfubyf+Odsf6DTeV7hbwzlNkuVzuPS
Abu7nQeulp1pXg089IqmDn1YxqNB9OTTnQDTCgC+3VlVabX/lS3ce4j/q37vf3DC
UCqwZzdXHm4X1yqCWtlpOdrhU/lGTbxGKYNpUt8qz80+anSegKh78oQo4BKdAqS8
sL6t/SUSNt3ts56z76v10lYZ6TsT/XboT3xiaUaCnakDU9RTIHIGqEyhjVxzoG5h
3iff5vlmBpd/vXpfgY8ceR7pXRuUnenw5yzq3MNlpbIfM1q2pOk=
=6DDv
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
