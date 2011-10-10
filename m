From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 00/14] Sparse fixes for tegra
Date: Mon, 10 Oct 2011 09:49:30 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173B23B51B@HQMAIL01.nvidia.com>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
 <1318224484-2090-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318224484-2090-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Sunday, October 09, 2011 11:28 PM:
> Some trivial fixes removing sparse warnings on tegra code.
> 
> Changes since v1:
> 
> * Implemented Arnd's suggestion to push annotation all the way down to IO_*_VIRT defines
> * Based on above, no longer needed IO_TO_VIRT() -> IO_ADDRESS() changes
> * Added two more fixes for cpu-tegra.
> 
> Stephen; I didn't explicitly apply your Acked-by lines to this batch yet,
> I will do so when I collect final acks before pushing a branch.

Just for the record; my ack still applies to the updated series.

-- 
nvpublic
