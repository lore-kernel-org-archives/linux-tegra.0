Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C530497B7B
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764958; cv=pass; b=LcpsERRchmKVcfdzvFkTIrkHaQOP+9aFYT9eJw9ASF51izR3eXxXSS7IPuzgiLCV1LERVvCnTSmsIbkPEo0Sq9W3YS6mAVCOc0wGqCKOJC2IQ4w/T/NZX9yb9rP5aXEYuJgwXDNnhLa5GAyRlOFo+RWpSc9EJTzdflvELv/drVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764958; c=relaxed/simple;
	bh=bsFH+GvDY/LoJjlhGOF78xHnoRniyt3cIA6gB0xNWXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuyYXzhrqHL4tEYtXjyMXBhpRObMzf/MZIsG8+cLYiLoeApwMYQzg3J/1GR8ZZ0kRbkZYIDQqK/rRGqJHCssbPT9M+dg9SnvTLV7hKmk8UjbNjP1XOOOFzPD2aVMz4IPwtyn4gcJfhrKaWGwMgD/iq0wqlt8g/yJkasGHRBmSSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn2LkyI0; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn2LkyI0"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so5903413eec.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 03:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764950; cv=none;
        d=google.com; s=arc-20260327;
        b=omaKShOLTfY32/br5g1T3e2A53j1TVqgPsWqdjt1kKq6bPFvs1p8As8F1fZobW4qcP
         IbJW+ZXc8uQrRF5Z6l5DPANrNidmYSKUJt4qNGBtONKSB2Rlu5UFu+xipoJHTA/QLxvs
         5UpOy3ulUXJQhFLKmIRbtCJl0KMR5brEpSUiwjhoEdhy4+omA4ospwzwt10EmX2kyKMl
         RDB+Lxs06NKQOgUFwGSKHKKnb27i0QS+ydRgFadV85Z4LYbD9S9kk70wleHW/eztXGXK
         XX4xSdD0VmRFBvfAns74GdycPweQMYwuH8bcUMYVtrBI2Xyd0esLIOjRhXLxvirz1EUj
         GA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        fh=z3R/Ur5Le7C/c/dpB25rBAmoYHAtvjkVHH1Wa0z3nIE=;
        b=d65uS4M+g0xOuURHxa/4QjiqOzMZO5mbvdtosyvl5jm7HqDJ8lLEnP7g8BrlojIFpi
         AQhgKBlHOUZDQHBUTHEeonkCpLooYSw7bN9MMKQ4nJwtYaEzjCjg45c8HXkE6lGkEDEX
         mtVKNHw/8ybru7dtv9Klu4dsoR1ZvpERkpoAqnfoMWUjNstN0s3F13wWjWB88FF6n1e2
         1T1Tf9U/Hk4UbqtHynwDRB1X/hCQcK8Hbg1WtGH7vAWtPozbJ4QvW8kNfzoc00hCDuiP
         R9N83xlFtPFO5QBEfbGPtyUwD62bFPzTZzSG0AdKTCO4yIfQKGkkRO7DtOWVvUJBDZG5
         7ZuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764950; x=1791369750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=qn2LkyI0JY8rRfHLjXyRjc1mCxzEradOcD0RDojES9QhgN1U3RUQq2WwIr3kTCHB9+
         8/nPeVyl9My9cGxe4faycArWlAqLyhm6ZW2heGhMQ8I7zudVf0KL8p+nrnwgHdCHTleB
         4987k9riDbjdp+p6ig1xZ3WBgqW3/0+2iM0NU3QdEoQmZlYboPLJX2uJt/R0bP24gdt4
         YBrGpyED3wzUQr8eqljxMDM7Loc6lxGLssA1APigUNZxrRF6RyrOMmfINrnViCOVA+IJ
         RDWjaqw0HWzF9OFUzHV/luT1HNRYseSm0yvmKK47B1QIseR0TqvEv1CxXIEtL9juciBP
         3Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764950; x=1791369750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJzAgwbp6neWrPgsw3mH4T/Yci4Kta5JlaoTPrqtAW8=;
        b=XY7FJvRVJH2lt47X8RfELLVbPdlaFMhW9wH0ZVUmeGQJFFKvE9PM/jPYYxuHOOo0fD
         4z5WwVrH3BEbKBa4CCK7brCHMuwI0+Z0WXzH9XgWlee6UcuK3Jph9TQLJYNINh5ItTwg
         wb6jwUjKiuL6YUbvnhdgTV+F+q7Zar68baLoXuJHvQ3/ro8MJaQzKl8Uh3uVo07kuvOl
         vyilggXVJfefgZoaM7EczLDv+1JVWjt0kB8+5IqY/eriOiHh86NtiuzHFrHZ93ZOg+sl
         KaAIfgyuV0iEB0JPrqFDIxMLMArkf/2ZiugQCvZXGkV4azxImQ79Gl+FuoCjSO07NDSi
         RVnw==
X-Forwarded-Encrypted: i=1; AKwUvByxunxFcHmmd8AyXHvg5uGhcRkwWwi2IUN9tG6N318Dt/MdcCAzbyBV+N/TQKI2nFru/LPjfATVcz+unQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK89Y9+ME17Kc2jxL5ab1rzzt+JCiD1V+B/DVgu86hxPPYD5cbA
	39Es8mwq4Rt9xXZlQckkhgibtoXIDy3WsM+vFO1WwdUQN83iOB9SjoPAM4JaxrYFXyayOp1Ak+g
	1nPLIy41hpazWXSD7D2G4FNu7slFrrkU=
X-Gm-Gg: AYBFou25TKOEAsQMq6Ym4UmcinWE8SFCulv/ch56x2OgU5t9okFI2kleg6QDGKqzAkR
	TRHfFVyxgsZ3FRWdg6LcKjkQ+3Le3nkmI84qfaz7qrU0Fx4xz9Gt6fhZKjhfOaC0K+16HrR0D/k
	W2gJb7ay5M1a3wr7U+kzELFxZxI46rNhQJtXD/3u8C2xznMl86bKozq77IcSPW3bNrqQSJ966DS
	FKEJtXoN2Ci49u6j+WZrgKZSn558u57NaTjlP/7jUpxR+1ZIi0h14bRM9ZjB7Y89pBKeRx89wUo
	Ih4TMnmSqiNAiubiI0kJSuqdbODmb7M7MaQ7PJnTPM96muI5y8VDSTmeyjfnzt8nmlzx+mkNVHI
	ZlCdWvBZZ4aeO+Q==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id
 5a478bee46e88-34cdd0a96f7mr1217151eec.2.1790764949439; Wed, 30 Sep 2026
 03:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome>
In-Reply-To: <arzlR8mCg9d_z62L@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:42:17 +0300
X-Gm-Features: AclHuK-DuyyAs9z6BpVs9PR86an08DuP-rLMFIX2UP_bIS5QjiwEsXp1jDjGZck
Message-ID: <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:34 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++=
++++
> > > >  1 file changed, 138 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra-8bit-cpu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml
> > > > new file mode 100644
> > > > index 0000000000000..f0dab608b2936
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-=
8bit-cpu.yaml
> > > > @@ -0,0 +1,138 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit=
-cpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description: The display controller in Tegra20/30 SoCs features an
> > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > +  protocol and is referred to as '8-bit CPU'. Each display control=
ler
> > > > +  provides two such interfaces, which can be used to send MIPI DCS
> > > > +  commands to initialize and control the panel while image data is
> > > > +  transmitted via 16/18/24-line RGB.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-8bit-cpu
> > >
> > > The description says that this is a feature of the display controller=
,
> > > so adding a new binding and compatible string for this is not the rig=
ht
> > > move. This is all covered by the "nvidia,tegra{20,30}-dc" already, ju=
st
> > > need to extend that with whatever is new.
> > >
> >
> > How would you model it? I have tried to model 8bit-cpu as a bridge, sim=
ilar
> > to how DSI bridges are modeled. This reflects interface used to link RG=
B and
> > panel, without inflating existing DC binding. If you have any ideas in =
modelling
> > this, I am open to any suggestions.
>
> My suggestion is to integrate this into the existing "rgb" node, or, if

Not an option since it is not clean RGB and there will be no way to
distinguish RGB from 8bit-CPU.

> that becomes too convoluted, a separate "lcd" node (or "dbi", whatever).

This is fine by me but nesting nodes without compatible feels weird. Oh wel=
l.

dc {
  compatible =3D "...";
  rgb {
    dbi {
      ...
    };
  };
};

>
> Thierry
