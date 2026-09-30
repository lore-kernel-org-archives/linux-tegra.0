Received: from mail-dy2-f32.google.com (mail-dy2-f32.google.com [74.125.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7B4F796E
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773888; cv=pass; b=pR3LUdSNw7isIam4UBfWMa+Wc32wtAAwueH9kCGxUsANo4sQfLIDA9K3/d3DB1AVboURjyxed74AfZ7LsIsOCO7VGgWv/Vvt6Uhoy9wLkpzIbuWhP1xMFfbwREs2PfZ9AqqLvzEiRCVY0CnKh/NGIEQ+jeuJiPhx0ZtUsk8AI/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773888; c=relaxed/simple;
	bh=Zt8I0rLvsyoWaB8MFKSA6VF9+DaTZuRYcVHpW7GrWDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fc4r12Z18Mwyg/C+ThOayOyo+Df/yzfht21gfpO0A0Z791u4FTf+PQTcvaCU33qvt85VjABI3lz6qqZ7IIwxFVsasvbUiaauZAUt9ZvCSDlsXtg+iM+sFH1xVDQ7Bye7Pd1YWIw1mY4XUoe27i/P1FuYBJzmH80xGwvoJf+V5L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNtPvpJM; arc=pass smtp.client-ip=74.125.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNtPvpJM"
Received: by mail-dy2-f32.google.com with SMTP id 5a478bee46e88-34b223602d7so1383626eec.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 06:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790773863; cv=none;
        d=google.com; s=arc-20260327;
        b=jd4YcPNlpfivt0VuUHbBIaZEiI/GCXUNEM7/L4nMLNlX3Z1DfUGyKCU/oNVKm4LlpR
         Hc2dF42SkYC/13EmhpJOK38VLStu+Uz0j7y3fnfkXTQ+Hc8+MTozRgOOZaMKMPCRtSz/
         hJ+YiHK14JaSL8SfluX6grUzN7YbzfqnK4Npua4DCp43fywDG9HuTdh17A2VYS556e0a
         36536sWcWzKuOoZdbRndtFCRHh8k6ZQvCkgj0DQ1gZ5Ufp/+jdnq6LMNM2cccpUu+KQh
         nvRlcbXHQkUWGqi3wE6CbRkNJ4n2JUo0f1QViNY+bYX6xOOR7UZgCjUp7OBgxlLStQsF
         wgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        fh=zh9W4klnPxmeR6FECIk3ujj6EBwpGM/+rkD9f3lXIAc=;
        b=HSb8MZfwjiK0ZXn8UgsuIv2WJmyg36LaTqGY/WKwvmWMdelrXZUlM1Z6/CM5r+AFhk
         tf2p3cNw56b1jt4r0ZCLNJRukjaam4uF5FpYxNStMO66SYgxVZTLFJM4hLLbsIaR/g5z
         0EPMUKL+HkP68/l3qisetKQThiLMfqvnh0m1W96Ecu6hEHPq/dGOjmphsPYzE5MjgbLZ
         kn9n3h8VDV6B5IJ1LzLuPnCCYYttzRaQvCdyjMCnwmlKGWQORaMH904KvxPwQ5DoVeOh
         PdvdkkIkihfbIs6skYkE10iOefdufusw6JuDBtfwIb3S76wN4pmCQxbJjrQuLNz7e2yq
         0prA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773863; x=1791378663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=VNtPvpJMSRf+Iz5RkG2YCEprFK/z7SsWmXEYc4ujWJQiBi+8Yj42wkZS9epDEjvqrg
         Kzd8JE9v5hkziOQ5WaGz5r3DoESExEWd+BF2o7Scdyr9Z23PmEh2SSuw3Bf9pyYtLq6Z
         kcM9Jm5MUdRCpU90QDCR1SWH1lhmMXpFK3w9YmIURO1MQLJarvA6vaPjpJ94d/eb/2sJ
         VBH1JrOGO257kGek+l1+CPhUkkvzTTj77pVPcsSUtIyqsHPK0Gvf88ukpgS/aMi11JoR
         Utlfj2q9JZvyNo/55wRoYxjVq75TDeaUxMJ7rJypZSk0asSp8P+A15XrE6ZbJoethWAk
         hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773863; x=1791378663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=Nf5JwNEtIABDw7MKUaLz0bPl9Sw+X1DneSp4wp7YcoKrNV96t71uY2YOluKjitZJDB
         vxP1tRz3lp3VQ3GTq22O8IXBTLom36me2LD4tXeTSSg+JdhLk7z+NPuGXI075wcmXQFq
         1MprZUO6cFX/EkU90uRslphGuJZkpE/HwTEiGRhUwhd5qCzATqMGIw3L5A59NQ9LB39Y
         aETDbvHTCHdCHjhUpkPh5hT8ge7mCiDnqR87Pk7fyG0PRv+Hz8OXHYyQzNNZ/9acKCwo
         fzKNCEpLADTkPLKPYMEPnJUTNhREJKn0W8+oYTV3Nte0DUG/rTAlflEdEMaynod2wXzK
         c7KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwCrbmrQn/NldvpThssA2XMTnbwIm3AeNg+RLbKknd4XZbsIfJbl9/mxpFqUGNVXSkbKDZBfcdkgAyAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIB9+Uo3m/9B+8ELFFHq8oAIQf2Jg5GCp+1E3VPEs2Ao1VGNrR5
	nOxd2/vVZs2ZuyB6EXb35rW5MOIu1u3SC+5nyfXG8wtD/ayTxnvwYuZVIv5YJoxvnSipNw+mtgJ
	Ca0qYilsfyY/h216cNzDUGZ9748AAZJk=
X-Gm-Gg: AYBFou0C1Trd6tTvwmm74jOWYz8TczPIn49OqvhEZQWRji/jpZ49+l155LBF1rZa3Iw
	LmPrz2OpRMag7mjVcLfNVlLEiXIWqTkvhrkwutoIBGvm4HLCfjALQnvCynXV9AvwwZ+4tRwS036
	aSmGnqsdHLUuYGJTU3qs7fGgKMdtlBqLL4sakbFKgxgxtoIxII/WUjWyiV4xUBcCswZJEbiJbqz
	4v4cb/rx+0fb9CNATTPJas62gJ3WhSja/7CgGN8r4rd2tlyl2ktOxXRcq2qoAgng5p3gE0S9+KH
	GWMxmgAMG14flpP3zFgHhX+eeSm54dNY3Joa+a4gt87JveuF+mJc38Bss8WG9c3fBqVBrHE1i6o
	LCA3AbRyHmeF4
X-Received: by 2002:a05:7301:4b06:b0:33c:16f1:2e11 with SMTP id
 5a478bee46e88-34cdb6ed6b1mr1708219eec.7.1790773862800; Wed, 30 Sep 2026
 06:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome> <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
 <arz1wzEI_7e7ruKi@orome> <CAPVz0n12oiuc=5wjeNCuNtJpe-M7Ys=rHn0TOExc0qkweVQnuA@mail.gmail.com>
 <ar0HCfSKR9yr9Z44@orome>
In-Reply-To: <ar0HCfSKR9yr9Z44@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 16:10:50 +0300
X-Gm-Features: AclHuK9PDl69Sotr67TThU9DWzl51KL70LQ5tx9814AsWsSrWDYmjdY2XxCFv1M
Message-ID: <CAPVz0n26bPgAYjAdpqknPdMeQgYd=QEfZLX2VsACmkTQNJ581w@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 15:58 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:56:26PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:56:40PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:50 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 12:19 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav R=
yhel wrote:
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
> > > > > > > > +
> > > > > > > > +  dc-gpios:
> > > > > > > > +    description: Data/command selection pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  rw-gpios:
> > > > > > > > +    description: Read/write pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  cs-gpios:
> > > > > > > > +    description: Chip select pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  data-gpios:
> > > > > > > > +    description: Specifies a set of 8 gpio pins used to tr=
ansfer data.
> > > > > > > > +    minItems: 8
> > > > > > > > +    maxItems: 8
> > > > > > >
> > > > > > > Based on my admittedly brief research, according to the TRM t=
he display
> > > > > > > controller can drive all of these pins - of which there are t=
wo fixed
> > > > > > > sets as you mention - directly. So we'd need to describe whic=
h interface
> > > > > > > the display is connected to in DT, but not any GPIOs (which t=
hey really
> > > > > > > aren't).
> > > > > > >
> > > > > >
> > > > > > I am perfectly fine to not expose any gpios in the binding, if =
this is
> > > > > > preferred. Only question, which method of interface checking wo=
uld be
> > > > > > preferred. I assume if primary then nothing, if secondary - boo=
lean
> > > > > > prop "nvidia,secondary"? Feel free to share your vision.
> > > > >
> > > > > The driver currently uses the GPIOs to program DBI commands, so I
> > > > > suspect we do need some way of controlling those pins. Or is ther=
e a way
> > > > > to have the display controller program the pins and send commands=
? That
> > > > > would be much preferred because it would more accurately reflect =
the HW
> > > > > design and possibly also simplify the driver because it doesn't n=
eed to
> > > > > parse the GPIOs and then also not use the GPIO API to set the val=
ues.
> > > > >
> > > >
> > > > From what I know, GPIOs must be used and freed after use. Sets of
> > > > GPIOs are defined and remain fixed for primary and secondary
> > > > interface.
> > >
> > > So you're saying that we need the GPIO handling in the RGB/DBI driver=
 to
> > > prevent anyone else from using these GPIOs and potentially messing wi=
th
> > > the DBI communication?
> > >
> >
> > No, gpios are used for dbi communcation while their sfio versions are
> > used to transfer RGB data. So there is no risk in external
> > intereference.
> >
> > > It feels like there should be a better mechanism for that than requir=
ing
> > > the DC driver to request all the GPIOs. Maybe these should be exclude=
d
> > > from the range of valid GPIOs?
> > >
> >
> > NO! These gpios can be used for random purposes on devices with non-RGB=
 setups.
> >
> > > We can make sure that device tree isn't going to use these on a given
> > > platform, but there's still the risk of users grabbing them via sysfs=
 or
> > > the chardev API.
> > >
> >
> > Well, defining them in the schema as it is now and adding a note that
> > gpios specified in the binding cannot be re-used/shared may be a
> > solution. But overall it is impossible to reuse gpios dedicated for
> > dbi by hw design. They cannot be shared or used for other purposes if
> > dbi is used.
>
> My concern was that somebody might try to use these pins as GPIOs, in
> which case the GPIO and pin controllers are going to interoperate and
> reprogram the pin functions, potentially making the DBI interface
> malfunction.
>

If 8bit interface is in use these gpios cannot be used for anything
else. You can be sure of that.

> Or is there some other hardware mechanism to prevent this from
> happening?
>

yes, pins are physically linked to the panel

> Thierry
