From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 28/38] dt-bindings: phy: tegra-xusb: Convert to
 json-schema
Date: Wed, 17 Jun 2020 20:38:26 -0600
Message-ID: <20200618023826.GB3343853@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-29-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-29-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
>  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
>  2 files changed, 2800 insertions(+), 778 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml

This one I definitely think should be split up into multiple schema 
files. There's very little shared.

Rob
