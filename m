From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC,v2,8/8] drm: tegra: Add gr2d device
Date: Thu, 29 Nov 2012 15:37:04 +0800
Message-ID: <50B710A0.4080907@gmail.com>
References: <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353935954-13763-9-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/26/2012 09:19 PM, Terje Bergstr=C3=B6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Add client driver for 2D device.
>=20
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
>=20
[...]
> +
> +static int
> +tegra_drm_ioctl_open_channel(struct drm_device *drm, void *data,
> +			 struct drm_file *file_priv)
> +{
> +	struct tegra_drm_open_channel_args *args =3D data;
> +	struct tegra_drm_client *client;
> +	struct tegra_drm_context *context;
> +	struct tegra_drm_fpriv *fpriv =3D tegra_drm_fpriv(file_priv);
> +	int err =3D 0;
> +
> +	dev_dbg(drm->dev, "> %s(fpriv=3D%p, class=3D%x)\n", __func__,
> +			fpriv, args->class);
> +
> +	context =3D kzalloc(sizeof(*context), GFP_KERNEL);
> +	if (!context) {
> +		err =3D -ENOMEM;
> +		goto out;

Change to "return -ENOMEM". Otherwise the NULL "context" will be kfree.

> +	}
> +
> +	list_for_each_entry(client, &tegra_drm_subdrv_list, list) {
> +		if (client->class =3D=3D args->class) {
> +			dev_dbg(drm->dev, "opening client %x\n", args->class);
> +			context->client =3D client;
> +			err =3D client->ops->open_channel(client, context);
> +			if (err)
> +				goto out;
> +
> +			dev_dbg(drm->dev, "context %p\n", context);
> +			list_add(&context->list, &fpriv->contexts);
> +			args->context =3D context;
> +			goto out;
> +		}
> +	}
> +	err =3D -ENODEV;
> +
> +out:
> +	if (err)
> +		kfree(context);
> +
> +	dev_dbg(drm->dev, "< %s() =3D %d\n", __func__, err);
> +	return err;
> +}
> +
> +static int
> +tegra_drm_ioctl_close_channel(struct drm_device *drm, void *data,
> +			 struct drm_file *file_priv)
> +{
> +	struct tegra_drm_open_channel_args *args =3D data;
> +	struct tegra_drm_context *context;
> +	struct tegra_drm_fpriv *fpriv =3D tegra_drm_fpriv(file_priv);
> +	int err =3D 0;
> +
> +	dev_dbg(drm->dev, "> %s(fpriv=3D%p)\n", __func__, fpriv);
> +	list_for_each_entry(context, &fpriv->contexts, list) {

Consider "list_for_each_entry_safe" cause you remove list members durin=
g
the loop.

> +		if (context =3D=3D args->context) {
> +			context->client->ops->close_channel(context);
> +			list_del(&context->list);
> +			kfree(context);
> +			goto out;
> +		}
> +	}
> +	err =3D -EINVAL;
> +
> +out:
> +	dev_dbg(drm->dev, "< %s() =3D %d\n", __func__, err);
> +	return err;
> +}
> +
[...]
> +
> +static int gr2d_submit(struct tegra_drm_context *context,
> +		struct tegra_drm_submit_args *args)

I'm still in the middle of code reading of job submit, so I'll get you
back if I find something.

[...]
> +
> +static struct of_device_id gr2d_match[] __devinitdata =3D {
> +	{ .compatible =3D "nvidia,tegra20-gr2d", },
> +	{ .compatible =3D "nvidia,tegra30-gr2d", },

Just as swarren mentioned, you'd better place "nvidia,tegra30-gr2d" in
the front of "nvidia,tegra20-gr2d"...

[...]
> +
> +#define DRM_TEGRA_GEM_CREATE		0x00
> +
> +#define DRM_IOCTL_TEGRA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
> +		DRM_TEGRA_GEM_CREATE, struct tegra_gem_create)
> +

Just a very minor suggestion: could you put them at the end of this
file? I mean, stay with other IOCTLs like SYNCPT_READ, SYNCPT_WAIT...

[...]
> +
> +#define DRM_TEGRA_DRM_SYNCPT_READ 0x01
> +#define DRM_TEGRA_DRM_SYNCPT_INCR 0x02
> +#define DRM_TEGRA_DRM_SYNCPT_WAIT 0x03
> +#define DRM_TEGRA_DRM_OPEN_CHANNEL 0x04
> +#define DRM_TEGRA_DRM_CLOSE_CHANNEL 0x05
> +#define DRM_TEGRA_DRM_GET_SYNCPOINTS 0x06
> +#define DRM_TEGRA_DRM_GET_MODMUTEXES 0x07
> +#define DRM_TEGRA_DRM_SUBMIT 0x08
> +
> +#define DRM_IOCTL_TEGRA_DRM_SYNCPT_READ DRM_IOWR(DRM_COMMAND_BASE + =
DRM_TEGRA_DRM_SYNCPT_READ, struct tegra_drm_syncpt_read_args)
> +#define DRM_IOCTL_TEGRA_DRM_SYNCPT_INCR DRM_IOWR(DRM_COMMAND_BASE + =
DRM_TEGRA_DRM_SYNCPT_INCR, struct tegra_drm_syncpt_incr_args)
> +#define DRM_IOCTL_TEGRA_DRM_SYNCPT_WAIT DRM_IOWR(DRM_COMMAND_BASE + =
DRM_TEGRA_DRM_SYNCPT_WAIT, struct tegra_drm_syncpt_wait_args)
> +#define DRM_IOCTL_TEGRA_DRM_OPEN_CHANNEL DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_TEGRA_DRM_OPEN_CHANNEL, struct tegra_drm_open_channel_args)
> +#define DRM_IOCTL_TEGRA_DRM_CLOSE_CHANNEL DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_TEGRA_DRM_CLOSE_CHANNEL, struct tegra_drm_open_channel_args)
> +#define DRM_IOCTL_TEGRA_DRM_GET_SYNCPOINTS DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_TEGRA_DRM_GET_SYNCPOINTS, struct tegra_drm_get_channel_param_arg=
s)
> +#define DRM_IOCTL_TEGRA_DRM_GET_MODMUTEXES DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_TEGRA_DRM_GET_MODMUTEXES, struct tegra_drm_get_channel_param_arg=
s)
> +#define DRM_IOCTL_TEGRA_DRM_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_T=
EGRA_DRM_SUBMIT, struct tegra_drm_submit_args)
> +
> +#endif
>=20
