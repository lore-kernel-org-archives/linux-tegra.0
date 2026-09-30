Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2AE4CA795
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768857; cv=pass; b=sHFmpctS2UO4Yq7Cy5YAztjJSPiQZemgSgLHk24Wgns0nzmLXRN0mybBzwOQznpxmHhh9Xuc7AnJgVlzGuK/sV0LrLYX7GT8FdnUO5AXWAuiAQaJ2HwpvLTFeWv2Ps/ETMT4BReY6EPWYnoO3Y2A/DY18R6Ybc23h7qnMlnJrzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768857; c=relaxed/simple;
	bh=tCnxQKaF5n24ux0FqNmPiHkkdScPtGclpUr1AEGXTyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maECERcoXxSktM5GtJ1gC8MrWe/CpjwZYtG1UJQPhBqEat/zwVD1qt7EjwPcZUhKwnWIyNQKjU0fNXIPuaswK/GfVQ8g4BPExgUxb+88ZZgzGNFswcf+nCm2Q1Lj1Ly4MqpTKr9QJ51hEs6rAH3NFimykx9mVV/T7ycsfHakWAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdQ8H+ml; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdQ8H+ml"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c2a97ec17so755820eec.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 04:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768854; cv=none;
        d=google.com; s=arc-20260327;
        b=G2rVsQ4/VSkmw6WKb6EK97iM+k06Hq1v2+qb4TRGaEiX0IVyQpuOOW39R7jj1OB4XJ
         Fflg5c/0VBugKuFaPdS+lNXVkFPHwsEBuYRvDFECReuToV01jrefppAU8VGmatqxcD1f
         SCQ7mjk9I5L/Yvbd0MrbtHO4YI564PnCzfTGQNlgmOw5pYLBCEjkztqOkx1eQ8MnFNCu
         h5p3D6ivAnrO/iO4KqfO27TIc6zjJ5hcWh2w3Rh05TJ/btu1WAkhZpvErSPafx/xFeRw
         KQq/gGshcxnuhWdo5lo6FSqWwo3ASBzaBv7BOjghSI1hXy2/E6MBiNFXVA2R+PgQJi5m
         yXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        fh=GTstXWljFq8YIbEhrgwux3kG6DJ0jITTKcqRV2fgKgY=;
        b=CU4pCDDYSNB2lmAoRx+mXJhbOo9KtkdoCR2UY7XMaKKdvUID/n8dpECieNznTcrju0
         XO3UZrMYnsdSQv/D2WcTELRswwvNhe9VIFfOfWAMOg2oXdMJTgLtmguXuNsIbFe0YqGD
         Je6Heawcj6zysSqlHs62lVhI8fXoLwOU+r/cIJuNPab6ExKWVlh9FfDt0ED340NvDKfc
         R6HI7gwdy6r4Poftfk7LkMKjCGTOS10TNbmr/Z7nWtV7aoa36rhFBV3VVujrI2eadb5F
         rUB+o/zo+p2XGZy1qYv4Jh7I3lU7hd6xQK+tk2j4GqcRBigKp9/evUjkig3d2btkXTMB
         7HgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768854; x=1791373654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=bdQ8H+mli6OECyMRBFOBx36NS7W/muNtXD+vOdjl/9B65WwU6Ogf2fWmYKFIn7d3Ww
         oDrpOCjhb0SrETHWTdOoNMcuHsM1LBq8bHw705YZ2YBdumiuO4UtM31adsiDOaeqtUpY
         X0RH2QRGyzpwKdP8u+5BLXSvmy2bHLS/KAReeR5zdzIve/gEP81zpjNXgXpe76WA4U6B
         MViCKdDsF9Z/mjyYWa77vspcPYAii5KJ85jwvUwZWzAINFHbYUU2SgLtp8iIIj5Kkfja
         HzCM/g/xKcP2u4/TTPO2vXllMC042CKqaZmUOICfBa3ZinfPKk6ResP7Tevue3J7jAf0
         wQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768854; x=1791373654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=vmI79k9w/IrEiSXzOPb0OIg+13uaEn0+wnIPyFkRMI9aNOaL52yPHekKZnWU+5qr/v
         oNlsUrWIHfvEVZCqWqdJMFtlnjVld1oM1hj4mJ7WLb/XJDaZBROZ515Kj1uJ3ustTIry
         a7iP94VTh4EB2TQICEJ9W3hFyioZKWngWYyljj8hZBLLRSlkhY01GXKgI/QM8WsQuRUp
         XgsAXKWeaKyqcvwyTd4y4VL29XCwb0GMpGTswrypHONK9rp8uDDh0woaKN1uyLZg0s4E
         Sr23qJ9++38Yu+GCiUPBgThjx1nWNKBzXSp2tFmWQ2Qp1NYrtsDhd13DDjgicNoFdhU7
         eArA==
X-Forwarded-Encrypted: i=1; AKwUvBzpRWQpDtMzNknI59fYgJjGKyM5ahwjFcuVxOyfiLSuycTkXIXOfcCJYJ6mallv8dM8bcwqzLKfY3U5gQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mMRJSmV0KU0Q8w3FBCsvE5aLNXMcT2Y36+eSGsLyUwc3nzj6iI
	v2T3eviaJ7hS1HQkwLCwpfbC2C/evbRbpE9bNok/mjlC/MXN7Jr0Cy7t6/z03KV0zbrFj61hEnn
	9si8gQx17MwTq7F//kaVb484xg0TrEPXWRg==
X-Gm-Gg: AYBFou0ZyopIbObkW8Nw4ikEJcVncsAmwkQ6qWyb2ms21FTLZs/PvRnYgS/+W7ykT6U
	ZLi9lYdXPsdtFLz6wfKE4cGFVv+iqzxp1wBsfDdFX5F8KvaeOPpUIDM644/zKCEv4sBbrUBv5yc
	p35C6r8i6GF6Mnwr3AiN33lwv1rij9pdEJfdGlE9KKbIVBGn1B0Ira6h83kw8WyGDSSYvhSupCj
	lNJCOzjZxFf7EnSzcoxfAM1Pf4QPOPF+wX8Qz1FdLBlqbK06TitZyPXwNWYgYrK8SnVP4mUhR+E
	GSol9rDevwJrQIIUhi3ifee/MzUVOjI7wkO3woCbsq8WYX0y0kg4qMUeUWa2jpZnnyQOY60PrS6
	Ntx39UAwED1nCUc5ayI4vlu8=
X-Received: by 2002:a05:7301:9e08:b0:34b:6d45:de57 with SMTP id
 5a478bee46e88-34cdb5f5697mr1375712eec.9.1790768853829; Wed, 30 Sep 2026
 04:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome> <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
 <arzpluDc-Ib7q-K7@orome> <CAPVz0n0sQo-6xKOGzd3LsJzzAr7_TficW4KeU320Z-tcRUne9w@mail.gmail.com>
 <arz1BYJT30VTosYj@orome>
In-Reply-To: <arz1BYJT30VTosYj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:47:21 +0300
X-Gm-Features: AclHuK9Y2nKRAcoyGWBo0XedUHUJ0UGBHVCSLavApiAyymEH-DqiDv0t1HCafQI
Message-ID: <CAPVz0n18Y0oAREzJvm3utM3XohQXyoRWGBm=7uRvzVRTSK9CDw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:10:15PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:54 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:42:17PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:34 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 11:47 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > >
> > > > > > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wr=
ote:
> > > > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provi=
ded by
> > > > > > > > Tegra20/30 SoCs display controller.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++=
++++++++++++
> > > > > > > >  1 file changed, 138 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/displ=
ay/tegra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/tegr=
a/nvidia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/te=
gra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..f0dab608b2936
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra-8bit-cpu.yaml
> > > > > > > > @@ -0,0 +1,138 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,te=
gra-8bit-cpu.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > +
> > > > > > > > +description: The display controller in Tegra20/30 SoCs fea=
tures an
> > > > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI =
Type B
> > > > > > > > +  protocol and is referred to as '8-bit CPU'. Each display=
 controller
> > > > > > > > +  provides two such interfaces, which can be used to send =
MIPI DCS
> > > > > > > > +  commands to initialize and control the panel while image=
 data is
> > > > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > > >
> > > > > > > The description says that this is a feature of the display co=
ntroller,
> > > > > > > so adding a new binding and compatible string for this is not=
 the right
> > > > > > > move. This is all covered by the "nvidia,tegra{20,30}-dc" alr=
eady, just
> > > > > > > need to extend that with whatever is new.
> > > > > > >
> > > > > >
> > > > > > How would you model it? I have tried to model 8bit-cpu as a bri=
dge, similar
> > > > > > to how DSI bridges are modeled. This reflects interface used to=
 link RGB and
> > > > > > panel, without inflating existing DC binding. If you have any i=
deas in modelling
> > > > > > this, I am open to any suggestions.
> > > > >
> > > > > My suggestion is to integrate this into the existing "rgb" node, =
or, if
> > > >
> > > > Not an option since it is not clean RGB and there will be no way to
> > > > distinguish RGB from 8bit-CPU.
> > > >
> > > > > that becomes too convoluted, a separate "lcd" node (or "dbi", wha=
tever).
> > > >
> > > > This is fine by me but nesting nodes without compatible feels weird=
. Oh well.
> > > >
> > > > dc {
> > > >   compatible =3D "...";
> > > >   rgb {
> > > >     dbi {
> > > >       ...
> > > >     };
> > > >   };
> > > > };
> > >
> > > That's one option, but there's also many other ways you could
> > > differentiate between RGB and DBI. Could be a simple "nvidia,interfac=
e"
> > > property in the "rgb" node (that defaults to RGB if absent). It could
> > > also be a node that is a sibling to "rgb" (rather than a child). Or t=
he
> > > child could work, too.
> > >
> > > Ultimately we're still describing aspects of the display controller h=
ere
> > > since this is all registers within the display controller's MMIO regi=
on.
> > > Nested nodes are purely for adding some logical structure for the
> > > description that makes sense.
> > >
> >
> > From my understanding data is sent basically as RGB, at least RGB
> > configuration is still used in downstream. Panel commands are sent via
> > DBI
> >
> > dc {
> >    compatible =3D "...";
> >
> >    rgb {
> >     port...
> >    };
> >
> >    dbi {
> >       ...
> >    };
> > };
> >
> > This would work nicely if DBI is modeled using bridge framework. I
> > would strongly insist on keeping it as a stand-alone configuration
> > separated from RGB and DC.
>
> Okay, maybe give that a try then. But to clarify: this should all be
> part of the Tegra DC driver and not need an extra compatible string or
> separate driver. The DC itself should be able to function as a bridge.

Noted, I will not add compatible string to the dbi node.

>
> Thierry
