Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268C391E77
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758837; cv=pass; b=d2iQnEvIUyjcqSz8LP6ef1JuQjuPEjvWP9tlJy+DH3FnjWS18roiCqv9/6jF0fABhuR5TBeDxquQ+17Yl4ylMxPNu0VuqbRkAMJ8ywJnxrfJRZBlbQS7i6wP/nrtRXrMWm6uLEi4rqjADgC7yoxtg6wZGYs8eK5xeDT/nH3/J0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758837; c=relaxed/simple;
	bh=2ptQLVKYeJjEOvJHdG809i6XfpxS5ynDbXh7OBZc7Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke3n7mcHlizfgPP0Nf92lNOosnebVwLYT4HwKld7f4duryf9gPn27KEEItF93jh9a6IdZzlumu8zArVemNZZrlPmg09EFvqkvTW97YzzKrl9jkNFItiMsBBeWIldCohhsCAuQujLeJCuJRW4so8mzuM17HOz0koRVRLU2/7k4is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q36lqAQL; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q36lqAQL"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34abf779ac9so1448790eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 02:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758834; cv=none;
        d=google.com; s=arc-20260327;
        b=mzZx/RHRpmgPddepLucpikWV+qfyuuK8Qej04GJER5Cyog3kBz7Trdwy9LyKKyBuIA
         bc739fVNhSUj2tGa5D2hXOD/KLo3t9wu4A/SSyAXVFLskAV7mmioks++UeFhCHPoXUId
         5RMsLV2URD4Oq3zmTn6LWQcpIPvy/C7Y+EaJiqQ+ts8w6hVW/sv7VeXXjH+LwkYIS3fi
         UmlU/Mq+uqKUCzJ4MXmsL2mLqnZPXuUeWMPt7ilZO6Zbld3IxtU+tIM61N6hRBrdtJ5M
         lKoIDmkuysIY7R2oQ1kzxtoENlKSpBHrRO9B+hvAHDKGURUWL9MAwGfQz/KYXbn5CjJr
         Icag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        fh=Aw0tv7PmPoFutPBFIUW1x8MmXTNAvMMaLEj/1pIq/FA=;
        b=Ne+KILOm2kxcKkfJdYYzVizB4M22n31ZMV+46+LSNie3+4x8+W5iQbkxh6RT8XuyQt
         Zf+BOPRgY5xo9GRgU236fHg6u7sPWPNNE97APl4fDAw2P3HDQWxNHm+YWDw8rZfv6gCr
         o8SSj3uPFR9qQNeUAAoGJ4wpfAutUBFB/Xfs37J4hAwFdiaaXIyR6wIfqqROUcFusqLw
         f4FczPrEtWAsl+BIueI6QtmrYG/VJVDTnSGYMSFm7ubASuU0O0o+QKcyrRhVIWjEFEJs
         argvVe4yYHzyOLyG0fVIsquQXnoLSaLVVUidzQIwklnTwR4JJn/bFB+ZJdvk/BHj1y9K
         9aFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758834; x=1791363634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=q36lqAQL0rX1j50QXQ4g49CYGMhYwKHCsJrYBLkFisCdAjHYrVK5zggtRjJx4pb+aC
         TWQZIYeYSVckcySzdbNxihiPbPpBKFkpWE9xzF6MfLJ2Sh9NYTMmeMBdvHR78H60BohC
         k5EgxQxavKZibsXmfUzCSuJC8x7UUXXeBc6/d494nPTBRe8D4+lR/yyutPxccyhx0+sI
         vnCFfGkyWdqlE5v38OXIOdW0nqoH6IiXSBrQoREUITfvhOjpfs+Bu2Jj3KUFbtHezRDk
         LvkMTNsvJoqZ/aOfnWOOP/91M5KYp8IGbOsY3GwADVgmpR0ouIU9sP7PxOLzyGhiQ+ZH
         J4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758834; x=1791363634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=NWcBkzh2I4WaGo7wzxCD/e/JUt1kKFrXrsMpRLqpwhdtQkIPQFV+MgPyIyc5C7Z1jf
         DAz8LgVPP03it/zI3g7FwGECYX7dAFzNc7Cd9e0zfNaMueOO4DS5b4SpDlLScwyQWDQ7
         1qvzNrD8LKdgiXrcaSzqheyq0kdEinD8g1nH8CJCmuXj+J2b5db42ccO2/o7HCj5IeGX
         Dqvu/MrVEN9Mxa/zA9KPvqXTrFdKiovnZy2jvOh0VQHBj/+s0XqqlMXia9xggD+npTu5
         wWtvEppnCNoqMlI0rxi6XhGd8y59amnIW64oIplRHPsI1ljUkNTt/lHW4HwQyqfB+jP5
         0Caw==
X-Forwarded-Encrypted: i=1; AKwUvBydqWmYlYRAic9hzgYcChOMhn1nRhpJ0f+N69nOVeGDGOm4xsZFMrFljriudWNwGr4TFg0PF3Pus2YAlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIC6Fg1CQibQA8PyvN/A90Js9INBQorwEQCKruTZY3uSLrNy4dn
	ALMeRYauVzoFFeyB1TP0djZ250tfDNLtBrTAj70rgUuxskXqaQG9iSpiLV503zzMptEAueKDzN3
	Kfyb0rpXdiJYydvUqU0ibSC5mpI6zguA=
X-Gm-Gg: AYBFou0t0NoIUdrAC4ovbABUaq6ngFabNcXL4ios6a+CPOjqV1Q91opu0IaPzWpnumT
	B3HK90+HjbkAElP+sMENLkh4OyEHrZJkuF9f/ZZqnubyEcjTAPwEdHV5ibQX+AA2keCGbF6Im2V
	/QBPOWy+V9YeFuz/PkjVkoqJBmCzLpfOG+tjw7AqLlBfyqty/jxWk7YWe4kLNdn3dMP4B8J8EhF
	+2gx15+CM/DPcGQL7BLMbjTW4FByIkExNNpoF9KS2mrlz6QihBAJiLxvQB75xedDwAf5OCv7/wG
	kKsr3JUoPS+uj45LN6JgsT5l+SIkC9PEhEQyXmWkAHDdkvvvt3hD935mjVxSGWKnnerWJeJr3li
	YNnlqa+iIuv/z
X-Received: by 2002:a05:693c:6392:10b0:332:8b9b:bdc4 with SMTP id
 5a478bee46e88-34cdc3caaaamr1126682eec.20.1790758833695; Wed, 30 Sep 2026
 02:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome>
In-Reply-To: <arzMF0wjcF_SVxpE@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:00:21 +0300
X-Gm-Features: AclHuK-TlqGnIU7ukp8yYWTozjs2IS2nCNkcdYeOW3HWE0VGgW8HyLwmVml-FCw
Message-ID: <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
>
> The description says that this is a feature of the display controller,
> so adding a new binding and compatible string for this is not the right
> move. This is all covered by the "nvidia,tegra{20,30}-dc" already, just
> need to extend that with whatever is new.
>

How would you model it? I have tried to model 8bit-cpu as a bridge, similar
to how DSI bridges are modeled. This reflects interface used to link RGB an=
d
panel, without inflating existing DC binding. If you have any ideas in mode=
lling
this, I am open to any suggestions.

> Thierry
