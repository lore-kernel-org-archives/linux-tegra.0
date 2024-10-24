Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585061FBF67;
	Thu, 24 Oct 2024 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790674; cv=none; b=FY9Wgovz54acyj4nhaHZd7mkMdoeu7cRybDt3KoNb/BIe4Qwz9Jbqzz9DVI8G5UtHJxA28/rWDvZzfSvdRM6f1L4LEVN/Ij/h+piGeLehBO0f303ZzTBO36i9oDM1bsqC+QETJD1rfXHt6pERWxpHf2cyVyAlwKxFKsSyAA6Xc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790674; c=relaxed/simple;
	bh=z//7jhsdWURDJNzkLyljTdh42RQboRUngC0WTdbnrM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNHZoTn2AC0ehRRBCQf6FKG8YR7cPJzocZVAHtuUVX6/LJqilaE8Wim1Nvj2IP8PhDeOZCx1ouW4nVKZ+RhActdtGlpSgHiteUHO5lzc0fIETZDv82ZNM+lMEW/+wt66Z9RNxR7Z4StUJcLyt/KPW+OVnQ5EKITinK3ZXTJ1754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpoC1Hv0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpoC1Hv0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so12532035e9.1;
        Thu, 24 Oct 2024 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790669; x=1730395469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOlfxjEp/wJHGaefXfCsbzBAmCFPBJAn9kRP/hc5SQM=;
        b=hpoC1Hv0fKajbGkuanTpYTvzDgucEM0KffADub9upIMQ287MRALgs8NblBBs3G4WHd
         gRNGzYdFV3GNckVBHYwsgc0Cfr05J/0LI5G3UcSixNcGn62y90RYrcFexhecOy1jPF8f
         D2DfRr7sIZWuub9lCWPQg+RCR4q0L2LFO5CupgpjTe0LgETCEQ53HcefBLPfUQgtrB0A
         Owdi4aYnv9Ott0ilixWmVueH/gqrD/+EaOvo9QUa0Bazzvp4g6pgJNkfzlCbhwbCZDTv
         5ArQy41Y5dx2k8eeAYFT5B6FYopBE2jONqIeegKVTwKbxOPqMkW14+5rWSU4HbIkFdWF
         UFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790669; x=1730395469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOlfxjEp/wJHGaefXfCsbzBAmCFPBJAn9kRP/hc5SQM=;
        b=vD3rrt7zbmrAxF3Dop99M3h233hnXDqqVpH5jhdPuPsSs5Vx4aMCxm/xL1pKSeb0lX
         BbHax+QIhS7Dtle4NiXhkODjjsgrdOc9CvDgIhTBieFsjCA5S1pWFk6VxAwQDmVkEKrO
         WmbTKjbqH+mtrDDnP4o+GDOqEhzohP7790uBq829cUHDgQtMHYl/Sd7m2JBGjhSsPU9B
         oEoLPZiNPdK5ehqe6TsYWzDZx7UZsrydEgtjX/O3EvkeHbr5dXwGReriPg+FVKdCaAas
         8DVlUy13wbHy3CGo72RD3JMFh4JwUDvOi+6K8/QQty6qJKwgkhbwvIxhhp2qElHligeA
         VsOg==
X-Forwarded-Encrypted: i=1; AJvYcCXkOVtyFZi2DjmRG5WFTiR629E2IOoxQks8L3CqtlpNpo51DnkeWTHvaWgYooGv7SYXkJL/zYFZ2VpTuew=@vger.kernel.org, AJvYcCXptBWbYIXPwEpajRxlz6gsZ6IRkwcldgdRvcyXK2ab5o8O6izVeqKyPiKnWT9L7Uiut5G18fMnwQFbTjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXT3Op4KI4rHhx58HvffB6oojba2TBYx90qfPZFkfuS6XyFCo8
	0eL6PZf/u4o8awYFhGjGISyjhERvc52LoUAx9+53fl1eSWL7BFTymhXWG3YV
X-Google-Smtp-Source: AGHT+IFO5XsyQ4f5xUeisxiOXMJa3MN+fjiUsg0XnMOLotp5SZzvFSlky0Y8ZLq7oMJ8EyY1J8aSjg==
X-Received: by 2002:a5d:5918:0:b0:37d:4ebe:163e with SMTP id ffacd0b85a97d-380458f4398mr2112720f8f.53.1729790669253;
        Thu, 24 Oct 2024 10:24:29 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b944fbsm11890866f8f.72.2024.10.24.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:24:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: smaug: declare cros-ec extcon
Date: Thu, 24 Oct 2024 19:24:23 +0200
Message-ID: <172979060256.717947.6943761862527248158.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241001-cros_ec_extcon-v1-1-1e212a1a4bbc@tecnico.ulisboa.pt>
References: <20241001-cros_ec_extcon-v1-1-1e212a1a4bbc@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 01 Oct 2024 14:27:07 +0100, Diogo Ivo wrote:
> Leverage the Chrome OS EC in the Pixel C to convey information about the
> state of the USB-C port via the extcon class.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: smaug: declare cros-ec extcon
      commit: 2433e22233f07b2e03034fffcbaf6c26b5838bb6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
