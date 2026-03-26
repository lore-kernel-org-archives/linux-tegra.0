Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559AB3939CD
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774496931; cv=pass; b=qAc0+eFViuEIVdvS6U233sz9AshmyRwiWhrLIUVmcL9oZu5gQiokkQdUxHP40jrM7uRJkFxmRYG9btz6v9LCoztf2VL/LlkHqjeC/34ZytR8op10+Awd9A8G7i1Y8lcFWs8Yu6T8BqhhIO1UO5S+3FsQWwhwzkAxBoacFFiYc8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774496931; c=relaxed/simple;
	bh=MH3p8Rq8n+uSxru3eIVnCkw7nOCUi0BFVhEsOO9JMXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fvo+AdR1BCYZp7xF+fF8n7JXIlZn8gLeVoZ9Wusluj/zHr1z0z+mFs+VZM1tJdMU1Roeie9LqpXBNCg+iNbjT5e9C7/qpFx8hVoSLXhxNfERyI4/ZCVIVOVf5vfO6KO7k/WDb2blcg6uPhkOBBbgOJLsyBYE2/+AvFbOumFikPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6+cSRIt; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6+cSRIt"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b268fba9aso5575501cf.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 20:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774496929; cv=none;
        d=google.com; s=arc-20240605;
        b=fQvpjmfwkakeRVLkl4q76sSpdycCsRwzOAl85Scwed0LPiThImFwUSZXpQmW2L6s+2
         nKLJTSXUXxPyBOKzB+KsIZu+4clvD6e3hrYZrHUZEybpkkXI6NtAYiaY4UY2gX5FDRAL
         AHCTRXQkLVW0rp4grhMRYefX1QwEZb7mPKwheaGLrwbPZe3525u52PgwaDFay4hwcZSF
         P0kptKq7QGGrtU+vQhwtFu+mBolO+5KWcveXiPf2m+6OoZUeE4j6cRuL6KWoQKBGJ7rV
         7Fwsu4QIbdlbwin+/LyIEFC4YVh+X8CGdfVJmQqt+WpWZgwO7Gc5bjpg3KE1FBhquvK4
         JcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07/utsPXTfE9bIXIPc5MyGyaUqOr0SOGKlBDsG+5Q14=;
        fh=czOwe4yKFv2/WdybbZwtcJNmWpJIIw2ORiL47zT8vKc=;
        b=K6t5xh4u+FIc/BjcaXEZgrgm6IXnCxdmzC2goPpY8DPX59xFLN90GIaaZJUNQ7M3ZB
         HryMJFpEeTlmkOZzFI0gwqjirvJUUleQ0FKpznR+YGcJoi4qzRbtKheBSM3nDxi5Uf9h
         IKqAbLz4lCJKbZVrcJBmcWyuNYGRTHAJGsIHTf1PVpLSkrFvx1F8wfMD3D91dHe2lX6l
         LZY9oCMuAXuRWjDtfRhlF6KJetTlvTbEzD/t9s1mRcsV1LSYr3t9YpNktpPYPiWk0Qd9
         sRhRhgdxu5nNKNTwSZ7yB9XGU2k69+1nglG6b2/Ahlrt0BNckirCUCqJm0XKvgUEu+Fr
         TsdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774496929; x=1775101729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07/utsPXTfE9bIXIPc5MyGyaUqOr0SOGKlBDsG+5Q14=;
        b=H6+cSRIth+F0GnP4xYQ1m4BufU39k/GM9MsejKBhiy010mbT4ek6qz/3o1PpLbkDzv
         jx6aYbGG2Bb9WVGxlQeMfOJDcbUtznjOUEg0tpJlg8HpwjRrJqZ75d5GmhXyeHUT2e/e
         lgZpymrkeamayc0ra9guGldN+wM78IQ/C1PtTZChXxQt36KE2C5t7SA9Xw5cQFrVHXi9
         RCfBt43WZXt1+oP2X6oURHPW/dK01+xFpWiw8jn4EKrW88LRGhcq1RI1qrtSvzIpVmlB
         S8e+EsobtYyEbp+OhKHTb69NJWCbRziFKTLvhmYgFSwQOmdfkWNBt4+ge2MIwADh7Z21
         2ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774496929; x=1775101729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07/utsPXTfE9bIXIPc5MyGyaUqOr0SOGKlBDsG+5Q14=;
        b=tVu/zpnp6ryZRceFZyxHxtm7M1qZXBbJzXYVUgiCwaNdijiyBtOIK3DhqxxNlcmjIp
         VtdoPxp8XjKn4BAeQlSnx5uXCgwp6fBCTdg5mCyd98oSB6WmV/hlc6KH3mOFAV8Or9a/
         rIzWghcyfAeiB2FgM8wdGMUnnqgPSy1+U8/U+0SdvaoZGapbGQwIFxTWvHBGKOvFQ0hT
         hZ1ZyUz1BnPK4MhdBmwWehNcUJ2mDfOh6ttNzCnrzeQoMOxl8jh8Ge4LZzm6z4rTveTf
         RRUfFR+UAX23PfoG7tKdeDt6eVOf/6wMXsmaIky96j/YynRkfFwlU2YIfdi/c89XZ0f9
         PXDw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ruJfeHZxTq+fzaYB6Th4BQEumbrcIKDi5kckm9anpIa3FUVuAC8s0cFdn987EqV7SQfFIkPvIRZ93A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBxyzlt+IAr4cm+A85hdIhMs7S/wA8JBlhM8dB2lkmmzF4lfRI
	WEpdlKoCcIRS1q9+wpSg8FpPNKNJdvfF7yBmwYq3ihJ//7hBV4dl0ZgqJ0cTZU/hX8l2Ze+NoPK
	pohsg8ou3yt/WZplFTqxKQ0/YHGXMxraE+HZO4OgG
X-Gm-Gg: ATEYQzwtgkN3vccptdiY+jGrhv8h172GD33MjxORbS7eW87EjHMpGwW/cCRMmH/62b/
	o2RGKDG2HpfdFo9zY322P5pUvPLi7kWaHqQUB1MEU4ZAdvCJ6oJb38KvCYRNuewzmt7svJAdMqD
	MbsCP8S5qB/YyHgpjtcan8+mnMscogFFdCjwA02+ffq5G26SS+TAAZKqTkpeb7bXrcPUb7rBsbB
	K2cgRCXh6J6wLsu9c12cgOr/DIMNBii0BAGkP9fbU2h3mlXw7x8PNcloBVpyH8qHd1e8PcpOK7D
	CkQ/GWmVKnTGLNZukZbiIeO6bU5nMM7kjtlrdKVJetHpfg5l
X-Received: by 2002:a05:622a:281:b0:50b:5146:8803 with SMTP id
 d75a77b69052e-50b80d3d8ddmr85893641cf.21.1774496928859; Wed, 25 Mar 2026
 20:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128212055.1409093-1-rrendec@redhat.com> <20251128212055.1409093-4-rrendec@redhat.com>
 <4e5b349c-6599-4871-9e3b-e10352ae0ca0@nvidia.com> <a8d841e870d6dbbabef7eadb774f2a58a96c57c7.camel@redhat.com>
 <cfe44924-3419-4f31-8ab3-87b769d21a5b@nvidia.com> <96c9d483f67be02fa1dba736fea465216d0c3269.camel@redhat.com>
 <87sebsdcte.ffs@tglx> <255713ca-bf91-4f7e-8df2-33b7b614a1bb@nvidia.com>
 <221f6dadb6d8ce06f30a24baaa2777e90d75b130.camel@redhat.com>
 <87h5s7bb5s.ffs@tglx> <87ecnbb2mn.ffs@tglx> <b5e33957-1b8d-436b-888e-2b6f13d30782@nvidia.com>
In-Reply-To: <b5e33957-1b8d-436b-888e-2b6f13d30782@nvidia.com>
From: Tsai Sung-Fu <danielsftsai@google.com>
Date: Thu, 26 Mar 2026 11:48:36 +0800
X-Gm-Features: AaiRm50LSOBGGeTsc-k8sx-ZC5DP0if3O1BxiToOLDGbs4CwHCrEIfEV5PdHh0Q
Message-ID: <CAK7fddBV6HHR-MTkRqH2gK=Ga16H6jjX0PsSaPUv-Cfef-WUbA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] PCI: dwc: Enable MSI affinity support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <rrendec@redhat.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rob Herring <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Brian Masney <bmasney@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Jared Kangas <jkangas@redhat.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Do we have plan to land this feature upstream ?

Thanks

On Wed, Jan 28, 2026 at 1:09=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Thomas,
>
> On 27/01/2026 13:34, Thomas Gleixner wrote:
> > On Tue, Jan 27 2026 at 11:30, Thomas Gleixner wrote:
> >> The below untested hack should confirm that theory.
> >
> > Actually looking at it deeper the solution is trivial because in this
> > case writing the MSI message to the device is not required when the
> > affinity changes because the message does not change. It is set once vi=
a
> > msi_domain_activate() and stays the same for the life time of the
> > interrupt.
> >
> > So the below prevents the invocation of irq_chip_write_msi_msg() in
> > msi_domain_set_affinity(), but I would recommend to investigate the
> > actual underlying problem nevertheless:
> >
> > It is going to roar its ugly head at some other place sooner than later
> > as there are tons of other places which guard against
> > pci_dev::current_state !=3D PCI_D0.
> >
> > Thanks,
> >
> >          tglx
> > ---
> > --- a/kernel/irq/chip.c
> > +++ b/kernel/irq/chip.c
> > @@ -1495,7 +1495,7 @@ int irq_chip_redirect_set_affinity(struc
> >       WRITE_ONCE(redir->target_cpu, cpumask_first(dest));
> >       irq_data_update_effective_affinity(data, dest);
> >
> > -     return IRQ_SET_MASK_OK;
> > +     return IRQ_SET_MASK_OK_DONE;
> >   }
> >   EXPORT_SYMBOL_GPL(irq_chip_redirect_set_affinity);
> >   #endif
> >
>
> Yes that does fix it!
>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>
> Thanks!
> Jon
>
> --
> nvpublic
>
