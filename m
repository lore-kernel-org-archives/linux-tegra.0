From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2 00/14] Sparse fixes for tegra
Date: Sun,  9 Oct 2011 22:27:50 -0700
Message-ID: <1318224484-2090-1-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some trivial fixes removing sparse warnings on tegra code.

Changes since v1:

* Implemented Arnd's suggestion to push annotation all the way down to IO_*_VIRT defines
* Based on above, no longer needed IO_TO_VIRT() -> IO_ADDRESS() changes
* Added two more fixes for cpu-tegra.

Stephen; I didn't explicitly apply your Acked-by lines to this batch yet,
I will do so when I collect final acks before pushing a branch.


-Olof
