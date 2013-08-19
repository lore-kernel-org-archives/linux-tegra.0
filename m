From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 tegra-cbootimage] Add automake option subdir-objects
 to prevent warnings
Date: Mon, 19 Aug 2013 15:01:08 -0600
Message-ID: <52128794.2090108@wwwdotorg.org>
References: <c0f44202ad8a959b1bd4c93f43c1dc42@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c0f44202ad8a959b1bd4c93f43c1dc42-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2013 02:10 PM, Stefan Agner wrote:
> The SoC specific code is in subdirectories which leads to warnings in newer
> automake versions. The option subdir-objects prevents those warnings.

Everything still works fine in my evidently archaic automake-1.11.x, so,
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Allen, do you intend to apply this? If not, I'm happy to.
