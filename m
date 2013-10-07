From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: tegra: basic support for Tegra124 SoC
Date: Mon, 07 Oct 2013 12:13:44 -0600
Message-ID: <5252F9D8.5010105@wwwdotorg.org>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381131085-26116-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 01:31 AM, Joseph Lo wrote:
> Hi,
> 
> This series adds basic support for the new Tegra SoC, Tegra124. To bring
> up the system, it also needs an initrd as rootfs. Because most of the
> peripheral not be enabled yet in this series, it depends on the clock and
> pinctrl driver.

Great. I tested these and they work fine for me too, even using bootz
rather than bootm after fixing some bootz issues in our internal Venice2
U-Boot.

If you post V2, I'll apply it ASAP!
