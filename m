From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/5] arm/dt: tegra: Remove /chosen node
Date: Wed, 7 Dec 2011 16:20:18 -0800
Message-ID: <20111208002018.GH12945@quad.lixom.net>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321911851-10091-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2011 at 02:44:08PM -0700, Stephen Warren wrote:
> The command-lines present in the existing /chosen node are not necessarily
> correct for all users. Ideally, we should simply use the command-line
> supplied by the boot-loader.
> 
> In fact, using the boot-loader's cmdline is quite easy; either the
> bootloader fully supports DT, in which case it can modify the DT passed
> to the kernel to include its command-line, or CONFIG_APPENDED_DTB can
> be used in conjunction with CONFIG_ARM_ATAG_DTB_COMPAT, and the kernel
> will substitute the bootloader's command-line into the DT.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks, applied to for-3.3/boards

-Olof
