From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra124: Enable hda to hdmi clocks
Date: Tue, 15 Apr 2014 12:19:06 -0600
Message-ID: <534D781A.90508@wwwdotorg.org>
References: <1396984629-14101-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396984629-14101-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 01:17 PM, Dylan Reid wrote:
> Add the clocks used for HDMI audio played through the HDA controller.
> Initialize the codec clock to 48Mhz and the HDA clock to 102MHz per
> the TRM.

This patch seems fine to me. Peter, I assume you'll apply this and
eventually sent a pull request to Mike.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
