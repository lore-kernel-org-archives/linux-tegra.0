Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78E20C030;
	Fri,  9 May 2025 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810461; cv=none; b=QU+fa7gEpVSzNP+jKAseKWdA+JMn8FWzrYeFX0eDmK/h6dz1osD2nwSiDBF/0gRRPYsys1kEk3NgbG6MFGW2hiWlA085OCvlMAtK+1/a+y6nhKEBVYuKAeYufV+C6x1tIStX6GVQdqBwhZONZNfmUkRAmWrx5gU85SneMZrUwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810461; c=relaxed/simple;
	bh=Yy4nra+O3NgFuFGl5p3Vw1wjXbyQqU59BCaFuBPghKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ79e2HyKyQmiJXNG66B1mxqVULIGiHf/WX/AKpmXaSX1GnipfwHxNuzUfKmk8fEZu8Dq9AruBYx9zrIna+wlbO83KUi2X49XUBZWLZBZ1BkHgqZ6D61VBqY060kwP0p5DCVVudAgVnkdD7nAeIQ28XXdwfZ3PPCJJZkrbhppkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IT3Mf/VE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IT3Mf/VE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso1643484e87.1;
        Fri, 09 May 2025 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746810456; x=1747415256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDX3Oj+HbC3ObmrYAVjbySeOBTlinuWZuSi6OlG2dbw=;
        b=IT3Mf/VElOTE2Q5ojW/QPCzbdf/I+p4Q9U6fsohUydLHfQSMAmrso/HbuF3cC6yLZ/
         Mq+QZ4Xw+vNmAdgJJOwlTOHO7BHywIH0jVg32+wVLgPQYgVHSUiMdoU5eCWIC1I/bZFx
         WJL2zLuw9jrQadFZ/PhIFtIW81mjIQUOyhp8DDz8i7lqTNXp2BtTwmTVm5DVdxMHWeZR
         DuqhO2cnowd59hNE/RC/tA2gmZCPSA/nIYjz49a/sh1+k2GdpkDclS22rOD6CENb5n4x
         IG8WMPdwN+hHum/HGtBsoKvl7XQof5W0GawKn5bILciwRRf5zUMMDDLbnjJ7aavbDcZU
         reIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810456; x=1747415256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDX3Oj+HbC3ObmrYAVjbySeOBTlinuWZuSi6OlG2dbw=;
        b=I5w99MglN6ZoVynwuV18TbNe8Qv/lQADR5rYcxrrzZWGEY1BrB3aDLqdMlXmAAK7aU
         YaKdy7cmMMdNTWNeF5Uqy+XqtmXnOaZYCx5xq4UjqgRG1VHJJUkZTKiAxrF5wsQIIWGi
         mAuvcDOsZ6uqbMalsrP9BwCDoTu9zmo3j+NCQrgIhVLWfFxFDCvu+GFxZrHZXjAR4f0g
         WMoxacF/InHHELGQYhq1KzDnlK/f7LgfUZyCfmkqT71Tt7CfGADdwLMaqGkyn4d7RBH8
         1u4m2NQodeLKwxaRXFru/vGoR2Xu1VwZrrxufxDrJ9SCbjlEOJuZbZngaiw3P3Yfin7e
         /fbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlY4syNOFzKQCabu0JWLohr/lmUL5r1WUoR0Z1aBax1kyVEt78FiVjw5F+CrY+Ejm+00rrECGyT619@vger.kernel.org, AJvYcCVnD1a5g8pqP/mwXf7bvHrLvZvAccXJWnjSwYpnMJeomsYYrtCvYhKteqAt1MoIFrcLWLZA1y5gcgvqUvk=@vger.kernel.org, AJvYcCWRPToRSjhIOOeyLPGrg39Bwf7uljPGMzrB7/1jmFw2+Pd6HH+od4CLiguHFp1J2weQh+aaPhSa1sBjL/Gc@vger.kernel.org
X-Gm-Message-State: AOJu0YxqV3+NiglZNQNhphkxZcnudlyd4Rde8n/SaiExOz0vu1ByvFlv
	8dxfVoDaRYime9L1Ep0KS94NNLCOLzXOGx2WvSnmrSwRWjg5mZ5LCKOEe+E6Ex/nPlkTOgA2nEc
	qauZFyPNc6BH6/7ekPldsy2f0NxU=
X-Gm-Gg: ASbGncvKHfM/Zx5h1KXEiwNV1Cm7uDL4+IsBYsLGSuM1TgRVdGtFCWcFo3oNW9vMK5N
	eoTUFz6bTCc7LYbwQ7Rcv8V75oDe1CqgwRCp/ak4I1x8oZrnlOPtavq3umphvoqMCmokeOqS7EP
	Vsp8MulAyXwJ5HRce8oiHn3Mo=
X-Google-Smtp-Source: AGHT+IFLQzdLx+MeHX+rO5zLQwLq8HbAkC1GL73j/RZKDyb5Ws8tHEwx7WdwhiSNMTIfj0wTq1t/FyZ9dKE1eko7kMo=
X-Received: by 2002:a05:6512:631a:b0:549:8a44:493e with SMTP id
 2adb3069b0e04-54fc67acf45mr1854254e87.5.1746810455435; Fri, 09 May 2025
 10:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <20250508-tegra210-emc-dt-v2-1-d33dc20a1123@gmail.com> <20250509134230.GA3188545-robh@kernel.org>
In-Reply-To: <20250509134230.GA3188545-robh@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 9 May 2025 12:07:23 -0500
X-Gm-Features: AX0GCFuwbdGI_i56mhKEg31cutWbUYYFKFPsX63x_KFdP_AAIqZlh-YrPFXumHg
Message-ID: <CALHNRZ-Z1u9jMOAvgvSvdLde+O6G3TVrTPxVjG56QvbUK6QYEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: memory-controllers: Describe Tegra210
 EMC Tables
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:42=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 08, 2025 at 01:07:38AM -0500, Aaron Kling wrote:
> > Add device tree bindings for Tegra210 EMC tables as used by the Nvidia
> > Android bootloader.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  .../nvidia,tegra21-emc-table.yaml                  | 1692 ++++++++++++=
++++++++
> >  .../memory-controllers/nvidia,tegra210-emc.yaml    |   38 +
> >  2 files changed, 1730 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra21-emc-table.yaml b/Documentation/devicetree/bindings/memory-control=
lers/nvidia,tegra21-emc-table.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..df371c835b95ad75deb74ad=
1d8711ed40a9b2361
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
21-emc-table.yaml
> > @@ -0,0 +1,1692 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra21-e=
mc-table.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra210 SoC EMC Table
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +description: |
>
> Don't need '|' if no formatting to preserve.
>
> > +  EMC training data used by the emc driver to do periodic training
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nvidia,tegra21-emc-table
> > +          - nvidia,tegra21-emc-table-derated
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Clock rate for this table
>
> ?? Drop
>
> > +
> > +  clock-frequency:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Already has a type defined. Drop.
>
> > +    description:
> > +      external memory clock rate in KHz
> > +    minimum: 40800
> > +    maximum: 1600000
> > +
> > +  nvidia,revision:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The revision of this table
> > +
> > +  nvidia,dvfs-version:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      The dvfs version of this table
>
> Constraints on the string?
>
> > +
> > +  nvidia,emc-min-mv:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The minimum emc voltage allowed for this table
>
> Use standard unit suffixes.
>
> > +
> > +  nvidia,gk20a-min-mv:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The minimum gpu voltage allowed for this table
> > +
> > +  nvidia,source:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      The clock source for this table
> > +
> > +  nvidia,src-sel-reg:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the source selection register
> > +
> > +  nvidia,needs-training:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      If this table needs training
>
> Sounds like a boolean?
>
> > +
> > +  nvidia,training_pattern:
>
> Don't use '_' in names.
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Which training pattern to use for this table
> > +
> > +  nvidia,trained:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      If this table has been trained
>
> Isn't that just !nvidia,needs-training?
>
> > +
> > +  nvidia,periodic_training:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      If this table should be periodically trained
> > +
> > +  nvidia,trained_dram_clktree_c0d0u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c0d0u0 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c0d0u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c0d0u1 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c0d1u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c0d1u0 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c0d1u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c0d1u1 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c1d0u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c1d0u0 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c1d0u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c1d0u1 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c1d1u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c1d1u0 in the dram clock tree
> > +
> > +  nvidia,trained_dram_clktree_c1d1u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Trained value of c1d1u1 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c0d0u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c0d0u0 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c0d0u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c0d0u1 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c0d1u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c0d1u0 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c0d1u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c0d1u1 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c1d0u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c1d0u0 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c1d0u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c1d0u1 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c1d1u0:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c1d1u0 in the dram clock tree
> > +
> > +  nvidia,current_dram_clktree_c1d1u1:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Current value of c1d1u1 in the dram clock tree
>
> Could all of these just be an array?
>
> > +
> > +  nvidia,run_clocks:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Clocks to run
> > +
> > +  nvidia,tree_margin:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Tree margin
> > +
> > +  nvidia,burst-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of burst registers
> > +
> > +  nvidia,burst-regs-per-ch-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of burst registers per channel
> > +
> > +  nvidia,trim-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of trim registers
> > +
> > +  nvidia,trim-regs-per-ch-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of trim registers per channel
> > +
> > +  nvidia,burst-mc-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of burst mc registers
> > +
> > +  nvidia,la-scale-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of la scale registers
> > +
> > +  nvidia,vref-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of voltage reference registers
> > +
> > +  nvidia,training-mod-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of training mod registers
> > +
> > +  nvidia,dram-timing-regs-num:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of dram timing registers
> > +
> > +  nvidia,min-mrs-wait:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the MIN_MRS_WAIT register
> > +
> > +  nvidia,emc-mrw:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRW register
> > +
> > +  nvidia,emc-mrw2:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRW2 register
> > +
> > +  nvidia,emc-mrw3:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRW3 register
> > +
> > +  nvidia,emc-mrw4:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRW4 register
> > +
> > +  nvidia,emc-mrw9:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRW9 register
> > +
> > +  nvidia,emc-mrs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_MRS register
> > +
> > +  nvidia,emc-emrs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_EMRS register
> > +
> > +  nvidia,emc-emrs2:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_EMRS2 register
> > +
> > +  nvidia,emc-auto-cal-config:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG register
> > +
> > +  nvidia,emc-auto-cal-config2:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG2 register
> > +
> > +  nvidia,emc-auto-cal-config3:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG3 register
> > +
> > +  nvidia,emc-auto-cal-config4:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG4 register
> > +
> > +  nvidia,emc-auto-cal-config5:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG5 register
> > +
> > +  nvidia,emc-auto-cal-config6:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG6 register
> > +
> > +  nvidia,emc-auto-cal-config7:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG7 register
> > +
> > +  nvidia,emc-auto-cal-config8:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_AUTO_CAL_CONFIG8 register
> > +
> > +  nvidia,emc-cfg-2:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_CFG_2 register
> > +
> > +  nvidia,emc-sel-dpd-ctrl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_SEL_DPD_CTRL register
> > +
> > +  nvidia,emc-fdpd-ctrl-cmd-no-ramp:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Value of the EMC_FDPD_SEL_DPD_CTRL_NO_RAMP register
> > +
> > +  nvidia,dll-clk-src:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      VALUE of the DLL_CLK_SRC register
> > +
> > +  nvidia,clk-out-enb-x-0-clk-enb-emc-dll:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      If the dll clock should be enabled for this table
> > +
> > +  nvidia,emc-clock-latency-change:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Clock latency change
> > +
> > +  nvidia,ptfv:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Ptfv list values
> > +
> > +  nvidia,emc-registers:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Burst register values, size is determined by
> > +      nvidia,burst-regs-num
> > +
> > +  nvidia,emc-burst-regs-per-ch:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Per channel EMC burst register values, size is determined by
> > +      nvidia,burst-regs-per-ch-num
> > +
> > +  nvidia,emc-shadow-regs-ca-train:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Shadow registers ca train, size is determined by
> > +      nvidia,burst-regs-num
> > +
> > +  nvidia,emc-shadow-regs-quse-train:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Shadow registers quse train, size is determined by
> > +      nvidia,burst-regs-num
> > +
> > +  nvidia,emc-shadow-regs-rdwr-train:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Shadow registers rdwr train, size is determined by
> > +      nvidia,burst-regs-num
> > +
> > +  nvidia,emc-trim-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Trim register values, size is determined by
> > +      nvidia,trim-regs-num
> > +
> > +  nvidia,emc-trim-regs-per-ch:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Per channel trim register values, size is determined by
> > +      nvidia,trim-regs-per-channel-num
> > +
> > +  nvidia,emc-vref-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Voltage reference register values, size is determined by
> > +      nvidia,vref-regs-num
> > +
> > +  nvidia,emc-dram-timing-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Dram timing register values, size is determined by
> > +      nvidia,dram-timing-regs-num
> > +
> > +  nvidia,emc-training-mod-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Training mod register values, size is determined by
> > +      nvidia,training-mod-regs-num
> > +
> > +  nvidia,emc-save-restore-mod-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Save restore mod register values
> > +
> > +  nvidia,emc-burst-mc-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      Burst mc register values, size is determined by
> > +      nvidia,burst-mc-regs-num
> > +
> > +  nvidia,emc-la-scale-regs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +      La scale register values, size is determined by
> > +      nvidia,burst-mc-regs-num
>
> That's a ton of properties... And somehow completely different than
> other Tegra stuff.
>
> > +
> > +required:
> > +  - compatible
> > +  - clock-frequency
>
> Seems like a few more should be required. Or there's some dependencies
> between properties?
>
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/tegra210-car.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    external-memory-controller@7001b000 {
>
> This node needs a compatible.
>
> > +        reg =3D <0x7001b000 0x1000>,
> > +              <0x7001e000 0x1000>,
> > +              <0x7001f000 0x1000>;
> > +        clocks =3D <&tegra_car TEGRA210_CLK_EMC>;
> > +        clock-names =3D "emc";
> > +        interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > +        nvidia,memory-controller =3D <&mc>;
> > +        nvidia,use-ram-code;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        emc-table@0 {
> > +            reg =3D <0>;
> > +            nvidia,ram-code =3D <0x0>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            emc-table@40800 {
> > +                reg =3D <40800>;
> > +                compatible =3D "nvidia,tegra21-emc-table";
> > +                nvidia,revision =3D <0x07>;
> > +                nvidia,dvfs-version =3D "04_40800_03_V9.8.7_V1.6";
> > +                clock-frequency =3D <40800>;
> > +                nvidia,emc-min-mv =3D <800>;
> > +                nvidia,gk20a-min-mv =3D <1100>;
> > +                nvidia,source =3D "pllp_out0";
> > +                nvidia,src-sel-reg =3D <0x40188012>;
> > +                nvidia,needs-training =3D <0x00000000>;
> > +                nvidia,training_pattern =3D <0x00000000>;
> > +                nvidia,trained =3D <0x00000000>;
> > +                nvidia,periodic_training =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c0d0u0 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c0d0u1 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c0d1u0 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c0d1u1 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c1d0u0 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c1d0u1 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c1d1u0 =3D <0x00000000>;
> > +                nvidia,trained_dram_clktree_c1d1u1 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c0d0u0 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c0d0u1 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c0d1u0 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c0d1u1 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c1d0u0 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c1d0u1 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c1d1u0 =3D <0x00000000>;
> > +                nvidia,current_dram_clktree_c1d1u1 =3D <0x00000000>;
> > +                nvidia,run_clocks =3D <0x00000003>;
> > +                nvidia,tree_margin =3D <0x00000001>;
> > +                nvidia,burst-regs-num =3D <221>;
> > +                nvidia,burst-regs-per-ch-num =3D <8>;
> > +                nvidia,trim-regs-num =3D <138>;
> > +                nvidia,trim-regs-per-ch-num =3D <10>;
> > +                nvidia,burst-mc-regs-num =3D <33>;
> > +                nvidia,la-scale-regs-num =3D <24>;
> > +                nvidia,vref-regs-num =3D <4>;
> > +                nvidia,training-mod-regs-num =3D <20>;
> > +                nvidia,dram-timing-regs-num =3D <5>;
> > +                nvidia,min-mrs-wait =3D <0x00000015>;
> > +                nvidia,emc-mrw =3D <0x08010004>;
> > +                nvidia,emc-mrw2 =3D <0x08020000>;
> > +                nvidia,emc-mrw3 =3D <0x080d0000>;
> > +                nvidia,emc-mrw4 =3D <0xc0000000>;
> > +                nvidia,emc-mrw9 =3D <0x0c0e7272>;
> > +                nvidia,emc-mrs =3D <0x00000000>;
> > +                nvidia,emc-emrs =3D <0x00000000>;
> > +                nvidia,emc-emrs2 =3D <0x00000000>;
> > +                nvidia,emc-auto-cal-config =3D <0xa01a51d8>;
> > +                nvidia,emc-auto-cal-config2 =3D <0x05500000>;
> > +                nvidia,emc-auto-cal-config3 =3D <0x00770000>;
> > +                nvidia,emc-auto-cal-config4 =3D <0x00770000>;
> > +                nvidia,emc-auto-cal-config5 =3D <0x00770000>;
> > +                nvidia,emc-auto-cal-config6 =3D <0x00770000>;
> > +                nvidia,emc-auto-cal-config7 =3D <0x00770000>;
> > +                nvidia,emc-auto-cal-config8 =3D <0x00770000>;
> > +                nvidia,emc-cfg-2 =3D <0x00110805>;
> > +                nvidia,emc-sel-dpd-ctrl =3D <0x00040008>;
> > +                nvidia,emc-fdpd-ctrl-cmd-no-ramp =3D <0x00000001>;
> > +                nvidia,dll-clk-src =3D <0x40188012>;
> > +                nvidia,clk-out-enb-x-0-clk-enb-emc-dll =3D <0x00000001=
>;
> > +                nvidia,emc-clock-latency-change =3D <0x00005172>;
> > +                nvidia,ptfv =3D <
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x0000000a
> > +                    0x0000000a
> > +                    0x0000000a
> > +                    0x00000001
> > +                >;
> > +                nvidia,emc-registers =3D <
> > +                    0x0000000c
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x0000000a
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x0000000b
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000020
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000003
> > +                    0x00000000
> > +                    0x00000006
> > +                    0x00000004
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x0000000d
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x08037171
> > +                    0x0000000a
> > +                    0x00000000
> > +                    0x0000000a
> > +                    0x00010001
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x00000015
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x0000009a
> > +                    0x00000000
> > +                    0x00000026
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000014
> > +                    0x00000005
> > +                    0x00000002
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000004
> > +                    0x00000009
> > +                    0x48037171
> > +                    0x000000a0
> > +                    0x00000000
> > +                    0x9160a00d
> > +                    0x00003bbf
> > +                    0x002c00a0
> > +                    0x00008000
> > +                    0x000000be
> > +                    0x0fff0fff
> > +                    0x0fff0fff
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x080b0000
> > +                    0x00120010
> > +                    0x00120011
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00100010
> > +                    0x00120012
> > +                    0x00110011
> > +                    0x00120012
> > +                    0x00000010
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x8020221f
> > +                    0x0220f40f
> > +                    0x00000012
> > +                    0x00064000
> > +                    0x00090029
> > +                    0x00290015
> > +                    0x000b000a
> > +                    0xc1e00302
> > +                    0x1f13412f
> > +                    0x00010014
> > +                    0x00000804
> > +                    0x00000550
> > +                    0xf3200000
> > +                    0x0fff0fff
> > +                    0x0000023a
> > +                    0x00000009
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000012
> > +                    0x00000012
> > +                    0x00020000
> > +                    0x00050037
> > +                    0x00000000
> > +                    0x00000010
> > +                    0x00003000
> > +                    0x0a000000
> > +                    0x02000111
> > +                    0x00000008
> > +                    0x00030808
> > +                    0x00015c00
> > +                    0x00100404
> > +                    0x00001600
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000034
> > +                    0x00000040
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000020
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0xefffefff
> > +                    0xc0c0c0c0
> > +                    0xc0c0c0c0
> > +                    0xdcdcdcdc
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0118600b
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000013
> > +                    0x00000009
> > +                    0x00000015
> > +                    0x08161414
> > +                    0x00000011
> > +                    0x00010001
> > +                    0x00009080
> > +                    0x07070404
> > +                    0x00040014
> > +                    0x0513801f
> > +                    0x1f101100
> > +                    0x00000014
> > +                    0x00107240
> > +                    0x01124000
> > +                    0x01125b6a
> > +                    0x0f081000
> > +                    0x00105800
> > +                    0x1110fc00
> > +                    0x0f081300
> > +                    0x00105800
> > +                    0x1114fc00
> > +                    0x07000300
> > +                    0x00107240
> > +                    0x55553c5a
> > +                    0x48161414
> > +                >;
> > +                nvidia,emc-burst-regs-per-ch =3D <
> > +                    0x880c7272
> > +                    0x880c7272
> > +                    0x480c7272
> > +                    0x480c7272
> > +                    0x8c0e7272
> > +                    0x8c0e7272
> > +                    0x4c0e7272
> > +                    0x4c0e7272
> > +                >;
> > +                nvidia,emc-shadow-regs-ca-train =3D <
> > +                    0x0000000c
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x0000000a
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x0000000b
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000020
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000003
> > +                    0x00000000
> > +                    0x00000006
> > +                    0x00000004
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x0000000d
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x08037171
> > +                    0x0000000a
> > +                    0x00000000
> > +                    0x0000000a
> > +                    0x00010001
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x00000015
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x0000009a
> > +                    0x00000000
> > +                    0x00000026
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000014
> > +                    0x00000005
> > +                    0x00000002
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000004
> > +                    0x00000009
> > +                    0x48037171
> > +                    0x000000a0
> > +                    0x00000000
> > +                    0x9960a00d
> > +                    0x00003bbf
> > +                    0x002c00a0
> > +                    0x00008000
> > +                    0x00000055
> > +                    0x0fff0fff
> > +                    0x0fff0fff
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x080b0000
> > +                    0x00120010
> > +                    0x00120011
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00100010
> > +                    0x00120012
> > +                    0x00110011
> > +                    0x00120012
> > +                    0x00000010
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x8020221f
> > +                    0x0220f40f
> > +                    0x00000012
> > +                    0x00064000
> > +                    0x00090029
> > +                    0x00290015
> > +                    0x000b000a
> > +                    0xc1e00302
> > +                    0x1f13412f
> > +                    0x00010014
> > +                    0x00000804
> > +                    0x00000550
> > +                    0xf3200000
> > +                    0x0fff0fff
> > +                    0x0000023a
> > +                    0x00000009
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000012
> > +                    0x00000012
> > +                    0x00020000
> > +                    0x05058033
> > +                    0x05050000
> > +                    0x00000000
> > +                    0x00003000
> > +                    0x0a000000
> > +                    0x02000111
> > +                    0x00000008
> > +                    0x00030808
> > +                    0x00015c00
> > +                    0x00100404
> > +                    0x00001600
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000034
> > +                    0x00000040
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000020
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0xefffefff
> > +                    0xc0c0c0c0
> > +                    0xc0c0c0c0
> > +                    0xdcdcdcdc
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0118600b
> > +                    0x00000001
> > +                    0x0000001f
> > +                    0x00000013
> > +                    0x00000003
> > +                    0x00000015
> > +                    0x08161414
> > +                    0x0000000b
> > +                    0x00010001
> > +                    0x00019080
> > +                    0x07070404
> > +                    0x00040014
> > +                    0x0513801f
> > +                    0x1f101100
> > +                    0x00000014
> > +                    0x00107240
> > +                    0x01124000
> > +                    0x01125b6a
> > +                    0x0f081000
> > +                    0x00105800
> > +                    0x1110fc00
> > +                    0x0f081300
> > +                    0x00105800
> > +                    0x1114fc00
> > +                    0x07000300
> > +                    0x00107240
> > +                    0x55553c5a
> > +                    0x48161414
> > +                >;
> > +                nvidia,emc-shadow-regs-quse-train =3D <
> > +                    0x0000000c
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000009
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x0000000b
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000020
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000003
> > +                    0x00000000
> > +                    0x00000006
> > +                    0x00000004
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x0000000d
> > +                    0x00000002
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000005
> > +                    0x08037171
> > +                    0x00000008
> > +                    0x00000001
> > +                    0x80000000
> > +                    0x00010002
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x00000015
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x0000009a
> > +                    0x00000000
> > +                    0x00000026
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000014
> > +                    0x00000005
> > +                    0x00000002
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000004
> > +                    0x00000009
> > +                    0x48037171
> > +                    0x000000a0
> > +                    0x00000000
> > +                    0x9160400d
> > +                    0x00003bbf
> > +                    0x002c00a0
> > +                    0x00008000
> > +                    0x000000be
> > +                    0x0fff0fff
> > +                    0x0fff0fff
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x080b0000
> > +                    0x00120010
> > +                    0x00120011
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00100010
> > +                    0x00120012
> > +                    0x00110011
> > +                    0x00120012
> > +                    0x00000010
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x8020221f
> > +                    0x0220f40f
> > +                    0x00000012
> > +                    0x00064000
> > +                    0x00090029
> > +                    0x00290015
> > +                    0x000b000a
> > +                    0xc1e00302
> > +                    0x1f13412f
> > +                    0x00010014
> > +                    0x00000804
> > +                    0x00000550
> > +                    0xf3200000
> > +                    0x0fff0fff
> > +                    0x0000023a
> > +                    0x00000009
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000012
> > +                    0x00000012
> > +                    0x30020000
> > +                    0x00058037
> > +                    0x00000000
> > +                    0x00000010
> > +                    0x00003000
> > +                    0x0a000000
> > +                    0x02000111
> > +                    0x00000008
> > +                    0x00030808
> > +                    0x00015c00
> > +                    0x00100404
> > +                    0x00001600
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000034
> > +                    0x00000040
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000020
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0xefffefff
> > +                    0xc0c0c0c0
> > +                    0xc0c0c0c0
> > +                    0xdcdcdcdc
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0118600b
> > +                    0x00000001
> > +                    0x0000001f
> > +                    0x0000001d
> > +                    0x00000013
> > +                    0x0000001f
> > +                    0x08161414
> > +                    0x0000001b
> > +                    0x00010002
> > +                    0x00009080
> > +                    0x07070404
> > +                    0x00040014
> > +                    0x0513801f
> > +                    0x1f101100
> > +                    0x00000014
> > +                    0x00107240
> > +                    0x01124000
> > +                    0x01125b6a
> > +                    0x0f081000
> > +                    0x00105800
> > +                    0x1110fc00
> > +                    0x0f081300
> > +                    0x00105800
> > +                    0x1114fc00
> > +                    0x07000300
> > +                    0x00107240
> > +                    0x55553c5a
> > +                    0x48161414
> > +                >;
> > +                nvidia,emc-shadow-regs-rdwr-train =3D <
> > +                    0x0000000c
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x0000000d
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x0000000b
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000020
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000006
> > +                    0x00000003
> > +                    0x00000013
> > +                    0x00000006
> > +                    0x00000004
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x0000000d
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000000
> > +                    0x30000002
> > +                    0x00000004
> > +                    0x08037171
> > +                    0x0000000a
> > +                    0x00000000
> > +                    0x0000000a
> > +                    0x00010001
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x00000015
> > +                    0x00000011
> > +                    0x00000013
> > +                    0x0000009a
> > +                    0x00000000
> > +                    0x00000026
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000003
> > +                    0x00000014
> > +                    0x00000005
> > +                    0x00000002
> > +                    0x0000000d
> > +                    0x00000008
> > +                    0x00000008
> > +                    0x00000005
> > +                    0x00000005
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x00000004
> > +                    0x00000004
> > +                    0x00000009
> > +                    0x48037171
> > +                    0x000000a0
> > +                    0x00000000
> > +                    0x9160a00d
> > +                    0x00003bbf
> > +                    0x002c00a0
> > +                    0x00008000
> > +                    0x000000be
> > +                    0x0fff0fff
> > +                    0x0fff0fff
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x080b0000
> > +                    0x00120010
> > +                    0x00120011
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00280027
> > +                    0x0025002a
> > +                    0x002a002a
> > +                    0x00260026
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00100010
> > +                    0x00120012
> > +                    0x00110011
> > +                    0x00120012
> > +                    0x00000010
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x8020221f
> > +                    0x0220f40f
> > +                    0x00000012
> > +                    0x00064000
> > +                    0x00090029
> > +                    0x00290015
> > +                    0x000b000a
> > +                    0xc1e00302
> > +                    0x1f13412f
> > +                    0x00010014
> > +                    0x00000804
> > +                    0x00000550
> > +                    0xf3200000
> > +                    0x0fff0fff
> > +                    0x0000023a
> > +                    0x00000009
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000012
> > +                    0x00000012
> > +                    0x00020000
> > +                    0x00050037
> > +                    0x00000000
> > +                    0x00000010
> > +                    0x00003000
> > +                    0x0a000000
> > +                    0x02000111
> > +                    0x00000008
> > +                    0x00030808
> > +                    0x00015c00
> > +                    0x00100404
> > +                    0x00001600
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000034
> > +                    0x00000040
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x10000000
> > +                    0x08000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000020
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0xefffefff
> > +                    0xc0c0c0c0
> > +                    0xc0c0c0c0
> > +                    0xdcdcdcdc
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0a0a0a0a
> > +                    0x0118600b
> > +                    0x00000001
> > +                    0x00000000
> > +                    0x00000013
> > +                    0x00000009
> > +                    0x00000015
> > +                    0x08161414
> > +                    0x00000011
> > +                    0x00010001
> > +                    0x0000b080
> > +                    0x07070404
> > +                    0x00040014
> > +                    0x0513801f
> > +                    0x1f101100
> > +                    0x00000014
> > +                    0x00107240
> > +                    0x01124000
> > +                    0x01125b6a
> > +                    0x0f081000
> > +                    0x00105800
> > +                    0x1110fc00
> > +                    0x0f081300
> > +                    0x00105800
> > +                    0x1114fc00
> > +                    0x07000300
> > +                    0x00107240
> > +                    0x55553c5a
> > +                    0x48161414
> > +                >;
> > +                nvidia,emc-trim-regs =3D <
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00280028
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x11111111
> > +                    0x11111111
> > +                    0x28282828
> > +                    0x28282828
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00120010
> > +                    0x00120011
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                >;
> > +                nvidia,emc-trim-regs-per-ch =3D <
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00249249
> > +                    0x00249249
> > +                    0x00249249
> > +                    0x00249249
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                >;
> > +                nvidia,emc-vref-regs =3D <
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                >;
> > +                nvidia,emc-dram-timing-regs =3D <
> > +                    0x00000049
> > +                    0x00000104
> > +                    0x000000b4
> > +                    0x0000007a
> > +                    0x00000006
> > +                >;
> > +                nvidia,emc-training-mod-regs =3D <
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                >;
> > +                nvidia,emc-save-restore-mod-regs =3D <
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                    0x00000000
> > +                >;
> > +                nvidia,emc-burst-mc-regs =3D <
> > +                    0x40020001
> > +                    0x80000013
> > +                    0x000a1020
> > +                    0x80001028
> > +                    0x00000001
> > +                    0x00000000
> > +                    0x00000002
> > +                    0x00000000
> > +                    0x00000001
> > +                    0x00000001
> > +                    0x00000002
> > +                    0x00000005
> > +                    0x00000002
> > +                    0x00000001
> > +                    0x00000004
> > +                    0x00000008
> > +                    0x00000005
> > +                    0x00000000
> > +                    0x02020001
> > +                    0x00030201
> > +                    0x72c30303
> > +                    0x70000f0f
> > +                    0x00000000
> > +                    0x001f0000
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                    0x0080001a
> > +                >;
> > +                nvidia,emc-la-scale-regs =3D <
> > +                    0x00000006
> > +                    0x0080001a
> > +                    0x00000076
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff003d
> > +                    0x00ff00ff
> > +                    0x00ff003d
> > +                    0x00ff0049
> > +                    0x00ff0080
> > +                    0x00ff0004
> > +                    0x000800ff
> > +                    0x000000ff
> > +                    0x00ff0004
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x00ff00ff
> > +                    0x000000ff
> > +                    0x000000ff
> > +                    0x00ff00ff
> > +                    >;
> > +            };
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/=
nvidia,tegra210-emc.yaml
> > index bc8477e7ab193b7880bb681037985f3fccebf02f..78e3417d273a329b77bf2f6=
1de41b29017be56d3 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
210-emc.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
210-emc.yaml
> > @@ -44,6 +44,44 @@ properties:
> >      description:
> >        phandle of the memory controller node
> >
> > +  nvidia,use-ram-code:
> > +    description:
> > +      If set, timings are split per ram code and expected to be in
> > +      subnodes per ram-code
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^emc-table@[0-9]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +        description:
> > +          Ram code for this timing set
> > +
> > +      nvidia,ram-code:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A regis=
ter that
> > +          this timing set is used for
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    required:
> > +      - reg
> > +      - nvidia,ram-code
> > +
> > +
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.48.1
> >

Thierry mentioned on the cover [0] that he is trying to get the
bootloader I'm targetting updated to use the reserved memory tables
already supported by mainline. If that gets done, this series becomes
unnecesary. So I'd like to put it on hold for a little while to give a
chance for that discussion to happen internally. If the response is
negative or there's no response after a while, I'll pick it back up.

To give a bit of context that answers several of the review comments
though, these dt node names and types are hardcoded in the bootloader
and thus cannot be changed. Like the sub-nodes are named
emc-table@$ramcode and emc-table@$freq, which then triggers errors on
the schema example if reg is not defined. And if I have a reg in the
example, then I have to put it in the schema. Etc, etc.

Sincerely,
Aaron
