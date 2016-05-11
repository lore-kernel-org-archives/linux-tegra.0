From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] drivers/of: Fix depth when unflattening devicetree
Date: Wed, 11 May 2016 10:37:33 -0500
Message-ID: <CAL_JsqJN1M_1GZGJHMcymDbDokJQtCqUsbWQ_zqjDvR2SyD_Dw@mail.gmail.com>
References: <1462920194-28803-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462920194-28803-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 10, 2016 at 5:43 PM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> When the implementation for unflatten_dt_node() changed from being
> recursive to being non-recursive, it had a side effect of increasing the
> depth passed to fdt_next_node() by 1. This is fine most of the time, but
> it seems that when the end of the dtb is being parsed, it will cause the
> FDT_END condition in fdt_next_node() to return a different value
> (returning nextoffset instead of -FDT_ERR_NOTFOUND). This ends up passing
> an FDT_ERR_TRUNCATED error back to the unflatten_dt_node() which then
> sees that and complains "Error -8 processing FDT" causing boot to fail.
>
> This patch simply avoids incrementing depth and uses modified accesses
> for local array indices so that the depth is the same as it was before
> the change as far as fdt_next_node() is concerned.
>
> This problem was discovered trying to boot Tegra210-Smaug platforms.

Please reference the commit hash and summary. It is stable at this point.

> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/fdt.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index f3da1878eea2..8855ba4f7470 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -407,24 +407,24 @@ static int unflatten_dt_node(const void *blob,

This needs to be based on the top of my dt/next (or linux-next) branch
which renamed this function.

Otherwise, looks fine to me.

Rob
