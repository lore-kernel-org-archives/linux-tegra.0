From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] dt-bindings: memory-controller: Convert Tegra124 EMC
 to json-schema
Date: Mon, 13 Jan 2020 12:03:02 -0600
Message-ID: <CAL_JsqKWRm7BN1vjV=DDHJooEbQti+zFN=PrvEtrNhKoKa06YQ@mail.gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com> <20191222113921.1469372-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20191222113921.1469372-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 22, 2019 at 5:39 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Convert the device tree bindings for the Tegra124 EMC controller to the
> DT schema format using json-schema. While at it, clean up the binding a
> little bit by removing any mention of how RAM code and clock frequency
> are represented in unit-addresses (which they aren't) and by adding the
> EMC clock without which the EMC controller can't change the frequency at
> which the external memory is clocked. While this is technically an ABI
> break (the clock was not required before), this should be fine because
> there isn't much that the EMC driver can do without access to the EMC
> clock.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../nvidia,tegra124-emc.txt                   | 374 -------------
>  .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
>  2 files changed, 528 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml

The example fails 'make dt_binding_check':

/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
memory-controller@70019000: '#reset-cells' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-mrs-wait-cnt' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-xm2dqspadctrl2' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-zcal-interval' is a required property

Rob
