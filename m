Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974029;
	b=hprk4POjNjFt9+10SbfZqef6ZrcP39A8K1Gkb9AXf4PMgql4j5a3YGuzZ3pI/Y/GsudS
	 nmi1u/DN28emut01eQw9H9OyXplU1UTZ51Oh5Yxkvsxxmw4VyK8kAAOG5nOG6kxStNq0i
	 bRLYRZoLnDLPD97/sSjKj0OmiDUKLm+4OkEUBHEHID0LgXFQsGqidEeXfKWk7RaB16GcR
	 7Ohvz4dwdSqqJnHFK+Cbr8++CF2s689roFMxsjsKVii7TxN/Okxbl0mQr6lxPWg7ePb+l
	 9KPvqysz8Skxxpi9t0fsmfcTVDO4UUGhxl+4nIDaQgVfzCXDjnV7fhIfrtqZjpiqhnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
	b=xVKttS7oc9ClXXqOfuF8W6jsLYjAU+6ErTCiPKJdCrFOSmkdKAYUcf33AtzAT2SAWzal
	 2wmxFrGq5nWW0Aim6/FHLr5rIKdjKAW4KfmztH/BtRYmQh8bVM//QsLgryKR2vM98QG2m
	 I4mTPFrZnzvkf09I5XDANHxFBA5kzVGgDJ91jFVwR/oWMboVqI07KPyTdoPqmKegFliPx
	 ZwyuINsAi2ipHgIi+st6eAXVnJ5vav/1cLDSWJ/JYYnWevDDt1GrDn/9bM4i6yQVJ5ypN
	 sOj3gMJbl0LeEAIXF/+UoPT9N2lqChKGbwxqnz4icOtjJlps6UJwv5vIxe61e+rCFpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diwYusPb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28599606A326
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28599606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diwYusPb
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso84751866b.2
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974026; cv=none;
        d=google.com; s=arc-20260327;
        b=Nee0FZzdil9V8UQUwkLgotH99ZotuizoQsCWjXwHM82ZmaLDlMQw5ZgXuWlo4XjkUM
         hDqAwxbBzbLtA4MqcET5I48KH2tRQaLze/MszrCH7eixllaqXNBYzAL7psFot0ouEbcF
         R5no98EV8DSD94kZ2Xv8XC/MWrbeLQFypuOVgczQ4n4iWfJtai8g4C/aGymx5JzXomaC
         vUfsO9OVVjkEjUFW/nEqlVg68++Gkeo6Ke/Ni601b8V7zkCu0XEnApZnzxnKyS7iMTJR
         hOD8/CBka4uDGwaUI4HXu7Bw5kKscwbhaMmxZMu2UNdlNIsP5HKBtNNLJPlapBGam7KH
         4GYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        fh=YiUk1MdhGEa5p49zct6xzSV7z40ru2eUD6DIKTAC+cE=;
        b=MhAm/iUTVu3xNtHqWRCZ/DfCUMNaukJvdHLskAZQbPJd1d1FV/7gcqiDQvZQqTuANT
         R94MvKL/c8AKPkWewVqftblOsNWfgKZ7XR6LmiKa1LRuzJckqUMEA9WoBgztR+3Diwdb
         hJnsdjzueIoq6pwKVQ1WVo/WyrWn4T1TZXtU44fUvNzFz9JZHvjS2kmLeOgGxlvc7KWs
         Xu8D4A8GpZIoaTWbvtkQTDsxshaLphg7Q5yMWc4rn0Y3/TeLkbzBSzOUorXjpOsnUNf6
         CQQZ9jmHfSrQaoJYG+zylxdhXN6WGGT6o1d6GYrcihE+MagzROEScDt5Nhps7tdnoWff
         g5zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974026; x=1794578826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        b=diwYusPbK3mZRd+qud70e0rpFKU9vePSkEqawtb7pazo0DhAieJnGMjc2Bj52uvI1m
         CFKdlC1/L29Cb6BAD3xiDhPt1V/LnZc19JQX8LgSsdRvBQNmkGy0/CIYtcuNuKvyJ7L1
         bhwb1daNfmN6dzXInXeVuF8q3f0qkVIeFjFFlfCAvcn+kyRJIfZJY6IMqVWBHOlSoNra
         B6vjihQZg2qlT8RozkWOKuVBd42dDEUFi5HUDXR+zpX4o7dNEBXCIyD/jccWZjAlCxuk
         CyqwGFccSEp314pE3QWbgwZ/qgGpCmDjeIj86SS4vgbpbbnXNJWe0Ac/xc9g3vhKd1ph
         LewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974026; x=1794578826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        b=yke7EzK/pCrERfDW1OebuWCKVlo8Mu/xVe6ldlPpV6VL0jkEt4bBg58jITFHYBTsnX
         3FzaSx+Te25P3BaUgHKQizeajtIL5IHyBVnV+kYgzH5s0Kq2jzVXC7YdL3tjjIR9QinW
         jQRkIhMiRkErQGRIx8xXxkoroBVIklNwkz6Po0usu3IEbO79b89vWxHJXzaqTg9cZuWO
         FjI0GriuXpyjyhC9NFLdRKkSnuw3HbYbRWnNe2ILR+SJDBzWiJ0WfQtA8HvXSohRkupL
         WqO/sFVXN6oxwMGQp280uv5BkmkF25idwx3puCdRx1vjOCTHTYWLdDzjPLBYmS4oyFmH
         P6Yg==
X-Forwarded-Encrypted: i=1; AKwUvBy3q+nKRY4fktke8nOp51So0jkhes+7dghffNdi0JDn7/sVeyrpWIwcbZ8W+N8AuZWQTO3PEPyaRQKZag==@vger.kernel.org
X-Gm-Message-State: APuU4Z8iNwDweEQYH+/buA0DVZGdUZLcuUAS5ODfSTR45LRq9O9D188n
	G7BwNlIuFw05PeBlTdnE+bJsWg1DO7pnMp5sCQeRI4fqYDlWa6+0mgH+A9ieejVRfNO0nQ1DqbK
	1ZsXIMny0xy0PTdTbMZzgg50zpwELKWM=
X-Gm-Gg: AYBFou1rjn/RXsKco1iGhPBhqRh5/PRMGdDPyDgWckwlk59FHniNBnv3oSV6AHkJ36X
	YMu30vpZsBFq8twMRrk/r6QUlYGHrCJwYwqeZPf3RE7fh/0q2GEfn7cyAuYijLdsziWMf/MZIuA
	FutuFKzEh0ZpmgAjX2jFCN0ATEns3+wT20o2kvizvKOpQjd9lBjZmY3+oZrrDM70yXC6nEMFa5h
	6/Wf0Mw+m2IkBxRleSXoQG8WYfGiLCglMTubvAXjkwgvnBi30CqkTeGPxr1cfKRsLdx9gKeTFaE
	w1S5nEpIuUSYCDL+ndhEuDpBI7OP6zHVdEtjdipkdBtEEq/8Zh0RSn8wsMuNADa73Sa0U57vmxF
	DerFXxZzU5iIzriLE0K8GEq7XVrMn65J8T8PY3/KNssXYFrFhWznqRCLDHwu9dlxXBciHxDm7Ft
	F7Aj7diSw7e4jFznP0hYsOvffDkFa8lyn2B457wdUF/735mi6/2Mw=
X-Received: by 2002:a17:906:794a:b0:c36:179b:6d68 with SMTP id
 a640c23a62f3a-c4d34babc94mr212442366b.24.1793974026265; Fri, 06 Nov 2026
 06:07:06 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-5-clamor95@gmail.com>
 <au3X8tpU9KWas9ZM@orome>
In-Reply-To: <au3X8tpU9KWas9ZM@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:06:52 +0200
X-Gm-Features: AclHuK9W8h_VdmRrbmlRdGVn94XocWlAhADiJndzE0sl5T8qxllPsgvIMFjUVog
Message-ID: <CAPVz0n1h8SS09Nt9fw4q806ktEM59fQRXTqdP053E7+2onzmYA@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] drm/tegra: dc: Refactor and expand header
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

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:56=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:04PM +0200, Svyatoslav Ryhel wrote:
> > Refactor and expand existing DC register definitions with additional
> > fields in preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c  |  11 +-
> >  drivers/gpu/drm/tegra/dc.h  | 856 +++++++++++++++++++++---------------
> >  drivers/gpu/drm/tegra/rgb.c |   8 +-
> >  3 files changed, 514 insertions(+), 361 deletions(-)
>
> This is impossible to review. Please split this up into refactor and
> expand patches. Each should be a separate change.
>
> Also, a lot of the "refactor" is just pointless whitespace changes that
> are just not necessary. Please keep the changes to a minimum.
>

Well, I did what Mikko asked. It is not my problem that this header is
a hot mess. Initially I just wanted to add fragments needed by dbi.

> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> [...]
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
>
> This type of change seems entirely useless to me. It's neither more
> readable nor shorter.
>
> [...]
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..2b87bb675d4cf 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -178,9 +178,11 @@ int tegra_dc_rgb_init(struct drm_device *drm, stru=
ct tegra_dc *dc);
> >  int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >
> >  #define DC_CMD_GENERAL_INCR_SYNCPT           0x000
> > +
> >  #define DC_CMD_GENERAL_INCR_SYNCPT_CNTRL     0x001
> > -#define  SYNCPT_CNTRL_NO_STALL   (1 << 8)
> > -#define  SYNCPT_CNTRL_SOFT_RESET (1 << 0)
> > +#define  SYNCPT_CNTRL_NO_STALL                       BIT(8)
> > +#define  SYNCPT_CNTRL_SOFT_RESET             BIT(0)
>
> The whitespace changes here are completely arbitrary, it's changing one
> preference for another. You're actually changing the contents in this
> case, so it's not that bad. Still unnecessary, though.
>
> > -#define DISP_CTRL_MODE_STOP (0 << 5)
> > -#define DISP_CTRL_MODE_C_DISPLAY (1 << 5)
> > -#define DISP_CTRL_MODE_NC_DISPLAY (2 << 5)
> > -#define DISP_CTRL_MODE_MASK (3 << 5)
> > +#define  DISP_CTRL_MODE_STOP                 (0 << 5)
> > +#define  DISP_CTRL_MODE_C_DISPLAY            (1 << 5)
> > +#define  DISP_CTRL_MODE_NC_DISPLAY           (2 << 5)
> > +#define  DISP_CTRL_MODE_MASK                 (3 << 5)
>
> These are purely whitespace changes. Please don't do that.
>

This separates register content for register definitions

> >  #define DC_COM_CRC_CONTROL                   0x300
> > -#define  DC_COM_CRC_CONTROL_ALWAYS (1 << 3)
> > -#define  DC_COM_CRC_CONTROL_FULL_FRAME  (0 << 2)
> > -#define  DC_COM_CRC_CONTROL_ACTIVE_DATA (1 << 2)
> > -#define  DC_COM_CRC_CONTROL_WAIT (1 << 1)
> > -#define  DC_COM_CRC_CONTROL_ENABLE (1 << 0)
> > +#define  DC_COM_CRC_CONTROL_ALWAYS           BIT(3)
> > +#define  DC_COM_CRC_CONTROL_FULL_FRAME               (0 << 2)
> > +#define  DC_COM_CRC_CONTROL_ACTIVE_DATA              BIT(2)
> > +#define  DC_COM_CRC_CONTROL_WAIT             BIT(1)
> > +#define  DC_COM_CRC_CONTROL_ENABLE           BIT(0)
>
> FULL_FRAME and ACTIVE_DATA were previously consistent, now it just looks
> weird. Either use proper GENMASK() definitions where applicable, along
> with modifications in the driver to use FIELD_PREP() and FIELD_GET(), or
> just don't change it at all.
>

This one seems legit, I must have missed that.

> > +
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> > -#define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> > -#define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > -#define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> > -#define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > -#define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> > -#define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> > -#define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > -#define DC_COM_PIN_OUTPUT_SELECT(x) (0x314 + (x))
> > +
> > +/* Defines in PIN_OUTPUT/INPUT_* describe pin position, not state */
>
> This comment is completely confusing to me. The registers themselves
> define the state and bit positions within them seem to indicate the pin
> positions.
>
> > +#define DC_COM_PIN_OUTPUT_ENABLE(x)          (0x302 + (x))
> > +#define DC_COM_PIN_OUTPUT_POLARITY(x)                (0x306 + (x))
> > +#define DC_COM_PIN_OUTPUT_DATA(x)            (0x30a + (x))
> > +#define  PIN_UNMASK(x)                               BIT((x) + 1)
>
> Given that pin positions are in steps of two for all registers, does
> that PIN_UNMASK apply to all of them or just PIN_OUTPUT_DATA?
>

Check TRM

> > +#define DC_COM_PIN_INPUT_ENABLE(x)           (0x30e + (x))
> > +
> [...]
> > +/* DC_COM_PIN_OUTPUT/INPUT_*_3 */
> > +#define PIN_LSCK                             0
> > +#define PIN_LSDA                             2
> > +#define PIN_LCSN                             4
> > +#define PIN_LDC                                      6
> > +#define PIN_LSPI                             8
> > +#define PIN_LSDI                             10
> > +
> > +#define DC_COM_PIN_INPUT_DATA(x)             (0x312 + (x))
>
> It's not clear that PIN_INPUT_DATA_* can take any of those PIN_*
> defines. Given that there are only two PIN_INPUT_DATA registers that's
> probably not true, so I think it'd be good to somehow specify how that
> works here.
>

I do not need input data, hence this field is not populated

> > +#define DC_COM_PIN_OUTPUT_SELECT(x)          (0x314 + (x))
> > +#define  PIN_OUTPUT_SELECT_MASK(x)           (0x7 << (x))
> > +#define  PIN_OUTPUT_SELECT_PRIM(x)           (0 << (x))
> > +#define  PIN_OUTPUT_SELECT_OUT(x)            (1 << (x))
> > +#define  PIN_OUTPUT_SELECT_F2(x)             (2 << (x))
> > +#define  PIN_OUTPUT_SELECT_F3(x)             (3 << (x))
> > +#define  PIN_OUTPUT_SELECT_F4(x)             (4 << (x))
> > +#define  PIN_OUTPUT_SELECT_F5(x)             (5 << (x))
> > +#define  PIN_OUTPUT_SELECT_F6(x)             (6 << (x))
> > +#define  PIN_OUTPUT_SELECT_F7(x)             (7 << (x))
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT0 */
> > +#define PIN_OUTPUT_SELECT_LD0                        0
> > +#define PIN_OUTPUT_SELECT_LD1                        4
> > +#define PIN_OUTPUT_SELECT_LD2                        8
> > +#define PIN_OUTPUT_SELECT_LD3                        12
> > +#define PIN_OUTPUT_SELECT_LD4                        16
> > +#define PIN_OUTPUT_SELECT_LD5                        20
> > +#define PIN_OUTPUT_SELECT_LD6                        24
> > +#define PIN_OUTPUT_SELECT_LD7                        28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT1 */
> > +#define PIN_OUTPUT_SELECT_LD8                        0
> > +#define PIN_OUTPUT_SELECT_LD9                        4
> > +#define PIN_OUTPUT_SELECT_LD10                       8
> > +#define PIN_OUTPUT_SELECT_LD11                       12
> > +#define PIN_OUTPUT_SELECT_LD12                       16
> > +#define PIN_OUTPUT_SELECT_LD13                       20
> > +#define PIN_OUTPUT_SELECT_LD14                       24
> > +#define PIN_OUTPUT_SELECT_LD15                       28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT2 */
> > +#define PIN_OUTPUT_SELECT_LD16                       0
> > +#define PIN_OUTPUT_SELECT_LD17                       4
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT3 */
> > +#define PIN_OUTPUT_SELECT_LPW0                       0
> > +#define PIN_OUTPUT_SELECT_LPW1                       4
> > +#define PIN_OUTPUT_SELECT_LPW2                       8
> > +#define PIN_OUTPUT_SELECT_LSC0                       16
> > +#define PIN_OUTPUT_SELECT_LSC1                       20
> > +#define PIN_OUTPUT_SELECT_LVS                        24
> > +#define PIN_OUTPUT_SELECT_LHS                        28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT4 */
> > +#define PIN_OUTPUT_SELECT_LHP0                       0
> > +#define PIN_OUTPUT_SELECT_LHP1                       4
> > +#define PIN_OUTPUT_SELECT_LHP2                       8
> > +#define PIN_OUTPUT_SELECT_LVP0                       16
> > +#define PIN_OUTPUT_SELECT_LVP1                       20
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT5 */
> > +#define PIN_OUTPUT_SELECT_LM0                        0
> > +#define PIN_OUTPUT_SELECT_LM1                        4
> > +#define PIN_OUTPUT_SELECT_LDI                        8
> > +#define PIN_OUTPUT_SELECT_LPP                        12
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT6 */
> > +#define PIN_OUTPUT_SELECT_LSCK                       0
> > +#define PIN_OUTPUT_SELECT_LSDA                       4
> > +#define PIN_OUTPUT_SELECT_LCSN                       8
> > +#define PIN_OUTPUT_SELECT_LDC                        12
> > +#define PIN_OUTPUT_SELECT_LSPI                       16
> > +#define PIN_OUTPUT_SELECT_LSDI                       20
> >
> >  #define DC_COM_PIN_MISC_CONTROL                      0x31b
>
> If there's only one PIN_MISC_CONTROL register, does that take these same
> PIN_* values as bit indices?
>

Check TRM

> Thierry
