Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C6143C7C2;
	Fri, 21 Aug 2026 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306601; cv=none; b=LKK4YABG9SLisqBuM24Q1BDOflJditW3Zdx4Ec32810cRnMllhdchoWVaAPz4QgtsfWRxKhWC9C1EAaBJvVJGnwpwiv03d+f+ApcL3MnqnDmy7hFTBtHzDZdvleAm+NHFVxEcJIayaJy7IxJCYFWbZYpeCGhpb6g0nirZEsY0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306601; c=relaxed/simple;
	bh=PGOlbA3AdN9s+2BFA2m9q8toElua5IVxxzNqXNXB5Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0KpC5H8vOmpSOOArtjWUzYXMLoubNsv8zh8FjbIGxSJ57Bu7JHEpqTyIcB6InhOU6wWnGYsYVddT/ZXHRCFOOj/iB79WBoEHFtmBieqnKS9IRc5EzbmJ6wIHlYyW2AYB3bVqwZj8eRjKLo8CPPWow4UbuhCDDto8qreGJJS7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2E71F000E9;
	Fri, 21 Aug 2026 10:03:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] drm: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:03:01 +0200
Message-ID: <cover.1787239944.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the DRM subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  drm/sun4i: Make sure clk_init_data is fully initialized
  drm/tegra: Make sure clk_init_data is fully initialized

 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c     | 2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 2 +-
 drivers/gpu/drm/tegra/sor.c                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
