Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76947ACE8
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837981; cv=none; b=c12PgL0ay9xT1jeaZidCR6If5KIWtMe69uUPsIb/cfCbrGXOyH/hqgKky+TpARAQU9gnHOzxyW/MkG/zji1rcTLVMkTN5AH0ixAe01hP242GA+wHU2kXo66sasEekaT8e3lmWqyJgsmJ+D9gQXPQ3CjXUkZe6C1CecgNpjmws0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837981; c=relaxed/simple;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SU9z+SM6Pdfon1gHNNJeo+AJjgEOoYcIZjVzQ/3gsi57urniMWbmJTMqVprLlU+vItjg5lsFgvcGT7zb6lDfvrn2K3dSMObuBJhXBCu96tVmrCvDm7EBmJM79rx8z2Ozyfh5fSRIV7Yhz7T75COk/7HdVy+ISfuf6QDkiN+O40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb7QsxdV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb7QsxdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2CB1F0089B
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837979;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Eb7QsxdVvwC6Q6ASOE6RHWopINjqmVsM+asCISC8KzX4TbbjLlLnsFGewjxLBiuAL
	 USpbOV25b9ZmxZxGODhRZ/pIOUEV4j/7ISqQiq/4Q3iBTdt2DVLljYevQD1l6XoyiL
	 /6myJolVu0oJo4EALqct9L6A2ND53yX9mOAI/X1jCNzZ1CH/ZbM+48f/OViR41yaiE
	 YSWVB+jXEhQSQQdD456ShpIZi68mzYXHl+aRD0Dw6RexksYrZgHbY19oPl/9V4B29b
	 xtsP823iFmnkNIANNLcxBYI21WhoxAkFuarvbrBPjvq3midaRtXgYMBNaY+ttNwSXN
	 HLUC7j9fQRUAA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cdef66fso21924581fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 23:59:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLloG5sDT0B/vmBonWVPKIxyu+TusX8d9mtO1KfcL9CGBcCHWq2n3H8EbQOgxcyG4D3vhpDCqqyQkqrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ32AN++Dz0fZD698ta1867S2ZhLRJEeb2uJyWX9Fnj2vfCY0Of
	Hderc/EpmKH435ZLW3VI2VhvpHZFuvasjnQmkj9Q443JQRiADJ37df+lYWHFvpyGkcB609Wxc6M
	1BSqndzkohd+yeUywCbgcjLmdcJmCmCc=
X-Received: by 2002:a2e:a99a:0:b0:3a7:812b:d0b with SMTP id
 38308e7fff4ca-3a7812b1f22mr7437971fa.11.1790837978465; Wed, 30 Sep 2026
 23:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:59:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
X-Gm-Features: AclHuK_sHPl7UkC73IJwZdQ3ifWpNCzHWYkFbMbP-K9-g_pDmrUnJv1iVcxQNBo
Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] drm/todo: add entry for removing the
 panel_bridge API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now that a drm-bridge is embedded into every drm_panel during the panel
> creation, the panel_bridge does not really exist anymore. Its API has bee=
n
> deprecated and kept until drivers convert to the bridge API.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
