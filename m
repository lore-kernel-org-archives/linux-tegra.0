Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495322;
	b=0+vEiuPA/RCU+syA5A/d3MC/gReklACNn5PNZu8KTHxtqNOUZE8veOe2mPyqsy7P3TJj
	 Y3f2G2BIrbo+Kto2H/ByCrwaQnavhj40x2mS4JqhW1n7erF6oAUw/0SFUvyYBxqeRvfFT
	 gWIL351X1WZSZ2YOQPIRNMrb0fMXvUm/ddl5jgxNcB9g6eauj/nHBHBV0fE57a4eW3Crv
	 KLI4HnHjDmLgxLF8GvxkVDiVu/VwEFl9tjWB8hECUTpCsrsSaIuyaNtZxfQ3duQ0K3Hg9
	 tnoJwc0yVuc5QjJmux3k4sxQmwteV5y45Y2M3f8wEESB/obECUWoFZTa/3dKFL0KJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495322;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcBOF6PXpp09IwMziSX0kwNANxSfYEQCGrMesY0eIsk=;
	b=bYjjr86bN5VvikuSHSahOJQhpvauBcYiF3+zyD6MEStwrokXlzMwQ9jsFbZKP0XK/F9T
	 m7I1xPcyawuYaOLkCxlsOI/EWxvFwkwTbv0TSD64l9GeLm8i3xGjSOj1Aue/eOj4keyoU
	 XOF5Q0gDa+abzhBvKX7kLM8Y331v8IX/FV1FWW/GPxnD+c26SVlsVttzUk27U0kgdlbmw
	 IczK3UysytHYIhYsWjvbh1Se0V5nak7c+S426aV8jEpuJRfMLsGFF1FTUTorKAPky7xsr
	 5uGSug4EnC4bwEvO+mkg53dLXWya/pFkx3Mwfbr9ahJCK3QRfS8QbUrY7y92vNZWxdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wc3lcipV;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC26606A31E;
	Tue, 24 Nov 2026 04:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=wc3lcipV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=wc3lcipVFh6bJnNTgKIFdZ5LzsBhmG4Bg5H5Xw2bXdJotKnP3pCpvlQ6kBhwid31u+YKqYG523/u8
	 Y1ugxKx6hOrpfdDAWlXKulJ+eytanHZfxPe4kZCDUKKu37EhDleGWgZcylowBCnWY6rDYxo/Kw0beu
	 1U2eLHMcFy+9Q9Pw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b05159497d-495e3;
	Tue, 24 Nov 2026 12:41:57 +0800 (CST)
X-RM-TRANSID:2ee96b05159497d-495e3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36b0515935ca-13776;
	Tue, 24 Nov 2026 12:41:57 +0800 (CST)
X-RM-TRANSID:2ee36b0515935ca-13776
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: dpaux: Fix VDD supply and AUX channel leak on attach failure
Date: Tue, 24 Nov 2026 12:41:55 +0800
Message-ID: <20261124023000.1211-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261110065254.1211-1-laixiangwu@cmss.chinamobile.com>
References: <20261110065254.1211-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Thierry, Mikko,

A gentle ping on this patch, sent two weeks ago on Nov 10:

  drm/tegra: dpaux: Fix VDD supply and AUX channel leak on attach failure
  https://lore.kernel.org/all/20261110065254.1211-1-laixiangwu@cmss.chinamobile.com/

The patch fixes tegra_dpaux_probe() error paths after drm_dp_aux_attach():
when the channel AUX lookup fails or drm_dp_aux_register() fails, the VDD
supply and the AUX channel acquired earlier are never released, leaking
one regulator and one AUX channel reference on each deferred/failed probe.

It applies cleanly on top of the current drm-misc tree. Please let me
know if anything else is needed, or whether the patch is queued somewhere
I missed.

Thanks,
Xiangwu Lai


