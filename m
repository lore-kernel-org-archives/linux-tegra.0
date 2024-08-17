Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CEB145B2D
	for <linux-tegra@vger.kernel.org>; Sat, 17 Aug 2024 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723885685; cv=none; b=Btmr+hIaRlT3ez2l3zJ39FL6iWYxSH2ReMreJUU4V6fsbH9eALwbTO5+m7JSxO3wBZChTHHbgVxpCborCKfb/oCIGck1+X1S6NUYMG6TxMmiuFxlFQv7/63S6fBqvMetLPFoK9+LZo2z1pJPMpNv40pSDrqXdbEYrSEJvPjFP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723885685; c=relaxed/simple;
	bh=C9VVaFBGTal8QMa+obbM4icDEq9C82/NMX9XkzX8J2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfWeuMLMHIb9sTITBom66FLX4WwGRn8mQrHIVG09lf1sSsaaemyQV6iiPDNMcgpKyEIReynzXYh4TrGPoKhZd7evJG1K/b1lFIQaOYkNIityoK21+C0q7I0fZpOJa/9eDXz16sWONIgWwNSdxog0ddvqw8qOuOh/gt225BogdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kfydAboT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kfydAboT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so19034925e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 17 Aug 2024 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723885682; x=1724490482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=kfydAboTult1XjR8zKv6GCXNNUxnw+MXaL4b4YDguhizZDBdxEqfAE3nXvO04dIoVL
         oveq5qQHeFxeOX+3zJS/RqPvJ9je1i4P8LIiRuEtLTf/7Q3te3puy8ERrdtnsF68Vo1n
         R4djkxHGxlfuJ64jltQnVakkvIaAsE0Q9c9y4EZxoVXYQyQjtlclAS5nnbtAeSlI6IAi
         FrPzbI9deMU2MPe0i0Zt0CA8asorDXersPtiVTBoeGgZqnQ6xGa5TvT8EcssaFcw+WRc
         ZszjJ/F/hthwbO96Lx+dppoArxiX6rWmtJ9RhSHr49NTcwE9er+s9b1Irlm8mxZgSC83
         I5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723885682; x=1724490482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=E9DvAAkNUp/ZkuCmTeb+oAoGIL5CoNXHHJV60vKwODy2eaaCNVhysHSzsoYJwbv3pr
         P5btWDE2NqgeNdNrWKVeDYKrhaH50oulzMU4ewt0YyyLDM4T48cUaDY4BHZ4LMlklHfM
         C/QO38bqj3KkZcd3088J53O8PqueMnGQxSdKRThPIpUQ3DbVEEA8Pi8Goh8pcdeTUDnF
         4HPNOqu1TMQNODFXSB88DFBd4i6AioiMfhuvTiFpes6m+pSTb6RDGUgouqQbfU18ceqA
         FPEWFFsVgSX92WE6j7qJIjr/myi9dnE9jZQltLD6tEi5pA0CjKqokHXEvoTF96GMstbT
         AOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+1IGpaZDF1BRNIUDkUjSipvIokZRm+bu0OWIKZ7M67+44IBD7IxYg2yjSQkaAJfyF8Y4CP14OzZVD6iUjdqrDhHdL3Ou/kOX3J3s=
X-Gm-Message-State: AOJu0YzOUCRivh1pK+ZSGA+ebcZ+6IRsar8gXEqNQs1PIldW+aWuZ++M
	5+QWPsLfgBJLcLQ+bBOrmgxKHnnEp8P6Id8e8h9WtDxoKk1/IdAG52mfIguOj+E=
X-Google-Smtp-Source: AGHT+IFqPK78U4SliOQYt4MFyXyezxY5YXxZuEpRIOtN+fnxyD4VwFBOGWGb/VPGGTvD3eHpkc3FQw==
X-Received: by 2002:a05:600c:3145:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-429ed7870afmr31694215e9.2.1723885682237;
        Sat, 17 Aug 2024 02:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm97704135e9.45.2024.08.17.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 02:08:01 -0700 (PDT)
Date: Sat, 17 Aug 2024 12:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
 <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>

On Sat, Aug 17, 2024 at 02:11:57PM +0530, Amit Vadhavana wrote:
> On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > > Correct spelling mistakes in the DMA engine to improve readability
> > > and clarity without altering functionality.
> > >
> > > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > ---
> > > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > > V1 -> V2:
> > > - Write the commit description in imperative mode.
> >
> > Why?  Did someone ask for that?
> No, I received a review comment on my other document patch.
> So, make similar changes in response.

Ah.  Okay.  I was worried someone was sending private reviews.

(There wasn't any real need to resend this but also resending is fine).

regards,
dan carpenter

