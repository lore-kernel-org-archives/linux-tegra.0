From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 6/8] gpu: host1x: Remove second host1x driver
Date: Mon, 4 Feb 2013 12:23:48 +0100
Message-ID: <20130204112348.GB595@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-7-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358250244-9678-7-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 15, 2013 at 01:44:02PM +0200, Terje Bergstrom wrote:
[...]
> +void host1x_set_drm_data(struct platform_device *pdev, void *data)
> +{
> +	struct host1x *host1x = platform_get_drvdata(pdev);
> +	host1x->drm_data = data;
> +}
> +
> +void *host1x_get_drm_data(struct platform_device *pdev)
> +{
> +	struct host1x *host1x = platform_get_drvdata(pdev);
> +	return host1x->drm_data;
> +}

Passing around struct device * should be enough and avoids the need for
the explicit cast to struct platform_device.

It is a bit unfortunate that we have now have two structures called
host1x, but I think we can live with it for now. We can clean that up
once the code has been merged.

Thierry

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRD5pEAAoJEN0jrNd/PrOhD1gP/08Yf8YdNq2HNCTORy/oVRt7
yZpxzmEq6gtYBzQAz9gDLQPEEAxfBveZSYjgbb/SSMDIhd14IH7xbFlpz0xi4aCk
UsrrxMt1CKCsUZ22mMXt7IByNVwINmUfQ7qlK2I1Nk165zsOreb5cWcoH40oMwf8
IyylVpp/smtym8ctDjmx9S/BXFUCuChyR1dagD1y52OV4947ma/nT5HjoeE1aQE4
bIngbnwZdYXxiMX6lijDC2lmGFdAFe8sSVuUUlgdXFxRllxDOKDun/VaotoU7aps
HGDW/ib9dQG2o14hWYSmcM8WPZlBLu8lnXnhiv+g2iBrSvcggLXa1p+he5qh2A6T
k0DNztD0cHZ1CEo1+vDkizEJj4HB3HAnPuxwcRODJOqruEyV9yCF4waaiQLxBynV
9NMvqp5Ef3tif5sWkfjM39eUq2dAMwERmkUuY2ie8VsvmzaRqQ6dqEtEV+DIfGrA
YBJAx5HJEMr/4nf1E6GNghXimy7UfWfKQ443beLdMdlJa7oU0GJ8/XG00DqC+4Oa
i0S8ztNC2uVa3RxDIJNdGwxp+7AlVD6WNDZayq9y0JHZdZy5Dx/jZDH5OhfeWb/J
+LrmhFvhEHzblEcX4j2+H6KDN73dbLKUb1Y4DxU+Rhg1NZgkVBpRhmJ53SSZ+3Ne
KYsSgmr7DTsVDMMbi9Gs
=vRt2
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
