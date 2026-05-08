Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BA19ADA4;
	Fri,  8 May 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227238; cv=none; b=D0Mj85zGpyTWGwuydXNJcJpPGgWV3benY89DQf/oERbuUDk9CdPwHVzg67qwZ1P03LbGkVZjLB8NM6E5/4kGAbta2XsmnNVMGmdy4C2KWoxBsHGOcdiyaf6SxrH/3mUvgpGbm1RsGM8zmC9Zm3EeT3wF1/079PXmdYtjH46pc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227238; c=relaxed/simple;
	bh=9BQtMkFDgyYqA5TYUfHuLNaN1gOF/WtY4roOKQPNQqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jpreh4rquvWivrdndJWnXdS56U9hHfonzGHikyrrEh7VLt9enL0mcHJQueCHHkBru52GjxuYijEaRRquCr5lSTDljQZEDRBOQjBdmUHR2/TuOcDZ9O5FopDGMoxRWR18d+UVncKKJe+qaXKOm+lYrVzOGNPrgcIVX099r4ktBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0eZRSzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0eZRSzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CC9C2BCB0;
	Fri,  8 May 2026 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778227238;
	bh=9BQtMkFDgyYqA5TYUfHuLNaN1gOF/WtY4roOKQPNQqY=;
	h=From:To:Cc:Subject:Date:From;
	b=C0eZRSzEICPyP7iz5+n+Sldyd8fKddWl5alMlCwO6xAWt66f+i5Ke+/u3mGizhjWS
	 LvsdxG04yyKGuhIQRFr2WyZ559oCnx4IqqyXzE6+3H8EB3nog5wI6cuAc3aJcDHczT
	 AZwElfBby9XatNNmuLRZyZNBsIvpsLl9m7ftWOC5mmLl6yA+FrSCxPoXlV17qCKbyd
	 KdkMJQW203sQN+QHZTaqz8qPeCDJPDDMTuUqoJ0XCFVdxbzf8/5SpbLzX0lxcDgrfB
	 fjVoOQ/+sbaI1k31pM35Y29LU267u2M2zyqWMLSwypmwMgDI4L24ryRHzQyKnH0MHB
	 qxMrdO9SqgkmA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
Date: Fri,  8 May 2026 10:00:25 +0200
Message-Id: <20260508080031.4064272-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing this driver for 32-bit causes a build failure:

x86_64-linux-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra210_mixer_configure_gain':
tegra210_mixer.c:(.text+0x709): undefined reference to `__udivdi3'

As the driver is only actually used on 64-bit Tegra210, rework the
division to use the div_u64() helper that avoids the libgcc call.

Fixes: 36645381b864 ("ASoC: tegra: Add per-stream Mixer Fade controls")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra210_mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index f05617b5f433..d21f55dad0e3 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -157,8 +157,8 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 			if (i == DURATION_N3_ID)
 				val = mixer->duration[id];
 			else if (i == DURATION_INV_N3_ID)
-				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
-					    mixer->duration[id]);
+				val = div_u64(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR),
+					      mixer->duration[id]);
 			else
 				val = gain_params.duration[i];
 		}
-- 
2.39.5

