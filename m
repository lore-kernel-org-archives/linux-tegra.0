From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 3/4] tegra-cec: add Tegra HDMI CEC driver
Date: Thu, 19 Oct 2017 11:37:00 +0200
Message-ID: <20171019093700.GF9005@ulmo>
References: <20170911122952.33980-1-hverkuil@xs4all.nl>
 <20170911122952.33980-4-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911122952.33980-4-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 11, 2017 at 02:29:51PM +0200, Hans Verkuil wrote:
[...]
> diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/platform/tegra-cec/tegra_cec.c
[...]
> +static int tegra_cec_probe(struct platform_device *pdev)
> +{
> +	struct platform_device *hdmi_dev;
> +	struct device_node *np;
> +	struct tegra_cec *cec;
> +	struct resource *res;
> +	int ret = 0;
> +
> +	np = of_parse_phandle(pdev->dev.of_node, "hdmi-phandle", 0);
> +
> +	if (!np) {
> +		dev_err(&pdev->dev, "Failed to find hdmi node in device tree\n");
> +		return -ENODEV;
> +	}
> +	hdmi_dev = of_find_device_by_node(np);
> +	if (hdmi_dev == NULL)
> +		return -EPROBE_DEFER;

This seems a little awkward. Why exactly do we need to defer probe here?
It seems to me like cec_notifier_get() should be able to deal with HDMI
appearing at a later point.

> +
> +	cec = devm_kzalloc(&pdev->dev, sizeof(struct tegra_cec), GFP_KERNEL);
> +
> +	if (!cec)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	if (!res) {
> +		dev_err(&pdev->dev,
> +			"Unable to allocate resources for device\n");
> +		ret = -EBUSY;
> +		goto cec_error;
> +	}
> +
> +	if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
> +		pdev->name)) {
> +		dev_err(&pdev->dev,
> +			"Unable to request mem region for device\n");
> +		ret = -EBUSY;
> +		goto cec_error;
> +	}
> +
> +	cec->tegra_cec_irq = platform_get_irq(pdev, 0);
> +
> +	if (cec->tegra_cec_irq <= 0) {
> +		ret = -EBUSY;
> +		goto cec_error;
> +	}
> +
> +	cec->cec_base = devm_ioremap_nocache(&pdev->dev, res->start,
> +		resource_size(res));
> +
> +	if (!cec->cec_base) {
> +		dev_err(&pdev->dev, "Unable to grab IOs for device\n");
> +		ret = -EBUSY;
> +		goto cec_error;
> +	}
> +
> +	cec->clk = devm_clk_get(&pdev->dev, "cec");
> +
> +	if (IS_ERR_OR_NULL(cec->clk)) {
> +		dev_err(&pdev->dev, "Can't get clock for CEC\n");
> +		ret = -ENOENT;
> +		goto clk_error;
> +	}
> +
> +	clk_prepare_enable(cec->clk);
> +
> +	/* set context info. */
> +	cec->dev = &pdev->dev;
> +
> +	platform_set_drvdata(pdev, cec);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, cec->tegra_cec_irq,
> +		tegra_cec_irq_handler, tegra_cec_irq_thread_handler,
> +		0, "cec_irq", &pdev->dev);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"Unable to request interrupt for device\n");
> +		goto cec_error;
> +	}
> +
> +	cec->notifier = cec_notifier_get(&hdmi_dev->dev);
> +	if (!cec->notifier) {
> +		ret = -ENOMEM;
> +		goto cec_error;
> +	}

Ah... I see why we need the HDMI device right away. This seems a little
brittle to me, for two reasons: what if the HDMI controller goes away?
Will we be hanging on to a stale device? I mean, the device doesn't
necessarily have to go away, but what's the effect on CEC if the driver
unbinds from the HDMI controller?

Secondly, this creates a circular dependency. It seems to me like it'd
actually be simpler if the CEC controller was a "service provider" that
HDMI could use and "request/release" as appropriate.

In that case, the DT would look somewhat like this:

	hdmi@... {
		cec = <&cec>;
	};

	cec: cec@... {
		...
	};

And then the HDMI driver could do something like:

	cec = cec_get(&pdev->dev);
	/* register notifier, ... */

That way the dependency becomes unidirectional and it seems to me like
that would allow interactions between HDMI and CEC would become simpler
overall.

Anyway, this is something that could always be changed after the fact
(except maybe for some bits needed for backwards-compatibility with old
device trees), and this seems to work well enough as it is, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnocjoACgkQ3SOs138+
s6FmfA/+Pokhc2uBRCGapvBS1ySbQNUCGLrfmpFLMxzWoiLjlzRRa6n4a9cNH/be
V0zMfIsqfsrKkoQV5EY4uTWIWpLpnBf6lGEKxEP58X/pNMY4wc38gFi/P58HDAXe
vsxzqvAmUSuBpssMZnTaepO+ZjS8E5JaqjOoig+lxSbs7e78y6uVzY4sfrzQ0m1m
7Ql7Vtq6QrsmFn4RDJKPEEx7spCZ+PWqQlZLs65bN8L7ASk3LQu4/aetAdG6NRWZ
zFiIJRbO7JsaosoHCES/yeM2pCZatsEhH7Txe/k6rOW3v6cGs3QZoj9NeDmWqcfy
2z21d/3PiwBd7Iby7CDmy3QU4ORn0FIE/GZk/8QJbLZ/v92MH/lBBkOw5lpbCr4e
aZ8MvKT497CEhoOarsO15xzoYQ+HCcua1Ms7KkFqgb/JobU4GunMXP5RxRwWeMDg
mLaa9hPkuScd3pis6XVOGcs3KZz6W/TLgg2T+q+jL7sgfePk85OIxiqEE9Qy6i3p
etl200CY/zbyWOjpsOaXtooOg/lK3MQXHmKgnvDrNlqlLjc3vzNwdP3eQz0jg0oO
90rs07N12C7YcRm/CmmGhIhyVwahtiflhaK+javXgYE6NWjLjx1Ecqftt3YT6UaB
IdM7tmDp08ajJlv0xO/zGYUaLbM3fdbjWWLxe8P9l14qH0UbQr8=
=O17f
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
