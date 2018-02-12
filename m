From: Hector Martin 'marcan' <marcan-WKacp4m3WJJeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Date: Tue, 13 Feb 2018 01:17:49 +0900
Message-ID: <09072c49-9796-9a16-8a6f-8e5c609d7e06@marcan.st>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: es-ES
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.

For the series:
Tested-by: Hector Martin <marcan-WKacp4m3WJJeoWH0uzbU5w@public.gmane.org>

This requires an additional patch (Thierry has it in one of his trees)
to fix the tegra_powergate_sequence_power_up path (missing `pg.pmc =
pmc;` in that function). With that fix, this series fixes the
nondeterministic "green bars across display" issue.

-- 
Hector Martin "marcan" (marcan-WKacp4m3WJJeoWH0uzbU5w@public.gmane.org)
Public Key: https://mrcn.st/pub
