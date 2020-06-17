From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date: Wed, 17 Jun 2020 07:24:16 +0300
Message-ID: <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-26-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

12.06.2020 17:18, Thierry Reding пишет:
...
> +patternProperties:
> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> +  "^gpios(-[a-zA-Z0-9-]+)?$":
> +    type: object
> +    required:
> +      - gpio-hog

There are two problems here:

1. This naming limitation didn't exist before this patch, so it's not a
part of the conversion.

2. GPIO core uses the node's name for the hog's name. Hence by imposing
the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
which doesn't make much sense to me.

Please explain the rationale of this change.
