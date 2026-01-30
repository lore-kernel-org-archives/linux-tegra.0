Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93437FF51
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777412; cv=none; b=o8wSRjPxueex3C1vTXtvX0vL1p5a16zO7ojD6kl2xDWjQ96tW5PNqu8r18MLZ+YEKd9ZQ3MTmHgKGfD/7LGDqIwKmtrH3JLVyy1Bn/IqQis5CepJ8DhYyDbMyAS4+EkqtwQZe6dTvzQnjng0QERhfXMQLLqx3qypaNRB5o4/a8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777412; c=relaxed/simple;
	bh=nYt6duhsrmz+e69NidfUvJL9FCPmAn4B/IKgU/QMe0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNJRwmeVGMaJZgUMuY4qBDS+KZTbHQjLCrQFJelkYhv17wY5fbyfB18dw20Uh7wd1W6xX0vTxZakCidcNR0NSGbP++cgSeWCaV+J2JcJ5lGC4Xif4HweMY3CspYfxleptIUGLO6K4exLAgtmdD4cbapQLmHcgLWS4f06WAwhbwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQui/aw0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQui/aw0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so22692585e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777408; x=1770382208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=QQui/aw0YZeBIfX76/ZKWT7ZM12hScqRkKh4JJ/A8w5pXRLJGhdrpUYrQCxhnT60O+
         GLYBeYszVnuT7TgncVK9Wx3AC9uAoNAc8dD3s+tpnzt6kjFuerV9jyf627Hum/IGLQC7
         qwAQWB4eRG08Kh4ciCgsrOoWBjLwsnnbNg+EH0zq0bus9D0CpL+zCIWqxdlJ0x+wCnmB
         NwlF6D7R+TJ5YACRGjOqYdaVLQNB03q3fXZdNVaaPQrlxbLSVK5o3J8ZuTS4T4txq6Es
         90ITHFrBFU/Gtvgsg1DubHTHJ07OANkSBJ6AGNrPkuNMUlHm/YtS8xKlphtGr5XLH7ax
         BHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777408; x=1770382208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
        b=i52M7TxKpFWyf3HWV3R0P8dybEQllgoFtGQTIhcXtHz6EnjadSGq4BhDlx/WI68AD/
         xz6ayyXBbkutSu7QwcVRQUUVlnsNspPKsctMHecczjkW7pURm6I9KK7/76ug16QDd8Aj
         UoMtwBOO9SMdh3ZWldnK1nHeu0uAunCIrTrnAi6DWkEVVXWl6jt+XDpoghtbW1ayEPzL
         6DCwbKAyDzOtvIpw0+LjXQgo1Qvc+KW2VA16ou+lzE3ti0NMwiCL3TgckOBppz5hi5w9
         Ctmrvo0vRiqkFJgLsOrpTlU3dzaSpNuF/mQWwNM/QFjjHO627cvdG8MeKEoKg0v2Dmxs
         /Nsg==
X-Forwarded-Encrypted: i=1; AJvYcCWE/9ZRnA2z2w4OVip3Z3fDq5zQ66753WfAOoez7TU/NxTmbtfgBsDaD5BXrJ3tSlx2MHltWhBrifmdtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpl4XrK/jJdFZriIwfWZlc131Dd3U1MKw5DpQ+SPntmZHlHCsV
	BGGW6lFDiuYwVOeHCxvoo65mGp52aufyBsaY6rUhcCw51SxMcgBNA3yz
X-Gm-Gg: AZuq6aIPozamusMRdZJgG8Exk2l6Cudtt12MiknmfjSNfm64qTUhozHrfQdGaDFNHUS
	I3MblOKrt76JBi968UctmezjbOLNqAFbwkpNKa7Y58HYndJB0yZ7OmOn+B6/cl9BRb0KygSrI9f
	tnicanwzsgchTELhE1HaUyopRqusjSk+HbXX+dpitqir3vSf3fNSH17rhkXuIc6CfGoczmhYOp+
	z0ptp5T//FhxfouKmKIs3/IYodvh2vzvBOuOrwnjGA3UTNPvaDbm1puAASd2AIfoHCNU2w/bsba
	Agk7LG1vNfmggbhIKeIrRu7UlY6aIbuLofxaJ4afMDdbwcblJL6cHiuGJ0llBEJE+94AAxqIqsC
	qfBvGvRYNkhQHqozAj/bomxnORlfnZ7HIMVzxiI/KWmYnfjCm57PxUGfqKQ8/MWTxlBB/K0AX7q
	kE
X-Received: by 2002:a05:6000:178b:b0:432:dcb1:68bc with SMTP id ffacd0b85a97d-435ea2102d0mr8586769f8f.23.1769777407709;
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 12/15] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Fri, 30 Jan 2026 14:49:29 +0200
Message-ID: <20260130124932.351328-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0

