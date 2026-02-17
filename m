Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293A36E49A;
	Tue, 17 Feb 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353515; cv=none; b=tyMutikaz+Xp55n2SkHfWaJlVYzAANBMOOj169BwNU07bRI9d4+lgx4E6xNOPKBVw3pve8zOBbyUOnqKSYOPrQY+Ds5nrN5cTI2g7ylvbTqxYQgTt5kHZDnxmJTpxDHFKOfWbjgW4WVB2/Fs051D2MPjVn02L2MFFH5U5agPQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353515; c=relaxed/simple;
	bh=xSpRZfzsx0iDj2wjAiZITo0O7m06D91RNQSPqHc+JxM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B6HTQMRSAaZM6KxdbGATZc6sMZk+wIAiWyu9rVApwHTf3G+aZ5cECGbSxygwIvxzNaQPeq/rXhNQVE6Ax6x05MPcLtCDPwdYZfehiHJh8XmhfGF1ecu9a8PlshlNHJpvJYUVc2skJ+IVyQJdJ8MCAvtltOZLq+v0gKZWCc0F98U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB2OCfcm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB2OCfcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05D2C4CEF7;
	Tue, 17 Feb 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771353514;
	bh=xSpRZfzsx0iDj2wjAiZITo0O7m06D91RNQSPqHc+JxM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OB2OCfcm8aY0wLH+Gp7tApzcaQbQJpXPvVz/eZRKWk3SC4uhz388WBNHahHr156O8
	 9j8lx6061pDEuvkkO0uIGT8y13dxHCdPP8jp9pWKS5I/Zmh190bQHYqsbQ3fFAmWs/
	 erJW9mwX18C2UKn++GfCUJWElxBJSHmaNXC66YzNDblqMRhHYOtTK0FYWBmovbwKiR
	 8bMveoJ191UVH8iNtkzwsc6p5/I1AyHD/1LS0yxqOaJJMj6Ny9kBGcTgJ6D0GK7/9T
	 /RX2UM3KyNUmKvKbvp9Sk/XDLC5E5zAlf9CO5tnRx2L8ee0q1+KDyVFyNosIPRcX1c
	 YHi5h+XlSloBw==
Date: Tue, 17 Feb 2026 12:38:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Frank.Li@kernel.org, thierry.reding@gmail.com, conor+dt@kernel.org, 
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
To: Akhil R <akhilrajeev@nvidia.com>
In-Reply-To: <20260217173457.18628-2-akhilrajeev@nvidia.com>
References: <20260217173457.18628-1-akhilrajeev@nvidia.com>
 <20260217173457.18628-2-akhilrajeev@nvidia.com>
Message-Id: <177135351257.3689107.9046186711900610115.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property


On Tue, 17 Feb 2026 23:04:50 +0530, Akhil R wrote:
> Add iommu-map property which helps when each channel requires its own
> stream ID for the transfer. Use iommu-map to specify separate stream
> ID for each channel. This enables each channel to be in its own iommu
> domain and keeps the memory isolated from other devices sharing the
> same DMA controller.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml  | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/virtio/pci-iommu.example.dtb: pcie@40000000: iommu-map:0: [0, 1, 0, 8, 9, 1, 9, 65527] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/riscv,iommu.example.dtb: pcie@30000000: iommu-map:0: [0, 4, 0, 8, 9, 4, 9, 65527] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.example.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 4294967295, 7552, 1, 256, 4294967295, 7553, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.example.dtb: pcie@1c00000 (qcom,pcie-sc8180x): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'phy-names', 'phys', 'power-domains', 'ranges' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8180x.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.example.dtb: pcie@1c00000 (qcom,pcie-sc8180x): iommu-map:0: [0, 4294967295, 7552, 1, 256, 4294967295, 7553, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.example.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 4294967295, 7552, 1, 256, 4294967295, 7553, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.example.dtb: pcie@1c00000 (qcom,pcie-sm8150): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8150.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.example.dtb: pcie@1c00000 (qcom,pcie-sm8150): iommu-map:0: [0, 4294967295, 7552, 1, 256, 4294967295, 7553, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.example.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 4294967295, 7296, 1, 256, 4294967295, 7297, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.example.dtb: pcie@1c08000 (qcom,pcie-sc7280): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'power-domains', 'ranges', 'vddpe-3v3-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.example.dtb: pcie@1c08000 (qcom,pcie-sc7280): iommu-map:0: [0, 4294967295, 7296, 1, 256, 4294967295, 7297, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.example.dtb: pcie@1c08000 (qcom,pcie-x1e80100): iommu-map:0: [0, 4294967295, 5120, 1, 256, 4294967295, 5121, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.example.dtb: pcie@1c08000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.example.dtb: pcie@1c08000 (qcom,pcie-x1e80100): iommu-map:0: [0, 4294967295, 5120, 1, 256, 4294967295, 5121, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.example.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 4294967295, 0, 1, 256, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.example.dtb: pcie@1c00000 (qcom,pcie-sa8775p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8775p.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.example.dtb: pcie@1c00000 (qcom,pcie-sa8775p): iommu-map:0: [0, 4294967295, 0, 1, 256, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.example.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.example.dtb: pcie@1c00000 (qcom,pcie-sm8350): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8350.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8350.example.dtb: pcie@1c00000 (qcom,pcie-sm8350): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.example.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.example.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'max-link-speed', 'msi-map', 'msi-map-mask', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8450.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8450.example.dtb: pcie@1c00000 (qcom,pcie-sm8450-pcie0): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/apple,pcie.example.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 4294967295, 1, 1, 512, 4294967295, 1, 1, 768, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/apple,pcie.example.dtb: pcie@690000000 (apple,t8103-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-range', 'device_type', 'pci@0,0', 'pci@1,0', 'pci@2,0' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/apple,pcie.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/apple,pcie.example.dtb: pcie@690000000 (apple,t8103-pcie): iommu-map:0: [256, 4294967295, 1, 1, 512, 4294967295, 1, 1, 768, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.example.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 4294967295, 5120, 1, 256, 4294967295, 5121, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.example.dtb: pcie@1c00000 (qcom,pcie-sm8550): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8550.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.example.dtb: pcie@1c00000 (qcom,pcie-sm8550): iommu-map:0: [0, 4294967295, 5120, 1, 256, 4294967295, 5121, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.example.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.example.dtb: pcie@1c00000 (qcom,pcie-sm8250): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-coherent', 'interrupt-map', 'interrupt-map-mask', 'iommu-map', 'linux,pci-domain', 'num-lanes', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sm8250.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.example.dtb: pcie@1c00000 (qcom,pcie-sm8250): iommu-map:0: [0, 4294967295, 7168, 1, 256, 4294967295, 7169, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.example.dtb: pci@1c00000 (qcom,pcie-sa8255p): iommu-map:0: [0, 4294967295, 0, 1, 256, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8255p.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.example.dtb: pci@1c00000 (qcom,pcie-sa8255p): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'pcie@0' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sa8255p.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-sa8255p.example.dtb: pci@1c00000 (qcom,pcie-sa8255p): iommu-map:0: [0, 4294967295, 0, 1, 256, 4294967295, 1, 1] is too long
	from schema $id: http://devicetree.org/schemas/pci/pci-iommu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260217173457.18628-2-akhilrajeev@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

