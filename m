Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795852541;
	b=NBUZnZlKZGMcx2vNRN2oBYAMX43jELWojDLfevBEQIJlfU0cHMmeJRfHr/Mau2BRifYb
	 2Vkwqq1bs8s4y2SXyPxfvcA0Inb6v0lOvpJIdbeJGXA/PxlPpYvQHWP7efvbQP9aIBH73
	 XhHq3UHi3yoMvIJmlVf+6WFA7JwytsFnI1S5Vd3gwIg39onisk/A4SV3GZfYrhxDgZ3kv
	 cUlU/bN4F6IKEQuHIKFAppsmAjEn+YB4TnSzKxKxPY0r4SFYgHqG9dPMi9xFc/8t8cd/8
	 IEvbuSuZ5nt1AXza0K11dgTBs8hQ7RiM77OCmFAx5pTnGZ3Tgxnt/iL+kmWGgPonqDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
	b=Jcjnt+iGuknj7tWbaJMly6T71hIdd2U2iqOSGh7pSWcamobNxgMawJ85FvmvN4VS0Dci
	 Etu1gMWc35eRtskzXdYML4S+CBVEDJv/NUZVFjvVYT1Kv4lFUT4sAYuF6eE9H1iFOP6eL
	 Xz0tT+isQuBRgrhTYP7l44Rnr9xchYuvw7pojJjRwDdgPNCpeG6m+J55mO9U0Vyx0wxU4
	 ny6jYZUlQ8ENyxkreu0//H7tV4TRB8tzqnfeg3qLONGkxiojSgwqCfanUGEtnwkOIE7fo
	 rtZXk7Mh/UT32XOMk0ISXGNYuIFiQ2z1Uia9C5gGL+GAt9UOdeG3ULzrzt9GdWuFUCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E3606A321
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k6yIzSZs
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386bd881d39so10719300eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 23:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795852540; cv=none;
        d=google.com; s=arc-20260327;
        b=OPgwiB28x5P/4+BQX33sYVrohmK/GRmyt0Y25J7ffwbrGohgsAfpB4WY8dKECkuNcW
         ay5o71U95grYu+9Xrz2MVFIVmkNic/LsAns7+NF/c078BIZ3/8hEYqqshW1HM88twfSl
         vXbMQzvgMRV9KapAYl2Gb9fG0zUkKXu1vM+rL0E+k1CWr+5qrFMJMvV4Rm9PfAZm5mNl
         NlWnW/nUFqQ61h2FDUooJFxy0kFuTRV9Pwb3OEI8IGtkdNMgcB6m3jT8S/C2zpajbuDs
         fU177e8pi5TxDT4vTALpY16SSxY3yxmQUyMM39KWxGG2lNX7r4kuthC1N+rC25dlRuff
         leIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        fh=TpxkSx+Eld/ZDHv9zyQQ7aw+kuotH36mg0zkLSYQClY=;
        b=ODsOCvViyYZ8Ehq3zQArAzUWu4rbf9MdLFbMdtjOzN8JDonW5UoPQYzM2I6RkSqOOm
         Euq7YEi1U3NYYs6dKnLISXCW1rt/8kJgYWicfpNc7NnaWJt2ZJrmze8Y9QMSeFdoqbsv
         Ca31k6X/J6CN8/b1ZfYM4v4un3qayx71JMPmWhLlLI/q6hU/BmkUQueoNXBhA2emKm0U
         bXczmVdjKk0tVdhTMdj58LZxfHjsgMFiwPJ3gWw9EF8+ivvQQ94LC9eA/Whvqwct6DFh
         lBvMZcotY0H0MLJe9bcboBXncwzPnYVuQo+pPiejIf8w1joblzq2q0CsNYvzCPM1Khr4
         QM0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852540; x=1796457340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=k6yIzSZs5j871Tsu5ramhiBI44Cs9MQpJNNP/7T39kC7FHeV4ALzXTvmxPLe2094IS
         gSqrGZ0StYjayUUhLEIdrbivQXsIXuZwwDpBpvAAZbyeCrhoy31Krv9sCFHQU1XFvrNP
         YllgAeW9zRDGHhDUw8ZzH7690ziZrOT6m6z9lP7NlaNkqZJEZw8au3ItXPqF04A5TL93
         TjZ2t9qA8+d++ma1/RMqzi1CZvqeHIKvMqmbmsKE9Gxu5oXan58VoDrgjZs8aznrjrMD
         iT1m+65866llFivUiI7RuN+RVp/gaHIxt5ydA0QOmIQXPF0HJhmVpy9m13GYKUAGJEwl
         x2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852540; x=1796457340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdXJuxT11f4xHYQZt4NsB8ndiDlb6V/GAbpnGwwxv7A=;
        b=0FCtTbxUUD45XCLyiwxnT88U4DmcH0HxjHcJiSPnS5O6zHyyy8jb96HGAdzKd64i0p
         Gi21hGxsNlWexki2QtWmai8S97Ml0PSIjycN2p8t7UntSLulTrxn1Bx/vAox3JOUkgHL
         AZrmtsjGlTtcMGbq35x0+vAC5B9gXn2+1oTzPIFhPX6lKc1gLqs3yfBmRVVvHHcuoln/
         hDsWqhOv2Z6lF6gwNjVa4xY+diVojvkpRkS9vIVtnxqVepnj9s2Y5G1/3UhUfl/PHF+y
         zrCPWe/GO5A3txLxjq05Q22HR6nFnuVK5Rxl4WtCUw8GXZGMCpQdSdOkfxCTdRumRUs2
         Jj5g==
X-Forwarded-Encrypted: i=1; AL+hErFu2bX4S6cnsV0W4pEYH86tZNJQC9ujdS+HcUB5X0uul7ei9/Xl0VZ3658K8+KdDt2aKnK1SqA7uTxcNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uWsDXfWFRIQbQHhItCV4lNd3bCufA8l5soSCj7dp4l7lywXN5
	VCEyEOGBPHlhzHcsVexft5zTGayvOiwSs7K4ZxGQSxlB6h5KQE7p+YrDsYuxu1AKpOSrTXLMFsm
	dNDz3g2M3d8y1bR6qZccOkH5hQbmBjH8=
X-Gm-Gg: AZFdTZd/AxRzXSS8u41J1AnsNYmrbVmiQl+yVJzCKeKQPv/2v+0nm8b72bJb1dSAozg
	8fXJc+6OUeXJTyTGIsnVm4qEXcSl3PBEmiWD8DewkJq/ECrzwKRkckNpSVek0mM/0dV+X8K9Ghd
	pWju2/it78mnXjOuE0ms/J3mBJ/MCG32T0POeBosYAKH/kGGGBxeYV/Tv0SdG953GpzW2T9zSM7
	Y0cRm3Ca4iIx7cu89bZsFVG/p5jbQ+wkBl6KoNk+OpBiagCsb4Spb1uqiJ4x2brL+RfiAyslWUO
	HNg9CLQzuD/QP6N53u/EOy1hunxKzd0ISEnH82LCsWqlunV2CRk27cdfmncvCzjSMo1fvjP6cl2
	GtNlE2n2zyqA4wSP1osUfmbdY/Cv15//uhS9yWJUDOb46vYCHhZxUutLIHdgmSH3YhCtMyNyiZd
	pxYNDnZoyDhYJ38RZ3ZJ2Bh8xTcaOdcrbxkb13hGZJZgw5ecFLTSf3
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr23973057eec.20.1795852540349; Fri, 27 Nov 2026
 23:55:40 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
 <CAPVz0n1xeNP=rv3qDMG06aSWRLTVvCfuo5tFyt9fz7KDTySV0A@mail.gmail.com> <kaWzD58LSXePk8E_XcD28g@nvidia.com>
In-Reply-To: <kaWzD58LSXePk8E_XcD28g@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 28 Nov 2026 09:55:28 +0200
X-Gm-Features: Aa3M54oteGux7ycBFDqaQLj_8yYFVhcMiRkeiuuEM4I0oXp7dJIyrqrkoXPQNzA
Message-ID: <CAPVz0n2S=LVqgXdQsFX-A3q92YNpEu-S_NWm5Sf1uYJexEEkhQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:2=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:41=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:21 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote=
:
> > > > > Parameterize configuration based on bus flags passed from the bri=
dge or
> > > > > panel. The list of supported flags includes now pixel clock polar=
ity,
> > > > > display enable (DE) polarity, and data alignment.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > ...
> > > > > +     /* configure DATA order and alignment */
> > > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > > +
> > > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > > +     else
> > > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > > >
> > > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to che=
ck
> > > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB=
/MSB
> > > > bit ordering in a classical way, instead:
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > > >               R[7:2], G[7:2], B[7:2]};
> > > >
> > > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > > >
> > > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > > panels depending on the layout. So the correct value depends on how=
 the
> > > > panel is wired to the SoC on the board. Hence, I think we should
> > > > describe this with a new property in device tree under rgb/dbi or
> > > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > > document that this means the above kind of wiring - not all RGB888
> > > > panels use it.
> > > >
> > >
> > > Ugh, why is this so confusing...
> > >
> >
> > Using 'nvidia,rgb888-wiring' may be confusing since as you mentioned
> > not all RGB888 panels use it. I can add 'nvidia,data-alignment' to rgb
> > properties and set 0 to msb (default) and 1 to lsb, or directly set
> > boolean `nvidia,data-alignment-lsb`. Let me know which is preferred.
>
> data-alignment is a very ambiguous name if one isn't deeply familiar
> with the hardware, hence I was thinking something a bit clearer would be
> better.
>
> I agree nvidia,rgb888-wiring isn't the best either, but I'm not sure
> what would be the best choice here, off-hand.
>

'nvidia,disp-data-alignment' to match exact field name it refers to?
'nvidia,rgb888-wiring' is too ambiguous as well.

> >
> > > > > +
> > > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONT=
ROL);
> > > > >
> > > > >       tegra_dc_commit(rgb->dc);
> > > > > --
> > > > > 2.53.0
> > > > >
>
>
>
>
