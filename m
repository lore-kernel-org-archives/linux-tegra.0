Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E43DCDB1;
	Fri, 21 Aug 2026 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302356; cv=none; b=gIM9AZoJpqL42UtIzQ6EaEjkuv418DNpDHVi3DVkTHKvGYRGZjT0ReuX7pgNfN+VotW0ZX+Nb8OFE5SjcihMKPygjX0t+CXUudongnekM6ZTLBXelTT43HnehdoQCE0DGZwX08vCnlvaGy0HOUYDDFA9JQsuHfzcbJnzXHRzRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302356; c=relaxed/simple;
	bh=2eu3xe42DwTrkW7Pqp0CwbKZfQYzsvg6ZOXbvNnayUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bLeGs32myI78mYOK+EyareBqN+o/x9OCb+33/AJhPyMt9g9INu1CXHFEAYx/Ivqhd/hGU4womWyfu8L+FTjx8L4WQ++YIKR/BxcVDhgcWCAnEEqlgU2IyCISxnpdpBAW8DSv7FJbymD2nJUrYwnIwR5r5tuIvAkIrKQlGJbHzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2FB1F000E9;
	Fri, 21 Aug 2026 08:52:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM/soc: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:23 +0200
Message-ID: <cover.1787239869.git.geert+renesas@glider.be>
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

This series is the ARM/soc subpart of Part Two, which fixes remaining
cases that are currently harmless.  These are still fragile, and may
cause future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  ARM: versatile: clock: Make sure clk_init_data is fully initialized
  soc/tegra: pmc: Make sure clk_init_data is fully initialized

 arch/arm/mach-versatile/spc.c | 2 +-
 drivers/soc/tegra/pmc.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
