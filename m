From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: add ac97 controller clock
Date: Mon, 28 Jan 2013 12:15:58 -0700
Message-ID: <5106CE6D.9030008@wwwdotorg.org>
References: <1359325055-5160-1-git-send-email-dev@lynxeye.de> <1359325055-5160-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359325055-5160-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/27/2013 03:17 PM, Lucas Stach wrote:
> AC97 controller clock is hardwired to pll_a_out0.

One more comment here; don't you need to add this clock into
audio_parents[]?
