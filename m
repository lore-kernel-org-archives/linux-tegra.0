From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] clk: tegra: initialise parent of uart clocks
Date: Tue, 12 Feb 2013 11:34:55 -0800
Message-ID: <20130212193455.11471.39288@quantum>
References: <1360682279-23051-1-git-send-email-ldewangan@nvidia.com>
 <511A7FF1.1030009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511A7FF1.1030009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-02-12 09:46:25)
> On 02/12/2013 08:17 AM, Laxman Dewangan wrote:
> > Initialise the parent of UARTs to PLLP and disabling clock by
> > default.
> 
> This patch wasn't tested, was it? Without the patch I just sent titled
> "ARM: tegra: remove clock-frequency properties from serial nodes", the
> UART clocks get turned off and the console breaks.
> 
> Anyway, I've applied this patch to Tegra's for-3.9/soc-ccf-fixes branch
> along with that other patch, although I'll hold off on pushing them out
> while I wait for an ack from Mike on this patch, and give the other one
> time to get reviews.

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
