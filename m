From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: sram: add documentation for
 reserved-only flag
Date: Tue, 12 May 2020 13:45:28 -0600
Message-ID: <52f099e4-5c03-2141-f049-cd3adeb04c5b@wwwdotorg.org>
References: <20200512144803.24344-1-ykaukab@suse.de>
 <20200512144803.24344-2-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200512144803.24344-2-ykaukab-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/12/20 8:48 AM, Mian Yousaf Kaukab wrote:
> Add documentation for the new optional flag added for SRAM driver.

> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml

> +  reserved-only:
> +    description:
> +      The flag indicating, that only SRAM reserved regions have to be remapped.
> +      remapping type is selected depending upon no-memory-wc as usual.
> +    type: boolean

This feels a bit like a SW flag rather than a HW description, so I'm not
sure it's appropriate to put it into DT.

Are there any cases where the SW should map all of the SRAM, i.e. where
we wouldn't expect to set reserved-only? I'd expect reserved-only to be
the default, and perhaps only, mode of operation for the SRAM driver. If
we can't do that because some SW currently expects to be able to map
arbitrary portions of the SRAM, shouldn't that SW be fixed to tell the
SRAM driver which parts it's using, hence still allowing the driver to
only map in-use portions?
