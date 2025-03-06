Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BA25D53F;
	Thu,  6 Mar 2025 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741284497; cv=none; b=aTjcjnChk/vpsymAv+pn/s8Yidvr/rJf39cnVk/ewyO3NVdXz2CPZ12ysyPn+0AeSRRKtZC8hHE/tqcJNOHy+mJsg2KKkyeHa4bPRgTZChZ+TkOIwJ1ySnCFGLFCIAIo6bBMNr6/9ZiVtgOdos97ehGj5kZG6p8nLX2k0o+ac18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741284497; c=relaxed/simple;
	bh=pus2414q3ysXYPB6M7GQnyOAtQne3KCdLPIJx+MSH50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=erFG4o/j2Qd60CNgyvFTVE+dPhDb6lllGygws90cA0ghdBtr25ex9RQIskqQUa7oOIcd359e+ChdyBtO0b92MijVgizUFKdciNpR/ax3jusMK+om99kLFZzRQyCOQsxezUD+31CiHRZI+Cas2OmekfuBMu3IrcwF3l4/RdbDXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdnTf1Lo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdnTf1Lo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso6359795e9.0;
        Thu, 06 Mar 2025 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741284492; x=1741889292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odjt1WJN9ajK+ixN/B3yE2ggg6Wn8h/NQbtxMfSq2eU=;
        b=hdnTf1LomOPRmuvP/twhOcRIqLRxmNWVJbxvyFs3tApA4mAGKmIe/3LurUNP5BlJ0r
         oYk/LbkqkZzsW2ggiIuRt3nL4YtpneLpVkghaYKNFr8KqiHd/oDxq1KNzAAepOA6ExCL
         01Jkhao/PTVlnsHH0cVKLiHqYgpKV+toilT16EgtVitUSpF3dbeZEoOxy01SrKYfFTys
         u23jUL4Y0vy5Rqj7/f7oEzIvwDYwYFVfN8Hun5tzXRBV0StoEPRLwBUAb3ALEWF9tTO3
         jwozYUFCqDUhb9Dzy3m0o+7OZXVK2x5Fh8osxde3QJ1VEFCcNF8hsWcMUOAbYDKRQnrp
         oDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284492; x=1741889292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odjt1WJN9ajK+ixN/B3yE2ggg6Wn8h/NQbtxMfSq2eU=;
        b=DeSAmOgudkDi16SPPrzP1SjlQ9JKhn2wEGazGSZ6Lrf/fGXglBmtX6YKDRYeoIDEBk
         NtYZrnVcmEM/1QD9iEn4KSq/5oAwvTpQNMWzxOyL3uhNQN8XKivm5Q/L6me0d8YPsqr1
         Aubyc+JJNS+skpkSoUuZYJbG2ac1iJyYMQdWVw5+AaqrfQM4WCmE6JXrqP4EQqC4OKMo
         XN6Ue4rBzM4qr6z7MyVG4MMq0U/hT2Wx9FJi1b6GNhumNfO6ffIrpb38U8Lg2QLzpD2I
         +0AmCRuJKbwiT9Eeti49gYjCw4nrmfIM7thA4Fi3RvdkeBE8b8hPEoDYUd6YUdlp1COH
         SFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkI9CoYIWk29QqgFLXQbQGimEVADJqCEpWX47UZ6e1BHAFe+WGrXsDRN09inYWWcs0hRBqv/KgzlAcEBo=@vger.kernel.org, AJvYcCWag0bq+yAQQNVNqNJxgnEo28P1GVsp3yQSY1hHh+VI8FLPTg4J+WaclXuk6TlElDdpidodfpt8HkER@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTwgfV6ta9uyuARW7QTN2liJW0N3k27oD5XUk14iy0Z9TYVQS
	AtWA49SvCzzPJUz1l7G1iZOADmjiTWLtH5gfAR5TR4E4luBd+tRYoJ9ZVg==
X-Gm-Gg: ASbGncsHnwrQccmG4Pw2h9zgh3VZwZTRG8boGa4YylB6bSA3rVfkd7CVifRMD1YGKpn
	VnHa1l1P+cAi9ZFwFQIqj3LW0t/YadF3qSVIEunnPsiDK9+ejot42hr/UHU05YAyoC/l1lGbTAW
	5nvIBvuA5AiV+kFq2741sr/jyKoZ97ZkKK2ShkErjNX6QwLFYPIzKj3dv2NS/j363Uu6JYX6qWU
	eKepsdroXXuE/15gEe2bHI29UYvUv+kpkcFoDOJqmduEXmxMzREsMmdbE6X0Q252jD6uye2WqJZ
	EpBLy9svpYvKFNRKjaulJpRLEdzD4Bbx0vzKBTWL7GicY29b85Ye/pmtyjMav7LWGNkwGcdOtTn
	LwyTGdxE1ndGn59xfSCg/o9p2JCC2jh4z/4iZ
X-Google-Smtp-Source: AGHT+IHSutRUGpiSKnrqzL1Db2BXSZRq1dnX2kvieNlnHi1TMVt8zQAC/PuYvEfpppJSqcSsy+Ecug==
X-Received: by 2002:a05:600c:3511:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-43c601d921fmr4721555e9.11.1741284492402;
        Thu, 06 Mar 2025 10:08:12 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8b0548sm27992175e9.6.2025.03.06.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:08:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Brad Griffis <bgriffis@nvidia.com>,
	Ivy Huang <yijuh@nvidia.com>
Cc: Haotien Hsu <haotienh@nvidia.com>,
	Henry Lin <henryl@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
Date: Thu,  6 Mar 2025 19:08:07 +0100
Message-ID: <174128447782.2030480.15735320967070322060.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206222731.3691073-1-yijuh@nvidia.com>
References: <20250206222731.3691073-1-yijuh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 06 Feb 2025 22:27:31 +0000, Ivy Huang wrote:
> Populate the USB wake-up interrupts for Tegra234 to enable
> the USB device to wake the system up from low power modes.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Enable Tegra234 USB remote wakeup
      commit: e6709a6f78132468d18e56e201d6ed313624b78b

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
