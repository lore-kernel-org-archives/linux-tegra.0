From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 07/10] ARM: tegra: Enable Venice2 keyboard
Date: Fri, 20 Dec 2013 10:56:52 -0700
Message-ID: <52B484E4.8050509@wwwdotorg.org>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com> <1387469182-14398-8-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-8-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 09:06 AM, Thierry Reding wrote:
> The keyboard on Venice2 is attached to the ChromeOS embedded controller.
> Add the corresponding device tree nodes and use the MATRIX_KEY define to
> encode keycodes.

Patches 7/10 and 8/10 do work fine with the current pinmux/regulator
setup in Tegra's for-3.14/dt, so I have applied those patches.
