Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0318E59169
	for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081934; cv=none; b=szYyJbzLIWjdjeU+pQ2QDpeeFpHVNoz83vsrdiBYHsk1IgC1ALBo4zbVA9j0OJEPXFP+RDUQDMh+g/vGzgH5T5o+68KaDw8sChDgU5PijADYAPqwNW9D3VPVxkZ7AK4YqmehQM1ASNju8mP07gXKy+wNxKAvJBSv8a2o4i+3lpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081934; c=relaxed/simple;
	bh=GBXRWXTY1ErZqY7stgtAHahfBcbwfWjziS+Doe7vcKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVS7sjHEB8HW59WniTy6rXFwhJ+aHqDyco968KfrOwncFoOM/SSujJ4MQ3Kd1aaAvvFitBBx8lJhSJoCIBuR8YAbCGBJKQC65YOoK3KI9Ml1x1aMQ49XohghD5sqNvMw7qN+lqwhmelFjbL1lt2L0rEQsBBNsqAhqEMzZ3k6f1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxT+UPcZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxT+UPcZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3d6ea28d46so378692266b.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Feb 2024 03:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081930; x=1708686730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6EQFaDvbkLPpSMnh/3CU7s0tppoYwrapjL2ZOKWVrQ=;
        b=TxT+UPcZdRsfLTYncBgHnNJB0WNeUqaeW74XZBc98Blmt+DiauqfAiU0yQEX8Yw/mB
         k5gkOec8/lsfXaENjRtm+tNLJ/i5VWqxDmru4JgMFg2EdDbDvqDNugvwZ07bWQPKJ1K4
         Ep9HelZvSE3MnybdztI1kWrAJMWyABxe93UUm3qjz99gt9qro1wL/i8Al2ssNha+DTal
         25Qf4TYOdDqX00RGFgjOIKjKEp/EZ7GuMhR0GjakYvJE0u9MbUS8+ivsJUZvFfaCF4hv
         ztMYW8g8cDdQ6D07QmY0YGvK6+dhdR1BWuAYfXFR0kosI8YtPrbFBmIlU4RFCiNgf/dQ
         fA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081930; x=1708686730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6EQFaDvbkLPpSMnh/3CU7s0tppoYwrapjL2ZOKWVrQ=;
        b=S2GOzQM8va2z4Vxy3IV6Vgui0OH+NAIehHy5sTlMBb2cI9o4miV4ooQ3jcA4saK2s0
         FOE2ntsx8iU7s5lG5mtBmpct7gDu8GYqzRvsXvRMYYmfMcJV0LjODw8ArENaNJSZrNP9
         QYJItEd61pj4N6byzOwyRHI6tDTlgTgA9c8WW/rpEaB8Vh1oUVaWFMkf5Q1m2bhsjNG9
         UmlMeiX/YuSXHT0ql42BzsEa8UlMMH042fH1IWZan6TihrB//xE/pFAgLuF5rwvN1c25
         QPA8oRCVZDxc5s276V6C4RFQz25ruwO9MsNA84emVn4K7nnOn5/W4eSKkWrA5sNVZMYz
         JBqQ==
X-Gm-Message-State: AOJu0YyKTKdHZcOQH1w8SYHyGDaXbIv6a4KWH1g+QW/wcv/divdES6oM
	NOq3ZJthWwXhO/9A3eVpdzwu/IlQa3PGDqoBydan7CTQVStGxKBuXSCtCzDJ
X-Google-Smtp-Source: AGHT+IHk7qZ7a9ger2Fxzs0URQRZqzCUOKu/6VqE7A2/V4ZBwoarMDIngvrUccXuVDY6K0ZbTtsB4A==
X-Received: by 2002:a17:906:b0ca:b0:a3c:e8e0:3ef3 with SMTP id bk10-20020a170906b0ca00b00a3ce8e03ef3mr4126045ejb.1.1708081930416;
        Fri, 16 Feb 2024 03:12:10 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a3dd52e758bsm517664ejc.100.2024.02.16.03.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:12:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: linux-tegra@vger.kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: (subset) [PATCH 1/2] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
Date: Fri, 16 Feb 2024 12:12:08 +0100
Message-ID: <170808192275.195646.2546751085967111016.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216100246.568473-1-pbrobinson@gmail.com>
References: <20240216100246.568473-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 16 Feb 2024 10:02:37 +0000, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just Tegra210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC option that excludes Tegra210 you don't get
> this driver.
> 
> 
> [...]

Applied, thanks!

[1/2] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
      commit: 4acd21a45c1446277e2abaece97d7fa7c2e692a9

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
