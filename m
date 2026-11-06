Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974288;
	b=NvOlZSzushvoO1wr04JwONjCmixnTPg8FM6g5xwJQuAVVKRNT1P5o2n4bUM1DpmkBsVx
	 w+U+nvHzkLdPlOEooMBFoSw0wPvrZzMPbe6v6TTF1pBLLlm6yuhr3MDLpyF/+StAOnORd
	 ain0zVuKFiX4lngFO6K0kD/LAOT/f4vkjRfKPbA/GJHijDKAjyecRlwFnTK5VFm3PHYqA
	 zpmaA+QkBiIcIEEiVIRo1PMaCm1GxMJmF3DZZ+k3R6SzcBr9/btU4dAAbPLm2/n+jIOnt
	 E6ZHeB92pyb5if0eDVvSZq0ito7FSAQRuYq/ZFcMKkgZ6ovPbqOaxu2unkJThavzrJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
	b=cnlMtP8UKCtdcfMFSsjPOe1oIrIj6dNDQR976f9hZuH7QMm7zbsGya8a8ThaDAXM8sb/
	 D/IU1OY/jJaFOvxMHpRUJJDpeDSw0W5oE1wePiCAFqrtbqo9WSx1JdvyEFnwAH8fxPgF/
	 eW9Q8w/BgdF1X/dD6LpVth0u57Wj4exPdHQTnVVp/vmqCa9cTL07C/pkQbas/j59mJpjb
	 FsGnrCay5Zs2wSceJUGg9viMcDQE+qOowR/EWZTkXDg0Ekc4sMHzrYuabBDbmofuGTd3t
	 cTMuOLUN91doCCO7qcf1fORB5bWXlYuJgIn9zYkCJbIeN360scfrbcQ3O7l/lsAQp8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B4606A329
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5B4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d21051042so91503166b.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974287; cv=none;
        d=google.com; s=arc-20260327;
        b=e3Dm+rUd+Pd5WKsDaD670SyykBi3VIUOG2YjfyvwhwhvIv+sQJuEyu53rlo+wqxH9V
         xscqALUtjDPzq/dzXqIbcclTtEsjygwD/kGIPmk0uP/wfOydZbixb1JkdroUA8dPPaXT
         X0qsqJpiBgJHO6ua20oFEXs3xsy2N6Ijms7/lr+KbeXu8Ulfm8nIYdBLOuxosmlVW/pg
         UpwcZWuaeqlM0Gr5FJxjXwVYS3km4LcCyYYhKoyq7W1vRL+uU6/eyo3/gS7Mr44oWidU
         QiGSJEhuLJWsKwoUe2TfkPGPD2kHdNuWxDrnLMNE0zCoFWBauPQ2gNl6ElUN3Yh7gJa1
         HElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        fh=TjDRmN8iSAH43xHcRjd4RbPAEpttn8g8oXedSUf2Aag=;
        b=kTUD2Z2TbdiTRtHhmFrU1V34DyK9KgcoWgkzUiX1DZmpImiifGZ3NSEqpH8HYI873w
         XzM5HkuY15YIU8gHP2R2Uv/zuITz9booUn8WAKi3Sdh7Cmp6yfGsOA0qVTstKKc8ZiZP
         YHhbgc57oRZJCOaAuLMXNBcR5o+zbnBKWyBpyIeFAykyq7Mj14OarD0biyUhBVFFbIgt
         PFrB2Chgj8hBqQTBEoYsctyWKJrJ2sp1O/eo7XPcisZ1CJte4VnM1d9GsXPebtfvulFf
         xSB4MaGnNsf8WJuWc06LiSIvZ61HsSWywDs7B6dnTxQPuKtqBB4eHBEVRow6/6BUPsAK
         tmUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974287; x=1794579087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=wlF9vvx0jjxE9XlesKjv7QSscrOhN4uaUzQXjeIb+ig4zHVGuWCB7p7+ABbzV/xMB9
         v7QxICPrlsJx9mwTtSctvbTJ3/f6d3Sye/9JZDoHyrMCbuGZdZ8rlzMY9Wglhk5uK/EY
         J98XpdHuLfOMg6ZH2rPyE2gHC19j+bxjIkhL7oMyDqF0ItWJEgiHdJZgxiZQ1bXRgpnU
         +B6/nuEOkEmf4scBkKkpbR374nG79tbJsqukzj64xnPULQ7q0Iu/BNmEPeAz1OeevHte
         HePrgXhcAfQT9VSS/UCDvZxmdjO8x+neHVtWLYHaSxuXB47Ld3p+asftyratZmZQXnqM
         JSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974287; x=1794579087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=WVkMBBEtanC+LWKhIyF0rOMG4kloGY7EhFuFp9vUuMcLMrauIo7NCW61SNLxwS/mCx
         7wyFqqYqSVfAnoVQtWzO5gj0z3mUM9kNuhJufjLZlcv0OKZoJDgohAN4YIsZ1DK2xq8b
         v3DVuMwvpTJkXW/XZdoKlCKEO4/1N0vMMfhhiKypwXiIJTiWxhIo/crnNCGQO3uIMl5m
         y5+nmliKIabF+1nzPNHjS1fWSBAXcnWnwXqLvfy+Ot9N3DcT13HXM6TUKy2KZHcOcNtU
         dBePP/0JL6LfFXxbiTi25R81FQVOVMXgON1gIhjKrvYmLZucFLpNIFtGCuroPBfGo362
         MumQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEjxh0dnHxiRJXu8cQm8hqSMeJjpPSYPwz6U6ZlCqXVHwWoziRunyVqbbhVCitTMIjYq4AA96dJ7wOCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/c70ddzlA58EDm8EsHpraaRQoW8YHrT+9wRpCbXX4fMsGOVvx6
	C9KhHZ423HBHZ8UEMWV3fp5qXQmb+XkVjnNsY585SkfO/c2sxLNJJ5z3S/NAMIuDD8L8/dT42Bs
	A53c6VxS0908QaueY8zw1vKHdoB3ghPU=
X-Gm-Gg: AYBFou0HbkSOJO4xqvxvQf2ABwRHLqS6qtkH+SK9xzDSfzcBKj4QWmBSF5krKBsY9dj
	GQXgRcTL4BEky35VbNz4ppeIgobVY9vh0VCLHfAjlALb6eexKmciA/ZYD1aav8JGQNuQumaixwA
	IBA2gr+IbrDlJBn6IDJi4pzuLM9MYZGehnqlIfQbkBa07i9lgULhujBzTAZS8R6kO5FMosUffNC
	/FbggZlJhZAT6OrjGXdrd04QdsMLQy41sBWUQ6KYh+iBZkOlQ2KkcjADoQXf2NrP6Lwg4SUauYL
	y1poLeoDB6/c+6t5xM3NpTk1xPr3O6+cKU/mODWO0c9K//8y3Zn8njYUojbqSPcEUK7Dq3yry9A
	csX7/VgwYltGVh6rELqIqa3rG0v7dSN8PWoOqpWygYkP9Vaoz+cP/QJ8wT3uCT82T2Ol4OpvXHj
	ICu6G7rBe/VN1SKICr6kL7gWcDvgaZrg==
X-Received: by 2002:a17:907:3e8e:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c4d3526bc65mr237868866b.4.1793974286564; Fri, 06 Nov 2026
 06:11:26 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome>
In-Reply-To: <au3etybQlb5CtjBL@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:11:12 +0200
X-Gm-Features: AclHuK8vFqFS9sw3roYv91eoeg5V28eK0ZMbIUEIj7uPY5ywLKX-LdV7NUmea50
Message-ID: <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
> >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> >  2 files changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-dbi.yaml
> >
> [...]
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-dc.yaml
> > index 69be95afd5627..ffeb124905dbf 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > @@ -79,6 +79,16 @@ properties:
> >    rgb:
> >      type: object
> >
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^dbi@[0-1]$":
> > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
>
> I think it might be better to group these under a separate dbi node at
> the top-level, making it a sibling to the "rgb" node. If you add
> #address-cells and #size-cells here, I think that means technically the
> "rgb" is now in the same address space as those new dbi nodes and would
> need its own "reg" property and such.
>

Only 1 DBI node per DC is available. Adding address/size cells means
nothing for rgb.

> Thierry
