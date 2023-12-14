Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu/piGOt"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA32411A;
	Thu, 14 Dec 2023 09:07:52 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso87243925e9.2;
        Thu, 14 Dec 2023 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702573671; x=1703178471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWlfYf0pCm80vcpzCm+bipZIaDRTb8fv8eSh+cPPghI=;
        b=Mu/piGOtGg3tgLRSvz0PCPmaP2OSLRQag+rBnTGNeQArICHwZgiv+r4qiF50LVHYai
         RMatIjtVG4eD7JuG5FgU/BNk2Lx7yIZKIYt+wBeryJN8Td8H2OGEG5GW/6seXG1aEvB5
         VpilUBXVF8a7xPL+iyIy58K9CcLCxATuqpnyyPbxfcZVrY3VQ5NAxDLQAxmXX46kEMSg
         dVx6w6R7Ja6bv3FymhkaaJNxefa8Ay0GIwIyURE9r1k1iOSAWyi45GIai73yZJz6N+bp
         BVwIHtFyhDTq9Mwvjh4jy7qn/KfQq0sz3+b1WhgE4mNdIJofAf7CM+S+2uamThH/d3wI
         Ka7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702573671; x=1703178471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWlfYf0pCm80vcpzCm+bipZIaDRTb8fv8eSh+cPPghI=;
        b=S+0fSHS3lHj9V5X0yb+eH+a8d7YW1wbtYy+CTK69AD7aWtT/gtNFPRBzmApQNpRIpZ
         WANJCeJPtIhRpLP07k8jhx68NcR36M5JK5VdIQdI4lG6x2qh2FkXP0ku/vOpDFzrKmbu
         96MHdDSEj82qtA2Bb2sx7gFBnWQddY0lhVur5SECbA388SfIpIDdpeYRTyPQWvLBzxVQ
         3gMaQSR0ux6KJLtroLTmWz7uf2CXXNbjCpaBis+OjB084QPJJr1QhVOEbE/WS6kUt1AE
         DsR2LiDOP/NxkSd41jxNYOgj018MZ3FfcLEWHQS7m/C12NgeDvIwiq2g2lkATRZwCCZ2
         MymQ==
X-Gm-Message-State: AOJu0YxGdWpOwUKRvIwpRGaaH5Le1DNcMCt/NrhnelFXi8nhTOIFB7/o
	oIUIiMKZJHtGBKW1FvpJNaJtbEib45M=
X-Google-Smtp-Source: AGHT+IGjNYp182ul1zT962B79H1WOiHlYyzKDxdLC7ymb6diuX/SEPsEusgr4F0O7r8OAgwSEO9Fgg==
X-Received: by 2002:a05:600c:3b08:b0:40b:357e:28be with SMTP id m8-20020a05600c3b0800b0040b357e28bemr4519002wms.16.1702573670931;
        Thu, 14 Dec 2023 09:07:50 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b00336103442d2sm15171517wru.76.2023.12.14.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:07:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Remove some old and deprecated functions and constants
Date: Thu, 14 Dec 2023 18:07:46 +0100
Message-ID: <170257365192.3829873.9539341059036334904.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9d352be8797f01ffe6193da70e3d9d1e2684c6b4.1699772620.git.christophe.jaillet@wanadoo.fr>
References: <9d352be8797f01ffe6193da70e3d9d1e2684c6b4.1699772620.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 12 Nov 2023 08:04:14 +0100, Christophe JAILLET wrote:
> These TEGRA_IO_RAIL_... functions and constants have been deprecated in
> commit 21b499105178 ("soc/tegra: pmc: Add I/O pad voltage support") in
> 2016-11.
> 
> There seems to be no users since kernel 4.16.
> 
> Remove them now.
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: Remove some old and deprecated functions and constants
      commit: c4ae5addc4c53c504b1bdbd77ce72601ef51da8e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
