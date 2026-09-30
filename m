Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA547207F
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758948; cv=pass; b=glJ5cS2MxEwpjnHmuMa9MBStOJa6odg3GHyZeIIH4EckHWVD2p4A61Znl2hUivXh0iIC6erm18g/xXkpIssbtjVkaMwltZJrrHbd+Gz/9vUQvLnstxjURtXKd+bNL3gMjVA1dLumS+hCuZ0xGL+X09LpxWV6p2VMyWHyKqGrxnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758948; c=relaxed/simple;
	bh=LudNYNgHQKH6hdYc0e5cVfVYBZBCqVTtPXU1MdM7gts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ik7IRBfP9Uxt8CRjK05QdM1KJU+GFoq5cEYOkTCKQMfM1tCkPAknTh9s+K4Df4PwpEct0LwaI1OHfKdcE1hN7nhOnjdrHXuFmhZvW0PBmRnKbXMgN8MjEyosAIqTqzvREq2MrZ9yyqnl+PznNxHfFHp1Nxt6nABkjImFIkYpMtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBIRrWvP; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBIRrWvP"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so6491462eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 02:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758945; cv=none;
        d=google.com; s=arc-20260327;
        b=cZbNOJzj2XWo0gxgckznCze315FeVoWyBn9vPxK8NSm2hFWGZDta4kXFLRqM6xxMtg
         5emCZvo9XWsFDXwBtdfDYXcxmSvRoqFMGtgkjy8Ds2cIaR4nDowVkD3Qzv67KgLdo8nE
         RHSm8vKy6XKsHkb6HibI/Du7JUXRmu59AafdvANXicOhlznxi4YxzIe4RtNwMwCkAKSS
         K6SxLckL7H3SgSR33yIMuyK8SrBPg1hBntn/doGnjbvLLLm73qWQs+XpevKtFovxeZe9
         qyWvpJtdgmWzIenp3kFyxF0en7buOQvsBQTgrJxqaVD9XDlSVBA7sneoP3t5eBpFPzRL
         15Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        fh=XYCc4Ckm8gVnFrB61siNG4S0/imPrUArczRd7S0ZrKk=;
        b=mS0iMW5c45PG6MlpzErbVogTfoXxvrLfcrAVaRMCel6JmpCZWza1pCr/AY1TOnA6Gh
         5tXN847V+grGVQDcSBMebDUniJUEJosChgwaSHu7eanyTOuM/zdk/lOVNFzBushr0LZK
         Ado8HkfHC1X0va/3hffUUCb06fUtapTi2kI7NPQmDBRqyaDGFkNOJl/ICHhoxdVH+GGq
         cP6yQ93ubxBt3Vkh4NhGuUdP15/3sFVIc6rawliMijK539dHQRG+Bzkt2cbjalHN2d5j
         qbNpWk7Xz33GKK1hZ+lzde5tQbn9afVQQnpor8KO5J9EuDOdzpd8XtnScxIHhy5Lx3vB
         zPbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758945; x=1791363745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=aBIRrWvPgLicUMdgdqp2LKbQiCRzODbl2m7RBZu9meqKBaWGbuExyB4QG23JPma/1y
         ZE0nFUeS/kfPvJSaDizyF+Se6oa8JId16R9eSivFfLSeBVhDJJqX2Aw4JDXatWMQJoaO
         J+oWq/Q6a8rR+XjpSji5bPPLEUGgEER0sVftpfQCVV4w3xlc7dtMgHWquDoZ3tewSkJy
         /q+gJO7gHRmxGXrG3+GZvz8EJFHTaDNrtg6SksY1hdofvM4W7ybSOQcf3VM69rf5CUFy
         TYA0X99kdIlHrJN41VBdqCvRIfTLVdo69swwjcqP3pl+bD+QOTl/rrSVT0PJ9T/y+tzJ
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758945; x=1791363745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC5lpJodoKWj+ThkQS/GDtjtBRuSiV1pCUjMNbQXHOY=;
        b=S04tYqdw1UBbgSbo3i63NgHr4q85+zjbPxlpZLBMKlgSlAn17A8hdXjqQFoDnyWgcF
         Udra0XbceisuckWb8zmowaNDdbXhpQSmPaAjlC33mgsPd5676yUjg3cP4UNKTNsLUCb6
         48iWkYJGOpciXJNbjBBGaAAYj46pvFyL9BqMbxvGDPOCjUQ+M3QLhHuLxPNkgjasuOlt
         B+1RGT6cUSqHQNqdSl3rs5wpDMTQtaNak2xIK+zeHLmNxBmQ0oUVDLpMXHyr4/R+GLn1
         Q8+7Myb+Dg3C3WbhT8BIa5iQlv2HwZ83GF/ujILfbxDeKG/KBLfgPCcUxbIiJpX6MCq/
         AY/A==
X-Forwarded-Encrypted: i=1; AKwUvByy9+MVacQ2tkDepaME/MtGvrJ6owrksKh1iZHMKkoS+h7+QIp2uMViOU35JZ/VA/Vsx0F32x38tvSCkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTheWz66oPZC2ycjQUOAu/vHg+40kLO25fGCB4Sk3kGC+3UXdD
	pI6ybkoHxr/ck9KDHeTv8UK4Ytau01HEjBrPdytkZiB4W0AnkUsGCdGnlQl/FX5XmPEvvVsQizX
	96RbZTsBJlk6ih8yRM45UzieLe33axsQ=
X-Gm-Gg: AYBFou27KSvzlayu/CXQaMTrg4V+WDV8tf1rvLQVrYQGcwr6h4LKYiuX7jT+yjpBxLh
	V9pWLGP1McXZ+SBPhJWtfVZnosobkDAwJCRr9B89W/UlhLwEvM0CwzmJTuCuXQD+H6fhM1IH6jN
	dRaPogvPN+4N9GEgxzALcth5U5fYQBy25Ady9KJ5Sy5BwiYqs1vyI0jRENhjDg9KhmF/vaImgDM
	+yT6GRrE0H29wauNzusZfLOzWm75uVqhJXQYKaX662ikU2Dv6rvABkumCdB7uPPbZ68xSk5BBOJ
	4gzWnKTPHOJJE8qLtXstFFhcGitHFBpyTahiaXRVFKI9CJVBCU0k4Qb8Noty/GYnjiKRw2ZzgNT
	6BiTOzBvWGkFLmfv+a3Vyhtg=
X-Received: by 2002:a05:7301:4b12:b0:34c:85c:da56 with SMTP id
 5a478bee46e88-34cdc1ce152mr1130423eec.17.1790758945369; Wed, 30 Sep 2026
 02:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-5-clamor95@gmail.com>
 <arzMjoi2LcyfxCzN@orome>
In-Reply-To: <arzMjoi2LcyfxCzN@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:02:14 +0300
X-Gm-Features: AclHuK9Pghb36l-P22g_3lrlycHGrleGAXYX6a3Jb3oFvTmErepUHWwZ9_v-FXc
Message-ID: <CAPVz0n1WnhwOqz2xOp_0SsbgUFuYAf5YBByoMv_+XUDPANvhFw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/tegra: Add support for 8-bit CPU interface
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:48 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:33AM +0300, Svyatoslav Ryhel wrote:
> > The display controller in Tegra20/30 SoCs features an 8-bit SPI interfa=
ce
> > that closely resembles the MIPI DBI Type B protocol and is referred to =
as
> > '8-bit CPU'. Each display controller provides two such interfaces, whic=
h
> > can be used to send MIPI DCS commands to initialize and control the pan=
el
> > while image data is transmitted via 16/18/24-line RGB.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/Kconfig      |   7 +
> >  drivers/gpu/drm/tegra/Makefile     |   1 +
> >  drivers/gpu/drm/tegra/cpu-bridge.c | 427 +++++++++++++++++++++++++++++
> >  3 files changed, 435 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c
>
> This doesn't need to be a separate driver. It should all live in dc.c.
> Or maybe even rgb.c, since it uses pretty much the same pins and is
> quite similar to it.
>

I don't mind moving this to dc or rgb, my intention was to avoid
bloating them with smth that is not used often and is present only on
Tegra20 and Tegra30.

> Thierry
