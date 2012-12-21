From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv4 8/8] gpu: host1x: Register DRM dummy device
Date: Fri, 21 Dec 2012 15:09:35 +0100
Message-ID: <20121221140935.GB9729@avionic-0098.adnet.avionic-design.de>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
 <1356089964-5265-9-git-send-email-tbergstrom@nvidia.com>
 <1356098031.1490.111.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1356098031.1490.111.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 21, 2012 at 02:53:51PM +0100, Lucas Stach wrote:
> Am Freitag, den 21.12.2012, 13:39 +0200 schrieb Terje Bergstrom:
[...]
> > +void host1x_unregister_drm_device(struct host1x *host1x)
> > +{
> > +	if (host1x->drm_device)
> > +		platform_device_unregister(host1x->drm_device);
> > +}
> > +EXPORT_SYMBOL(host1x_unregister_drm_device);
> > +
> > +struct platform_device *host1x_drm_device(struct platform_device *pdev)
> > +{
> > +	struct host1x *host = platform_get_drvdata(pdev);
> > +	return host->drm_device;
> > +}
> > +EXPORT_SYMBOL(host1x_drm_device);
> This should be called host1x_get_drm_device

Or maybe even host1x_drm_get_device() to make it more obvious that it
doesn't return a struct drm_device. Also I think it would be better to
make it take a struct device * and return a struct device * instead.
Users of the API will probably call this like so:

	struct device *dummy = host1x_drm_get_device(pdev->dev.parent);
	struct drm_device *drm = dev_get_drvdata(dummy);

So we save ourselves some needless up-casting.

Thierry

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ1G2fAAoJEN0jrNd/PrOh8goP/3/mlTk7KUz2hI8V5KTQrrlu
v0HpANG7CrXsW9Js9fVFL4mfaKK3+x/FycRvbgZecBBYPbuSyT3LdPzsnhVZAf1Y
C6hXFf66cxYLQHihAPTLqIcajYq8h4RjvtL5GdthxB6HhCAlWrv/tDdhnUZJbfD6
B1mwrgJUJga8GHvfjmolPt+xHeRxCmIKwUjNlBnki92NnIo3pyX7SILNny2UXAPi
1/kMilGOCnnKO8Q/LhFe2tSVZ1YgNlZlLOCNjuGo5E4RJHsskn4c3fnu41xxYBRp
Zar1kwM8SXBVWjvCov+YbUwld8P5KhAif7fkfklzVvi1M8ylLHodApplc+CEyglW
xVxSDzyTG0txQNRuivtXkdTD9DEUzkfkTx7TRI4txDhCfW3mQUF+dtLqwe3a+lGr
VfEQCziTjK3uN9U7MapOB0M+EHVEOgBV0R/4H6gavZ5UvDSks4IaSMwAIicpLojp
/DFgXqCKL2TyhcRT1uLbfBrJ6LAX/33haNfnsU3VYyKvo1EF5TJbdzzQ1uJE2vvi
cM/x1oWqaNt32divgGHv13ctaV3eKLdG4VlnnZpcZ238JGniOis3P4l1mRRi6Xjp
Q8oyK5uPdX6w4zzgOXzsAYlEsK3OIUN95laPf+7zZhYigQSooK/UEmj8ifLR5Lkq
izZWjBq97PBIg/kkarC+
=aQmT
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
