Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606C5C0007A
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 06:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1279423357
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 06:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgLPGIx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 01:08:53 -0500
Received: from mail-vi1eur05on2082.outbound.protection.outlook.com ([40.107.21.82]:9344
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbgLPGIx (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 01:08:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+IoWJfxyUzLEZJQxaWNViUYY8OAvksep9Vpw2Q1rexBy4p8vBcpbTXNWut6iy94XZguqmfsrrK3xZhRCMqt04daWsAkfVj8hgdfo+5drRDKlJPzXQp8YkeFaCM0bNOEkEzQ/NQQrPIpocrKHFAYErVT9Bt81E3mfHou8uP9fnjip5ArgdcrZBvk6y2hyrj2ga9H2+OkglYo3/f1JBoC8g3lcn4iVeiFBBcOo8J7XRWHEXiP1dyFLiAWkKMEiHnJpdJvNaI1m0FGOlLERguSlQt1sQmj7iaNVr5eAbxCEal8I4+hL/Dlo3l+aoHI1Zxp5Hi+O4vS9wZy2H0jV3pdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYOzpln6GrkXcNhXrp7Na7FawAkRZzxD4HXJ3X1ZeoI=;
 b=k5DLHaJI3V01nCZmwHjK8bybBzozULBgfO729gv6Vo+F9LV692k1K4m8cwSUd8FYf4z32GXA3l/VH08V+gEwXZBekJHW+imwYWwrYKAB2M7L+nbNUJYDhNDZtVwyjlBOMotLEG3+NtQCresbFSFYQaGTIoZOHGcpKd/Ijxsb3RHv8e/ZisTlh8b0u53VYrThijRSPNEjY/HyC7+Ws1QYu1hmHoQ3R3/VFFowTuWgLuhiKbmdEfSAkJY7vWtSMBzxCcvNe9MR+RNSl3qoOqm8lHlndTNQ8+9UT9oE06vynSWp/DSvp4Bn8alEsZTxFxS5hzfIIxH9Nlt4Nigwd6VHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYOzpln6GrkXcNhXrp7Na7FawAkRZzxD4HXJ3X1ZeoI=;
 b=ni/RRKRh6zh7I9BElsMvukhWaf3b4XJ9WcmYvnKXdlFVOtdtSuNWrjETxzQOdsrZNBwuJjaKgJRSOIjDqhKHKCYyrVtCO91I+iGLeA+i+RwGy1925T7gYrMV2a3NNaMml6Gbz2oR3hO8sDmLMBgQIBag5gVLBtegfznU7tGOvcc=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 16 Dec
 2020 06:08:02 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Wed, 16 Dec 2020
 06:08:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
Thread-Topic: [PATCH v1 5/8] usb: chipidea: tegra: Support host mode
Thread-Index: AQHW0x/sFW0mzdxsYU6mrtKY3m6gWan5PTsA
Date:   Wed, 16 Dec 2020 06:08:01 +0000
Message-ID: <20201216060732.GB5595@b29397-desktop>
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-6-digetx@gmail.com>
In-Reply-To: <20201215202113.30394-6-digetx@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d3e63b1-a388-43c1-2539-08d8a188f200
x-ms-traffictypediagnostic: DB3PR0402MB3913:
x-microsoft-antispam-prvs: <DB3PR0402MB3913F1686912D12C2DB3B8978BC50@DB3PR0402MB3913.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lh9Uaky4ji6hf8ep6uZI1WHnUXJU4liCJtM1ZI/CI/cN1rXQzwBrS3CYsOvYB2zTapI23kA53vumNal0WcGE6d/vz6JDE/ydkStERmSkAHNo6/aMA14MgyhuhNzeWwORPjjYAw7hK5uQqzAO/muxZFXMEBn5aNtbiE4eg20ZOdJx4mCzBrQ7mWa6mgj8+anAUQ67tbq/HvX/3CVYBNcvACumC0TilFhf0XeM960yuOcHq1b7qo7hHfWzsX2IfohonhZfcTr4i1+U1U1iLFXBVD2QujlKmidNeygl4bFSfpMvY5EulMGOTHQK0VJcQrz7+12kiHQfvAjOlW0VflRcXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(44832011)(30864003)(83380400001)(71200400001)(4326008)(6506007)(66476007)(66556008)(1076003)(186003)(64756008)(6486002)(7416002)(6916009)(66946007)(478600001)(53546011)(6512007)(26005)(54906003)(316002)(91956017)(33716001)(8936002)(66446008)(8676002)(86362001)(5660300002)(2906002)(9686003)(33656002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?09F8S4+YU4zyrt8ZPhqFw0hY3REIJVq29hQik5mYjAzQz8kmNNiwrIqnT8k0?=
 =?us-ascii?Q?K0bFEqucudk9GsrV5sDJafcWfYgvrzn5d4FqUqFzlYa22s3HgwAmaFnnnTk1?=
 =?us-ascii?Q?j11Bz3I5DXStEwmQLdCnhUIlZbW14+11QJGvaEdDvQvC45y+bqabRx4zsmyj?=
 =?us-ascii?Q?9pw15qjdsxpe5R2l/vjQjQPfY+ffEEoQs/7fKy+wlD16pTM+qh61ctyNtp8w?=
 =?us-ascii?Q?Ohwp1xS40bNSzbAAX1NRopKC6dVl6z2J/UpZ53jBHHh+z4hREV8VrxWV5vV0?=
 =?us-ascii?Q?Xt6lArooEZm7ySBDcPgdnrGvZpb1+I9Ww5R63ldij4CNeNKiS8kOP9FOjsd2?=
 =?us-ascii?Q?FcfzoqqZkMyB89WNP/mlFUlRlr6i/h4Dwx839Uib4VD2XJ01mXtSShebISuh?=
 =?us-ascii?Q?z/At+UPSSJaFjMV4o5QV0pN4v8gKNTWL/oqrqt3UpCxXGdFpc3tq5c7bWa+W?=
 =?us-ascii?Q?OO8z26ia6JijdBmZrvrnpfCOpvvoKQEUyAWZe7i4aw1vGtJWkvdbrsAZyaoI?=
 =?us-ascii?Q?OCzhCr2f4+9TRk5bnSrTJttmM7LyJrQc8xHp4YnV3tLdqgcFSqPpYGed0+/5?=
 =?us-ascii?Q?RPcOPhcgYi4DwSA/oGfv5vVjQkgmb9dOI9TqMIAwzcv10dMHlf9T/BCnVkVd?=
 =?us-ascii?Q?9yPSuoYCJ3HBIejowFxP2CJf89pxAViZ9IOnvAP6z72rsI5LJKV8rbARLdqj?=
 =?us-ascii?Q?cB7M3iYRFHBum1xRPuDv5Zps5i+S43+bJF5lEfTHfGwJWTcGrg+3UqcqEoXl?=
 =?us-ascii?Q?LyZu35Ie+rFekikD+YI52SRIktFppYfp53FHxXtnKWtFJ/eB/YodIbb9iU6d?=
 =?us-ascii?Q?Af53QLOXA/u1vikokwlvQ6/SKCgroR5Zf6otkX2qh65OzroPvjT1ww9eaFaf?=
 =?us-ascii?Q?NKxZ+eYyACeCtGs+d5DCTi3BPbhg1U0Sc+8wbgXg/WUrX0rvMm9YC1JyRngp?=
 =?us-ascii?Q?UvEV3F7KqvAWnaYOFSXVplXq8WUfNoolES54ITPUl0jUCRdv8wktZY689m7Z?=
 =?us-ascii?Q?Xdmu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F24B4BE438DAE46AE2271ECEB66B905@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3e63b1-a388-43c1-2539-08d8a188f200
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 06:08:01.9918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMwwk0v6akvlAzQ+wo+e4cwGMMZbuIpsZjM/i7DnbA3zWrxgtbhXOIB/3cCPepmJ1u4ppRgiJYQmtKaYU1uKeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-12-15 23:21:10, Dmitry Osipenko wrote:
> From: Peter Geis <pgwipeout@gmail.com>
> =20
>  struct tegra_usb_soc_info {
>  	unsigned long flags;
> +	unsigned int txfifothresh;
> +	enum usb_dr_mode dr_mode;
> +};
> +
> +static const struct tegra_usb_soc_info tegra20_ehci_soc_info =3D {
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> +	.dr_mode =3D USB_DR_MODE_HOST,
> +	.txfifothresh =3D 10,
> +};
> +
> +static const struct tegra_usb_soc_info tegra30_ehci_soc_info =3D {
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL
> +	.dr_mode =3D USB_DR_MODE_HOST,
> +	.txfifothresh =3D 16,
>  };
> =20
>  static const struct tegra_usb_soc_info tegra_udc_soc_info =3D {
> -	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA,
> +	.flags =3D CI_HDRC_REQUIRES_ALIGNED_DMA |
> +		 CI_HDRC_OVERRIDE_PHY_CONTROL,
> +	.dr_mode =3D USB_DR_MODE_UNKNOWN,
>  };

What's the usage for this dr_mode? Does these three SoCs only supports
single mode, it usually sets dr_mode at board dts file to indicate
USB role for this board.

> =20
>  static const struct of_device_id tegra_usb_of_match[] =3D {
>  	{
> +		.compatible =3D "nvidia,tegra20-ehci",
> +		.data =3D &tegra20_ehci_soc_info,
> +	}, {
> +		.compatible =3D "nvidia,tegra30-ehci",
> +		.data =3D &tegra30_ehci_soc_info,
> +	}, {
>  		.compatible =3D "nvidia,tegra20-udc",
>  		.data =3D &tegra_udc_soc_info,

Your compatible indicates this controller is single USB role, is it
on purpose?

>  	}, {
> @@ -47,6 +81,181 @@ static const struct of_device_id tegra_usb_of_match[]=
 =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_usb_of_match);
> =20
> +static int tegra_usb_reset_controller(struct device *dev)
> +{
> +	struct reset_control *rst, *rst_utmi;
> +	struct device_node *phy_np;
> +	int err;
> +
> +	rst =3D devm_reset_control_get_shared(dev, "usb");
> +	if (IS_ERR(rst)) {
> +		dev_err(dev, "can't get ehci reset: %pe\n", rst);
> +		return PTR_ERR(rst);
> +	}
> +
> +	phy_np =3D of_parse_phandle(dev->of_node, "nvidia,phy", 0);
> +	if (!phy_np)
> +		return -ENOENT;
> +
> +	/*
> +	 * The 1st USB controller contains some UTMI pad registers that are
> +	 * global for all the controllers on the chip. Those registers are
> +	 * also cleared when reset is asserted to the 1st controller.
> +	 */
> +	rst_utmi =3D of_reset_control_get_shared(phy_np, "utmi-pads");
> +	if (IS_ERR(rst_utmi)) {
> +		dev_warn(dev, "can't get utmi-pads reset from the PHY\n");
> +		dev_warn(dev, "continuing, but please update your DT\n");
> +	} else {
> +		/*
> +		 * PHY driver performs UTMI-pads reset in a case of a
> +		 * non-legacy DT.
> +		 */
> +		reset_control_put(rst_utmi);
> +	}
> +
> +	of_node_put(phy_np);
> +
> +	/* reset control is shared, hence initialize it first */
> +	err =3D reset_control_deassert(rst);
> +	if (err)
> +		return err;
> +
> +	err =3D reset_control_assert(rst);
> +	if (err)
> +		return err;
> +
> +	udelay(1);
> +
> +	err =3D reset_control_deassert(rst);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int tegra_usb_notify_event(struct ci_hdrc *ci, unsigned int event=
)
> +{
> +	struct tegra_usb *usb =3D dev_get_drvdata(ci->dev->parent);
> +	struct ehci_hcd *ehci;
> +
> +	switch (event) {
> +	case CI_HDRC_CONTROLLER_RESET_EVENT:
> +		if (ci->hcd) {
> +			ehci =3D hcd_to_ehci(ci->hcd);
> +			ehci->has_tdi_phy_lpm =3D false;
> +			ehci_writel(ehci, usb->soc->txfifothresh << 16,
> +				    &ehci->regs->txfill_tuning);
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra_usb_internal_port_reset(struct ehci_hcd *ehci,
> +					 u32 __iomem *portsc_reg,
> +					 unsigned long *flags)
> +{
> +	u32 saved_usbintr, temp;
> +	unsigned int i, tries;
> +	int retval =3D 0;
> +
> +	saved_usbintr =3D ehci_readl(ehci, &ehci->regs->intr_enable);
> +	/* disable USB interrupt */
> +	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
> +	spin_unlock_irqrestore(&ehci->lock, *flags);
> +
> +	/*
> +	 * Here we have to do Port Reset at most twice for
> +	 * Port Enable bit to be set.
> +	 */
> +	for (i =3D 0; i < 2; i++) {
> +		temp =3D ehci_readl(ehci, portsc_reg);
> +		temp |=3D PORT_RESET;
> +		ehci_writel(ehci, temp, portsc_reg);
> +		mdelay(10);

Needs accurate delay? How about usleep_range?

> +		temp &=3D ~PORT_RESET;
> +		ehci_writel(ehci, temp, portsc_reg);
> +		mdelay(1);
> +		tries =3D 100;
> +		do {
> +			mdelay(1);
> +			/*
> +			 * Up to this point, Port Enable bit is
> +			 * expected to be set after 2 ms waiting.
> +			 * USB1 usually takes extra 45 ms, for safety,
> +			 * we take 100 ms as timeout.
> +			 */
> +			temp =3D ehci_readl(ehci, portsc_reg);
> +		} while (!(temp & PORT_PE) && tries--);
> +		if (temp & PORT_PE)
> +			break;
> +	}
> +	if (i =3D=3D 2)
> +		retval =3D -ETIMEDOUT;
> +
> +	/*
> +	 * Clear Connect Status Change bit if it's set.
> +	 * We can't clear PORT_PEC. It will also cause PORT_PE to be cleared.
> +	 */
> +	if (temp & PORT_CSC)
> +		ehci_writel(ehci, PORT_CSC, portsc_reg);
> +
> +	/*
> +	 * Write to clear any interrupt status bits that might be set
> +	 * during port reset.
> +	 */
> +	temp =3D ehci_readl(ehci, &ehci->regs->status);
> +	ehci_writel(ehci, temp, &ehci->regs->status);
> +
> +	/* restore original interrupt-enable bits */
> +	spin_lock_irqsave(&ehci->lock, *flags);
> +	ehci_writel(ehci, saved_usbintr, &ehci->regs->intr_enable);
> +
> +	return retval;
> +}
> +
> +static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 w=
Value,
> +				  u16 wIndex, char *buf, u16 wLength,
> +				  bool *done, unsigned long *flags)
> +{
> +	struct tegra_usb *usb =3D dev_get_drvdata(ci->dev->parent);
> +	struct ehci_hcd *ehci =3D hcd_to_ehci(ci->hcd);
> +	u32 __iomem *status_reg;
> +	int retval =3D 0;
> +
> +	status_reg =3D &ehci->regs->port_status[(wIndex & 0xff) - 1];
> +
> +	switch (typeReq) {
> +	case SetPortFeature:
> +		if (wValue !=3D USB_PORT_FEAT_RESET || !usb->needs_double_reset)
> +			break;
> +
> +		/* for USB1 port we need to issue Port Reset twice internally */
> +		retval =3D tegra_usb_internal_port_reset(ehci, status_reg, flags);
> +		*done  =3D true;
> +		break;
> +	}
> +
> +	return retval;
> +}
> +
> +static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
> +{
> +	/*
> +	 * Touching any register which belongs to AHB clock domain will
> +	 * hang CPU if USB controller is put into low power mode because
> +	 * AHB USB clock is gated on Tegra in the LPM.
> +	 *
> +	 * Tegra PHY has a separate register for checking the clock status
> +	 * and usb_phy_set_suspend() takes care of gating/ungating the clocks
> +	 * and restoring the PHY state on Tegra. Hence DEVLC/PORTSC registers
> +	 * shouldn't be touched directly by the CI driver.
> +	 */
> +	usb_phy_set_suspend(ci->usb_phy, enable);
> +}
> +
>  static int tegra_usb_probe(struct platform_device *pdev)
>  {
>  	const struct tegra_usb_soc_info *soc;
> @@ -83,24 +292,49 @@ static int tegra_usb_probe(struct platform_device *p=
dev)
>  		return err;
>  	}
> =20
> +	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
> +		usb->needs_double_reset =3D true;
> +
> +	err =3D tegra_usb_reset_controller(&pdev->dev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to reset controller: %d\n", err);
> +		goto fail_power_off;
> +	}
> +
> +	/*
> +	 * USB controller registers shan't be touched before PHY is

%s/shan't/shouldn't

> +	 * initialized, otherwise CPU will hang because clocks are gated.
> +	 * PHY driver controls gating of internal USB clocks on Tegra.
> +	 */
> +	err =3D usb_phy_init(usb->phy);
> +	if (err)
> +		goto fail_power_off;
> +
> +	platform_set_drvdata(pdev, usb);
> +
>  	/* setup and register ChipIdea HDRC device */
> +	usb->soc =3D soc;
>  	usb->data.name =3D "tegra-usb";
>  	usb->data.flags =3D soc->flags;
>  	usb->data.usb_phy =3D usb->phy;
> +	usb->data.dr_mode =3D soc->dr_mode;
>  	usb->data.capoffset =3D DEF_CAPOFFSET;
> +	usb->data.enter_lpm =3D tegra_usb_enter_lpm;
> +	usb->data.hub_control =3D tegra_ehci_hub_control;
> +	usb->data.notify_event =3D tegra_usb_notify_event;
> =20
>  	usb->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
>  				      pdev->num_resources, &usb->data);
>  	if (IS_ERR(usb->dev)) {
>  		err =3D PTR_ERR(usb->dev);
>  		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
> -		goto fail_power_off;
> +		goto phy_shutdown;
>  	}
> =20
> -	platform_set_drvdata(pdev, usb);
> -
>  	return 0;
> =20
> +phy_shutdown:
> +	usb_phy_shutdown(usb->phy);
>  fail_power_off:
>  	clk_disable_unprepare(usb->clk);
>  	return err;
> @@ -111,6 +345,7 @@ static int tegra_usb_remove(struct platform_device *p=
dev)
>  	struct tegra_usb *usb =3D platform_get_drvdata(pdev);
> =20
>  	ci_hdrc_remove_device(usb->dev);
> +	usb_phy_shutdown(usb->phy);
>  	clk_disable_unprepare(usb->clk);
> =20
>  	return 0;
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index aa40e510b806..3f6c21406dbd 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -195,7 +195,7 @@ static void hw_wait_phy_stable(void)
>  }
> =20
>  /* The PHY enters/leaves low power mode */
> -static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bool enable)
> +static void ci_hdrc_enter_lpm_common(struct ci_hdrc *ci, bool enable)
>  {
>  	enum ci_hw_regs reg =3D ci->hw_bank.lpm ? OP_DEVLC : OP_PORTSC;
>  	bool lpm =3D !!(hw_read(ci, reg, PORTSC_PHCD(ci->hw_bank.lpm)));
> @@ -208,6 +208,11 @@ static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bo=
ol enable)
>  				0);
>  }
> =20
> +static void ci_hdrc_enter_lpm(struct ci_hdrc *ci, bool enable)
> +{
> +	return ci->platdata->enter_lpm(ci, enable);
> +}
> +
>  static int hw_device_init(struct ci_hdrc *ci, void __iomem *base)
>  {
>  	u32 reg;
> @@ -790,6 +795,9 @@ static int ci_get_platdata(struct device *dev,
>  			platdata->pins_device =3D p;
>  	}
> =20
> +	if (!platdata->enter_lpm)
> +		platdata->enter_lpm =3D ci_hdrc_enter_lpm_common;
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 48e4a5ca1835..b8a4c44ab580 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -29,6 +29,12 @@ struct ehci_ci_priv {
>  	bool enabled;
>  };
> =20
> +struct ci_hdrc_dma_aligned_buffer {
> +	void *kmalloc_ptr;
> +	void *old_xfer_buffer;
> +	u8 data[0];
> +};
> +
>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enab=
le)
>  {
>  	struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
> @@ -160,14 +166,14 @@ static int host_start(struct ci_hdrc *ci)
>  		pinctrl_select_state(ci->platdata->pctl,
>  				     ci->platdata->pins_host);
> =20
> +	ci->hcd =3D hcd;
> +
>  	ret =3D usb_add_hcd(hcd, 0, 0);
>  	if (ret) {
>  		goto disable_reg;
>  	} else {
>  		struct usb_otg *otg =3D &ci->otg;
> =20
> -		ci->hcd =3D hcd;
> -

Why this changed?

Peter

>  		if (ci_otg_is_fsm_mode(ci)) {
>  			otg->host =3D &hcd->self;
>  			hcd->self.otg_port =3D 1;
> @@ -237,6 +243,7 @@ static int ci_ehci_hub_control(
>  	u32		temp;
>  	unsigned long	flags;
>  	int		retval =3D 0;
> +	bool		done =3D false;
>  	struct device *dev =3D hcd->self.controller;
>  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> =20
> @@ -244,6 +251,13 @@ static int ci_ehci_hub_control(
> =20
>  	spin_lock_irqsave(&ehci->lock, flags);
> =20
> +	if (ci->platdata->hub_control) {
> +		retval =3D ci->platdata->hub_control(ci, typeReq, wValue, wIndex,
> +						   buf, wLength, &done, &flags);
> +		if (done)
> +			goto done;
> +	}
> +
>  	if (typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_PORT_FEAT_SUSPEN=
D) {
>  		temp =3D ehci_readl(ehci, status_reg);
>  		if ((temp & PORT_PE) =3D=3D 0 || (temp & PORT_RESET) !=3D 0) {
> @@ -349,6 +363,86 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
>  	return 0;
>  }
> =20
> +static void ci_hdrc_free_dma_aligned_buffer(struct urb *urb)
> +{
> +	struct ci_hdrc_dma_aligned_buffer *temp;
> +	size_t length;
> +
> +	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
> +		return;
> +
> +	temp =3D container_of(urb->transfer_buffer,
> +			    struct ci_hdrc_dma_aligned_buffer, data);
> +
> +	if (usb_urb_dir_in(urb)) {
> +		if (usb_pipeisoc(urb->pipe))
> +			length =3D urb->transfer_buffer_length;
> +		else
> +			length =3D urb->actual_length;
> +
> +		memcpy(temp->old_xfer_buffer, temp->data, length);
> +	}
> +	urb->transfer_buffer =3D temp->old_xfer_buffer;
> +	kfree(temp->kmalloc_ptr);
> +
> +	urb->transfer_flags &=3D ~URB_ALIGNED_TEMP_BUFFER;
> +}
> +
> +static int ci_hdrc_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_f=
lags)
> +{
> +	struct ci_hdrc_dma_aligned_buffer *temp, *kmalloc_ptr;
> +	const unsigned int ci_hdrc_usb_dma_align =3D 32;
> +	size_t kmalloc_size;
> +
> +	if (urb->num_sgs || urb->sg || urb->transfer_buffer_length =3D=3D 0 ||
> +	    !((uintptr_t)urb->transfer_buffer & (ci_hdrc_usb_dma_align - 1)))
> +		return 0;
> +
> +	/* Allocate a buffer with enough padding for alignment */
> +	kmalloc_size =3D urb->transfer_buffer_length +
> +		       sizeof(struct ci_hdrc_dma_aligned_buffer) +
> +		       ci_hdrc_usb_dma_align - 1;
> +
> +	kmalloc_ptr =3D kmalloc(kmalloc_size, mem_flags);
> +	if (!kmalloc_ptr)
> +		return -ENOMEM;
> +
> +	/* Position our struct dma_aligned_buffer such that data is aligned */
> +	temp =3D PTR_ALIGN(kmalloc_ptr + 1, ci_hdrc_usb_dma_align) - 1;
> +	temp->kmalloc_ptr =3D kmalloc_ptr;
> +	temp->old_xfer_buffer =3D urb->transfer_buffer;
> +	if (usb_urb_dir_out(urb))
> +		memcpy(temp->data, urb->transfer_buffer,
> +		       urb->transfer_buffer_length);
> +	urb->transfer_buffer =3D temp->data;
> +
> +	urb->transfer_flags |=3D URB_ALIGNED_TEMP_BUFFER;
> +
> +	return 0;
> +}
> +
> +static int ci_hdrc_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> +				   gfp_t mem_flags)
> +{
> +	int ret;
> +
> +	ret =3D ci_hdrc_alloc_dma_aligned_buffer(urb, mem_flags);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
> +	if (ret)
> +		ci_hdrc_free_dma_aligned_buffer(urb);
> +
> +	return ret;
> +}
> +
> +static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *u=
rb)
> +{
> +	usb_hcd_unmap_urb_for_dma(hcd, urb);
> +	ci_hdrc_free_dma_aligned_buffer(urb);
> +}
> +
>  int ci_hdrc_host_init(struct ci_hdrc *ci)
>  {
>  	struct ci_role_driver *rdrv;
> @@ -366,6 +460,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
>  	rdrv->name	=3D "host";
>  	ci->roles[CI_ROLE_HOST] =3D rdrv;
> =20
> +	if (ci->platdata->flags & CI_HDRC_REQUIRES_ALIGNED_DMA) {
> +		ci_ehci_hc_driver.map_urb_for_dma =3D ci_hdrc_map_urb_for_dma;
> +		ci_ehci_hc_driver.unmap_urb_for_dma =3D ci_hdrc_unmap_urb_for_dma;
> +	}
> +
>  	return 0;
>  }
> =20
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index 025b41687ce9..edf3342507f1 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -88,6 +88,12 @@ struct ci_hdrc_platform_data {
>  	struct pinctrl_state *pins_default;
>  	struct pinctrl_state *pins_host;
>  	struct pinctrl_state *pins_device;
> +
> +	/* platform-specific hooks */
> +	int (*hub_control)(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
> +			   u16 wIndex, char *buf, u16 wLength,
> +			   bool *done, unsigned long *flags);
> +	void (*enter_lpm)(struct ci_hdrc *ci, bool enable);
>  };
> =20
>  /* Default offset of capability registers */
> --=20
> 2.29.2
>=20

--=20

Thanks,
Peter Chen=
