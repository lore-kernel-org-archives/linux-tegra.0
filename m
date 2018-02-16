From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v3 6/7] arm64: tegra: Add Tegra194 chip device tree
Date: Fri, 16 Feb 2018 13:33:53 +0100
Message-ID: <CAOFm3uHvbut7w5eBuggNg0NnW-UvBsRjifsJxGuj3L34vCjEHA@mail.gmail.com>
References: <20180215145206.24775-1-mperttunen@nvidia.com> <20180215145206.24775-7-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215145206.24775-7-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mikko,

On Thu, Feb 15, 2018 at 3:52 PM, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Add the chip-level device tree, including binding headers, for the
> NVIDIA Tegra194 "Xavier" system-on-chip. Only a small subset of devices
> are initially available, enough to boot to UART console.
>
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> Notes:
>     v3:
>     - added hypervisor-related apertures to GIC node
>     - removed GPL boilerplate in favor of SPDX and harmonized
>       copyright headers

Thanks for this boilerplate removal! but see a few nits below.

<snip>

> --- /dev/null
> +++ b/include/dt-bindings/clock/tegra194-clock.h
> @@ -0,0 +1,653 @@
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */

The proper style should be this for a .h header on the first line per [1]

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
> + *
> + */

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst

<snip>

> --- /dev/null
> +++ b/include/dt-bindings/gpio/tegra194-gpio.h
> @@ -0,0 +1,64 @@
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +

<snip>

Same as above

> --- /dev/null
> +++ b/include/dt-bindings/power/tegra194-powergate.h
> @@ -0,0 +1,38 @@
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */

<snip>

Same as above

> --- /dev/null
> +++ b/include/dt-bindings/reset/tegra194-reset.h
> @@ -0,0 +1,155 @@
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION. All rights reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */

<snip>

Same as above
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
