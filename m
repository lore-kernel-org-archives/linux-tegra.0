From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: Convert Tegra186 BPMP
 bindings to json-schema
Date: Thu, 16 Jan 2020 13:28:17 -0600
Message-ID: <20200116192817.GA30287@bogus>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200114181519.3402385-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 14 Jan 2020 19:15:18 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the Tegra186 BPMP bindings from the old free-form text format to
> a json-schema and fix things up so that existing device trees properly
> validate.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 107 ---------
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 209 ++++++++++++++++++
>  2 files changed, 209 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dts:52.29-30 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1222983
Please check and re-submit.
