Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FD468C06
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766631; cv=pass; b=Ha6GobvEjrB7He71U9FWpzFNgEqoRYDFpOQpHbApjwQp7Hhy1I0ZE+BO/Dlj594Vzwcq+51tTXPOwosgi8jiXiD7e/IY8ZQckm+widxzUlL+47Efu2S4uydNg9ih+11KuLkY30gyQBZNS5PPkHtDa+RFPi/GrIaSUJUysLIWWAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766631; c=relaxed/simple;
	bh=HnH8VJnjaBSq8pHNX8m+PS+xqjnyRiEUaGmbI29CpZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQGImxvODzly2MFpwLdKTk59cFPsPQTSCOfWgyBG6CqY7X0D9VWvMmhgC9QzBW8xPT/oZcmzamdRbhP75fHq+4FTh/fdGrXDaEQruALW7f/eIW8IXz8wz8NJ4h4o1AP30VsgqQUcnS+odNcAumS3QzETfT5wHveA3oOYCvmztRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgQTQyg1; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgQTQyg1"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347866278b6so1589652eec.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 04:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790766627; cv=none;
        d=google.com; s=arc-20260327;
        b=bdAlOAwjxmn+iNKp1rHBUVUXs6pW4Fhk+Y8sn9j9b8Ol8kO+2wins0+L7eKnBDcgS+
         c/p/2d4mSBAq3AA23loQrbwNr2AkrWYa9G5cuy1I0jRzwT1I2kQaVxOHpEGVqSOcK8AB
         ZhizqSm1CHKOWzH1L4iZ7IiZWEIZtjLXoiQePWuxvrKGcCyYTa3d91SNHbCZVXZjB0Gp
         r0z8+FdeVvQ32eaMwJ4DZp3DZbT5YzrUGK/j8FRgq+sZl09SBNg31LTSQMr+ntsBdkLq
         vagnkrIaG8TecCZLxdIMUvUFKYsalAwhqOgC2NX7PeulN7/jlOhiTX1t/kmY20eJHyS0
         gd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        fh=8yU54DQ33KPhjillabq+Kd/2fekri8b70b6EZ5NjGNg=;
        b=YX+E9hGgJuau74pAZNz2bcQfM38PbjQmHFsTb2YHHpxqCvR0UbdOooa4xuC7grh+LX
         ydkBlxZO7fQTkfGSKoxG8Qljcg91NFG3oSnOjCttqWUDYpqLlMF0h+IsONMgdgqLm5vq
         k/VIYFGBBaBvud7dEyrmTgitaopmpGmExG1tm8Kzn8uZ5NqiQde5zIHEuG2N8+XdV9AF
         rBh/t9hHwzvB5Ku0HMMEXJgNUtVopg/eQjRl8VUw5fvSCYG6CyZQF+YMn0ksTPHyGF/F
         R/69LRs6K1SBJyEMDWS2lEMlNCbCCw2w++Utss+OdWT4M6mFkXRXUkShFp1y+Op9KfEf
         C1PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766627; x=1791371427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        b=MgQTQyg1ZXvluhLl4HNq2TnzEpia4IA7QL7q+ykyFhy6WehRWXU1peJZw+Bqehtp4u
         44maUhW+cOdfNWt4z9Xa6pnYkTBgTDW30HLqqiHO/ySxlRktd29uVoqe3AlIhfzqFzGC
         gZJPzscmILJ7ey4QWY9MwnSoOoNbSMrV0WZdpPZpZ43QGN+pR4OkAGdpUMVgCiLskFhT
         h/wkhrgfNV3rVERn6niPabRYQnsv80I2oUmHW2cyJKfD4chcxTbhKO8c5RTvdl5kKDyk
         EFBdPdbKTwypNe4rDT0r22o2hOWlEVD2ac+c863T37sKAhTflN4DC/fA6NiZVSdCejR3
         VrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766627; x=1791371427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEhQm76+qWHV8H86aGRhLc+e8lMqxBXJwP8RftuJrxE=;
        b=PN/ldrE/t0sw6g2/vUd2sMsAD3wVIMWCkOA/px3e0iZOX1Ai+5fNGPamwBZqLdMVS3
         Uq2g5hLjEsPBtvbxVYst+hqO9RfYMzrzVXJD2dmR03fg3+/6WC9H8SdU1hG+NBu7WDRq
         plbKwgJB3uyc2QROR4YcXxKw8WynGeTwGKfC2YxGlAek5LTrCUxjblonXv4R0Cv1ht+b
         cj9RgRAXvQqGsnk5bsEvcIiO+f2K+1A3lMm/xHH1w7TTunWv4w5qXg5d4540mXDcZ2Mr
         IYFNWwPGdl2gPjQkRS4EYIItyzSyccW+QqvLGWms6aR2r7wuxTjHwwvkhoaoiNOzukWV
         dGAg==
X-Forwarded-Encrypted: i=1; AKwUvBwEg2CmW3RqcYluJYblukzpwyu3X7oGtUWq1xtacOvh7XQjjlMWkrLs0SXGGBwLSjgPH6znvhrhzBeKlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/9a9dPlWwj/qcNNUhHgYoVbjmVWg4UjMXwDXgbIyzkPTVrZSL
	TQIzvnZJ9q1Iasm+poDnyGEDY3tK3PQ73nmAoYRTjw+tXWqKnadgJABn4EU8/0BZc5VmYOaCu1y
	Dqb5yAaBTkUcrcXCwggJ3Dlw7ZD9tF/I=
X-Gm-Gg: AYBFou2l45KB/LWFvlLiSOCQRfBmv56RWHAQAEEGGnUebAlun9Wm1iFG6fDffw5nE2b
	2cN0FHeQsyfkjxK7C64cFohVTukEU7P/qXTWf5DaAYmfhwBXQRcEzphS9TLKZnadgeQazf5p1XP
	einscLHp9TM4KwKbhSHKxM2ElzgEM6tMOIlusjfX+YLn2fTunY+moCzwthVCR6qAzCEGCRiUbFx
	3S8GSh9zhqhyZ6acVpsIsR7Kb07pJM3q6Ixt/MBUwjTvu0dzfXpv6j4AeiyecbNjlIOQChck6Ky
	IAnZcxHO56lJ+9WbQ8/XrL5W18r0ByZTE5W7EOJBTxNbT5OKbTFv987dQy/293oWTxzR8e4mjXR
	FmapWyDYAo9Ce
X-Received: by 2002:a05:693c:66ce:10b0:34b:731a:7325 with SMTP id
 5a478bee46e88-34cdcbb4344mr1377981eec.29.1790766627375; Wed, 30 Sep 2026
 04:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome> <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
 <arzpluDc-Ib7q-K7@orome>
In-Reply-To: <arzpluDc-Ib7q-K7@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:10:15 +0300
X-Gm-Features: AclHuK-5MVKqwWOaWtZXWbiTTg2vtWkQnodr3EENyxfP5JkvZ2csH4Wtodn2Zmg
Message-ID: <CAPVz0n0sQo-6xKOGzd3LsJzzAr7_TficW4KeU320Z-tcRUne9w@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:54 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:42:17PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:34 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11=
:47 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided =
by
> > > > > > Tegra20/30 SoCs display controller.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++=
++++++++
> > > > > >  1 file changed, 138 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/t=
egra/nvidia,tegra-8bit-cpu.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nv=
idia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/=
nvidia,tegra-8bit-cpu.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000..f0dab608b2936
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra-8bit-cpu.yaml
> > > > > > @@ -0,0 +1,138 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-=
8bit-cpu.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > +
> > > > > > +description: The display controller in Tegra20/30 SoCs feature=
s an
> > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type=
 B
> > > > > > +  protocol and is referred to as '8-bit CPU'. Each display con=
troller
> > > > > > +  provides two such interfaces, which can be used to send MIPI=
 DCS
> > > > > > +  commands to initialize and control the panel while image dat=
a is
> > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > >
> > > > > The description says that this is a feature of the display contro=
ller,
> > > > > so adding a new binding and compatible string for this is not the=
 right
> > > > > move. This is all covered by the "nvidia,tegra{20,30}-dc" already=
, just
> > > > > need to extend that with whatever is new.
> > > > >
> > > >
> > > > How would you model it? I have tried to model 8bit-cpu as a bridge,=
 similar
> > > > to how DSI bridges are modeled. This reflects interface used to lin=
k RGB and
> > > > panel, without inflating existing DC binding. If you have any ideas=
 in modelling
> > > > this, I am open to any suggestions.
> > >
> > > My suggestion is to integrate this into the existing "rgb" node, or, =
if
> >
> > Not an option since it is not clean RGB and there will be no way to
> > distinguish RGB from 8bit-CPU.
> >
> > > that becomes too convoluted, a separate "lcd" node (or "dbi", whateve=
r).
> >
> > This is fine by me but nesting nodes without compatible feels weird. Oh=
 well.
> >
> > dc {
> >   compatible =3D "...";
> >   rgb {
> >     dbi {
> >       ...
> >     };
> >   };
> > };
>
> That's one option, but there's also many other ways you could
> differentiate between RGB and DBI. Could be a simple "nvidia,interface"
> property in the "rgb" node (that defaults to RGB if absent). It could
> also be a node that is a sibling to "rgb" (rather than a child). Or the
> child could work, too.
>
> Ultimately we're still describing aspects of the display controller here
> since this is all registers within the display controller's MMIO region.
> Nested nodes are purely for adding some logical structure for the
> description that makes sense.
>

From my understanding data is sent basically as RGB, at least RGB
configuration is still used in downstream. Panel commands are sent via
DBI

dc {
   compatible =3D "...";

   rgb {
    port...
   };

   dbi {
      ...
   };
};

This would work nicely if DBI is modeled using bridge framework. I
would strongly insist on keeping it as a stand-alone configuration
separated from RGB and DC.

> Thierry
