From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration support
Date: Thu, 17 Oct 2013 21:58:39 +0200
Message-ID: <20131017195838.GA7366@mithrandir>
References: <1381944997-30671-1-git-send-email-treding@nvidia.com>
 <CAK5ve-J1wXRqMb_RnKpK3aVxn4QxKgdqzq58hfBK9FJjf9T1ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK5ve-J1wXRqMb_RnKpK3aVxn4QxKgdqzq58hfBK9FJjf9T1ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2013 at 11:22:02AM -0700, Bryan Wu wrote:
> On Wed, Oct 16, 2013 at 10:36 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
[...]
> > +int tegra_mipi_calibrate(struct device *device)
> > +{
[...]
> > +       struct platform_device *pdev;
> > +       unsigned int timeout =3D 20, i;
> > +       struct of_phandle_args args;
> > +       unsigned long value, pads;
> > +       struct tegra_mipi *mipi;
> > +       int err;
> > +
> > +       err =3D of_parse_phandle_with_args(device->of_node, "calibrate",
> > +                                        "#calibrate-cells", 0, &args);
> > +       if (err < 0)
> > +               return err;
> > +
> > +       pdev =3D of_find_device_by_node(args.np);
> > +       if (!pdev) {
> > +               of_node_put(args.np);
> > +               return -ENODEV;
> > +       }
> > +
> > +       of_node_put(args.np);
> > +       pads =3D args.args[0];
> > +
> > +       mipi =3D platform_get_drvdata(pdev);
> > +       if (!mipi) {
> > +               err =3D -ENODEV;
> > +               goto out;
> > +       }
> > +
> > +       err =3D clk_enable(mipi->clk);
> > +       if (err < 0)
> > +               goto out;
> > +
> > +       mutex_lock(&mipi->lock);
> > +
> > +       value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> > +       value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> > +       value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> > +       tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> > +
> > +       value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > +       value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> > +       tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(modules); i++) {
> > +               if (pads & BIT(i))
> > +                       value =3D MIPI_CAL_CONFIG_SELECT |
> > +                               MIPI_CAL_CONFIG_HSPDOS(0) |
> > +                               MIPI_CAL_CONFIG_HSPUOS(4) |
> > +                               MIPI_CAL_CONFIG_TERMOS(5);
> > +               else
> > +                       value =3D 0;
> > +
> > +               tegra_mipi_writel(mipi, value, modules[i].reg);
> > +       }
> > +
> > +       tegra_mipi_writel(mipi, MIPI_CAL_CTRL_START, MIPI_CAL_CTRL);
> > +
> > +       while (timeout) {
> > +               value =3D tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> > +               if ((value & MIPI_CAL_STATUS_ACTIVE) =3D=3D 0 &&
> > +                   (value & MIPI_CAL_STATUS_DONE) !=3D 0)
> > +                       break;
> > +
> > +               usleep_range(10, 100);
> > +               timeout--;
> > +       }
> > +
> > +       mutex_unlock(&mipi->lock);
> > +       clk_disable(mipi->clk);
> > +
> > +       if (timeout =3D=3D 0)
> > +               err =3D -ETIMEDOUT;
> > +       else
> > +               err =3D 0;
> > +
> > +out:
> > +       platform_device_put(pdev);
> > +       return err;
> > +}
> > +EXPORT_SYMBOL_GPL(tegra_mipi_calibrate);
> > +
>=20
> Hi Thierry,
>=20
> Does this driver support T20/T30 or new chip after T114? I guess there
> are should be some difference between them.

Yes, I think this is currently incompatible with Tegra20 and Tegra30. I
have no hardware that can actually make use of this (or on hardware
which can, which I suppose would be Cardhu with the camera module) I
can't test it because there's no driver yet.

I'm not very familiar with the details on how calibration works on
earlier Tegra SoCs, but I hope that we can somehow mould it into
providing the same interface. I have some vague recollection of some-
body mentioning that the registers are not as nicely gathered in one
place on earlier SoCs, but I'm not sure.

> And is there any guide about when is it correct to call this API
> tegra_mipi_calibrate().

=46rom what I understand calibration needs to happen whenever a power
cycle has happened.

> I think for CSI, we need get all power and clock ready and external
> sensor is generating the data. Calibration will be done during CSI
> receive the first frame data. For DSI, it might be different.

Yes, I think for DSI it's enough to get power ready. I don't think we
even need to enable the clock. I wonder how CSI will even receive the
first data frame when the pads haven't been calibrated yet? Does our
downstream kernel provide any hints? If not we should try to find out
internally, but if all else fails I guess we can determine the right
time to call this empirically.

> And Is there any conflict when CSI/DSI driver both use this API?

No. I think it should be safe to use them concurrently because access to
the calibration registers is serialized using the mipi->lock mutex.

Thierry

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSYEFuAAoJEN0jrNd/PrOhUesQALEo3eGj8RHCj/1i64JFvW9R
GxbiX+RCkW6bSd9LBH9VN4lA3656Kgz5l75UKe3ah48aB03JxdV4FrpyFEUrGemx
FcIvhhXa7Lb5htO2SbWhALZF1Lf7CyviCdgjf9m5lbVC06XreiIXEfi4jM7Iu+z5
PGbwqogRY4aMjE4VE6wfd9l0d3m2FIjqpuvJ8KAVRup8PKXwDl+K2sKUJREbRtt3
1ZBIL36f1D7HyRquEwKO/7GjK/J7JDQs0GZMUyrLqK4+nXT3CuV+7zxnpBQO98zl
ZwzGGEKqEiZiLVPsz2ULDGZEOJvFND/UE2EN3S8XhEjEUhBF4WK5j2gvn8VQy/Ef
eURvXtquIMfoSxZVpJKb18CZlMpHGPDaGMkjNq6tvECFnkDoSLqnWFo1NxtdbBQV
q2C8xsWI792kweia2de+Qgr6E3C3Q1KvKGbL5sr0qKtj+um7YHB7dwW0GEiQ41Kt
Rd+E2YhkLmgx3zeL8k0p4+N4DgL8Wts31ToduJiVb+gGeTgAorFXgjuioU7QyFip
LM2SgdBLaPC+POKCyctoj9PQDDGYyYZBl5kv9XM6OZSRsCXRmixZSg1EkYvhb+Zg
4tygOKFm2174VKtp0lvkygKrni6lVwKVtAh3+Mox3mz3WCNu18HReTHwTjUX6u1f
ouC1xHl9Uf6OG5/OqLxA
=L4+O
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
