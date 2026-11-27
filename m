Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772515;
	b=io7f7ItdojcFxgSzZe0v+twUoUkZclcHCg5nbsAk+U+bi5KpVF1sNCqCZQQ6sFYN1fB+
	 fEWZ+gECqT8s2DyxbA6qTs2cXX66COOD2AXuBM9AnDlQCEVFaG2SczDKmUfrfG8clUcQP
	 bo7cT7Gi0qJHAfEPzQuXkNxBkjwZEQ9ri8hFsRv6Kbb8wNlOoB5qrCSZgobG4vBc6JVIC
	 YYQGtxpRI9plhf3m5JS0eXT6psbFZvVN2stN+nC1lu5TAJm7qBZ2fdarWCdYktmATkzi/
	 hz/+1xFguf7YHKaUSb0mHjU2xn1tlyptor1hadOqgRXB00MpLOzv/vaAe2StuHkk6xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
	b=zxolskQlnHd4z12LK4qdrdWyGnyCu2kVUcqTSl2QWb7rGrkbj/N497Xlgathl95YWzCv
	 kwcnUfbp86sWxAL3rjWtQq9odGqKzAhVUIVkQbvgAXc/5iP3eL57UP1UIkbDglRJk8zkq
	 /iBryf5RrT3hILgndRQbV76wTH2byaUZw+uQoVHd7ndCco5Rm0g/s27ZGLymXUuYaAXXj
	 aEz5cU79PbG7L9NahKfl6/+uYifiiKDrQw19sXo6Ejd7mk3gPwZ5I8L7h0qfdfiZMiWr8
	 ROC7LiXmaK00wQvgD29gIemWaSlmN9sCwAlIiyF4pk7PzvoO4IFr7QB4nvi85q5ArAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52689606A324
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 09:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52689606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKIQG6gL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386c336eab8so4318948eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 01:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772514; cv=none;
        d=google.com; s=arc-20260327;
        b=me8kjYvzsWfYUl4Z6ZB8h9Od8qhI5g3J47o5TMcSwh5dIiXs3UrF03hS/qhSNx4F7i
         0+BRNhtMIMAfjHwd8YorIp/3pOOtsgyulcjEy34S1vv64BzhBhag13J7JNe959hfW8UU
         a+o6IwNLMhZXt7u6Ok3llBARWOapZfceBHdDQRVnwhtd2Q0Zruguej+tjrfqsYtxtkDk
         egrgxqn1WGtBIUNwGClqcOviXpbNrGll30eXQbLcQAYhXwRLI1rYxjB1186+m07DAMkc
         sti9e2ut2Q5rcYl7gfrA3eZDKl1iW9/bJq7Y2qwwuSxhEESGzJicF+p3ODXFogC04H8U
         uqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        fh=tOj4fsbTV7s+hxuomQ5Czx/za3MlzGeNi2x3hRjbsf8=;
        b=RdDk6x51d9erxK1VJp3GTwMjjEjRcIJJunxGxF72sbEoA28vaJ07IVzxu+MyaXTGGi
         VVU/RwIVB6+RYWXBiW0ZPxgLeCs6LvP7lYoHuzePrcvcNPn6FuH1+SZxtE/k9qDDSedZ
         sleJlnYnzT2bkHuriO5wlgDLIrHibRdFNQOEAbS2jNzE65pi4V+2fK0+80B75MbpuQhu
         eHM5sawi2CivbhafTW/Rnq5iZhDRlN+xHAMPZtfGn5ZdaAmOb1KuCtu3V5Twyi26Euxz
         HUoBY2H0Ap0Ac32Zxqse7zrjOfqHpoL+E29odZT/M2497mDm1rU+pk6ccizFpdJSialL
         Fe2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772514; x=1796377314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=mKIQG6gLayQpySPc++5pyBCdaz+iricn1XEKwxSX7lNyZ5a4iV//cjVXw3qCToQqtl
         sl/T/I2kYuIRr9hSO+s1m612iSUADHJ5u6WTxZRb82D3cJR819odyDr6G5Frxq3dx02m
         1ooXAOSN51uNnkL9FtsbC5jQq6KrzRUi4wkVf13Qfy0NlH8NL/40DDJSo90YjbHHPL7C
         QPmalFiVGTMTfP7s5xNdXxGUF+4twCSseIwIzrjMZUfRcMN4kBCwIvgw8Dja5AdPjjnk
         O0T0cfXan96mkJOuYIOp5ixxhshO7cxYaybHSxxdJc0Rvdnp+0zuVoRukByTQYRGV5Tn
         dW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772514; x=1796377314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uU8/lZDNdhVavctrYy60KAkKa6LqrOSME59pYMkOn0=;
        b=CynBIpISGnlZDNuBY9CHRprtipRGKbQ577vzASnAc+HORuemSToJTYAxUWqe7YzX7I
         UycaB8FNRY5WSQnGpemgZobJVS15aH2o2azGu1+4wT6Cj+5pScZEnFOcHzKSUyHVoJXt
         gqbGcpfJa+GhSmBdlN2JGUhFnFyXztFqxHEVMSNJjoaLUCqZeBlhxq8GIydweo0thLxV
         j228cLrkMGEkRksRDbeh1NH0uIcf92g6AS5iClKBNCiqlAWb0LNSBXH+j+M3/heDM/zg
         BFlJr1GAwCMlfJXeopyF9Url9xXryEODFrqcw8q1d0rURZ6KdN/PRc+AcNZDDb8uqld2
         XkAg==
X-Forwarded-Encrypted: i=1; AL+hErE+8j1RJChkyXy/PjAiekXQbuOPVNmAawsjD1LqQdJ5ptr/NbcDrXy5nqV3zTTYNbUcPhCC38lAwVgNYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lmQIOXCZoJ466z0IpFjU5rKpIzrrwcDUQ3f+jkq2IriJL2PWH
	sR1pAIOs9ZfUhl/KW936ZzJ+srIHy/Tyt35cs48VcHoZbmbqO34VQgIJR0mJF1I4efMfqbe+h04
	pfz+T/rYuacWxYTnf6BwBx3ctLWYMXtA=
X-Gm-Gg: AZFdTZeFjyBjyvs13dOVrZ5NhckoTZrdMTDQ/ZmoC7mBCr+Y7z/t7G1G5CSDO6PQU8E
	ZacZhop83TY5qqMriQ7c9I+l9gMr+7/8UB+cIcqP5QAJxPo/FFNV+MVyUUSAvuYtYI+3LHDWOnD
	26X1mu52edjqJ4Y3NpqF+Zi7ZkGiOOU1Fa/liDgUkm08v5qRUq97yOxf+PcNe6NviKfm0js+Noe
	mh+dcvzahoYK9VTuC+4oH7+IVWPgpcGYs/UH5lMtmMlVs3EMABEdhvzmmz7UD1UZnTUbTFa7Gcq
	evWsZ0t7cGodWpBA92kc+rpQ99bdRpPQdkGhHkH86bqQwrZM6UMP3RHvhyKMD0h3O+MjRBry700
	V3NWjF1ehs1DBXaxG/Q7R2CUHBQlFmpqBgGjH30wT69eSD50FsK1ae7iy2ZRr5TsVqiJty1PX9S
	6It+VepZvhzOuGRmC0Ef/DhR7mJI06CAwBt1oU5dUhayUoD2ypsDs=
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id
 5a478bee46e88-3869ff18213mr20461146eec.4.1795772514372; Fri, 27 Nov 2026
 01:41:54 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
In-Reply-To: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:41:43 +0200
X-Gm-Features: Aa3M54q2qhxyDM_Zeh4LfrLo7uscd-ydHCRlf9uUlV1oDTURq66rSYIDmKEA6Jg
Message-ID: <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08=
:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Parameterize configuration based on bus flags passed from the bridge =
or
> > > panel. The list of supported flags includes now pixel clock polarity,
> > > display enable (DE) polarity, and data alignment.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
...
> > > +     /* configure DATA order and alignment */
> > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > +
> > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > +     else
> > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> >
> > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> > bit ordering in a classical way, instead:
> >
> >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> >               R[7:2], G[7:2], B[7:2]};
> >
> >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> >
> > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > panels depending on the layout. So the correct value depends on how the
> > panel is wired to the SoC on the board. Hence, I think we should
> > describe this with a new property in device tree under rgb/dbi or
> > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > document that this means the above kind of wiring - not all RGB888
> > panels use it.
> >
>
> Ugh, why is this so confusing...
>

Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
properties and set 0 to msb (default) and 1 to lsb, or directly set
boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.

> > > +
> > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL)=
;
> > >
> > >       tegra_dc_commit(rgb->dc);
> > > --
> > > 2.53.0
> > >
