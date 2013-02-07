From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: tegra30: fix wrong clock index between se to sata_cold
Date: Thu, 07 Feb 2013 13:29:09 -0800
Message-ID: <20130207212909.11471.76375@quantum>
References: <1360213631-16893-1-git-send-email-josephl@nvidia.com>
 <5113FD1E.9020801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5113FD1E.9020801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-02-07 11:14:38)
> On 02/06/2013 10:07 PM, Joseph Lo wrote:
> > The index of se should be 127. And the previous clock index was 125. So
> > we need to set up the index for se to get the correct index between se
> > to sata_cold.
> 
> I've applied this to Tegra's for-3.9/soc-ccf-fixes branch, on the
> assumption Mike is OK with it. I'll hold a pull request for his ack, and
> probably for a day or too in case any more clk-related fixes show up.

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
