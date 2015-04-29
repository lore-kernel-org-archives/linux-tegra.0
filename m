From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V7 5/9] mfd: Add driver for NVIDIA Tegra XUSB
Date: Wed, 29 Apr 2015 19:30:59 +0100
Message-ID: <20150429183059.GA9169@x1>
References: <1430174242-29465-1-git-send-email-abrestic@chromium.org>
 <1430174242-29465-6-git-send-email-abrestic@chromium.org>
 <20150429092348.GQ9169@x1>
 <CAL1qeaHNVVzMFg5r5ghg3zJTbaYOSf5Ms+Af_U5fhKc+vfWMHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaHNVVzMFg5r5ghg3zJTbaYOSf5Ms+Af_U5fhKc+vfWMHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, 29 Apr 2015, Andrew Bresticker wrote:

> Lee,
>=20
> On Wed, Apr 29, 2015 at 2:23 AM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > On Mon, 27 Apr 2015, Andrew Bresticker wrote:
> >
> >> Add an MFD driver for the XUSB host complex found on NVIDIA Tegra1=
24
> >> and later SoCs.
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> >> Cc: Samuel Ortiz <sameo@linux.intel.com>
> >> Cc: Lee Jones <lee.jones@linaro.org>
>=20
> >> --- /dev/null
> >> +++ b/drivers/mfd/tegra-xusb.c
>=20
> >> +struct tegra_xusb_soc_data {
> >> +     struct mfd_cell *devs;
> >> +     unsigned int num_devs;
> >> +};
> >> +
> >> +static struct resource tegra_xhci_resources[] =3D {
> >> +     {
> >> +             .name =3D "host",
> >> +             .flags =3D IORESOURCE_IRQ,
> >> +     },
> >> +     {
> >> +             .name =3D "xhci",
> >> +             .flags =3D IORESOURCE_MEM,
> >> +     },
> >> +     {
> >> +             .name =3D "ipfs",
> >> +             .flags =3D IORESOURCE_MEM,
> >> +     },
> >> +};
> >> +
> >> +static struct resource tegra_xusb_mbox_resources[] =3D {
> >> +     {
> >> +             .name =3D "smi",
> >> +             .flags =3D IORESOURCE_IRQ,
> >> +     },
> >> +};
> >
> > DEFINE_RES_IRQ_NAMED()
> >
> >> +static struct mfd_cell tegra124_xusb_devs[] =3D {
> >> +     {
> >> +             .name =3D "tegra-xhci",
> >> +             .of_compatible =3D "nvidia,tegra124-xhci",
> >> +     },
> >> +     {
> >> +             .name =3D "tegra-xusb-mbox",
> >> +             .of_compatible =3D "nvidia,tegra124-xusb-mbox",
> >> +     },
> >> +};
> >> +
> >> +static const struct tegra_xusb_soc_data tegra124_xusb_data =3D {
> >> +     .devs =3D tegra124_xusb_devs,
> >> +     .num_devs =3D ARRAY_SIZE(tegra124_xusb_devs),
> >> +};
> >> +
> >> +static const struct of_device_id tegra_xusb_of_match[] =3D {
> >> +     { .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra12=
4_xusb_data },
> >
> > Yuk!  Why are you mixing platform data and DT in this way?
> >
> > Why can't you just stick all of this in DT?
>=20
> I assume you mean the resources?  The compatible strings will at leas=
t
> need to be SoC-specific since they will change from SoC to SoC.
>=20
> >> +     {},
> >> +};
> >> +
> >> +MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
> >> +static struct regmap_config tegra_fpci_regmap_config =3D {
> >> +     .reg_bits =3D 32,
> >> +     .val_bits =3D 32,
> >> +     .reg_stride =3D 4,
> >> +};
> >> +
> >> +static int tegra_xusb_probe(struct platform_device *pdev)
> >> +{
> >> +     const struct tegra_xusb_soc_data *soc;
> >> +     const struct of_device_id *match;
> >> +     struct tegra_xusb *xusb;
> >> +     struct resource *res;
> >> +     void __iomem *fpci_base;
> >> +     int irq, ret;
> >> +
> >> +     xusb =3D devm_kzalloc(&pdev->dev, sizeof(*xusb), GFP_KERNEL)=
;
> >> +     if (!xusb)
> >> +             return -ENOMEM;
> >> +     platform_set_drvdata(pdev, xusb);
> >> +
> >> +     match =3D of_match_node(tegra_xusb_of_match, pdev->dev.of_no=
de);
> >> +     soc =3D match->data;
> >> +
> >> +     irq =3D platform_get_irq_byname(pdev, "host");
> >> +     if (irq < 0)
> >> +             return irq;
> >> +     tegra_xhci_resources[0].start =3D irq;
> >> +     tegra_xhci_resources[0].end =3D irq;
> >> +
> >> +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "=
xhci");
> >> +     if (!res)
> >> +             return -ENODEV;
> >> +     tegra_xhci_resources[1].start =3D res->start;
> >> +     tegra_xhci_resources[1].end =3D res->end;
> >> +
> >> +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "=
ipfs");
> >> +     if (!res)
> >> +             return -ENODEV;
> >> +     tegra_xhci_resources[2].start =3D res->start;
> >> +     tegra_xhci_resources[2].end =3D res->end;
> >> +
> >> +     soc->devs[0].resources =3D tegra_xhci_resources;
> >> +     soc->devs[0].num_resources =3D ARRAY_SIZE(tegra_xhci_resourc=
es);
> >> +
> >> +     irq =3D platform_get_irq_byname(pdev, "smi");
> >> +     if (irq < 0)
> >> +             return irq;
> >> +     tegra_xusb_mbox_resources[0].start =3D irq;
> >> +     tegra_xusb_mbox_resources[0].end =3D irq;
> >> +
> >> +     soc->devs[1].resources =3D tegra_xusb_mbox_resources;
> >> +     soc->devs[1].num_resources =3D ARRAY_SIZE(tegra_xusb_mbox_re=
sources);
> >> +
> >> +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "=
fpci");
> >> +     fpci_base =3D devm_ioremap_resource(&pdev->dev, res);
> >> +     if (IS_ERR(fpci_base))
> >> +             return PTR_ERR(fpci_base);
> >
> > This stuff is not good.
> >
> > Either let MFD handle it with mfd_cells or stick all of this stuff =
in
> > DT and parse it from the child devices.
>=20
> I'm not sure what exactly you mean by "let MFD handle it with
> mfd_cells" here - is that not what I'm doing now?  Anyway I think tha=
t
> leaves two ways of representing this in DT.
>=20
> Either have the MFD take a single IOMEM resource and divide it up
> statically within the driver:
>=20
> usb@0,70090000 {
>         compatible =3D "nvidia,tegra124-xusb";
>         reg =3D <0x0 0x70090000 0x0 0xa000>;
>=20
>         usb-host {
>                 compatible =3D "nvidia,tegra124-xhci";
>                 interrupts =3D <...>;
>                 ...
>         }:
>=20
>         mailbox {
>                 compatible =3D "nvidia,tegra124-xusb-mbox";
>                 interrupts =3D <...>;
>                 ...
>         };
> };
>=20
> ... or have the MFD take only the shared FPCI resource and have the
> sub-devices parse the rest from DT:
>=20
> usb@0,70098000 {
>         compatible =3D "nvidia,tegra124-xusb";
>         reg =3D <0x0 0x70098000 0x0 0x1000>;
>         ranges;
>=20
>         usb-host@0,70090000 {
>                 compatible =3D "nvidia,tegra124-xhci";
>                 reg =3D <0x0 0x70090000 0x0 0x8000>,
>                         <0x0 0x70099000 0x0 0x1000>;
>                 interrupts =3D <...>;
>                 ...
>         }:
>=20
>         mailbox {
>                 compatible =3D "nvidia,tegra124-xusb-mbox";
>                 interrupts =3D <...>;
>                 ...
>         };
> };
>=20
> I don't have a strong preference here, but I think the former more
> accurately represents the resource hierarchy.  Since Thierry requeste=
d
> the use of an MFD, I'd like him to weigh in on this - Thierry?

The latter is what I had in mind.

> >> +     tegra_fpci_regmap_config.max_register =3D res->end - res->st=
art - 3;
> >> +     xusb->fpci_regs =3D devm_regmap_init_mmio(&pdev->dev, fpci_b=
ase,
> >> +                                             &tegra_fpci_regmap_c=
onfig);
> >> +     if (IS_ERR(xusb->fpci_regs)) {
> >> +             ret =3D PTR_ERR(xusb->fpci_regs);
> >> +             dev_err(&pdev->dev, "Failed to init regmap: %d\n", r=
et);
> >> +             return ret;
> >> +     }
> >> +
> >> +     ret =3D mfd_add_devices(&pdev->dev, -1, soc->devs, soc->num_=
devs,
> >> +                           NULL, 0, NULL);
> >> +     if (ret) {
> >> +             dev_err(&pdev->dev, "Failed to add MFD devices: %d\n=
", ret);
> >> +             return ret;
> >> +     }
> >> +
> >> +     return 0;
> >> +}
>=20
> >> --- /dev/null
> >> +++ b/include/soc/tegra/xusb.h
>=20
> >> +struct tegra_xusb {
> >> +     struct regmap *fpci_regs;
> >
> > Are you going to add to this?
>=20
> No, I don't have any plans to add to this struct.

Then you don't require a struct.  :)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
