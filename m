From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 12/12] arm/tegra: Remove temporary gpio/pinmux registration
 workaround
Date: Mon, 15 Aug 2011 15:12:41 +0400
Message-ID: <4E48FF29.1030208@ru.mvista.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com> <1313189697-21287-13-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1313189697-21287-13-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 13-08-2011 2:54, Stephen Warren wrote:

> This reverts commit "arm/tegra: Prevent duplicate gpio/pinmux pdev

    Would be good to also include the commit ID for gitweb.

> registration with dt"; board-dt.c no long calls harmony/
> seaboard_pinmux_init(), so the workaround is no longer needed.

> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

WBR, Sergei
