From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: match SoC name not board name in DT board
 files
Date: Sun, 4 Mar 2012 10:41:34 -0800
Message-ID: <20120304184134.GF31064@quad.lixom.net>
References: <1330392376-7884-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1330392376-7884-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 27, 2012 at 06:26:16PM -0700, Stephen Warren wrote:
> board-dt-tegra*.c should support any board using Tegra when booted using
> device tree. Instead of explicitly listing all the supported boards,
> which requires a kernel change for each new board, list the supported SoC
> model instead.
> 
> Note that the board files do currently have explicit support for setting
> up each board's pinmux. However, it's fairly likely that at least the
> basic devices on any new board will work just fine as set up by the boot-
> loader, and the pinmux data should be moving into device tree soon anyway.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied.


-Olof
