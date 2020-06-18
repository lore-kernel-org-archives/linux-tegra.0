From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Date: Wed, 17 Jun 2020 20:34:57 -0600
Message-ID: <20200618023457.GA3343853@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-27-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:51PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Convert the PCI IOMMU device tree bindings from free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
>  .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
>  2 files changed, 168 insertions(+), 171 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml

This needs to come before you use it.

> diff --git a/Documentation/devicetree/bindings/pci/pci-iommu.yaml b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
> new file mode 100644
> index 000000000000..8aaa8e657559
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/pci-iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCI IOMMU bindings
> +
> +maintainers:
> +  - Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> +
> +description: |
> +  This document describes the generic device tree binding for describing the
> +  relationship between PCI(e) devices and IOMMU(s).
> +
> +  Each PCI(e) device under a root complex is uniquely identified by its
> +  Requester ID (AKA RID). A Requester ID is a triplet of a Bus number, Device
> +  number, and Function number.
> +
> +  For the purpose of this document, when treated as a numeric value, a RID is
> +  formatted such that:
> +
> +    * Bits [15:8] are the Bus number.
> +    * Bits [7:3] are the Device number.
> +    * Bits [2:0] are the Function number.
> +    * Any other bits required for padding must be zero.
> +
> +  IOMMUs may distinguish PCI devices through sideband data derived from the
> +  Requester ID. While a given PCI device can only master through one IOMMU, a
> +  root complex may split masters across a set of IOMMUs (e.g. with one IOMMU
> +  per bus).
> +
> +  The generic 'iommus' property is insufficient to describe this relationship,
> +  and a mechanism is required to map from a PCI device to its IOMMU and
> +  sideband data.
> +
> +  For generic IOMMU bindings, see
> +  Documentation/devicetree/bindings/iommu/iommu.txt.
> +
> +properties:
> +  iommu-map:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Maps a Requester ID to an IOMMU and associated IOMMU specifier data.
> +
> +      The property is an arbitrary number of tuples of (rid-base, iommu,
> +      iommu-base, length).
> +
> +      Any RID r in the interval [rid-base, rid-base + length) is associated
> +      with the listed IOMMU, with the IOMMU specifier (r - rid-base +
> +      iommu-base).
> +
> +  iommu-map-mask:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description:
> +      A mask to be applied to each Requester ID prior to being mapped to an
> +      IOMMU specifier per the iommu-map property.
> +
> +examples:
> +  - |
> +    iommu0: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID,
> +         * identity-mapped.
> +         */
> +        iommu-map = <0x0 &iommu0 0x0 0x10000>;
> +    };
> +
> +  - |
> +    iommu1: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID with the
> +         * function bits masked out.
> +         */
> +        iommu-map = <0x0 &iommu 0x0 0x10000>;
> +        iommu-map-mask = <0xfff8>;
> +    };
> +
> +  - |
> +    iommu2: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID,
> +         * but the high bits of the bus number are flipped.
> +         */
> +        iommu-map = <0x0000 &iommu2 0x8000 0x8000>,
> +                    <0x8000 &iommu2 0x0000 0x8000>;
> +    };
> +
> +  - |
> +    iommu_a: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    iommu_b: iommu@b {
> +        reg = <0xb 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    iommu_c: iommu@c {
> +        reg = <0xc 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * Devices with bus number 0-127 are mastered via IOMMU
> +         * a, with sideband data being RID[14:0].
> +         * Devices with bus number 128-255 are mastered via
> +         * IOMMU b, with sideband data being RID[14:0].
> +         * No devices master via IOMMU c.
> +         */
> +        iommu-map = <0x0000 &iommu_a 0x0000 0x8000>,
> +                    <0x8000 &iommu_b 0x0000 0x8000>;
> +    };
> -- 
> 2.24.1
> 
