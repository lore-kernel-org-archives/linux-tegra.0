Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFA158DA3
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759208587; cv=none; b=JBKAI15Q+GiC3MAreyqx32NOg6YbBQZIiq7OL/hn7u8k6Akx/FK+jfif5QODLToQ9a25tVt7rKnLxWvZmfGkDceAY4JjYFj+xmRD9TQtppKB69zZxyFyiv2/5W1+TcUfAdLcJote1zyom+GhZOtkO7g3rU9d7jLySB9/I6/iD1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759208587; c=relaxed/simple;
	bh=a7qb2rJ0Jw/0UIKF71j2MJv2VPSIHDCUpr68yF8O7AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+kEq5mVDZGLYSEuAt8/K0IcOnBtkk3CxRf1AsCv4ngp7glldU6B5HvAyHJA7CDvtL3kwSJErjgVcoK/XMWSnotsxfOFZdTgQkzxzYWifIKYLLz0W4wdn8wdrb8evuaGOja6ta0S6FgChCFyc7tAQwtGr8tSIfEB7zMfR7n0gOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TekIBcTw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TekIBcTw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e5980471eso3948495e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 22:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759208583; x=1759813383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoR1B9T7V1pTFNhkgw0nIgS8ET98ouYhg1Jto8UVkhg=;
        b=TekIBcTwGod/GumanHna8s0BB0Ymjmk/jpUdxJzBEfCeKHYJIG7vbA6bMlMPyhvia5
         Rf8W78m9gL2OAVgSUQX/EQOK/dLGYgN4FZpQdRHSi1PGw4LFGzkeHoddh5pcGbIrbcpC
         voYNfWVqtxdp+6bxrz9EqoAWjuccUksHduwNcXDTaBy4vC3RzhWPhXrGDWksZLPj6ZTM
         1NCuhNR1YJzY/kH8KosgiHK//F5HSTlzSxFiTJDy9r8IP/xISrtEBOSplX7PV96yN8rO
         XQrq8wHM0HGSLFCvM+IUw0aO5MrYdwpqVbFoEW/YcRp35Jcl8wxlGNGgQxVpY5rdXCkt
         diUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759208583; x=1759813383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoR1B9T7V1pTFNhkgw0nIgS8ET98ouYhg1Jto8UVkhg=;
        b=jsTFnlnx+pq+SpeM8xe+TrSlUFD3nv28OqFZb5agMgFi7wRIzwLm5A71xzPx2CvxM8
         n0daQwGdEOw27R7No/QYC5AJgbENXySYgJFIuY6G4tu5kkESpXWghuDiVyzhNfO4MC8e
         q1Ret8epIr8Kx45EsUebdyExSqtJ63E4x5uLZXqQT3Ht7vZjo1F2MgAFzWVJiZOW2ZkQ
         L6jhgt9yZs329UFE1a5HhHD4KlGr5nYLUScQW1fa8zE6P+8SEBo3I3UXoLuMVzK4nuTf
         6Q85byst+Hhq1Lh2cwQ+BJ3BTYiEUN02D60pZvYmgmWhSENS3SeT8e9ysSSdotFlACPv
         Q/og==
X-Forwarded-Encrypted: i=1; AJvYcCUqcbEkimY3HXn7RSn5Hg/LodXoLNzCp1vEBL1cfZzAb9i86lZtfWmwJIUUHzLbrBGoSALXIbVjPsR3lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOdU5VtrU1Sqzd6SzaN5kho8um2zJ0Dw9yULlc4kcxQcvsSmg
	maLIh4A7AMsAASgbFXVYDGNIHfOI1qDglbTOeoAt3S0VvZCPxZVUc3UfJ82ygFokQZakBU7W7PE
	MgS1SEbKrlgvogBh5cYMTToa/g1Uv6dQ=
X-Gm-Gg: ASbGncsjsnKVQEH9ZTU59jIZr/9B32td452m2m150FwtXhbhVb0foUVShk7TysJvdgQ
	JsW8mRer6RW/lqYDILxUq11zRSbOtmzjraak92VDWKi3LB8BEayqikMJwSQJ1ZFfqhQNQ1TiGtt
	Ool+mEdx8H8dhaEPW9XOU+UR645RPewKI1iTRoZZ5U3/tZazvLfEpQRHnZV/YUsnp9Y7S0qXVV0
	LtylMyBeFuY8gxEejb5KYkqYtp03VqD
X-Google-Smtp-Source: AGHT+IHtCiLZWPd6YG0+/m8xv7WXlf4TjyLf87iKzlvK+SbdMSS/Y5iMogSqKCijOs1mMK9wjtjefb1nkSZHeV4XUX4=
X-Received: by 2002:a05:600c:3b12:b0:46e:4287:a85e with SMTP id
 5b1f17b1804b1-46e4287ab48mr113132665e9.13.1759208583161; Mon, 29 Sep 2025
 22:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
In-Reply-To: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 30 Sep 2025 08:02:51 +0300
X-Gm-Features: AS18NWD95jSyp5Bl_nRLcKiZ6--BarGD38quBofBfUrmsZQ1NRrhf1Cuovt9_j8
Message-ID: <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:12 Doug=
 Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which=
 it
> > clearly is not. Address this by adding the proper schema for this panel=
.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
> >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> >  2 files changed, 60 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,=
ld070wx3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx=
3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > new file mode 100644
> > index 000000000000..0a82cf311452
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LG Corporation 7" WXGA TFT LCD panel
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: lg,ld070wx3-sl01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vdd-supply: true
> > +  vcc-supply: true
> > +
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - vdd-supply
> > +  - vcc-supply
>
> I suspect you'll get a NAK here because you're not preserving backward
> compatibility for existing device trees. While there can sometimes be
> reasons to do that, you'd need to provide a very strong justification.
>
>
> It seems like instead of breaking compatibility you could just have
> two supplies:
>
> * power-supply - The name for the "dvdd" supply.
> * avdd-supply - The name for the "avdd" supply.
>
> ...and then you make both of them not "required". Maybe you'd add some
> documentation saying that things might not work 100% correctly if they
> weren't provided but that old device trees didn't specify them?

Schema describes hardware. If it does not (and in this case it clearly
DOES NOT), then such schema should be adjusted according to hardware.
If there are any users of such binding, they should be adjusted too
(third commit of this patchset does exactly that). Panel datasheet is
explicit, panel has ONLY vdd supply and vcc supply, names are taken
from there too.
