Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFF2EDD6C
	for <linux-tegra@vger.kernel.org>; Sun,  5 Apr 2026 00:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775350735; cv=none; b=Wo/t13sWHwI5vJOo2DZv20DcjSiwRwNstJe2fyD0LDgCwel0dpdZrv0gYm7yCKKkFv8eL/v39fiizOWj0lhukp9wQyygGRyZiU9i4IHWMgFid9vojTSyUIl9IJojfxRY/rYbtuI2ahRmnq3kBJcR2gfLs8COh1221O7vKGz9ink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775350735; c=relaxed/simple;
	bh=OUV8iYFcdaBNckohwit0b6YgnpM3gK0Lsy8t0bCd8sU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=IsvGsGj20lTROhIo7puGxtidjeGqOVX0TMLqbBRj3+pyhEODI23MfWTZ3VJGaKyfYo5/bqPydsvPpFDd5Or2MXS8kApn+of44NpVchGoOJyKsvIZ/uXD/Ie14UUOflZybMxq73Y06Tel+R/fcUftjhBGp3jXdxW6QU4ohfV+TCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kha86hpp; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kha86hpp"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so2696467a91.2
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775350734; x=1775955534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=Kha86hpp4XmoND8lLG/6SymqFmmEjyq1IS+Zc7FZX2gK4YNUa/bQGri94wkuaxUB82
         CLFcwi1Rx8luN5PbbIa5najuO+Y9qKk1Mol7h6/FH6Jbtn+Okzqp93Q00+X5RR7tr8EZ
         LhlL5vJaQi3iLKhzdPyQSAyXpS6wc5mxNrYsEG7p24C/Z0Z4jow6rSrfz+SFlNQ1/ekP
         X2YISGuCRDKsg+q09e5IQJVsboItmundrQUODDZ0IaMPxO5vs4hlBpYyWj2IvbkY2ImC
         TV+6uPqfgsVVWXFhVvKQTR+0oYIGBCOaT5g/Rs0wObt3cptkZNB2iBdr7Da0x7aYwULO
         pjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775350734; x=1775955534;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=fsTv3Q2zIC9b6cBhixao4izBqG6KSCbkIdqIT4vfV495gxjQrKZfuIsc3aiIoL09H7
         XI9Vf6Nycblt1FID/HHODv1x0+enCw1qsEDk1eERhP92PZ/Au0/Xp+ucVUiPeNtMziCW
         OIVSVxEM3DTujObIxR9buITgdo7VwfA51D2zz6KfbS0zv5HSD7O5ooXqLlulGON5KqjY
         AhrYJamvBdHuvxf6/1uYy7Iu8mbElx1uYBAXaPgCJLNCC6+4lbwnQJhwKoL5JtV17wzN
         YrJ9i1kWTsl61O5PCUB4NnyCjyt78xeMyC/k7f3Mxs3nPHR3jpTLy4R6a6hVODm9DjiN
         56dQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4yFQHtw9FsgDicgdRpbYCUUqcEGjxIfDdXagJFDukxCDYygggxL8l32WGZEPqYuNLCz9XMOpvP/Lucg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30XqfzbourfPXWAXR6z1fkpp8E/mw7yPhsnfWtvyvgx2RnldY
	XCSfDNMwiS2UWQ2qhYHtzAs4tUcolb29lWPrXH7B0c4KvbFKSHkjOBx1
X-Gm-Gg: AeBDieu1r9jTLSqVi3rGrGbZV6SOjClHAlpwe4qUDErkBlJZo5vH/F7PBmjZUt6ejEA
	NMIcuMhBfUD+sI+koar22IJj8X+caZ6oJYKKiTBUZepr6p6YSUR/SrWmKAH+kXtqdlCPJYwf4Vn
	+x/bXsEfB/Zg+U3Pzn7diCGgWKmHSqvSpK9mvylpegykmjtVc8HrpHhl4ELoUqtze8c2/eQ4Agx
	sBThZVVWLWFtVvraIeeDFAzV8eINo01O6afbpN4sSoG8Xbs7O/urlODLaXYN1yyz8gdjZEvajDd
	NM2LdUnDdkEbCloIqbCH/TOOkGJviWmFBwXhptqNZ0/aITHM6izaatS1gS+9rUZOJREtEKCmD2+
	KJWPqRLQv1XCDd/cp09mI6blW0C6JU2ohpHvDZIgUSp4S27ZZHBt+nc2k2JDx7dBlnaFpgQWDgb
	CbMeNsebH6WP5OL1zlcCurEH8=
X-Received: by 2002:a17:90b:3d4d:b0:35b:aca5:db39 with SMTP id 98e67ed59e1d1-35de67ee6bemr7012077a91.9.1775350734065;
        Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
Received: from [127.0.0.1] ([142.91.102.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm2876078a91.6.2026.04.04.17.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:58:53 -0700 (PDT)
Date: Sun, 5 Apr 2026 08:58:41 +0800
From: zhang <zhangweize9@gmail.com>
To: joonwonkang@google.com
Cc: angelogioacchino.delregno@collabora.com, jassisinghbrar@gmail.com,
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com,
	stable@vger.kernel.org, thierry.reding@gmail.com
Message-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>
In-Reply-To: <20260404124428.3077670-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>

Hi! Joonwon Kang.

I just looked at the content of your email, and I think we can design a resource priority scheduling system with 70% and 30% priority allocation. The specific idea is as follows:

During task execution, each task can be tagged. Important tasks can be allocated to the 30% of resources, while the remaining 70% can be used to run low-load and repetitive pipeline tasks.

The specific algorithm can be written as follows: reserve 30% of the runtime space for the system's critical processes. For the remaining 70% of non-critical processes, a judgment can be made: if resource usage exceeds 70%, the excess processes are marked with a priority deferred tag and run only when resources are freed up.

-- 

the-essence-of-life
