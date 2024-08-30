Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C571AF4F8
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027011; cv=none; b=ZpBBtB0gSRLvxhIHnNbz/XPhZc21BcLNyOBm8EeDVfMK4DA4s324v0M6ekuLBK/jvwhlbhFp2jSmuwV7X4esHB1+QyvoHVPxmUp7fiDIgUbjrAEynEB429RtHEzfHNG1yJbVAHXKZ87irPyml85HVCjN1ndgUFe5zEi6E7JLVQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027011; c=relaxed/simple;
	bh=6HdRdzXK9/DNv+TUtxgoEqtHPg/BPLeb62A0vTGglTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NUUiTIGH/Sn7sWFo5+tXi4oXvlSE+ixwYxGI4+7y1urKtj/uxz3t8FBEXf/ND25vLw3RmN60sSUATq4YI8wyJp6IKcd1cz2DszQCptEDmMgw1B3C/H/m+zrXxya+atbCIwqsUgnkEkIRYm3yIyQACH4f+9KFSUVP+7tQW/9qZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8OG1unD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8OG1unD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371aa511609so1228626f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027008; x=1725631808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8AI/Fdop6iHv+uoGGlpuSZ/Od9olmbw4mbRVXSNvW8=;
        b=l8OG1unD17jShQwK/6GlrlVcPNB3IXwDxtde5My6/VKuWnytBOToZ24E5+0g8WI3jV
         HHzsJx7wIHEUIKTSQYOAUATU37AKhDjxFg9AXWzBDbyuKBIjFdkOsAtJpkbozTpb0MHj
         /c+i2Y6uqA1Xst+1/MX0RQbKXovF4HYCp2aQGPWIgGG04knq+ubq1aw87AVco2SQnsh4
         WWJDs0Xc9TU0ZaHP0difrkY+9L+fhHXAG/VMZgWGFjA5KIsaSFIt5jtoAn2Y/BEWHZaS
         OZlAJuy6LPlVC1j/by+X7Z6a/vbSCe0L7IeS3ffSgtngYdpDbPco5rE9i+ALsaRm5sZi
         xQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027008; x=1725631808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8AI/Fdop6iHv+uoGGlpuSZ/Od9olmbw4mbRVXSNvW8=;
        b=i9jBt0MoRsib6gLWMqz9UNSnoTd77PY0D7TSYzd8F1mxZLXxW0dL2p1tEjOmU89v+B
         5zpatiDXgUv15s4Ts+kqPI3m6l0yZeD5cAoqySzEE8/hnsHNSyHe1PLWbcWaoe9//XJL
         6B7h4Uc+RzKhnNC0hRLPZmf4ue+nQDEhTvhYzmdxEP+rkjg7jrvlL63sT4bRMNpkhDwp
         xbOc/XYEI6z6conN20sjuompOvkuBCqdhsB6rYTnVG1RYl3yEszEeC7fvwxaCvOPhgNu
         5KXBOL55hKXVoQI+jALYtCtJIsr8bRUTfuQs8BZ4ERHGHcb+iRIIm+0G/5TsQAeAqPF9
         dXAw==
X-Forwarded-Encrypted: i=1; AJvYcCW+m/Z+r6/clXDs74L4utnu8Md9iu665OoFd7IAFKopq7u4UNmrVPh5rRnXwoqoma64DIvnio3IaxTpfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/iTgXarVUyvOkFXkFkHrTY1Li/x34kC1Lg0ZQE9oa2Zcoug/
	KOxtjAPrAYzCyGrU+wfXuvbcisGRWBZqSKgW8lEVDjPwt5VsFMf6ZZlwYtTi
X-Google-Smtp-Source: AGHT+IFiVV4FognpxJjECOXOy15naDCNUq2hzOneZZRh2PLbxhNsakYmHArm/JlTqzgGmCEZkbrlvQ==
X-Received: by 2002:a5d:400c:0:b0:371:8c27:4ce8 with SMTP id ffacd0b85a97d-374a959e353mr1606496f8f.27.1725027007382;
        Fri, 30 Aug 2024 07:10:07 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm47297005e9.35.2024.08.30.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:00 +0200
Message-ID: <20240830141004.3195210-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-dt-bindings

for you to fetch changes up to c20ebc7fbd2ac3af28e8c712cdaf5b20b524bfba:

  dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree (2024-08-29 17:24:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.12-rc1

This adds compatible strings for all revisions of the Nyan board.

----------------------------------------------------------------
David Heidelberg (1):
      dt-bindings: arm: tegra: Document Nyan, all revisions in kernel tree

 Documentation/devicetree/bindings/arm/tegra.yaml | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
