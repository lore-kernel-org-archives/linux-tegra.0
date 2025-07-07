Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19131292B5C
	for <linux-tegra@vger.kernel.org>; Mon,  7 Jul 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881917; cv=none; b=Ugn7BnN5pW13fH6uLSGCBHo/W05gvkWhf1z+gECC2wPG5rfaUO7o9GY5gmGk+7yc3aNGZCygyGoT9zIU80omZWhD45LLhdfT/UpC7zXJ/fH4FPIqBDve6WERwKLW/KoIOFQC85LRCeQtlmNfYNV4OqkNVeqHPtETYBUQLelceH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881917; c=relaxed/simple;
	bh=ajImuHw9dHJfEfF7tntmwUJ+Z1/AOwGqsKyr3FXGHk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgsmqauo+Ld9tI2oQd4/JJAq7FGpldR3yJvwBdiqApced/slYnKupOM4Y5AakwJSwwUBG5iGN2VGsczCVIR23ZA1qb1P7sg3OuHEY5BdWrikrSDFek8Cv2/p/vzPw3Jh1PArpCnqXNzYq8X3CpXMnSesBQWMyQFw0zNtgEFiNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1yOP5Y0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1yOP5Y0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4531e146a24so19522885e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 07 Jul 2025 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751881914; x=1752486714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79T548hQN5814nBTBXiq81/NbOB8dSsfA+CdUxZMwGs=;
        b=E1yOP5Y0kWxY5xa15UE6HeUJv+RAYCG5aaxMfUK4VRucVtXuEdVWRNp/qdwtUdWafL
         NbYlEz8zCysG9/bOtnB0nLHuBNfMKLf6DeVQ9KoD70NuSjmqOHztVUbfIgtl51S1pZ2t
         aCtIkj9kTgchJBfJ5CTS4bUsoHGr5j7PHx6IpdK3+ZxK00lNhAnMSf+kbkXtkvQpSso6
         tSK3abm3uD0yzzfLlMcoKYq6K0Oy8dmhtpyKl1wEpHrmtZUp308MpyIIc1RUP1PBfZRX
         02Opaf2Iqa2+T+1EbfPc1O7D9oK9rU+fQ/VNWGgm4BQBiMwjPs5wIgUCSU375R6N7uvx
         Opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881914; x=1752486714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79T548hQN5814nBTBXiq81/NbOB8dSsfA+CdUxZMwGs=;
        b=D0HUhFa/ej4IzczETtUdCAYtANi8520n124YSPd/YwS8rocbb33YcHoJiUohWCqdge
         ng6FfI7BkDAN0xNbzyU59RhMpkeZrKieZjat5s8QirgjuquZBRp2o6BnTwcS3WTI3XoN
         c2zK/MBFDWeCwqhZHDy8SO6bz/UZhfILSkDqqdAgg9JZT3FXVsqypI+b3lqlUv26UkZA
         pkpodzf/QWDmKD95ILVOVDufuEd1idFXxcMRLLJrtfwdRt2Kr+V6M1PU+iMFSeCW4F2M
         thHRGb9S7jG67OcCpJfy/xSoGOEnCdk2y097ouih87dqzU7D4XAuIGQuzp8wGsvfdaFn
         KrLA==
X-Forwarded-Encrypted: i=1; AJvYcCW/uIicPJXs6kQjIVx+P37fGiA+itvwFK6qmds/RWTCMWiWisjLgcH0bCNdQN7VoelnZKUXhJwVd2dMBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6X1F+PFILp4YVkPtuLDFFMonlhlQiQym7ImK3oUplUaPR+ipj
	Ft7tNIAS5eBKs7rNox+Z5C6e+7vGaYY5vXS1TrOq/KO9HbwRC/4q77nlhfDzQ+nlg4E=
X-Gm-Gg: ASbGncuj+R98+MJAVV3kxJ3v3rZoC6EvnFeCWAliBlfCn1SdpCf9sWPxDpdVEbLeR9v
	B12nLzQzOZn0ahHle6RBOBu91NgMecHsVz53D2KnsQ/Sx8U3v9zlG06twGYUb8ulCrSJK7wVxjV
	nGfSv7GCo+cdLkHXvbmjbtg4kP9pIS0vmo1dBbbdEKkcxsfB0tLfG16A2lKaKnn1a6OBT1oeP3Y
	GHzNOPJCiZIyZZXKlFwSxsCNCKUVfn8F7zPDryKYSGO/PjRqiSRWdahWDkmZriZscyF5YVFnEGS
	MziFFwb45jZjhEcPvHfw4ZDnTkdsky0A1PQr6kNSke1QyyfonjPBoIGEeWwzMvs3YOwOoUiVRMb
	j6tTw0qFIc/2by9moV7iUz7QH
X-Google-Smtp-Source: AGHT+IGbBvD3G+FSdzwFOCs8u0Qb5KRrn3BFktAkDC8zaXAaZYuaw8fsJOebPSukrMKvjGqrPVXcNA==
X-Received: by 2002:a05:6000:2484:b0:3b3:9ca4:ac8e with SMTP id ffacd0b85a97d-3b49aaa141amr6531664f8f.44.1751881914436;
        Mon, 07 Jul 2025 02:51:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b472446fddsm9775271f8f.66.2025.07.07.02.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:51:54 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:51:52 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: tglx@linutronix.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <aGuYuHx5qlKCur8P@mai.linaro.org>
References: <20250703110415.232741-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703110415.232741-1-kkartik@nvidia.com>

On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
> Currently, if the system crashes or hangs during kernel boot before
> userspace initializes and configures the watchdog timer, then the
> watchdog won’t be able to recover the system as it’s not running. This
> becomes crucial during an over-the-air update, where if the newly
> updated kernel crashes on boot, the watchdog is needed to reset the
> device and boot into an alternative system partition. If the watchdog
> is disabled in such scenarios, it can lead to the system getting
> bricked.
> 
> Enable the WDT during driver probe to allow recovery from any crash/hang
> seen during early kernel boot. Also, disable interrupts once userspace
> starts pinging the watchdog.

Please resend with proper recipients (linux-watchdog@, Wim Van
Sebroeck, Guenter Roeck) and the changelog.

Can someone take the opportunity to split this watchdog code and move
it in the proper watchdog drivers directory ?

As previously discussed, the auxiliary device seems the appropriate
approach [1][2].

Thanks
  -- Daniel

[1] https://lore.kernel.org/all/CABjd4YyXwznntcLVcYL6qx16YEwv4_VWzrXrE7_QHmQxiE0pXQ@mail.gmail.com/
[2] https://lore.kernel.org/all/20250521-vt8500-timer-updates-v4-3-2d4306a16ae4@gmail.com/


 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
