Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673291;
	b=jOVpcjFyeNkaFUZF9V3YBNDxbPDG8d/UMoEAU9maDJ1mNTVlDXpgE9+EuAfGQofOWFJN
	 Nu34/+HHlad+m3unxFc/iIt7WGgXiOD8q1YlFYHdtWVOGg+0D2gsM5eSuZPbWUQxuvXDQ
	 G1gKiXn+9lxmDla/1W8Fgrzn03Le0GbOQLsDBYeHROyi4NYEusOizmCCmkmFRow5Jd6l/
	 gawHdU74dFGmi6opRxddQWXTgp3rnjgtBFng7siGvxarU+a7clU9x9rG/lVDI75TyLtAH
	 X70pjM75HUsctofdvBR/ThWA04fGh/AQg7+nAAgPbZxfGyPIaeQbGobyl+k2wBmLUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
	b=dAYhHFDu+lAWIqNpwXM++je8mSUKAESE5ZtIKs5WTrq879ZT2C3PlBToo5iuVYsWczxq
	 DnOiRbSfDfFBGxvavWO+qm7JxexVyeRw2Jc9oBgNdSraR7JiBRHcmrdH1yB/6n5LMpszP
	 KD4AdauAvu7xPmHMyIVW0fpq2Sw19x17/WwGhveFKpa+54rud5J8cYeC/0zYJ9I1twkaf
	 YcXQhFqZGpUDKd0kvVZpHWfc+l8UIuTZffDNT7XD1CglE+iDYaxg1pYP5sA8zotwvUova
	 1vedtVL5lTlqPXYL/6KAb17RyIOVSmrx5kqCMc122JJmpNOuYwrJMUjeikqcjZMsyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoOsEvN;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8B606A32E
	for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2026 16:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A8B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoOsEvN
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so24323225e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2026 08:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673289; x=1795278089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
        b=HLoOsEvNbLLkbRRIYZsJtLww7CbQcnin1oQuSxP54eY4wkWFnWCPiDyqur1mMaOY/l
         BAYYzwyU3dnEvSYF4WG9SC8fjp03w2JTYF8XP+egEYQGU2HG0Zml5mgHgrfElNL3nR/V
         xFQQug8gOPBmz4u4F2d0xwnwVyqSdUlOueJIqBg94uBNbtzShZnRpVTTXOxERD4nbxKA
         s9G7sYj2+NexFH5/CM8BqXIkmxSPnb3fOTVNZicYk080/8+Td3Vh+3unzVoc3NQ1uM0c
         D0jQjRaGs5/kXf9PRVuUiYG7OCl4UR8VCa8EdINSehubJnbmYGsDhURGjOseZuiOZ+mi
         qYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673289; x=1795278089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
        b=vxrQgqvINlbldNsK3DvZVb8uB8dbZpooCqvHgIsplBoiqt1hHDvoqCiLEyE54AVmOw
         5uw1gnqZ7RN4no6iXIaFrUaZbKmG1JdQ9HFH8yGN1ynNqFEpGqgLlwq48GFZWu+y4Xnc
         JBtiCxkiLXmhYz6RsNktLMu9f9jPaBGskd9zqwA5Lg6odyvDWp/i0thtpoeEzk3gYcax
         SWKYPIEu2cjUUL6qpuqldsS/FIuKF48CcGpCD5tOJ3P0ehazAjP7uoNkNpjM9bUiq+dR
         gHML37kNJFHjCUOP0o8GECivuhY/VxFIl0xhPRxb5DS4+cNFDsmSOz07bN1tJWorVhc4
         1XmQ==
X-Forwarded-Encrypted: i=1; AL+hErHib8IYoj6QlU7Yqmg4X9M87RvDfW/TOLqdEzxDPxrrQhu8Edf4e5FGk7OCecAAL+RAhh0aV9T4RP4j/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+BTmqieqHd+N7cU/ISChS6RCTC3tNomFzgx2PZz5liwOtCmgbD
	bymZTotiw8HEzU3tsfPg8Gc9gZdX+9RZe7Rh7CmUN26R7tRqEAtCDxZk3Lro7Q==
X-Gm-Gg: AYBFou3ywQmALyLTA2l+rU9b0xPHnURJwLN9sY1wCjrwkhSwd9U68eBOlVN8mM8r7lm
	8pWodOvmJEqkrm/bmIkoAtXcZbh91aL2mwyYLLtio0mX0ZxlXszy7D7S2DuKPvdwxMrUcDl9IkT
	p8BpsE7QcHE3nbLF5RBevlv9MIO11S7mAhIiT4cscX+ue7T3N/5s3K41Zn6dIi2FSOJllPK8rtj
	wgUv0iI3AQ1JUWhb1w3GXmR0mCt4wpiVXKBpgsaXznNFa5MWb7XLApdEzXwQKTK9OPrCcooAMIj
	P0ba8FdoUfZSUWfobN4uYHwztZIDS3QgnsDq7ZLGciIZdYxn3Jg0b5Wlno/RfDBSpNhD1n/CaGY
	aeLbN9pFIHYtD6s3B8dOELAy4Z/2GIDekwy7RbRlh/psVqp1yDlSHmR3di9nVss6XfTaqLV/vx6
	Voty1pNw8Kf0pV0UMznNGap/WD/+54ak+mh7qfcJ7SgE98b0KEBI1wds3+5yjslpW5H8picXfam
	aJDz+zzMgwQZVgb89emwTzDuPMZdDPQ4uHixHbg8d+QWLV7E4Aoz2UjvImOrAODX2DMYDTGhJVk
	WFAqNg3ksaXWOeTjm/8nDtCuMg+qpXe0KGkMCAC5gJQdoc/3mVuLIgnzvl9z8Oa+ZJQ4CDG8HSZ
	GOacyCBufatfw2jLOFfEp4So35sclx1oU4Lcm
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb55a65b31mr117276745e9.18.1794673289246;
        Sat, 14 Nov 2026 08:21:29 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.81.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm162652275e9.11.2026.11.14.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:21:28 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	obabitemitope765@gmail.com
Subject: [PATCH] gpu: host1x: Remove unused host1x_channel_release tracepoint
Date: Sat, 14 Nov 2026 18:20:06 +0200
Message-ID: <20261114162006.3673-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing calls trace_host1x_channel_release(), so the tracepoint is
unused. Remove this unused tracepoint.

Fixes: 6579324a41cc ("gpu: host1x: Add channel support")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/host1x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
index 1b6aeb7b177b..6e9010ec5a3e 100644
--- a/include/trace/events/host1x.h
+++ b/include/trace/events/host1x.h
@@ -33,11 +33,6 @@ DEFINE_EVENT(host1x, host1x_channel_open,
 	TP_ARGS(name)
 );
 
-DEFINE_EVENT(host1x, host1x_channel_release,
-	TP_PROTO(const char *name),
-	TP_ARGS(name)
-);
-
 DEFINE_EVENT(host1x, host1x_cdma_begin,
 	TP_PROTO(const char *name),
 	TP_ARGS(name)
-- 
2.53.0

