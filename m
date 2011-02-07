From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 1/2] ARM: update trimslice entry in the machine registry
Date: Mon,  7 Feb 2011 10:10:52 +0200
Message-ID: <354f589cbbf0b58d0383b07f5e221fa3a6f5d23c.1297063443.git.mike@compulab.co.il>
References: <cover.1297063443.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1297063443.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/tools/mach-types |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 2fea897..bda8b81 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -3190,7 +3190,7 @@ synergy			MACH_SYNERGY		SYNERGY			3205
 ics_if_voip		MACH_ICS_IF_VOIP	ICS_IF_VOIP		3206
 wlf_cragg_6410		MACH_WLF_CRAGG_6410	WLF_CRAGG_6410		3207
 punica			MACH_PUNICA		PUNICA			3208
-sbc_nt250		MACH_SBC_NT250		SBC_NT250		3209
+trimslice		MACH_TRIMSLICE		TRIMSLICE		3209
 mx27_wmultra		MACH_MX27_WMULTRA	MX27_WMULTRA		3210
 mackerel		MACH_MACKEREL		MACKEREL		3211
 fa9x27			MACH_FA9X27		FA9X27			3213
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
