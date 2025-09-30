Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B54204F99
	for <linux-tegra@vger.kernel.org>; Tue, 30 Sep 2025 03:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201640; cv=none; b=qsyiTu05DFJpO4SYra/0zrmyC9Da6qY9TI1HONye4pr4yu2vuKxY8xHqYCYYYkJFn8Sx/5YfQPPgFcQZHMxy3ZPGTZyVSa4y2Kg0Y1BRSZ8YXvq3SRrOAafpUNJ5WerU3h9dkSxzwoF05uhXsniK/atXiW4TvTz//FvMt7DesSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201640; c=relaxed/simple;
	bh=6CYu0yjjLffWbYyT1iuvFnA3aqfZ7582Muoa6RB5CIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5ELB0iaQ+ur2sqxPpWXe4Cm/iKpnbIcjKB6k3fC0J4RToHFviLeHi+VoAiziZo2WBSlunob62nSrIbtB6xiUnuD6NdtEuqHd9mVHzDSeEfC1UD3gYhIh7yI7Kwg4TtYW7yv7nGFaRsb+ZYgVOH3CJ2nePLUeW64SrkISm/Fez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CRZpGTyO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CRZpGTyO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso5676536a91.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759201636; x=1759806436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKvNIqyQStmqM1bZBXJ3keviMu+G7jno5fFKkr2O1vg=;
        b=CRZpGTyOvFRVATJgE2lIk6B1h0LehxPtC7vxmgVIraDqZJO8jtH6L2vL00EZyIGbCR
         vyv8onUIFvfd3+oBhdNN5ecurB1YDB7izpuF/bYWBD4GXk2eYOkNSE9blUEAuC9RD5Z6
         bGEPEp1fXR3z31K7A1ZNBafiEGHbo92ffqpNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759201636; x=1759806436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKvNIqyQStmqM1bZBXJ3keviMu+G7jno5fFKkr2O1vg=;
        b=jh8h6fCQq1v+pbcMS7Mc3YdeEvC+M9JOJzeLx8l41y/8WKn8tDcljv9Lenr5HOrL1d
         RPzOl2xBTUG4xknpHdhKrsOMXO6tH7zAPidyFfbRn3YANUWdo1FYTaPlJGPUF1T2G04r
         Kj9yHMSEDOQPTlvZcb//3VT54ZYrmG7npSmNvZ0yeYTSv7khRzBNVnpypQ/s6DdIoPnp
         Bp17YvzxifohV0nWb62VJrYPo5JkbsMPLuedQtYVlM4vMILDp8R2xCw4yL/PP76c3MWv
         RoAYKRHfQkg8qOti0Dvhn0Q2O00206LhutAs1NeTcWPZJggtRSK4u8SAcwzq/QstW49/
         /B6g==
X-Forwarded-Encrypted: i=1; AJvYcCWukSJ46V/szvC30tD6+91DofCHYgtvc8gRWlct0vQjeawqqmZHs/IyGzPBfFHJdUape6SfLsAL2cKcOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2hLy2s7aRNjjOEzzsyUGiWuNow/b4btzEZM2yepDd5ueKYK7
	KUqf3Ndi06xfUm4OTwcuzvV5GDi7q+A4TbhJzH8s8jkvF5RU1aqQNkI1k+Obn22Jz2BVzFkTCON
	avWA=
X-Gm-Gg: ASbGncu1dGp8wIFBASi/vCe6SVqGRNcqxQ8d8ZDkAYaXBlaDkg93TA1QRQMYE/WiBBi
	Pzz7e0y3lHDzFabSxWQg0xMgfTJFjuppd7O/3VAYALwAdVOM93/dL3STDiri9arVtApIfNNnN5A
	Uo8lAS1J3QjA8K3in90lop/P+wOL6auno5uLeLAgFeEGldw4m9Mz0bx6BuKPAziBBiecYZt3V47
	HG0jTiGdKNgfFGQGFJraAdSoRkRntciqHDf5b6iO4ITw90v3poe3Q8yd3jqtPkR+jsOtUOotkRJ
	QapkiTsjsP30oOJPuH4aMqJk7TIaGfDFFxAUZk36mkjNJYDLY80xM/RF1HK0MOAOVxf/S4gb0un
	pYIEUeDFYNZGBXhpil5wWc3GYQjS4r8XGChbOX+lCGRYVd051jKZ2y1CGr7EzA5xbyoM3ORsTiq
	tDSYONDzyk4BU3SNTiDGisfanSXzVL6nU=
X-Google-Smtp-Source: AGHT+IF5ZRs21NoHPMBwPiiXnr5ayzygztN1JnTw4iUW4azR4aOtlNvO2OfmiZPQQ7C2EtuuQ+oIXg==
X-Received: by 2002:a17:90b:17c4:b0:32b:dbf1:31b7 with SMTP id 98e67ed59e1d1-3342a218452mr18096211a91.2.1759201636307;
        Mon, 29 Sep 2025 20:07:16 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be235c4sm18690157a91.23.2025.09.29.20.07.15
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:07:15 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso4911783a91.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 20:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWE2NVRm5EYG6Mnc2y7+GARXpw0ces+bzqixd2Y9qA04hvyxN4b/i0A8rF0kZoAtoSkmCr69HkILz5Lbw==@vger.kernel.org
X-Received: by 2002:a17:902:f64b:b0:275:f932:8636 with SMTP id
 d9443c01a7336-27ed4a2d54fmr206796235ad.38.1759201634408; Mon, 29 Sep 2025
 20:07:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-2-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-2-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:07:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
X-Gm-Features: AS18NWCupJdoWovR_kE0x_uWeV-e4Q15rTRpmAHzxBq1v_8sPWAFlU2cXRm8lAs
Message-ID: <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
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

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which i=
t
> clearly is not. Address this by adding the proper schema for this panel.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
>  .../display/panel/panel-simple-dsi.yaml       |  2 -
>  2 files changed, 60 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld=
070wx3.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.=
yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> new file mode 100644
> index 000000000000..0a82cf311452
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LG Corporation 7" WXGA TFT LCD panel
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lg,ld070wx3-sl01
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vcc-supply: true
> +
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vcc-supply

I suspect you'll get a NAK here because you're not preserving backward
compatibility for existing device trees. While there can sometimes be
reasons to do that, you'd need to provide a very strong justification.


It seems like instead of breaking compatibility you could just have
two supplies:

* power-supply - The name for the "dvdd" supply.
* avdd-supply - The name for the "avdd" supply.

...and then you make both of them not "required". Maybe you'd add some
documentation saying that things might not work 100% correctly if they
weren't provided but that old device trees didn't specify them?
