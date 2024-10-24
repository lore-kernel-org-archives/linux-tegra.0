Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B5D18871F
	for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750448; cv=none; b=BbYSWDRHpuIiTJIS+KSvINVkB8yhA5Kdke/AkFd/KdGm6M4pbt8KxEf2YJgQ/IdW9tUTiD4RqDcRmetDCKh78Coz6V13HSDCO1Qhc/6kgAIGlpxXJt60SKF21dyTwzb6L4Ng2JEaU+A+1FUoyT/pqciGFUTVEXuF9VG4sX8GRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750448; c=relaxed/simple;
	bh=zDXiwnNbOAqIIc1NRxGfQ1iF2PdUDrS7EJdjH4bGXdI=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=km63DEXbj9J38/b036lmAKnvx0cy6a5aiHRnptOgn42YdvMKWbiUi5ZouAFopbeGnGxP2S/LpS1EKPkEeyYWQKMrznf7rfGrEQLH/aP1GffpPzeXPBT44I5L8loR+LFAjp66ngb6R7C9UejkOZHJolqHMn/gPLxvwmYe/dpbe1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qNEVLB5w; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qNEVLB5w"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e376aa4586so10678917b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Oct 2024 23:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750446; x=1730355246; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=qNEVLB5wZAWqkQZOWbj/Bsr8QbqAdt9Bl0pjOuCJDLT2e8y5c9qH2MhHxRb4VNpIlV
         KUComeNF9rKthKH4gBKx44hhF9jmGI5ELiKu5rGsCYEubKqdJwSvAVR2FodktfEts0GA
         mnBKO6vhkxWsy6MI1Hs8M8eA4RXWL4KYEjw62phwE9Z2Je1IWtQmjmhO/0kGRpNTn2bt
         oghgvA7Qv3qeiqIyk7XllXn29z2AeW6K/5ik2PhqPU8Nltk1zGyji9QwbxvMkG7hhFsK
         q1ARqz3AMtoaouUWaGautpsveoGOXGu67WRBr1klrng+K6XtL/7T1xXx+ieHZfXH1Z3u
         Vedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750446; x=1730355246;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RirtA7EgN4fQOOKugcSYCvUnz6k6FXA4tnIv667SP2U=;
        b=V2ApFQbMYrd8RxVyyapsxsr0+fip+TX6pXhyybogVe7IO1jMA73y1Z0LU4dGXhRYWQ
         Nj2AOFmtqVLZyw5RMcxvWv/Ja4YcLXpgKYqTFn3BIG8OCTsxLEeuQgzZBKsEMLR3HcBe
         f39Aj0CZ77S797fZ3hwqYk2VvETfGCoaLt50TKQFaQ9vX8ngbHMeeh9s8is7a7AKl/fS
         +x+EM8kJXQqVzGNmmvJ+P4pinTZJ8oEmT5JSSZjtkW4mQFqmzytbl3dJCZYsro2JNo5T
         Ss9iUcD+DfELNcLWcfZU9hW8wE41m9690lzSxSWsUKdSyU1n5VdJEpdr8RKIhU/gEc9D
         dKrw==
X-Forwarded-Encrypted: i=1; AJvYcCWQkSsJ6Hj2/vBahxBb09ElVpvxcJ8+KEO6/xgCXBO3W+uy3rRvatmPYuuZTl6W6lK7VCdiakpY4FMSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaDkIBG29BomUtNZXnpvRhzsOmCWoC09IA402u2s2dJvI7nCnw
	CcgXSTN9bY2M7xuzFSXQxX9trTJOmWHd714RwHHfKNOuxx20En7PhrKsJGtBlnfFwJuIK7UYT6h
	95yVNCXKWm4CKKg==
X-Google-Smtp-Source: AGHT+IEJXaAAeZpuDAkTsefFXLL2kex4B2AlfwjdclQcvPn636A6m5nX8BurNhgR4ykV7U+QaaWd5sb2nHuey3k=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:965e:f81d:c9fb:b352])
 (user=saravanak job=sendgmr) by 2002:a05:690c:3749:b0:6e2:4b3:ee22 with SMTP
 id 00721157ae682-6e866359b6fmr171667b3.6.1729750445961; Wed, 23 Oct 2024
 23:14:05 -0700 (PDT)
Date: Wed, 23 Oct 2024 23:13:44 -0700
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
Message-Id: <20241024061347.1771063-4-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241024061347.1771063-1-saravanak@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a bit
 more useful
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>, 
	"=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=" <nfraprado@collabora.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

It would make it easier to debugs issues similar to the ones
reported[1][2] recently where some devices didn't have the fwnode set.

[1] - https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
[2] - https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a4c853411a6b..3b13fed1c3e3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2181,8 +2181,8 @@ static int fw_devlink_create_devlink(struct device *con,
 		}
 
 		if (con != sup_dev && !device_link_add(con, sup_dev, flags)) {
-			dev_err(con, "Failed to create device link (0x%x) with %s\n",
-				flags, dev_name(sup_dev));
+			dev_err(con, "Failed to create device link (0x%x) with supplier %s for %pfwf\n",
+				flags, dev_name(sup_dev), link->consumer);
 			ret = -EINVAL;
 		}
 
-- 
2.47.0.105.g07ac214952-goog

