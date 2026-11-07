Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059849;
	b=Uo9JsQaSi672Unew4XASdGEptvx9kOlKWrphbx+Vgtat12y6MCL5KLx6XiMtY4tDbR8N
	 vri20a+sIaNC9GxDW/GQB3WEGqDDVEQpx5fjTM2tABymfW5dijZ3JUBp5t5Ni+eNKIERo
	 tvrBztqV3pICidLcih5tG1NEpmNCKkJUkjbyb6fiuRCb36TP5IDiazBgmH5z+g76v/u/c
	 0bKt6u0mk5EwFLVtK1KD1lpN/zlJWBZAF+fsSDREPCQ885nBG8o1siHPuYkza0GRLWIDi
	 41pk697Pqp7G0jgkuLcieSpAALyXi9zVC8gIMYAjmH5NB339/BnQ9KLK9bguu47t6iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
	b=qdKeqtzRd/9F6+f7swP/DXQ4o6xw3kgZJKHyjOI1SN+nOTOnJsq+/beySToEn5LMFsVz
	 TxOet4KwwwoW7LYm4zatihk3ZkIsN6iq/53E29oxlu6HZvSofOOodHQh4PtWy3pZExqnu
	 +GToXXgVFuPqjuUZXbuck3zQjPfYPUqOZNZ+We0SsCcyreljSPPpT5qYA8JTOs6wkOY+p
	 h/42f5COUrY9Jf3uDwiwc/FWAdoAE57A5SiLl0Ys0WUhWbw89bqbsqA6WRhEDs+T/EWha
	 +6zZQiDGb0xhdSBUzaHEJ0p6TqsffYVbmLAF/rUrcnGQUUhwBmmY29rtOLiDObtwbDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DFA606A326
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so3129502eec.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 05:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059848; cv=none;
        d=google.com; s=arc-20260327;
        b=g4RWUeyKJlLxT7ska9DYHcv5UPaPiCZ9x/mLaXFpGBLb8UpLs/MpHqvsQiiZojaPxN
         bwYExQ2oocAGowfFiR5+uw1MVlYdybLtIe7FYXI3CBRIlpMa2Inzx+PgGjBfAdHTzOyG
         AToPvK9qVsWbOkXPY7or78rQbKwjm8xBH3QUZ0GjkctS8c/jp02OEfFXYt4KhbU2ijPG
         PCdwDqfqNCmvpMzkWrimIc6YL8cUdcsiSVxFGe2HKOlCFjfkiTfrLMmBGsGWAxieOnT7
         7UMxbidzXWKW+bhlqCfxk+G9hmyhjPE0GRPRzLVdRbaMx/IMgKTgWKvWWzxNm1NjxePd
         8JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        fh=4M6Xmi41BQVgQNukg1QML5+fpHZyzFud1YOsbYvoQKU=;
        b=svUcp+78lnB8fNoyT6Mb0mGHfSnfkEyI8FQwXsB0KZ3IfJLP4lFjngVq0F4RS+Uu1W
         CVeFISxR2mjQKs+IQGGFzRxVFffk/GmCdrLc0IeSuLpAeRlOglYrmRG+JjqBqrozBXVN
         NmWCmSXERPio0GgSUJx91IqwcGcZK/hsld2Nvu9Kjzeu1QXhxb/4OzjTcI7Z4vbgB75F
         XTIUhRYnkdrDoJ7P50OQyPTOeUxVbw1L2lrfMdpwmz9TukXVu6o0IKW4twe6Ok2ZGx2V
         xHIiYZJJq0xrA7+m1qdVkeJGKa/eQE38Z3vea+5pyuzUAwYhOIQKCtUUvtH7uwvMtWeu
         0grg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059848; x=1794664648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=pb9bekSBbz+xu2u0EigR2q569gXg9ukKx33kFt4Ckm3Ze/Mke9vrgStZOPNUbfCp//
         8wISeU9KpKnLtk7SRVkReTXDwKntNDrB9EBfDBBy/K9HoUzRM/vQDJmKs6vc4GAdUYZB
         LG5/wAbO7AYvecwG/xABv7okDo7BxsEXCypsQm0H1ooKr0O30BhaNjGm7B7UZVQj+FQ/
         AKWowHbO7VQGLhDk/f5MCkcR9jPutmrzLE/acJalzITiNL1NDSFwCcCKgdKlVN57gl9Y
         1OrSlEYoZp6q1j9fZzt7+8MJIjvYxr0mMPoSiFNp/4VSSZ1C5QCm7l2HvFxz48zAgdtn
         IblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059848; x=1794664648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=oSXBUTPq0/M8iUteLoZCdi/TGD8jhXRWo6DVeFJscL2LWRK/XAzU297F9jwgyp6Cjs
         QPU6w4QBZOiDd+rmc2AofgNpLBzcfzJzQXCM7E5B1gdAPrUch6Qt5nbs5xSZbrt95hP7
         1jjqCJGomv3qQ7irGhtQgEdwSZZByGjzfr4EMDIZEJnuTRaLm3xXkNw4keNzMH6I+o6Y
         uHsEJVqyoAV7b+8mXZ4i6a8DWRRqqrD2wdQACi80o3/Y0QH0yKCfEcjJYBQ54GFGXj62
         R+Ujhq/LHMDHuHFwe0l73jjE3oAckk7Bjf8dbNOcaNVYjQStVGvGOntL1Av5WElnntIp
         fsGw==
X-Forwarded-Encrypted: i=1; AKwUvByV3hEm9ScVFWY5o6oMXzj7dX7VJ+eWcXxwbv1HtwF3C4IAvAaNS53ZaX6jZasmMZ6wE/fCXadWmO5ZCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iFCNd9E9V9sgmi08DcfHNgVAIp2cO3b5QGUuFDoYhbUM9NsAR
	Qeyrdw7HcMruzhwIBHdWnoJ9DAekdyZiJU41cwRWPBs7DACDD+PlRFR4Nfv5ZejoxzkhsUNSn24
	sbhp9yVq1k0hRWjO+97sLodk5vzr1jsw=
X-Gm-Gg: AYBFou1FWU7rBhKHxPN2+SGSeC9t2Joy2WYGhs6B0f2+Y9GG5FBg/Hzn6sETbRK3ygP
	Hwmnj9W98mCcMohgUlyvfdzmdpOefs1P3gQg8lfXVOIIsCfqqf7CN/PTw5NmeoVA+yQqwHlTmzl
	bBFHeJg+e2w96HyU3Jv8XBSeiD2q1D27r63225yA9w5d3T1A0Nigr38yFRUk+jLq1QNdqYQ2Imp
	2fk+7wntI3lSH8QQCz7sv1v/IuusdMkdKjdrzfXBtxTm7Lmey200fViP8C1Hx7BsF+bzUNELd0Y
	Re9Neb4rf7X8pcZMeEQo22oU5y0Ii/1UxgdY3y+Mtqr/OMYWDb6/2JxAWZ7QBzGQxcFmyGw1W8L
	uHTCQPwGEo84rRP0LiwuoXiVTX8fR4m5mqL/lQeHol29kiOVV/aBgvg6CSswxv5kX0K8/0MVTaU
	X0ZoSJpFBAEG2ake4bED7Cc6pE6+ecflz7TRLsIwTnK+AInSulXS0=
X-Received: by 2002:a05:7301:5044:b0:36d:4570:a32d with SMTP id
 5a478bee46e88-36f727d41ecmr8063214eec.2.1794059847565; Sat, 07 Nov 2026
 05:57:27 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome> <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
 <au3w5Euhy-DyY5qQ@orome>
In-Reply-To: <au3w5Euhy-DyY5qQ@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:57:16 +0200
X-Gm-Features: AclHuK-rhOpUYmipYorAqU7OgtCn1M9P26bKqsgHA68BQBZ6wF3WXusKjqauthE
Message-ID: <CAPVz0n3JghP_XxiS22htU_uydhtzrTPKHJsJ4uR2iF12ogsXfw@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:26=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:00:45PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:19 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI drive=
r.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++------=
----
> > > >  1 file changed, 78 insertions(+), 89 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..d5d7ba2096608 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbi;
> > >
> > > It's somewhat difficult to exactly see the difference between mipi_db=
i
> > > and mipi_dbi_device. Maybe that should be explained better in the cov=
er
> > > letter of patch 1? Or the documentation added in patch1.
> > >
> >
> > It is already documented in detail in the drm_mipi_dbi.h
>
> That documents what the struct mipi_dbi is. I'm asking about the
> difference between mipi_dbi_device and mipi_dbi and mipi_dbi_dev. It's
> not clear to me why we have both mipi_dbi_device *and* mipi_dbi_dev,
> especially since they're very similarly named. People are going to
> easily confuse where to use which.
>

May anyone among DRM maintainers clarify if this explanation is
required? If yes, please point what and where I should add. Thank you.

> Thierry
