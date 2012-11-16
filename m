From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: whistler: enable HDMI port
Date: Fri, 16 Nov 2012 11:12:43 -0700
Message-ID: <50A6821B.7090303@wwwdotorg.org>
References: <1353088465-25556-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353088465-25556-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/16/2012 10:54 AM, Stephen Warren wrote:
> Enable host1x, and the HDMI output. Whistler also has a DSI-based LCD,
> and a VGA output. tegradrm doesn't support either of those output types
> yet.
> 
> Based on work by Thierry Reding for TrimSlice.

I have applied this to Tegra's for-3.8/dt branch.
