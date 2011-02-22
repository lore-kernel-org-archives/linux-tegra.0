From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/7] Second batch of Tegra clock updates for 2.6.39
Date: Mon, 21 Feb 2011 18:39:45 -0800
Message-ID: <1298342392-21236-1-git-send-email-ccross@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch series contains two small patches out of the previous
series that needed fixes, as well as some new ones to disable
unused clocks during boot and related bug fixes.

Patch 4 converts the Harmony and Trimslice boards to use the new
init_early machine handler.  Any boards that go in after this
patch will need to be updated to match, and this patch will need
to be updated if any boards go in before this patch.

Tested-bys on Harmony and Trimslice would be appreciated.

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
