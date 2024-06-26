Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1899191499;
	Wed, 26 Jun 2024 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437840; cv=none; b=DkLroYRW2qfWgPWMsvRy1JYsiiMmwHaeFWY2H+dBhKdzIsZvmE6BDOFb9fAyrpvfC8aTjYMS7PIz0EfhN3uydm3JhsBVKAb6WjhOKHsxe6ebq0d7ILPp446xsVRt3S2LSy5VwhV01jtRmgnIoD5GVyrBLBRRQrVTF67abuTSUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437840; c=relaxed/simple;
	bh=wm8IOjSy0IazMs+GqeoJgo5DdVy+HlV5n4Xf3NJQpYw=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=UmaAlnm/tum0ocTwQ+zDrtpVGYSrYu9rRPO6s9qdy2JwJUsF5IohYc7rccf1LQgNkOEdpqEUwvJI+zUlLWojsNNjw5L0uzUBbqgT72e9ArKdFyLXTnIlIXnIZrO5qoNwj/SazqRl6ffIg48VSb9HhRUWxz3NvGRsoAPgsw89pQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpZVXy99; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpZVXy99"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42564316479so1074745e9.2;
        Wed, 26 Jun 2024 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719437837; x=1720042637; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnGnPkXUd1aUtrN7P0KReA3W4+M4jw6ycApaJIjtT8M=;
        b=bpZVXy994kOT863KBK7HdxMcL4gzAYG669fG5Zmy0ZXQTKvm2RW4JsxzHwctRY0Hpa
         tYBXk7/4AuURIAwJO3Uv7BDZIR8L6Z4ZVB8BjMu2MVw20BFc5MsHnrw61h6VOQgIHUdS
         0mzcUEOhoHbm54KI2OlPzPUFnFpUMBp/JCFDomrc/M441n99qGMQ3fxi9KdeNF/GyVbL
         +P1CyzO999zsME/BUHANXKmPoIs++gotgqQ2L6ychGhKIWJS+9CmOdyxGfZeFHFu73Ey
         aFzpwY8ewHBqjd3u64lBmHz4DuPaMe4RezVw6lA261D8NsUpU1nBZH0gn9mC/mHxJXN6
         PdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719437837; x=1720042637;
        h=content-disposition:mime-version:subject:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnGnPkXUd1aUtrN7P0KReA3W4+M4jw6ycApaJIjtT8M=;
        b=IqXh3+t3Ysh4frByEhVMNTeRW7JzPQqlkgYeOdLAdFPS+KWTn+YHO4YkwRJGMDh8/W
         ZRiOTa7HGb6zZDPa/9V+1m6T5o4U8J08g1Zm4uUpXz4rdyeLZrYF2nKYu92ftGEp0b6i
         ZtH97MVD84UqceIvulTgqV1mEEDivm71c5A6hqE7ptL0ykfk5FdwBZy/E091ocw6mJNi
         Qum4PeApY2fOjByxAEgRIjcE3RGipTU5sQjOuTCjHBAwCikXEA8rfDr8upG0aSmSRHEJ
         Y3oyTzZpVKde1O03EorC5TYI1bSLLqdIWW+GMAhz4YtWWshOWzpJhbBlUywp7HLaYZBR
         Igdg==
X-Forwarded-Encrypted: i=1; AJvYcCUXOX/PGNuOMCMw44icjqU2pk6A7/l1E4bvlHAzwps7JztBCN+4S1Yq9Cdp61HB4M9zMtnx/PEHp/BMIGRJI4+dMqNzfE7WNHKLT1en4FGjx6VzjY7hRm8AZNN99lnyb0Ks0NruoyP8GH8=
X-Gm-Message-State: AOJu0YzCV022YHB0GBodGg7r2zx9crohwmz+kTwv9R1xYtUDVvQjNlu6
	TkU2hFKwNcIVFUfQ6mcE8GHnmp4NfjvqILzuMuRIK+m0sRKMBwKABEa1auQg
X-Google-Smtp-Source: AGHT+IF8ZxfDkoY7tQaMlIFw8ibDYc8+OnII82pa9zKj7EIAs2ieSt1GO9QKjuGhzrBLqEfni8Xosg==
X-Received: by 2002:a05:600c:1ca2:b0:424:8e12:9ef3 with SMTP id 5b1f17b1804b1-4248e129f6fmr82029245e9.0.1719437836861;
        Wed, 26 Jun 2024 14:37:16 -0700 (PDT)
Received: from laptom (88-121-55-84.subs.proxad.net. [88.121.55.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424a2abc265sm44536785e9.1.2024.06.26.14.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 14:37:16 -0700 (PDT)
Message-ID: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
X-Google-Original-Message-ID: <ZnyKCpE2tbvWD8Xm@laptom.>
Date: Wed, 26 Jun 2024 23:37:14 +0200
From: Tom Mounet <tommounet@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: nvec: Use x instead of x != NULL to improve
 readability.
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Issue identified by checkpatch.

Signed-off-by: Tom Mounet <tommounet@gmail.com>
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e5ca78e57..814eb121c 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);
 
-	if (msg != NULL)
+	if (msg)
 		*msg = NULL;
 
 	nvec->sync_write_pending = (data[1] << 8) + data[0];
@@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
 
 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
 
-	if (msg != NULL)
+	if (msg)
 		*msg = nvec->last_sync_msg;
 	else
 		nvec_msg_free(nvec, nvec->last_sync_msg);
-- 
2.39.2

