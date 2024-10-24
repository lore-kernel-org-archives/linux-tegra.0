Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD51FBF6B;
	Thu, 24 Oct 2024 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790674; cv=none; b=svoy9Dw11b5iNcYFvu+Ufl1GkENu4doL6BUyjhsmKNAnLBo3b9tWNfScAYn9LTwrffJRtAQ4ftUDuERhjpweIH55h46gjE8/lhKldwaa/Yixk0Pb23l2/dB56KEI8FW9pzEwfYHm7ZuBWcGhHJi1uZocr8YmJmnXkL2T6q8drAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790674; c=relaxed/simple;
	bh=MXY6gkaRWLV+fqB+jVIm/FKLT3FHawCkPqlO654TSts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odM91bvtL1SfRoLoqXl4L4Fc5xlJBQwt7X9q4d2CTsIDQJ1GYUWrHDLLDJbmYOqPU6LjwowJXtlFJkgVA8UClx/EtuN0bY8FHRM1STo28/9IsuBoHWrDv46gZBlKIHunMdmuGBf9jcAunNicvddCCe43mr/Uoy3XFlOoSY0DXPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3yKozwE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3yKozwE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315baec681so12193905e9.2;
        Thu, 24 Oct 2024 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790670; x=1730395470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vejI8IJSQuRurzw8vCP03lUVr3D38U5Y8ThgAR5afBU=;
        b=K3yKozwElN8ya5BROFCDgSMH+CewuAUfrDutrNjU54/XD1/kc32gviXu4aCcu2OCqZ
         v6xW1ECcWm70ubk+NyYTgKHkp94SdAoIKLYljIFS9Fp9LXTCK3a16dA3zqz0BeXQebpY
         PNy0KeRCCI87K4Xr6YPN+DuYaMxFXOODdn6Ia1hNU26bDQTvNvCqs67Pug5tQCVthqom
         DHE7vDTXAbv5nODdQadm6JUBMz4TcBQkKCPJA5uVELTFYK9eWMJcq+UtRCtu88tvW+Wz
         TkWO9og5/ocn19ASJX/tCZf21St/3RJALJmvjWvc6MrKUQT69+7k/n1GVp+VUHIpe07P
         Cr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790670; x=1730395470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vejI8IJSQuRurzw8vCP03lUVr3D38U5Y8ThgAR5afBU=;
        b=w5TGMPwwtpsPxoC73Uz6LUhMtNVH8dm0gExne1y8h08zeJjB8ncyGNKg+J+8kB5U91
         WKw85w3Ls8I9i2SezZ2EU6fMszc65hJK2w55/JRFM2yZwU//W3wraXvAg7QyZbvSYWju
         LY4/VDLWXQ/Np4AB1tunNOBdUAsGu/J7R5HhUBV/3M7Rm9KWt+EBcXQhBgCPgxVo2YLR
         /WJiTS29NzAphBsONFJbnn8jnVmtIIdIPBciYu5Y8gEhdOCPkzR2EvScYw9a5kDu8wsX
         7XlSDnkBYat8RT7rkGDC+YhnfoC6iZ9hMKj7VoZoSQvhX+oCVOUBUsBGAZVTbZSwnzrh
         H3sA==
X-Forwarded-Encrypted: i=1; AJvYcCVbJkktIhEsYmw53BuPqJEZNcKdcsSH3s5l/WzeMsBaXHex5h0YvkUMTctMwGIcJWO5cYulbsOlhtdXCdQ=@vger.kernel.org, AJvYcCWwgEGy2xO4XB1KVzETEJQVSQAKLpgvioxEGeEDapw1ISek8snlnsg/L9gR+iy6IhX+Z1xXBiMq7+kQqls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hyHyDh5MoKyh1snUEhMVJrR9GRA57kRzj1PcaKv68NhxscJ7
	th8TyQJDrTueHU8B0zMMXj3WupE7AfgvIzHQFEWLydFH30MPNyUy
X-Google-Smtp-Source: AGHT+IEAIt9LnCEqfZvO01NxtHWS1tO3sQOVPx4nynRO16L+lFdXE7IWAV7Cuq42ss4s2RQU8zSPiA==
X-Received: by 2002:a05:600c:3b86:b0:431:3927:d1bc with SMTP id 5b1f17b1804b1-4318c6dd4ffmr23347055e9.2.1729790670316;
        Thu, 24 Oct 2024 10:24:30 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd6923sm53445525e9.9.2024.10.24.10.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:24:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jasper Korten <jja2000@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH 0/2] Add touchscreen and TMP451 tempsensor nodes to Google Pixel C (tegra210-smaug) Device Tree
Date: Thu, 24 Oct 2024 19:24:24 +0200
Message-ID: <172979060255.717947.10925310477430553343.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
References: <20240916-touch-temp-v1-0-5a008b2acbc8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 16 Sep 2024 00:48:12 +0200, Jasper Korten wrote:
> Information to get these working was gained from downstream DTS.
> Link: https://android.googlesource.com/kernel/tegra/+/refs/heads/android-tegra-dragon-3.18-oreo-m8/arch/arm64/boot/dts/tegra/tegra210-smaug.dtsi
> 
> Both were missing upstream and easy to add:
> - It uses a RMI4 HID-over-I2C compatible touchscreen.
> - TMP451 is located close to eMMC according to iFixit's teardown.
>   Link: https://www.ifixit.com/Teardown/Google+Pixel+C+Teardown/62277#s290806
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: nvidia: tegra210-smaug: Add touchscreen node
      commit: c8d63aa0f14adce3d01a3b776b5ea6a33620891d
[2/2] arm64: dts: nvidia: tegra210-smaug: Add TMP451 temperature sensor node
      commit: b219fe91d3140cddb53538c169f7cb2f6f05e75a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
