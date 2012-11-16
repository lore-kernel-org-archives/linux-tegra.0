From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: harmony: enable HDMI port
Date: Fri, 16 Nov 2012 09:15:44 -0700
Message-ID: <50A666B0.6010605@wwwdotorg.org>
References: <1353021614-29200-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353021614-29200-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/15/2012 04:20 PM, Stephen Warren wrote:
> Enable host1x, and the HDMI output. Harmony also has an optional LCD,
> and a VGA output. The former isn't enabled due to potential issues with
> having multiple outputs enabled. The latter isn't enabled since the
> driver doesn't support VGA yet anyway.
> 
> Correct DDC I2C frequency to 100KHz.
> 
> Based on work by Thierry Reding for TrimSlice.

I have applied these two patches to Tegra's for-3.8/dt branch.
