Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4315687D
	for <linux-tegra@vger.kernel.org>; Thu,  2 Oct 2025 21:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440957; cv=none; b=c0YBeVdyKwaXG2rPLxL73QtLwK7MyqOIjQUKHh/YGA23Eb/NLzgwQLGJa0yBf/q+2huyQeTHgqa7U4qh/Yap+C1MM3P82aRvrilBSaSa7w1wm/W54echFZ5wPQ3JCEd+7Fy1ex/voOtZ38SgaBpT1Dh3veyax7n1Ko2j1LXgNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440957; c=relaxed/simple;
	bh=zMeuhyrGmKv3Vy1hEV7bUGE0hRvsTCbCldYPgrOEYKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5zX2Su9WstqILGDBhKXJ6P9bSaKhXXU33PGMcn1yIWWxRHKPV6Xejcw3yC2p4fPbyD61qxVRenJ3XYcKrx6HnvPPgkhut0dLqXK9kDQXnG4hOkJJUaYoa5H2V2ilN2X19qGkAiQhcnsFzWkd7GXtdv7fn3z+25bwVegeXOzBRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QsoxcFIr; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QsoxcFIr"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-269af38418aso16694605ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 02 Oct 2025 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759440955; x=1760045755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tb5ZhFKHgn3PI0RL+wA56er2lYPRbzxVlrU7xzkMbM=;
        b=QsoxcFIr3BVQU74FXe/esoKBYcKYPFE3AuA8P2ZBIJmRZvV1VdGxKV5J9Zqsn4tl2/
         gh8F6KQ7f2mb+0NfdC+LCDCB1fnkoBK98sJ3qOnA4EDGOdwqHkA/i8D38q9tMY3sT2aY
         fyaBtHJt86BePWRL9xK2+oi4LblLY2ll0h9Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440955; x=1760045755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tb5ZhFKHgn3PI0RL+wA56er2lYPRbzxVlrU7xzkMbM=;
        b=pq1+3vXzsTvnFKrg1pAW6p45kzq347ZPHyVeHvuuDyVIM6XsBCYqBhDb2opM2JXkpx
         Uh3iQNj/Sf6qXyN/fvIExMHPmij/VE6L8cYnQMvusn3cBdqa8w5NFklH69IB/gvyuZqe
         K3wRYCnbAL2Vv0QGgMLhZ2MphIoQ4Gcg0sIvPMuh9YFOkN/2f1fcq4ER83Jo/q2v9Yoe
         V7qITzHA/HR9/7arv1e7sy8e1LbCXJEywwt8H6MQt0zpCockRsAZVf0RHj6hD95E8qPw
         S8+62wkf8kcc03AwzYUU6+XJ8eJknI+VVF4TnITKnQ6VCPoYTU0cM7t6TfIqg7d6ry5b
         KXRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTwgHx4c76/hXogIE/MglX7+doVMzp5bcpraRIrQNYxj9reilCrEY/zaQtTFOlM5cYXANhhOZUyihRwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8J5fpB940UwgjgjNtyYS8t+cd9lckHnb0NkXD7hx+vcL2DE0I
	+MFybE1dm7piQy5GffOGpOSHBmAaMmpLq0eoy3YwW6yxlgqyCmTos5TFEmjrdbOZCOZn3Cxq7Nc
	uU8XZbg==
X-Gm-Gg: ASbGnctK7Xf4Q4obG5NeSM7CSOACqUkuBj6xpANlQHy4nAQG9QROtrhVmC5muKnJKQj
	hTTq3K2pz1BoLfCcmH0jZxtZizR7YbzwQcbn+SHzvRGqYZInQ4lb/2SWZH3iUKeUBvLKb5HFPNT
	1x+hKwRhAnvoj4aoWo71u334TS9NT8JNe5uf7JgXGLUXxPspju/yRnjAGLoRXgM1zIfaT84m6Xl
	eWa0vHazYFD9bwZ+If0xrG0O2vaAgmsIMmM4RlLnc36MtHkwymYZg1XKz5u9QgN03VHFFFeGiXo
	ebkUdPturCcJvELbTb+6fZQZrRQ/RywErJZxEqDFj204mvUryPgbi/A39QIiemgDlQc7woEzzpZ
	2pVkNtZEXPQLdoNoiQALjskvHAywiQ5/cArHC+WDtQYfdKQuRMTjFEJonpfNJUHNMiOeLp3iYVA
	+k50N6q9bBuoxkmw==
X-Google-Smtp-Source: AGHT+IH5dCHA0RFLKl7dyl07KtT9/0DU5qWUpDj/y0ET6RHkaTYDR02EW+hIuRyIQ1xtsByEZiVfwA==
X-Received: by 2002:a17:903:3d07:b0:268:500:5ec7 with SMTP id d9443c01a7336-28e9a5b9441mr7811395ad.2.1759440955510;
        Thu, 02 Oct 2025 14:35:55 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com. [209.85.214.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1267d7sm30284875ad.49.2025.10.02.14.35.55
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:35:55 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2698e4795ebso14436165ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Oct 2025 14:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/RLnUAwzoLWFnQJt+ZUyWvpukINoP+ytg+pRwu828BRg8qjmkbUNY4c2Ax6HU1b5zMniMdo3U0zeE5w==@vger.kernel.org
X-Received: by 2002:a17:902:ebca:b0:265:604c:17e7 with SMTP id
 d9443c01a7336-28e9a6ff040mr7217865ad.60.1759440954340; Thu, 02 Oct 2025
 14:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com> <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
In-Reply-To: <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 14:35:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
X-Gm-Features: AS18NWCyCoeGl8UyyLw_R0kuFN-88oe-Wi6XpVX99MGsfcmrycek7SZgv1oi908
Message-ID: <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
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

Hi,

On Mon, Sep 29, 2025 at 10:03=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> =D0=B2=D1=82, 30 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 06:12 Do=
ug Anderson <dianders@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi,
> >
> > On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmai=
l.com> wrote:
> > >
> > > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, whi=
ch it
> > > clearly is not. Address this by adding the proper schema for this pan=
el.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++=
++
> > >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> > >  2 files changed, 60 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/l=
g,ld070wx3.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070=
wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > new file mode 100644
> > > index 000000000000..0a82cf311452
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yam=
l
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LG Corporation 7" WXGA TFT LCD panel
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: lg,ld070wx3-sl01
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  vdd-supply: true
> > > +  vcc-supply: true
> > > +
> > > +  backlight: true
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - vdd-supply
> > > +  - vcc-supply
> >
> > I suspect you'll get a NAK here because you're not preserving backward
> > compatibility for existing device trees. While there can sometimes be
> > reasons to do that, you'd need to provide a very strong justification.
> >
> >
> > It seems like instead of breaking compatibility you could just have
> > two supplies:
> >
> > * power-supply - The name for the "dvdd" supply.
> > * avdd-supply - The name for the "avdd" supply.
> >
> > ...and then you make both of them not "required". Maybe you'd add some
> > documentation saying that things might not work 100% correctly if they
> > weren't provided but that old device trees didn't specify them?
>
> Schema describes hardware. If it does not (and in this case it clearly
> DOES NOT), then such schema should be adjusted according to hardware.
> If there are any users of such binding, they should be adjusted too
> (third commit of this patchset does exactly that). Panel datasheet is
> explicit, panel has ONLY vdd supply and vcc supply, names are taken
> from there too.

I'm more than happy to defer to DT people on this, but the general
argument is that "device tree" is supposed to remain forever forward
compatible. In other words, someone could have taken a snapshot of the
"tegra114-tn7.dts" device tree at any point in time and then shipped
it in some BIOS. Presumably the old "tegra114-tn7.dts" (for some
reason) managed to init the panel properly in the past and the idea is
that there should still be a way to init the panel with the old device
tree now.

Obviously, that's an ideal version of the world and sometimes
hard/impossible to make a reality, but it's supposed to be what we
strive for.

From a more practical standpoint, the dts changes and code changes
will go through different trees and so making them mutually depend on
each other can leave people broken if they happen to have one patch
but not the other.

I suppose one way to handle this (if DT people like it) is to keep the
bindings the way you have it but then add some layer of backward
compatibility in the driver. It will mean that anyone with the old DTS
would officially not "validate" properly against the new bindings, but
I think that could be OK as long as it was explicitly mentioned in the
commit message. Obviously, though, DT bindings reviewers would have
the last word there...

-Doug
