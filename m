From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/5] core: add support for secure boot
Date: Thu, 21 Jan 2016 12:09:21 +0000
Message-ID: <CACvgo50P8JQ5EkCEMmnGQGO4jMsc0O4cRB1QO04V0KQS7Y8AYA@mail.gmail.com>
References: <1453097447-12152-1-git-send-email-acourbot@nvidia.com>
	<1453097447-12152-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453097447-12152-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Alexandre,

On 18 January 2016 at 06:10, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

[snip]
> +static const char *
> +managed_falcons_names[] = {
> +       [NVKM_SECBOOT_FALCON_PMU] = "PMU",
> +       [NVKM_SECBOOT_FALCON_RESERVED] = "<invalid>",
"<reserved>" perhaps ? we already have one invalid below.

> +       [NVKM_SECBOOT_FALCON_FECS] = "FECS",
> +       [NVKM_SECBOOT_FALCON_GPCCS] = "GPCCS",
> +       [NVKM_SECBOOT_FALCON_END] = "<invalid>",
> +};
> +

[snip]
> +int
> +nvkm_secboot_ctor(const struct nvkm_secboot_func *func,
> +                 struct nvkm_device *device, int index,
> +                 struct nvkm_secboot *sb)
> +{
> +       unsigned long fid;
> +
> +       nvkm_subdev_ctor(&nvkm_secboot, device, index, 0, &sb->subdev);
> +       sb->func = func;
> +
Move these two after the switch statement ?

> +       /* setup the performing falcon's base address and masks */
> +       switch (func->boot_falcon) {
> +       case NVKM_SECBOOT_FALCON_PMU:
> +               sb->base = 0x10a000;
> +               sb->irq_mask = 0x1000000;
> +               sb->enable_mask = 0x2000;
> +               break;
> +       default:
> +               nvdev_error(device, "invalid secure boot falcon\n");
> +               return -EINVAL;
> +       };
> +
> +       nvkm_info(&sb->subdev, "securely managed falcons:\n");
> +       for_each_set_bit(fid, &sb->func->managed_falcons,
> +                        NVKM_SECBOOT_FALCON_END)
> +               nvkm_info(&sb->subdev, "- %s\n", managed_falcons_names[fid]);
> +
> +       return 0;
> +}

Cheers,
Emil
