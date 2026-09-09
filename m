Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3BC48E0C1;
	Wed,  9 Sep 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944218; cv=none; b=Rvxa5oAIF1NGIMqjjoxNzbdhTPUkiUzDqxnAP1/FBHFlGSuY7AIjAJiomEGDbSgsYkt7VE9p+OKvbhVAfZQqN0HnCQzOtfRhrpnOOLzd4cCsFCULo32oIZN5MNgeM9P+jiCerjAbcaxeQEuihjX0C9BN5OYcVpY8alVY0Mkuoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944218; c=relaxed/simple;
	bh=d90VN6Sgs+IL1Mw69zS9BhRCoZnWZ+pucEcqe3us92s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:To:From:
	 References:In-Reply-To; b=RqtHRFiDWhnRW79Ni4n+gwotBl0efXP1qqH7P7SfiozlhlDW8Nruj0LAooVx/AurX+sMIgFa5KnYrjcolzCTBye/sMBOmxGbpxefD7dfObFB9OxsQVatfYH/5JL1IaOKFeXXMX3ZmApja7yrrYOIzYfaWrnD5iNjpjiYT/2EdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CBX9jFPK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CBX9jFPK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB21F4E415A9;
	Wed,  9 Sep 2026 08:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE4BD60448;
	Wed,  9 Sep 2026 08:56:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 445B711C7AF59;
	Wed,  9 Sep 2026 10:56:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788944214; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BbanUwdlh/0efY1NZ4m20ixL+A4hAWes9KjfDG53tuM=;
	b=CBX9jFPKO+68YL1rGGQ6LVLZklYs0sihO6+x4uoIqIZOc++n8DMFBoaMoI6iFR2mULRHXG
	0QwZZXD8csSJEWLGP1fTCrQAn9pKZFbvcLSu+e05EWjdE6bSrVgzW3D5Jzd2/cMGHIcdrF
	9BhbuupMcw9I57z0w3/tCbQf7ClLq+e84IhBfeIDfJO5x95V4nv75rZArs9OXzM76qx7B8
	4dDV/KD7ri1tp3Lqog4uHfmuuHOyntHRhW3YUa9+VoVVIM4eYCzBpbtEX21kHRgVn6q2t6
	1ZcijlcbpXl/XA36/IPIBPHz41+DWfk3rbigJf6WGtY86LOkZGKBZ+nPKJ/6qw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 10:56:50 +0200
Message-Id: <DLANSP0CTANH.6BZRA42J57EC@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: use BIT() macro instead of
 bitwise shift
To: "Lalit Shankar Chowdhury" <lalitshankarch@gmail.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Sowjanya Komatineni" <skomatineni@nvidia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "open list:TEGRA VIDEO
 DRIVER" <linux-media@vger.kernel.org>, "open list:TEGRA VIDEO DRIVER"
 <linux-tegra@vger.kernel.org>, "open list:STAGING SUBSYSTEM"
 <linux-staging@lists.linux.dev>, "open list" <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260907173302.23053-1-lalitshankarch@gmail.com>
In-Reply-To: <20260907173302.23053-1-lalitshankarch@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Mon Sep 7, 2026 at 7:33 PM CEST, Lalit Shankar Chowdhury wrote:
> Replace the remaining instances of (1 << X) with BIT(X) to follow the
> kernel coding style guidelines.
>
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index eb1fc5b7e2cd..2586a137d9da 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,15 +177,15 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
>  #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
>  #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> -#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
>  #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
>  #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
>  #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> -#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
>  #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
>  #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
>  #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> @@ -214,7 +214,7 @@ enum tegra_vi_out {
>  #define       CSI_A_PHY_CIL_DISABLE			0x2
>  #define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
>  #define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> -#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			BIT(16)
>  #define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
>  #define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
>  #define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)

The same change has been rejected multiple times. See the previous
discussions for the rationale:
https://lore.kernel.org/all/?q=3Ds%3ABIT+dfb%3ABIT+dfn%3Adrivers%2Fstaging%=
2Fmedia%2Ftegra-video

If you want to improve this code, use GENMASK() or FIELD_PREP_CONST().

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
