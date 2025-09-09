Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1571DA4E
	for <linux-tegra@vger.kernel.org>; Tue,  9 Sep 2025 04:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391497; cv=none; b=GZgbgneyS2hQQ2iQmT42ILuTmkLKKWk6jeXCgVfY99jYKxyPxk7a7hEXAwXWLS1NVE+GFLAthByStbC7UJwxwuH7xIm/AMD3PKTnxfYFLl8n/aEhtSVq9TLk8dv6wYEwrKw/rPgz5CikuGo8FHr1dKgabTFE7tFyPS/Wl2fEqQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391497; c=relaxed/simple;
	bh=0hN5hBfw2u9IejFxmzV7rNe7hVXngvs3bEh86Z6vQfs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jVpjO2sPnAAE8MboWqQFSVjtV99xhC1+Sl6/FRYJrJOgbcyOi9flIfqlCxidaLfH0LSDsuI6DNlql/oE7EVM0N33OV10mgeJxyIx3XlFzSVu+UxndAThvtzNnuIwmRFXSx7Z4RJaVTkI16Dm6jALZ4d+3wHi57Ukajx4G+bxXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO7oBS+l; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO7oBS+l"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f716e25d9so4740833e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Sep 2025 21:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757391493; x=1757996293; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0hN5hBfw2u9IejFxmzV7rNe7hVXngvs3bEh86Z6vQfs=;
        b=kO7oBS+lKGlIfip/pHFx1JRCU+pIGIfQTZSJwh+9unQkjAV5iCf44x+253O3sEZYrI
         td0+jESShFirXaKGWC4JEDfB8KQRCX/fEPjjfTOm0uzjMvd8otSru1miy8zy+IbBBGhb
         Cr+MFsQrt7NGwJvDu7QCnP+lAcxKaoSNLePS3oAyN9VtmZ/tS6DxVeSmOqbtnbD5TIhf
         H0hOPRAStwVZR0QzK6GXjwuA8M7dEhAvKf1MusSzXTlZ+5v426LD2HfD/GRfjxHfMqM/
         N94T8gWyHbwPBTF4Yx8kxAS03bs7qkZ/CklbHFgb1akEIDcWheI4dvkPdhfom+AX9DJn
         TQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757391493; x=1757996293;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hN5hBfw2u9IejFxmzV7rNe7hVXngvs3bEh86Z6vQfs=;
        b=vfQbygmKIs5lN70SqRI9pAfLsv+XQyNnJBlEaT0Vrzif913i/qd3HDje/E/I+OO5AX
         epPaQ5qutVBy+GI3fjEmu6o8slc6PlrYzyx+sj1DOrEouc9JP24AU03wrZeS99Wccycv
         tQmUVhf4ubJD3AOwbxIhwNVa6X+b04jLAX4pn/5aZjLN7OhSjaNAODMPqYypyRrlUTXK
         6q9IoM25tU2htlAz35EjNB8fwX0aog4JB1IHLCWOzSf3ltHGUOvd3WzrXjzdJ62WtyiA
         ZkJXBL2XcWfA2EaWNXXrWqCNedpfVl6iRmrjlMT3RnPFOBZapIvdN0ZC9Tu57iiWQOYS
         srpw==
X-Gm-Message-State: AOJu0YxwuLtwOprbJJxAn1ejtC1R8zPucAcXCwU/v/yFGKKp8jyH6rwq
	gHqSvv7gT66/gzNQhPAqrgIl2gfb+7Ia2TebxUbLzmybGhpgSb+dlegJZETEWzNjqwzOTMjEbeO
	ZPy3p+Yj2WIT9u6RkqIkILGoIigbalUpk7WR92hs=
X-Gm-Gg: ASbGnctmakt8ZX2xa00drKHnT+ra/mhWrBNMysKq8GWoX2Kta6qHa0cVf7TbAlQfTzD
	ReXX/LNSnQxadiuCtf8IxCky6o/nYI2nocERwUoFu2oNw4/8nWCSoycBInpeCXQHspwPugOINe+
	EYkA6Jik0AiJLp1OpxTL/iIPFu7NRFWLrA777nfnJIsLOkU86WlnfMgzbvDU+dDaaCSkZCeox6P
	UHJkb0fWtsJ463t1g==
X-Google-Smtp-Source: AGHT+IHfVxcYMoKaVFpOQHdFzTPWHyjdRex1yW1mOBqw3DrOnl3Jq+R3BHDNwpjX1QpN1GhAAwgl1zpbjl1Q27W2AGo=
X-Received: by 2002:a05:6512:61b3:b0:55f:4c1d:47f3 with SMTP id
 2adb3069b0e04-56261219bc1mr3109024e87.28.1757391492621; Mon, 08 Sep 2025
 21:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Sep 2025 23:18:01 -0500
X-Gm-Features: Ac12FXwA3net42ySHBasqby82gQWbbMP6zTAAoEYS9-zDIKw-lQ0aMFlQPQ7T0c
Message-ID: <CALHNRZ_vMy1CTosZ=ymOhAyMNRh+oBOU9NJ8Gvr8EkqQ5XjFDw@mail.gmail.com>
Subject: [BUG] drm/tegra: Rendering too dark on Tegra186/Tegra194
To: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

All rendering on Tegra186 and Tegra194 is darker than it should be.
Tegra124 and Tegra210 work as intended. A matching report has been
created on the freedesktop issue tracker [0] so screenshots of the
issue could be uploaded.

Aaron

[0] https://gitlab.freedesktop.org/drm/tegra/-/issues/8
