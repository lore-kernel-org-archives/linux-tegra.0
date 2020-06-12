From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 31/38] dt-bindings: panel: simple: Use unevaluatedProperties
Date: Fri, 12 Jun 2020 08:28:13 -0600
Message-ID: <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com> <20200612141903.2391044-32-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-32-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Using "additionalProperties: false" results in rejecting any of the
> properties defined in panel-common.yaml, whereas the intent is to
> inherit the common properties defined in that file.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 34fe3d42b829..c58bc90ffd43 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -275,7 +275,7 @@ properties:
>    port: true
>    power-supply: true
>
> -additionalProperties: false
> +unevaluatedProperties: false

But we've listed the properties we use here. Some of the common ones
may not be applicable. Maybe they are and if so, then you should drop
all the ones listed with 'true' with this change.

Rob
