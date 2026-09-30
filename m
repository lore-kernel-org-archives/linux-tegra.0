Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058AA4A99D6
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765821; cv=pass; b=J5qVMXJ/Y72bEjDqAgVZMdK+4cGLBXeCLEa/qkPA/g9+X2BkQX63vkmv/Kvt2uGJjzri114HimhuJQHvrmcKbjDn7ySuWEVIUj9rK3CzbGPQhWdobS3a2fB7cN9ZRPnNF5rvQQnPg5dhLgrayZndkPYtQc3ThdcMZq/rF/JtIGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765821; c=relaxed/simple;
	bh=XcbWL0nrpyuw33WpWCVIaEEAxdeZN3j0ShZSAAf0IvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlniWoJN8lv2x8LwVX2coL5clUiWLxaty6icuzK0lI+2wooL9eN1PXnKpVB8Qro3KYIuG8AZuzErEDpvmQlPy89FxyDUNLDj81cATGtL6W9LP0zDuo6rysaWOI6u/1QpmjswiLtwMtKo3Uu3/c8nW32FOxuXtTbHEoFRRHDNfC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rybekjI9; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rybekjI9"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so6582904eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 03:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765813; cv=none;
        d=google.com; s=arc-20260327;
        b=p3ns7mhUYZpjDvz90rAgbNVkmXOJ+8ccYu2U/eOXYYrzJx0FL5FGFCXCNSEegjh3vq
         ucB6TM6AUc45ZIE4GjQUj+GWPVI+ODW0oeYD5wxQfGLcEA/YEldEETMaauhx/ZNbC1w4
         PCjWBWhDyGniKlXj+9wDrg+boJ2W9mPLWSmR5xqXrcex7sGZ8Ouh3jF1WNALGGs1Upyu
         FasMeWJjPj7wq2T7JbUCC7iUj/8ufOawM+kzgnFoDhqj5L2LuxvGOsw9tOcwyYdWhott
         901jxizCv0pKxIkZIvfzd9N51U4Wo5bfMtCkSo1ZxFaJKk6QCXbhFTYMwdmjBHT/HFI0
         q9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        fh=WObqGRjY12GiEHjFpIcB05CIO4WI7T84XmoZQ1E3ynE=;
        b=WBEf7T3Kj6J9Ab+gKjLijd5+tu0cDr9umAkUpuFhqpkbhkPT8Y7TlsILYorCzq2R5/
         XdDOUVhgLLm5V9V6ewUNZipmlVSSS1bZ77k61+yvM6K7/LCSQzl1S9L0Q9B9f4apPRzB
         gmiPeGrhxkbzgnf0NTDogyrt7drjrxfPrW9/N9CpZ19AsI9VP8lgrki/bU0BPbO9T4RW
         UuSnfGvo6tuouqfWl5Qc14E+dnUdZ96sfrZlBMcMuT5sciAt07CVQOVxKZlhr+MGfJIn
         ub8w0UF8FXOTGr+cd0izo5qICNiAfCW+MCbhpooQ20QfhFEe+QCJugc8FrO1fyG5hHOa
         5d1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765813; x=1791370613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        b=rybekjI97RAVJGUiavX981Z73wuvlnlE/zrBODzwCInnQOwdhPlISuQ5rLl0FIPb85
         NS0FT+J/EAfjMdLE4efQfweGTUVwKjo+74cUPrWUT+QxkFgLD5E69TLxatvrCwnfajvv
         hE6PTIb2XDfEZzJPUKyrrJBilupezt+kToq6FhhJiKkNxQv6jmyvbJ1QWF4k9xwW4gYz
         45viYHNdfLBhRhAlFZ48YCyZG/aTbCBI1TKl7upDs+Zs6JEZP53FRNybEHavT1SKCLWK
         Cwx2iAXZJQNxVscL1GUC890mkO8vPNhu461SOo0EH7a6aQ/+x82aoOvCQMse7Zl6T95D
         7lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765813; x=1791370613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        b=tpgz0nO9dHhJFOTy5lIH227n8NL5TY9Bvynm1QOaxQdjH+P8DYIxuCPXwOltUeXu7v
         FkMvgnDs2wLCC0xuOHmnsmXPkAdBPCsd8NDHN/t0VUmcp+gAsHb6ETKwc6Do1q4wtvbJ
         yZlwf6FNYM2PgXx/8VeiBZyQglqx342i1DZ17CorvADkwOhyHRRCWYHVe4aku2r+XFUD
         +chinsZMjxHOka9HxQDJWTVQLj6c2osvTNrVw2XblfJza6Gs9AJFYU47Zw1W1VBFVIA+
         lr5UyDcFZ4zV3sJ7PVql/qiCkXFcQzLufI2pRe+Kq4hvlFj1uZH9jisR25Yz2/VdVdlS
         8NDg==
X-Forwarded-Encrypted: i=1; AKwUvBwPYUkevmJz+S861wlbO5PNbJbu62lpKzLJeJ0AEECJFVUMdf+FZ9N5pjyFudC6usoUSngPMlB9qlu/Tw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsWFVzGz4nbddSchiMgQOfmSmT5qEkIY16E0SvDP1A3H7TUWwf
	UXCZ97M7n1k/+CJ7gvsmhuWHaGyTVkehG6/eigK5BuVmukygaGZxOBI1/Vs2H99vB246M7RzCgB
	KOYIOu17Ebtc+EovI0Sdn6zkro+eQ7QtF4lES
X-Gm-Gg: AYBFou2rTlyG7jrS3IbpC6rzVvRAHv5KmhdyvX4jdhltrsJ/zh52Vbt8NngzRAgHtfA
	PM1cl3bnpAHHjLUi/aa0SFbGAH/yVM9A7i99TDoJ/1IDql7JSYfmKnmPFXf2ewZbIXbKNCikU5P
	4ufBbxz8llVqDDLxO4r67Brb9+jFiorvJU0O8gsYzow0uR3k9bb+RUY9th2a4DUdaAOBmm/5PtS
	BxSeUczCKSK4+ZsVngX//Z7XD6Ksnwg6N985FZpEgi4E+B7VYLPVAIb2zvn+/FHpljWLBS7+axL
	sd/LdYwK44/S3sWzgBRsGmAVTHzfZPrukx8oq4WQbnHKzWm2+fDGvENOMUMgL2tIM83GEvTwBGN
	KE7eItjIEJSLcNPT9/y5Ssow=
X-Received: by 2002:a05:693c:42c8:b0:33e:a0c3:4163 with SMTP id
 5a478bee46e88-34cdcca9e48mr1323411eec.24.1790765812417; Wed, 30 Sep 2026
 03:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome>
In-Reply-To: <arzn-TNbOlqXqQgd@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:56:40 +0300
X-Gm-Features: AclHuK9oLMebZiHh4azYE1DFmusVvYbZfHXPOcFGt1h-TD62cN-nNm6dZ6ICVfc
Message-ID: <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:50 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wro=
te:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++=
++++
> > > >  1 file changed, 138 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra-8bit-cpu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml
> > > > new file mode 100644
> > > > index 0000000000000..f0dab608b2936
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-=
8bit-cpu.yaml
> > > > @@ -0,0 +1,138 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit=
-cpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description: The display controller in Tegra20/30 SoCs features an
> > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > +  protocol and is referred to as '8-bit CPU'. Each display control=
ler
> > > > +  provides two such interfaces, which can be used to send MIPI DCS
> > > > +  commands to initialize and control the panel while image data is
> > > > +  transmitted via 16/18/24-line RGB.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-8bit-cpu
> > > > +
> > > > +  dc-gpios:
> > > > +    description: Data/command selection pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  rw-gpios:
> > > > +    description: Read/write pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  cs-gpios:
> > > > +    description: Chip select pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  data-gpios:
> > > > +    description: Specifies a set of 8 gpio pins used to transfer d=
ata.
> > > > +    minItems: 8
> > > > +    maxItems: 8
> > >
> > > Based on my admittedly brief research, according to the TRM the displ=
ay
> > > controller can drive all of these pins - of which there are two fixed
> > > sets as you mention - directly. So we'd need to describe which interf=
ace
> > > the display is connected to in DT, but not any GPIOs (which they real=
ly
> > > aren't).
> > >
> >
> > I am perfectly fine to not expose any gpios in the binding, if this is
> > preferred. Only question, which method of interface checking would be
> > preferred. I assume if primary then nothing, if secondary - boolean
> > prop "nvidia,secondary"? Feel free to share your vision.
>
> The driver currently uses the GPIOs to program DBI commands, so I
> suspect we do need some way of controlling those pins. Or is there a way
> to have the display controller program the pins and send commands? That
> would be much preferred because it would more accurately reflect the HW
> design and possibly also simplify the driver because it doesn't need to
> parse the GPIOs and then also not use the GPIO API to set the values.
>

From what I know, GPIOs must be used and freed after use. Sets of
GPIOs are defined and remain fixed for primary and secondary
interface.

> As for selecting the interface to use, it could probably be just a
> simple, single-cell value with two valid values. That's a bit clearer
> than a boolean, because with a boolean you need to explicitly document
> what happens when it is absent.
>

I can describe boolean too, but if you want set it like "nvidia,head".
Fine by me.

> > > > +
> > > > +  nvidia,init-sequence:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    description: Device specific set of values used in DC DISP_SPI=
_INIT_SEQ
> > > > +      registers.
> > > > +    minItems: 4
> > > > +    maxItems: 4
> > >
> > > And AIUI this is panel-specific DBI commands the display controller w=
ill
> > > transmit. So ideally the display driver should receive this data from
> > > the panel driver.
> > >
> >
> > This is not panel driver data, but it is panel or maybe even more
> > interface itself specific. TRM has no clear method of generation of
> > this seq I am aware of. Maybe I have missed smth. These 4 entries
> > co-respond to DC_DISP_SPI_INIT_SEQ_DATA_A_0,
> > DC_DISP_SPI_INIT_SEQ_DATA_B_0, DC_DISP_SPI_INIT_SEQ_DATA_C_0 and
> > DC_DISP_SPI_INIT_SEQ_DATA_D_0 registers of DC. Maybe you have some
> > info to shed some light onto method of generation of this seq. Then it
> > could be simply removed from binding and calculated internally. Thank
> > you!
>
> Even if this is interface-specific data, it is still defined by the
> panel that's being used, right?
>
> As such it'd make sense to integrate it into the panel driver and have
> some side-channel to feed it to the display controller. If there's no
> good standard way of doing so, having the display controller read it
> from the panel node and programming it at the appropriate time could
> work, too.
>
> Thierry
