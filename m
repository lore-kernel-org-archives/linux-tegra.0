Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D5133F5A7
	for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328674; cv=pass; b=PNg91p7QUWZ2wijLD3SqBuyBCKnyiC+RTdUuPYbtKmFu8CI4QdZDZXkeDIOR6iUPEvKgyGTzlCN3DXahZVltYyjM0zxNXOYc2GqTc5zf9vEdzUh2Y5mxHODrlI4VeBDNRhLU59p3RyGEy/VUj7StADqOW4cEUMc0BONMplBzOWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328674; c=relaxed/simple;
	bh=n3ZdwtFbjDiH9EBOiJIwiZMSWbVjFjhZRnyxPeovuLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0jrcUh09PsCmFx0I5+pmrj+/AT7pX4dUcno4jw0PdG2hmAlP1mwAVvgzQJAVhm2YeJ4DndZ1R3geJJjuQmP5CspG5Vyr+qHkmNqPWvFQC794X1RzVBS2RKqhOLe/Vj5+luu4pcyznFLh90GwvDLLjDdyXQd6fkUUUDqNIj+c2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDqZcH5o; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDqZcH5o"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1222617f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2026 08:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773328671; cv=none;
        d=google.com; s=arc-20240605;
        b=WzKeQ/KOIOp54cCcKfOLaTwlBwYDeH1jnzWGgbHCexVdc6BFp5WkBg0KfVXlenCxvF
         0YbIGYfgcMffNafTc0Haf0Z92mybmEeVOdX1f9h7HjQzsGFj4jrp4eLg7OFmuBqwfV1k
         CGnKRTP5KlFJGDTRt5/NeIzqTLEGeoEaUAk+vcjAvlYsKj8uvNpqOeBWHFGpIRNzZ9m5
         NRCxoKT1zWbuRVyB9tSg01lZKg8ZobBNYJtZT7m0kuTrv2o8waRwiueVP502Eu5OKijP
         5OKTDNxFZIH2SFMxkNMVldgjK6VeKZCiRlnhAMf5osDJUocQ0Bzq/ekgi03kU//mjMl0
         SsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jo2s1AAf8ngQgnPyrjkllIL90Gv+XfCJiqjmpNYyaq8=;
        fh=ya+qVc4h1thmXtGYWDjDN2Ndpe/LGnlHEu32t/Z6tH0=;
        b=cTFDrpfKQRuH2jYr4GtJ9ygNXn1jPmwEAZNUxR0qBB4dtnVZ90Y6dR8yBfoBwHSQRg
         Y2HNjpKb3oVmgcfR2l95VTKdSizve3/zghtvO5rEpW6/s42wGfVlODozmTsd3TR1OOzd
         qtYVfLStyc38c/tcAujYBT0/YWY9Ms6rsYZs24Ff5uRn5ZCETSooL2ynBDMIkLULp3m1
         5PAAMXLzyLNJoeUTAGWOTfQt/We84/j7X0i4BH8Yh+RavGNotyFWzUNC5xcZPQKKvgMG
         h2k2oFjAeAfD4RXda8zMIFXSMQFx9z2od12qob60dnHMKe/FdwLS980lyhQVY3RZpcT4
         UeGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773328671; x=1773933471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo2s1AAf8ngQgnPyrjkllIL90Gv+XfCJiqjmpNYyaq8=;
        b=MDqZcH5o/LzB2Lfx9tCUg3EgA8GkLGlXUTjojVMaFHXkuwLQF3pxwEJHuWxjMRpfhb
         Mrb3GJNUaBccsggJfvyKgltKJzw7kZDtUM95RwrcR/4ZGv/L4h58sGeFH6NW5iXIPUhs
         rZKl5IfGoAmcMNcX9PWm9couzvsJTB2/Hedsg9n+qk+RFqg6rOFLmS4wddljVXzRmMDW
         JoRYRfAn7oNJylkux/GXw/PL8PoHEqLB7BKsNot0Ppvzpw6d4dcu0baG08d+zP2Z/YDB
         SasIUhs10AgvPVROPYsPKJcC0d4Z+W+pRgPDyDHQFD+3JY+4ygNJHwKpCn9pPgK1J3EB
         ymVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328671; x=1773933471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo2s1AAf8ngQgnPyrjkllIL90Gv+XfCJiqjmpNYyaq8=;
        b=v4e96xxUGL+exhokfr6ZY04STyMIMpNEn4Q5rG+n6NaTZvIB9HOOhePLsGc0FlF9o6
         NDB+z382MKSRCuHnnrhwnh2RurBYYIj0N0YZ8VK6N5W3/16QFU6U4fazunWji9p50VpA
         iM4PCSp8H1h1VWq1GmTm2z2w9zhHKNRCRFXKy57h2OO11hw/ZpYT+lLiAcqn5SkuGN98
         j136LsVWA2eT5UIvl3eoVKETOvIdAw7AZmMR0xN4c1MMH3aZkK2ul+1R3HNVm1VTy/7h
         JZWdfI0977gs/fhwiA+UQHIejiNmbUI89APOUrc/92WOGu1q88pGn6J0ryjX8rP6VGy2
         NpQw==
X-Forwarded-Encrypted: i=1; AJvYcCV3L2sGbpw7suDSyNbGfZ58oYLs67eJIyhSkBjGBiwFriIDdwq3FZvS6U3OBvBCGFsSAwZjuf5k7oorFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7ftM5wEaEJ3RzsYmcLAR3VvV8glq+OEDWlNmfVVTucEfU9Om
	gSE28Fr7DCjpRPLOsr8E72jW1UA4vDiDAwTTk8lUKyg2qYkAdCDm2FZ8P1tb2YdAAPD62KDjfMR
	848YIwDAdUS+/xYXkI4+dcO15Nsv/MOE=
X-Gm-Gg: ATEYQzynpeE5wOQD6Fan2kkk/ZhnN7bNz2UjgWZavv3fcQgOBJyr+lTMKT9fFJBrWDq
	SAUhHQ9+6aqvi6nZ9fhyIM3KEdmFvIbIHUnPJ+j6Xwp6MhpeMP1R7UqvI4chq58d1jvfO4R95Fz
	mCZzLbRdwtSpWwTNiCuS/eKec0yPlTmDHolNrqcwNd9LcgmQCi9HJIJ28pTZ9H9KbhLsxobQoYL
	/emnz9NEb+i0iKlKvHUZc1rMxjd3odfxoYzFDMp+fe9suxMvSVgLC6IYnD7Is7uTrVZkW5K/w/x
	2/+12XKm
X-Received: by 2002:a05:6000:400a:b0:439:c157:256f with SMTP id
 ffacd0b85a97d-43a04dbbe1cmr93582f8f.33.1773328670951; Thu, 12 Mar 2026
 08:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305161035.64548-1-clamor95@gmail.com> <20260305161035.64548-2-clamor95@gmail.com>
 <20260312145743.GA3116703-robh@kernel.org>
In-Reply-To: <20260312145743.GA3116703-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 12 Mar 2026 17:17:39 +0200
X-Gm-Features: AaiRm51WovXJ63_4ynYJM6VsATVlyafbG5p2Q-agM7njMf0supe6EPuiPgTypQg
Message-ID: <CAPVz0n2JjD8MbxuX831QkYbgp-X5Bw8z7MMnNeCLTwU3vHYKxA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 DSI port
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 12 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 16:57 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Mar 05, 2026 at 06:10:34PM +0200, Svyatoslav Ryhel wrote:
> > Document the optional port node, which is required for correctly modeli=
ng
> > a dual-mode panel.
>
> Dual mode as in command mode and sync mode? Or do you mean dual link
> like panel-common-dual.yaml defines?
>

Dual link like in panel-common-dual but that panel-common-dual should
not be suitable for DSI controller/host. Tegra DSI expects panel to be
defined as in dsi-controller.yaml while this port node is solely to
cover dual-link mode panels.

Command mode and video/sync mode usually refer to how driver should
work and usually are not mentioned in the schema.

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-dsi.yaml
> > index 59e1dc0813e7..0f4837648d17 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ds=
i.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ds=
i.yaml
> > @@ -83,6 +83,12 @@ properties:
> >        gang up with in order to support up to 8 data lanes
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  port:
> > +    description: specifies the connection port for the dual-mode panel
> > +      and is required only when the panel is operating in dual-mode
> > +      configuration.
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +
> >  allOf:
> >    - $ref: ../dsi-controller.yaml#
> >    - if:
> > --
> > 2.51.0
> >
