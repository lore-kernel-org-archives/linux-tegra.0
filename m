From: "Hans Verkuil (hansverk)" <hansverk@cisco.com>
Subject: Re: [PATCH 4/4] media: tegra-cec: fix possible object reference leak
Date: Mon, 11 Feb 2019 10:53:58 +0000
Message-ID: <acfbc23ff09e48db9c5cffebee87a3a4@XCH-ALN-012.cisco.com>
References: <HK0PR02MB363490E3F738F20868E8BD9DB26A0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <yellowriver2010@hotmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 09/02/2019 03:55, Wen Yang wrote:=0A=
> The call to of_parse_phandle() returns a node pointer with refcount=0A=
> incremented thus it must be explicitly decremented here after the last=0A=
> usage.=0A=
> The of_find_device_by_node() takes a reference to the underlying device=
=0A=
> structure, we also should release that reference.=0A=
> This patch fixes those two issues.=0A=
> =0A=
> Fixes: 9d2d60687c9a ("media: tegra-cec: add Tegra HDMI CEC driver")=0A=
> Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>=0A=
> ---=0A=
>  drivers/media/platform/tegra-cec/tegra_cec.c | 20 ++++++++++++++++----=
=0A=
>  1 file changed, 16 insertions(+), 4 deletions(-)=0A=
> =0A=
> diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media=
/platform/tegra-cec/tegra_cec.c=0A=
> index aba488c..b6c28c8 100644=0A=
> --- a/drivers/media/platform/tegra-cec/tegra_cec.c=0A=
> +++ b/drivers/media/platform/tegra-cec/tegra_cec.c=0A=
> @@ -340,19 +340,24 @@ static int tegra_cec_probe(struct platform_device *=
pdev)=0A=
>  		return -ENODEV;=0A=
>  	}=0A=
>  	hdmi_dev =3D of_find_device_by_node(np);=0A=
> -	if (hdmi_dev =3D=3D NULL)=0A=
> +	if (hdmi_dev =3D=3D NULL) {=0A=
> +		of_node_put(np);=0A=
>  		return -EPROBE_DEFER;=0A=
> +	}=0A=
> +	of_node_put(np);=0A=
=0A=
You can move this line to just after the 'hdmi_dev =3D of_find_device_by_no=
de(np);'=0A=
line.=0A=
=0A=
>  =0A=
>  	cec =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra_cec), GFP_KERNEL);=
=0A=
> -=0A=
> -	if (!cec)=0A=
> +	if (!cec) {=0A=
> +		put_device(&hdmi_dev->dev);=0A=
=0A=
You don't need to do this. In fact, the put_device can be done before the=
=0A=
cec =3D devm_kzalloc line.=0A=
=0A=
There is no need for this driver to keep a reference to the hdmi device, th=
e=0A=
device pointer is only used as a key in the notifier list. This cec driver=
=0A=
will never access the hdmi device.=0A=
=0A=
There are several other CEC drivers that have this same mistake and that=0A=
need to put the hdmi_dev device.=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
>  		return -ENOMEM;=0A=
> +	}=0A=
>  =0A=
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A=
>  =0A=
>  	if (!res) {=0A=
>  		dev_err(&pdev->dev,=0A=
>  			"Unable to allocate resources for device\n");=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		return -EBUSY;=0A=
>  	}=0A=
>  =0A=
> @@ -360,19 +365,23 @@ static int tegra_cec_probe(struct platform_device *=
pdev)=0A=
>  		pdev->name)) {=0A=
>  		dev_err(&pdev->dev,=0A=
>  			"Unable to request mem region for device\n");=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		return -EBUSY;=0A=
>  	}=0A=
>  =0A=
>  	cec->tegra_cec_irq =3D platform_get_irq(pdev, 0);=0A=
>  =0A=
> -	if (cec->tegra_cec_irq <=3D 0)=0A=
> +	if (cec->tegra_cec_irq <=3D 0) {=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		return -EBUSY;=0A=
> +	}=0A=
>  =0A=
>  	cec->cec_base =3D devm_ioremap_nocache(&pdev->dev, res->start,=0A=
>  					     resource_size(res));=0A=
>  =0A=
>  	if (!cec->cec_base) {=0A=
>  		dev_err(&pdev->dev, "Unable to grab IOs for device\n");=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		return -EBUSY;=0A=
>  	}=0A=
>  =0A=
> @@ -380,6 +389,7 @@ static int tegra_cec_probe(struct platform_device *pd=
ev)=0A=
>  =0A=
>  	if (IS_ERR_OR_NULL(cec->clk)) {=0A=
>  		dev_err(&pdev->dev, "Can't get clock for CEC\n");=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		return -ENOENT;=0A=
>  	}=0A=
>  =0A=
> @@ -397,12 +407,14 @@ static int tegra_cec_probe(struct platform_device *=
pdev)=0A=
>  	if (ret) {=0A=
>  		dev_err(&pdev->dev,=0A=
>  			"Unable to request interrupt for device\n");=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		goto clk_error;=0A=
>  	}=0A=
>  =0A=
>  	cec->notifier =3D cec_notifier_get(&hdmi_dev->dev);=0A=
>  	if (!cec->notifier) {=0A=
>  		ret =3D -ENOMEM;=0A=
> +		put_device(&hdmi_dev->dev);=0A=
>  		goto clk_error;=0A=
>  	}=0A=
>  =0A=
> =0A=
=0A=
