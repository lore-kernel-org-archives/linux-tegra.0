From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] phy: mark tegra_xusb_lane_lookup_function() static
Date: Wed, 31 Aug 2016 12:01:11 +0200
Message-ID: <7060924.RuInUXIHDe@wuerfel>
References: <1472634319-11886-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472634319-11886-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday, August 31, 2016 5:05:19 PM CEST Baoyou Xie wrote:
> We get 1 warning when building kernel with W=1:
> drivers/phy/tegra/xusb.c:104:5: warning: no previous prototype for 'tegra_xusb_lane_lookup_function' [-Wmissing-prototypes]
> 
> In fact, this function is only used in the file in which it is
> declared and don't need a declaration, but can be made static.
> So this patch marks it 'static'.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Same comment as for the other patch, it's better to use "phy: tegra: ..."
in the subject for clarity.

	Arnd
