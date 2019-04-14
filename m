From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 02/12] drm/tegra: rgb: add missing of_node_put after
 of_device_is_available
Date: Sun, 14 Apr 2019 17:01:23 +0200
Message-ID: <564652ed-d398-33ae-0f05-088d1235bf9f@web.de>
References: <1550928043-14889-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550928043-14889-3-git-send-email-Julia.Lawall@lip6.fr>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mukesh Ojha <mojha@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

> @@ -221,8 +221,10 @@  int tegra_dc_rgb_probe(struct tegra_dc *
>  	int err;
>
>  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>
>  	rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
>  	if (!rgb)

How do you think about to move this function call to an additional jump ta=
rget
for the desired exception handling?

Regards,
Markus
