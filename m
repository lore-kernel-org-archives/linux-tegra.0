From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: PCIe: Provide 3.3V supply voltage
Date: Sun, 26 Feb 2012 14:34:16 -0800
Message-ID: <20120226223416.GI11189@quad.lixom.net>
References: <1329724647-15783-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329724647-15783-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 20, 2012 at 08:57:27AM +0100, Thierry Reding wrote:
> The PCIe reference clock needs a 3.3V supply voltage to work properly.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> This patch is based on next-20120217. Note that PCIe works without this
> patch when the Linux kernel is booted with a combination of QuickBoot
> and U-Boot because either apparently sets LD0 to 3.3V. This is not the
> case when booting from mainline U-Boot, so it must be set explicitly.
> 
> Changes in v2:
> * Set voltage via constraints as suggested by Mark Brown.

Thanks, applied to for-3.4/boards.


-Olof
