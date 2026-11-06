Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793976514;
	b=t5ifEm5njfWuUrNB2dlKgMsNMLMWaHyUp0t1nJbgHbQc0afZVgFveOlZAVoOxd5gnpnh
	 iYlLEJ54R7VUYj1YmQtD5TCpdc6L30vkM17i2843mFKtOWKZS9FyiU6fJQ9U136ji6ZJH
	 r/qwQFgSwHl0bRYtCUE4RMj8hdO/am9wmiyMWaBFqbdh3CD7lcS3ovCWu5+/pJ6c3g0md
	 KBfHZx5BkNq9F7qQCeBArikwcgS3FSnT8jYvXZDuYUfoRyxstaaeqxJVGaVHVXFrMVGtI
	 6At7jMHDtmpGOL2aTEBW6lJv1DqfgNGEXdH7iZey62X8nqHZ86itdkTy8jJL9F7Ta2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
	b=Gwp21znuclkm6dqlt5q8Wqc/CXDNw5zBV8LNJGEUTSdSt6/WHlAO8K2NDX9ss5qWMm2C
	 hDhcKmu/5wusCQkUOMyhhgZNYnHtzxOrVJw3oTcPbxegnmllbLYdeZ0MsEP9PHF2bHpN1
	 6Lm/v+6hjv5t9TwnoD7XXolTZl7wlPM2Rp2QyZaG3z3sWxSJeVS9b7iv9jjEELYwLubUd
	 FDH9hnYGkiN2y+qWPMTakYDURPPXC/DWuKN7MEWo0gCvuw2HC7t4GwITbSRHdooqqCS98
	 qcKb2RelyB+uAPgIwYYVBQfnzXQmShtkL7EgZK7IpFYZB9UqFXGoAvZQycAO+CMmM2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165CE606A326
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e795af1d4so623523eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793976513; cv=none;
        d=google.com; s=arc-20260327;
        b=QtgL95vGOPWugruqzTyQ/drqY2lk+omsUaHtcZAM0McyKyuQgDjrKmagueDjjwN4VY
         N1I0e0mxxQq/3B7ooj610VZnT1IU9iPjKch/iwelwPMk0xlS1sNuGh9kZtGvxDWWQX4E
         gblS83C2r7JxaOfs1TUucQHWhciBSRa9IiKJtqDphUDv+Ih63lda3QSZb1rW6wiUL7CP
         ynzBwssvDOw8sfutNKfpq+B8XnZ8SUYbQBHQsIbfKh3PaLFt+nFBRnHn4u9QFdftGQqn
         ycjnC1o+nCmmy2s8krMSZ0S7/ql1fkEAD29M3Ua8VDIwYBn9/vkD0XM0OZIWCrQ/6fIS
         XKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        fh=Mj/PcqzZ+7hhPqVSmirQ+oHlGugkaH4s3s4JLWutOT4=;
        b=dA9n1FQ2tjWhVd3U5VZXYjMwQn1OqMQ1hnS+5eFtXVzjblve+Td+pa6GIQ33oO1LCi
         zCZMmvfJAK5jgu1o02iVtL3RWIyrDa/z5OH6HEUqNAuQhQuCA1dVxHsBulc/PY/mXOal
         Duc2zMKzcReGjYbYZL2CFiz/rdK1CCMI5x8zTvTkOkacfvLnLx1lEmNRN3G3XE6uoCIH
         DP9d1xoWKF8MXdFGiKUxVevfYnFVfvIGwX3qEIW2BQW5GYZ88146YkHJq/SCSyjSYqzD
         bUbk5IFkgP+fYtz+vT56JGSEkoa88G4E7Bym8uy1JOaHpZ/2zUwcaZ+6jictyHsmPkAS
         OMZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976513; x=1794581313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=I6fFiPpet3LDIrtYZwCrjVU0804rG3FM7aU8xyPN2TiTV0A3w515GX/EMw7fDua5wy
         vLyJHiJxKbWFGRe6hhn5erMUxwHE4+rVEsR4cZE2Zj1YGrxM321N0JGFNAkJFxtZAWJn
         doo3BfZwVlv2lZlIB6rvt6MU+Iq9aMF+4GxvXEYs4f7lfLjm024VmqCjFN1NXESBvxlK
         PKkVkHVoX64uvhNwCa2hKyX74J0AoB95uY7PszXhiR6STicH3ZS0rS5vR8rwqeDH6Ca9
         qve7fdmCe0MUJ20BYi3xlkjOKZkSxV7NuhL5nba2Zs559O0wnWtjdvGNFZWSu7sndenB
         eLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976513; x=1794581313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=wIYfV+4bmaQI2LwH02FxVsbnDflaHxOWo4xFyZZ3WUWdu0Emo6yA5hERYCtHcey8xZ
         1jBUakxPAhokuc0GUCe0S9Jeldh6jndIFRugRJyQltAtdLmQHTQDcJG+xV1XPJMQ3C9E
         V0LXdgXfunv0aCVRO8oqYIVDHjQDay/BbzFixGKVBI3isWBclMkMr8oyEuaq8Oj+38MK
         EQuGIdbsWh/XtvKSMYjOuZ/RYyFT9/yFnmgbHIAGmCca7cMoRmJ8gTP2y2IYXbUuweAX
         KKJvCsXbUegTNfKv+bFC4uVnl2GsHfUphiKW7MIYKffNQZFnHgHrW8BJ3RKNtgpruVPd
         6isQ==
X-Forwarded-Encrypted: i=1; AL+hErEBWJ8Rjooo6jfygsqy+puGm7Z0mQRLVCrb+swGX1xntyAYHwj4jJxJ3prOtWYrIpe9SyM0xwrSR6/gyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZRE03My64K81cKNK7z3I+rVhYcL5TPYht7n6o5friaLPx1l6X
	IX0Q32pnBfJ6/w57dDJgcN1yKSeEJ6et16LXSVHQFw4QoRiOZ06rbCMWroyyOnHdgjWmgannNtn
	TP+NVuoQ5fr6emr+RrCOm5TeOHsun4eA=
X-Gm-Gg: AYBFou2c6+DdfMQ64DAbeSiaBsCvSqTouTqHD4rgKIxRUa+QKOX5MAJGPnbSfmKvER9
	oAA83lkTFnH9vFRPkUnX8P3e5eimuGpJBp6fDmcEBHNUzYtB10Xrn4Dlin9v4fmFyHImJviox0j
	bceofUOv1Qg6kmfdrUWIt+vpxyYV6R0/RvbQMN7igOdCMnzBDZlYbqrktgAHhPvCQNYVuitObTF
	r5PtBOj+H0JZBvQgN4YqoJqJXqcaiM2l59rEbfMyY1PTdvO0AWJzcDTNmv3Rbqsh2USbBBMF9ms
	Qw54G3UgZM0IqHfMs+holeOL1tiuzAy4mWukMhfFLDxH/ZydZEiUfm3u0nwUMT8YyoyTeoHA1c9
	YOFIdZfyvE6RyyydqwD9O6dhXlnPPV+J9Oh3xtZxXibos9mFNn0/tUl2EiSVbzqp1DhCv6ELa+4
	emmJf6YTDAlRYU0SVjSlWYN7mP8igLLw==
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id
 5a478bee46e88-36eca058eeamr5256866eec.2.1793976512062; Fri, 06 Nov 2026
 06:48:32 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome> <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
 <au3mloMMzQFPUept@orome>
In-Reply-To: <au3mloMMzQFPUept@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:48:17 +0200
X-Gm-Features: AclHuK8DwPrQnJ-dtjZgKOk6mQHPlCNwM8DshspgESp7qhKKTAtefGWbono97xk
Message-ID: <CAPVz0n1j0M1Zjj90pEGCYiNqUQv00N89oPcAxZbA7upuxhoF9w@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
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

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:40=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:11:12PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:08 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++=
++++
> > > >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> > > >  2 files changed, 135 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-dbi.yaml
> > > >
> > > [...]
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-dc.yaml
> > > > index 69be95afd5627..ffeb124905dbf 100644
> > > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > @@ -79,6 +79,16 @@ properties:
> > > >    rgb:
> > > >      type: object
> > > >
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  "^dbi@[0-1]$":
> > > > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
> > >
> > > I think it might be better to group these under a separate dbi node a=
t
> > > the top-level, making it a sibling to the "rgb" node. If you add
> > > #address-cells and #size-cells here, I think that means technically t=
he
> > > "rgb" is now in the same address space as those new dbi nodes and wou=
ld
> > > need its own "reg" property and such.
> > >
> >
> > Only 1 DBI node per DC is available. Adding address/size cells means
> > nothing for rgb.
>
> If only one node is available, then "reg" isn't the right property.
> "reg" indicates we're somehow addressing the child, which applies to all
> children, so I don't think that would work here. A separate property
> would make more sense in that case.
>

Check v5 and talk to Mikko

> Thierry
