Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79726369990
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610942; cv=none; b=DevbpfUPRUuYbaHO4/UU/03EttHIN96gR6PoI+pCcWpH1HgmLeACCGPqY0cWaDXOmZWoDyH71gGpPxx4vcq6pj8OOg/A1oehgUf9/BS71sGzVPiXPK0BdRGoFeWuT0d6oGzC5sizFCmutbnibIfOYL5HWUy4QMKMGncflte/2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610942; c=relaxed/simple;
	bh=MW96MT2H5e5odG8AsWjgHCe+BWBDJHJDIscXEc3BAJo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IsTZjGmhsEhdI2jkK5m7fvlA43rUxYjcPDynFkvVVzWisCF0hqeU6yhnsYkaKnf0tEPslFysPC/ILxK4E5e2RTBht1MFbGIQ7/8BrNqRZY/r4unUKI25sJDZshK7f6lkzeUagn6iIlmzfWLKxsRL6v2HbPj/RQj59HJsqE9wrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCgDyLnk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCgDyLnk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso7483075e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757610939; x=1758215739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlBu2NprIg2+aIhadTPHpgKffn2YpAgdyJg8kJsiv00=;
        b=RCgDyLnkxm9gXTQV/vazW9m9XgBISOx35hfWYIQZ/SoQvDaTdDtEVMaGzM4UTVfgO2
         XXydGuMlPGlt5qE6iYMeEcvazJfFxgUhPOOAjorDBxMSEIrrwyNAOqECGDd8e1NSosfE
         zNt061KCNbdE6OjcXKzP979fAw3HaySEyLx3mPzBkGD+cdV+M4+tUKaxTudeWWr95eCK
         q2RMBLGn3aiUt739yu1v32Z/pZcQ5pyWFPFqzrBcskz8Ni1tESaCIl4j/K6pBN6c2zCS
         eA90K8CuK0fgn75ERW0fHTR4Ha22z6iJDa5GusmY30U80RFsyeIrLLy15SwtjKtJrK4f
         mHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757610939; x=1758215739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlBu2NprIg2+aIhadTPHpgKffn2YpAgdyJg8kJsiv00=;
        b=AsWpCJz2TzfjRt5sQfIwYZHXPUTIekKRiUMKAyTlz3dWafaSc5pI59X8Auzd/l1C/c
         Wvbads9XNMiH+14scH+fxrbetmMVRQvC2n8wCa9dUORdvsAQU+28+Dbq0M0KDWDk+CAc
         ZEJ4L1y65vVsdKaaSst9Esm8LYLGV2bGqYtPQkrOkEMF9FOKWXkXECD9tVVIt+Bpb6m6
         hipizz5ecW3vZQhu9rBnziBvoQ5f+Q3YBunJB3QPCLUi+Jx8YfdXTebQHVYeunl37jrm
         AJLELDZY6HryF6+4073gXfTPZNtL3B1TDGy0k+aKlgeZOHDj47m8f/X6nBBxkBaDWgaK
         Iugw==
X-Forwarded-Encrypted: i=1; AJvYcCWjaj0OvjLrlJdeuIXgwFZZv5//Pj+nvTqLQv2KCoEsL9U9eUD7hBIQTWCkSeO9vf30hmdjSKcQkMmh9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznZ6NB9GKcxLtNejbqfEEkyg49ZLPwOBv4wQ9hZKFnBD+Y10rU
	5rkDU0IzOt9HwFbMRBwKXqd8rKbbOodqq/QD9QvWMl1otb+o2tEguiWo
X-Gm-Gg: ASbGncsVAdSd51pcnpH4hA5o2DBlnjGNvZvJ+gNI3JXLyf5lQltrAp/lvPC5kEeuUG5
	0i+1d59+0VdLNOD1Dk9YQ5S1yOi7eaxXdINR7y0fc///2ugxsi7pmlvMtnuKCnDVL+smuIdPGjT
	p7HXdjR888fWON90ADDyojxsJjuwoqXRg9q9AfJTvlNME+D/tVMElD/fDWG0cbeGq6eV2ugM1/o
	eiElkC9u5CjX7bilAhAEB8iy/HtKMrYuT6WGpJkR07vTmZewyNZR/vAaGKQcGAs92RP+6vxoKHN
	I9B7MUmCi2ASN5trl7KvbBcm3ZgZLJE9CdRGR7er8GrgyQ8ZTensC4pQ0N7cfoJUEAxEdmM+FTr
	yp7/jeQnK4pDnWHPZP1o/ehnwCBXJIivvdUWadjzmwppvcW0ZhLhDEVByqRpwLV8VaCjXVbftLL
	8wOzbTdVQuTcfHb12ClwJQcuMy
X-Google-Smtp-Source: AGHT+IFyNITYXanMUiTOVy2Osl5V4I64mGYalEHfEOcAOQH9B7h6enLV0/I+HA9A714OXMrpa16Evg==
X-Received: by 2002:a7b:c4d0:0:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-45f211f2fb3mr1627565e9.23.1757610938657;
        Thu, 11 Sep 2025 10:15:38 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3ce5sm30198205e9.16.2025.09.11.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 10:15:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH] clk: tegra: Remove redundant semicolons
Date: Thu, 11 Sep 2025 19:15:32 +0200
Message-ID: <175761090509.3229177.9207716245913935287.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250813094003.552308-1-liaoyuanhong@vivo.com>
References: <20250813094003.552308-1-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 13 Aug 2025 17:40:03 +0800, Liao Yuanhong wrote:
> Remove unnecessary semicolons.
> 
> 

Applied, thanks!

[1/1] clk: tegra: Remove redundant semicolons
      commit: 8ec061e72f15da80df10d4cf29777556992074e1

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
