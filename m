Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF5D51D53E
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791414; cv=pass; b=ohov3cAo5ypJ45CwB0B2lQQXC4GA433HYYtUpc6OrMdJ0SOrSEg5qFxjAJ54QXf2FCqYC6ZiGR4Nr/69hZhbOHBXDvFkKEmw0dcYb0CBNhoeLjY11mocW6tbMoe/B3Pm/Xu+CrjEzhyDmD1Urf64y4InI9GA0oFI4AESxNPAHn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791414; c=relaxed/simple;
	bh=upcfHAxGtdtk1uSk0A/SEb/TRi4JNBIMlA1MuWmB/Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N06hc1/3YK0scm2Jk9Z3J2C1ovK9kbspltYrMCzf0ib+JwhdPJH52kIPs5/wk7/+pKWJN2bHBhZD0NNwE4I2ElS9MW0rmZVQl84FjFJOsKGCy2OpNQUShAL6LFZo7yBhIl3g+FnpM4Us2iA8bThJmNw+BnO/v9PT9no8YxBRR+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJWdqBUM; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJWdqBUM"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso1072486eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 11:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790791412; cv=none;
        d=google.com; s=arc-20260327;
        b=iwTRztn3BsSnJKCYAOwXn230Lx4J8WNu/jhBWpJC1amA/pm+7Qllw8nzXR69+BqJBQ
         aQex1j7KChZ2P4gGYuq+0NOuBwvZhRIZGFEvN1W4RUf25FrDF4AZDhjrx7jHdmsGt0H8
         fiUzKdJ1NHQmTGUiLTXC+zlFYkqQ6p9b9CpvV0GSo7T0QyK80p4xZeBTDhH1FLyWUGQT
         bcC7JvsW9HZLY1SOwF051GibGbVYcjmHgHcybNNtmgjK8yAkvWLzuG1q8/r9qM7TiuMy
         yaindoL8vPfcrCWyxJvQHcfbm4tDnQrXMgyC+ahXwYvQY39vM0V4tDhOyuNFKwgpD0PB
         YZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        fh=JlJ1tnLQUEU8/o79YHvSw/vshfZghuCPVllaCa5OZEc=;
        b=VraveFVoD1UiO+F/NzLaQu4zNp2jIVihSPgFiQu34WVEWaoIMXlSMP82BVrSrUEkkk
         ElOl/KlwnVMNK1ruMH56vUFUF9sLHLD7tPPoKKWGHld/+nDsfEYxqcEOD9S5Q+vjUR3u
         UruXydhip+1FCcVT2XBYJU584Fm7P+VW3ZD5Sn55PBm+OvGkpa/mNyrxvVSKHrc5GjZT
         UT/a6IUYwEj5ovsbQXPAWVuvDfmW9BtcJn/N9Zx0+Y+a8PTRYDVxK5G2nzkkbpMfjneb
         pTQE1x78dqUeLi16XlYbBfFecwIAQIr2cgBs+7nfT/i7sFoo0rNnksnDGsLdHDli27g9
         mU7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790791412; x=1791396212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        b=ZJWdqBUMnfCQYTAgYJNR9K/BuJAKGQjNOdURb+MlxuF86Mew524XuvcXtNjsfBLs7n
         TkkuSUSxpgI4VqjhOD7oUefpwTztkkjko+ooJ/klsrKOemEquddWWla6ZypuD+Lzc0C7
         y550yCH4Kba1fl5IAFZN28fkihnrjTtIm4CCOnylG+XMsfB+UZ7pIvk0NpsUOyAsJYfs
         PMMzU2DTaTSYLJlUZpZLrne9zLmsjtvi0rAX50hIvQ5P+O3iNM9krFBIBJOMV2j4OzuJ
         UoeKcd29N2YQ18tYGEg+DuX/inIv6Kq1gy3lCPTTsUWPEZN3HSJllw1xybzM765d6Ahv
         NpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791412; x=1791396212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFazgWQfgrqX5tXQzvSSrxoFxe7hMQG/LSZ4puiNeNc=;
        b=adVETXAWZaD1SgrdI3gBOzlmeMTj5a92hoOJl8XstVLHznOkJx8kfiMo2u7mR5qdZT
         FHeek74BYeeXwjrl4QAawTGvO9allGWXS6S6LvIVw3HWxoUQlIeynXyGYWrKGyO0fU86
         ukEXN147Flg/OKN6V8bM6wDcBUzoSPqDe1CmrtUhqn3655DDHHTg7TBq72ffHR8bwTHq
         EY5PsqrdtVFcXQ4xm8z4zp9R1mTyT8EKnMAsmR3B5rnAJqefUfVHgUg47UJBpxqoC0La
         8YqdihMfevoCgVM7uEk2QUJQoo8C16Wd4G2iM9vbC077lUV3xSGMKpCFoGkA+gYhPVj8
         C1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLsZTUrQQyVnCgeMnAc3Bg9WqA4JTf2euWdd9GCNdLmdt5r7KSN/e4kY0iLkf7ab1/VGQmifNvdu49xw==@vger.kernel.org
X-Gm-Message-State: AFuF++nItr+eWaOsOZ7K3FIscf+dGd/NJQShw40Cy8h4oZzWQoE679Td
	foO7gxrBPBO92CSBpBYCr9VU0KpN1krkmD499MNMshwBXFWtMuUDZ1eFU1IacZQarKBc4fheJZU
	JvbtfN8zSqr4+Q5zXdGI8c+EufjKRy44=
X-Gm-Gg: AYBFou3kfwKtbWrtj1JEnWO4KJ/8aF8UML4W2I8V9MW9pBu/Ae0Li7Cgl3wu/um5clH
	AwAF91LBFz2prDDJEc3kjrhg39LFPZGMLBR+YxwfnddHJ4BzNx7Uz5hZaLw/N51KdiMQQ8I2qGH
	hNgYdj5EU92mq+dqfTJHDmaKFfiP7gkPVVpX4y+HZc9tXtlsu2FTp28bkGcUa+QSV98c1H0aaD+
	5V16vIiZUrdksM2t21XhQND0N50N9JFJMlwnz+eCtqKROf8S3jQa125F7rATIbaz0aVPT/WDCCj
	vdwO/0avvY5VKdQ6gCAuHmiRviEKdl9lITuV0rZr/h9DKkI3W0lQhuYS+S51hPLwNErLFlE2TGl
	8f3CkV/iLaxrs
X-Received: by 2002:a05:693c:6302:b0:33b:f87e:9e24 with SMTP id
 5a478bee46e88-34db442e062mr301482eec.0.1790791411529; Wed, 30 Sep 2026
 11:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
In-Reply-To: <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 21:03:19 +0300
X-Gm-Features: AclHuK-1QxITN8tXKEVLFacuZ52BTqv5hd6JiagMmZ8V3B_11Lh2NaeMasip5dQ
Message-ID: <CAPVz0n2mwC1r+Wsm8j13J-zoZyzjEH2sepsYKVbf847Gqnapgw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
> > +
> > +  dc-gpios:
> > +    description: Data/command selection pin.
> > +    maxItems: 1
> > +
> > +  rw-gpios:
> > +    description: Read/write pin.
> > +    maxItems: 1
> > +
> > +  cs-gpios:
> > +    description: Chip select pin.
> > +    maxItems: 1
> > +
> > +  data-gpios:
> > +    description: Specifies a set of 8 gpio pins used to transfer data.
> > +    minItems: 8
> > +    maxItems: 8
>
> Based on my admittedly brief research, according to the TRM the display
> controller can drive all of these pins - of which there are two fixed
> sets as you mention - directly. So we'd need to describe which interface
> the display is connected to in DT, but not any GPIOs (which they really
> aren't).
>

Thierry, Mikko.

I am not sure how to approach GPIOs defined outside of Device Tree.
All GPIO interactions are done either by ofnode/fwnode or software
nodes. Global gpio declaration is in process of being removed and
legacy GPIO API seem to be not long-therm sustainable. How to resolve
this? Should I keep above layout with GPIOs defined in the tree?

> > +
> > +  nvidia,init-sequence:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: Device specific set of values used in DC DISP_SPI_INI=
T_SEQ
> > +      registers.
> > +    minItems: 4
> > +    maxItems: 4
>
> And AIUI this is panel-specific DBI commands the display controller will
> transmit. So ideally the display driver should receive this data from
> the panel driver.
>
> Thank you
> Mikko
>
> > +
> > +  panel:
> > +    type: object
> > +    description: Node of supported panel driven by the bridge.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Video port for RGB input.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              bus-width:
> > +                enum: [ 16, 18, 24 ]
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video port for DBI output (panel or connector).
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dbi-bridge {
> > +        compatible =3D "nvidia,tegra-8bit-cpu";
> > +
> > +        dc-gpios =3D <&gpio 110 GPIO_ACTIVE_HIGH>;
> > +        rw-gpios =3D <&gpio 11 GPIO_ACTIVE_HIGH>;
> > +        cs-gpios =3D <&gpio 108 GPIO_ACTIVE_HIGH>;
> > +
> > +        data-gpios =3D <&gpio 32 GPIO_ACTIVE_HIGH>, <&gpio 33 GPIO_ACT=
IVE_HIGH>,
> > +                     <&gpio 34 GPIO_ACTIVE_HIGH>, <&gpio 35 GPIO_ACTIV=
E_HIGH>,
> > +                     <&gpio 36 GPIO_ACTIVE_HIGH>, <&gpio 37 GPIO_ACTIV=
E_HIGH>,
> > +                     <&gpio 38 GPIO_ACTIVE_HIGH>, <&gpio 39 GPIO_ACTIV=
E_HIGH>;
> > +
> > +        nvidia,init-sequence =3D <0x0000002c 0x0 0x0 0x00005000>;
> > +
> > +        panel {
> > +            compatible =3D "hit,tx10d07vm0baa";
> > +
> > +            reset-gpios =3D <&gpio 175 GPIO_ACTIVE_LOW>;
> > +
> > +            avci-supply =3D <&vcc_2v8_lcd>;
> > +            iovcc-supply =3D <&iovcc_1v8_lcd>;
> > +
> > +            backlight =3D <&backlight>;
> > +
> > +            port {
> > +                panel_input: endpoint {
> > +                    remote-endpoint =3D <&bridge_output>;
> > +                };
> > +            };
> > +        };
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +
> > +                bridge_input: endpoint {
> > +                    remote-endpoint =3D <&dpi_output>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +
> > +                bridge_output: endpoint {
> > +                    remote-endpoint =3D <&panel_input>;
> > +                };
> > +            };
> > +        };
> > +    };
> > --
> > 2.53.0
> >
> >
>
>
>
>
