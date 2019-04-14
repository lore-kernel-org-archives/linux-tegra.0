From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 04/12] phy: tegra: add missing of_node_put after
 of_device_is_available
Date: Sun, 14 Apr 2019 17:42:15 +0200
Message-ID: <00e76c9f-a551-ee83-9cb3-b2c3b8523c5c@web.de>
References: <1550928043-14889-5-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550928043-14889-5-git-send-email-Julia.Lawall@lip6.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mukesh Ojha <mojha@codeaurora.org>, linux-tegra@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

> @@ -260,8 +260,10 @@  tegra_xusb_pad_create(struct tegra_xusb_
>  	int err;
>
>  	np =3D tegra_xusb_find_pad_node(padctl, soc->name);
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>  		return NULL;
> +	}
>
>  	pad =3D soc->ops->probe(padctl, soc, np);
>  	if (IS_ERR(pad)) {

How do you think about to move this function call to an additional jump ta=
rget
for the desired exception handling?

Regards,
Markus
